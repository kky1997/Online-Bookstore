USE bookstore;

INSERT INTO Users (
    first_name,
    last_name,
    username,
    email,
    passwords,
    phone_number
) VALUES (
    "Jim",
    "Johnson",
    "jj1980",
    "jim@test.com",
    "12345",
    "1234567"
);

INSERT INTO Users (
    first_name,
    last_name,
    username,
    email,
    passwords,
    phone_number
) VALUES (
    "Jen",
    "Jenderson",
    "jenny77",
    "jenny@test.com",
    "12345",
    "1335777"
);

INSERT INTO Address (
    address,
    user_id
) VALUES (
    "1 Spam Road, Carpet 7077",
    1
);

INSERT INTO Address (
    address,
    user_id
) VALUES (
    "5 crystal Street, Red 5053",
    2
);

INSERT INTO Book (
    title,
    author_first_name,
    author_last_name,
    ISBN,
    price,
    transaction_status
) VALUES (
    "Strange Weather in Tokyo",
    "Hiromi",
    "Kawakami",
    "1-234-56-1233-777",
    25.99,
    1
);

INSERT INTO Book (
    title,
    author_first_name,
    author_last_name,
    ISBN,
    price,
    transaction_status
) VALUES (
    "To Kill a MockingBird",
    "Harper",
    "Lee",
    "1-277-53-1643-1355",
    20.00,
    1
);

INSERT INTO Book (
    title,
    author_first_name,
    author_last_name,
    ISBN,
    price,
    transaction_status
) VALUES (
    "testing testing book",
    "test",
    "tester",
    "1-277-3456553453",
    15.00,
    0
);

INSERT INTO Book (
    title,
    author_first_name,
    author_last_name,
    ISBN,
    price,
    transaction_status
) VALUES (
    "testing testing book 2",
    "testerino",
    "testy",
    "1-277-347737373",
    10.00,
    0
);

INSERT INTO Book (
    title,
    author_first_name,
    author_last_name,
    ISBN,
    price,
    transaction_status
) VALUES (
    "berserk",
    "guts",
    "stug",
    "1-277-355773131",
    99.00,
    0
);

INSERT INTO Advertisement (
    date_created,
    seller_id,
    book_id
) VALUES (
    NOW(),
    2,
    1
);

INSERT INTO Advertisement (
    date_created,
    seller_id,
    book_id
) VALUES (
    NOW(),
    2,
    2
);

INSERT INTO Advertisement (
    date_created,
    seller_id,
    book_id
) VALUES (
    NOW(),
    2,
    3
);

INSERT INTO Advertisement (
    date_created,
    seller_id,
    book_id
) VALUES (
    NOW(),
    2,
    4
);

INSERT INTO Advertisement (
    date_created,
    seller_id,
    book_id
) VALUES (
    NOW(),
    2,
    5
);

INSERT INTO Sale_History (
    sell_date,
    sell_price,
    seller_id,
    book_id
) VALUES (
    NOW(),
    25.99,
    2,
    1
);

INSERT INTO Sale_History (
    sell_date,
    sell_price,
    seller_id,
    book_id
) VALUES (
    NOW(),
    20.00,
    2,
    2
);


INSERT INTO Purchase_History (
    purchase_price,
    purchase_date,
    book_id,
    buyer_id
) VALUES (
    25.99,
    NOW(),
    1,
    1
);

INSERT INTO Purchase_History (
    purchase_price,
    purchase_date,
    book_id,
    buyer_id
) VALUES (
    20.00,
    "2023-06-15 04:32:39",
    2,
    1
);

INSERT INTO Messages(
    seller_id,
    buyer_id,
    message
) VALUES (
    2,
    1,
    "Hi Jen, I am interested in buying berserk for $99"
)
