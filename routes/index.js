var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// route to get books sold by seller (hard coded to be seller_id = 2 which is Jen Jenderson)
router.get('/get_books', function(req, res, next)
{
    const query = 'SELECT b.*, u.first_name AS seller_first_name, u.last_name AS seller_last_name FROM Advertisement AS a JOIN Book AS b ON a.book_id = b.book_id JOIN Users AS u ON a.seller_id = u.user_id WHERE b.transaction_status = 0 AND a.seller_id = ?;';

    const pool = req.pool;

    pool.query(query, [2], function(qerr, result, fields)
    {
      if(qerr)
      {
        console.log(qerr);
        res.sendStatus(500);
      }
      else
      {
        res.json(result);
      }
    });

});
module.exports = router;

// route to insert messages from buyer into database
// hard coded so user_id = 1 is buyer and user_id = 2 is seller
router.post('/message', function(req, res, next)
{
    const sellerId = req.body.sellerId;
    const buyerId = req.body.buyerId;
    const message = req.body.message;

    const query = 'INSERT INTO Messages (seller_id, buyer_id, message) VALUES (?, ?, ?);';

    req.pool.query(query, [sellerId, buyerId, message], function(qerr, result, fields)
    {
        if(qerr)
        {
            console.log(qerr);
            res.sendStatus(500);
            return;
        }
        res.sendStatus(200);
    });
});

// gets the messages for the seller to see by querying the database
router.post('/get_messages', function(req, res, next)
{
    const sellerId = req.body.sellerId;

    const query = 'SELECT m.*, u.first_name AS buyer_first_name, u.last_name AS buyer_last_name FROM Messages AS m JOIN Users AS u ON m.buyer_id = u.user_id WHERE m.seller_id = ?;'

    req.pool.query(query, [sellerId], function(qerr, result, fields)
    {
        if(qerr)
        {
            console.log(qerr);
            res.sendStatus(500);
        }
        else
        {
            res.json(result);
        }
    });
});
