const vueinst = new Vue ({
    el: "#app",
    data: {
        books: [], // array to hold the books for sale
        message: "",
        seller: "",
        showPopUp: false,
        messages: [] // array to hold messages from buyer
    },
    mounted()
    {
        this.getBooks();
    },
    methods:
    {
        getBooks() // get books for sale from database
        {
        var xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function ()
        {
            if(this.readyState === 4 && this.status === 200)
            {
                const responseJSON = JSON.parse(this.responseText);
                vueinst.books = responseJSON;
                vueinst.seller = responseJSON[0].seller_first_name + " " + responseJSON[0].seller_last_name;
            }
        };

        xhttp.open("GET", "/get_books", true);
        xhttp.send();
        },

        // auto write a message to seller when clicking on book items for sale
        writeTitle(title, price, seller)
        {
            this.message = "Hi " + seller + " I am interested in buying " + title + " for $" + price;
        },

        // gets messages from buyers for seller to see
        openMessages()
        {
            var xhttp = new XMLHttpRequest();

            const sellerId = 2;

            const payload = JSON.stringify({ sellerId });

            xhttp.onreadystatechange = function ()
            {
                if (this.readyState === 4 && this.status === 200)
                {
                    vueinst.messages = JSON.parse(this.responseText);
                    vueinst.showPopUp = true;
                }
            };

            xhttp.open("POST", "/get_messages", true);
            xhttp.setRequestHeader("Content-type", "application/json");
            xhttp.send(payload);
        },

        // allows user to close the modal which displays messages
        closeModal()
        {
            this.showPopUp = false;
        }
    }
});

// AJAX to send the message from the buyer, so it can be saved to database
function sendMessage(event) // eslint-disable-line no-unused-vars
{
    event.preventDefault();

    let messageSentDiv = document.getElementById('message-sent');

    const sellerId = "2"; // hard code the sellers and buyer id
    const buyerId = "1";

    const message = document.getElementById("message").value;

    if(message === "") // check if user has actually written a message
    {
        messageSentDiv.textContent = "Please write a message before sending";
        messageSentDiv.style.color = 'red';
        messageSentDiv.style.display = 'block';
        return;
    }

    const payload = JSON.stringify({ sellerId, message, buyerId });

    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function()
    {
        if(xhttp.readyState === 4 && xhttp.status === 200)
        {
            messageSentDiv.textContent = "Message sent to seller";
            messageSentDiv.style.color = 'green';
            messageSentDiv.style.display = 'block';

        }
    };

    xhttp.open("POST", "/message", true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send(payload);

    document.getElementById("message").value = ""; // clear text area after sending
}
