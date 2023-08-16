drop table spring_shoppingcartdb.accounts;

drop table spring_shoppingcartdb.products;

drop table spring_shoppingcartdb.Order_Details;

drop table spring_shoppingcartdb.Orders;

CREATE TABLE spring_shoppingcartdb.Accounts (
    User_Name VARCHAR(20) NOT NULL,
    Encryted_Password VARCHAR(128) NOT NULL,
    Active BOOLEAN NOT NULL,
    User_Role VARCHAR(20) NOT NULL,
    PRIMARY KEY (User_Name)
);

CREATE TABLE spring_shoppingcartdb.Orders (
    ID VARCHAR(50) NOT NULL,
    Order_Date DATE NOT NULL,
    Order_Num INT NOT NULL,
    Amount DOUBLE PRECISION NOT NULL,
    Customer_Name VARCHAR(255) NOT NULL,
    Customer_Address VARCHAR(255) NOT NULL,
    Customer_Email VARCHAR(128) NOT NULL,
    Customer_Phone VARCHAR(128) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (Order_Num)
);

CREATE TABLE spring_shoppingcartdb.Products (
    Code VARCHAR(20) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DOUBLE PRECISION NOT NULL,
    Image BLOB,
    Create_Date TIMESTAMP NOT NULL,
    PRIMARY KEY (Code)
);

CREATE TABLE spring_shoppingcartdb.Order_Details (
    ID VARCHAR(50) NOT NULL,
    ORDER_ID VARCHAR(255) NOT NULL,
    PRODUCT_CODE VARCHAR(20) NOT NULL,
    Quanity INT NOT NULL,
    Price DOUBLE PRECISION NOT NULL,
    Amount DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT ORDER_DETAIL_ORD_FK FOREIGN KEY (ORDER_ID) REFERENCES Orders(ID),
    CONSTRAINT ORDER_DETAIL_PROD_FK FOREIGN KEY (PRODUCT_CODE) REFERENCES Products(Code)
);

--Accounts table
INSERT INTO spring_shoppingcartdb.Accounts (User_Name, Encryted_Password, Active, User_Role)
VALUES ('john_doe', '$2a$10$A/1PWHxBvOWtduKc7UXDM.Wau4jGYCBT56/f2mykx1Z7qATAIk.tW', true, 'MANAGER');

INSERT INTO spring_shoppingcartdb.Accounts (User_Name, Encryted_Password, Active, User_Role)
VALUES ('jane_smith', '$2a$10$A/1PWHxBvOWtduKc7UXDM.Wau4jGYCBT56/f2mykx1Z7qATAIk.tW', true, 'EMPLOYEE');

INSERT INTO spring_shoppingcartdb.Accounts (User_Name, Encryted_Password, Active, User_Role)
VALUES ('mark_jones', '$2a$10$A/1PWHxBvOWtduKc7UXDM.Wau4jGYCBT56/f2mykx1Z7qATAIk.tW', true, 'EMPLOYEE');

--Products table
INSERT INTO spring_shoppingcartdb.Products (Code, Name, Price, Image, Create_Date)
VALUES ('P001', 'Product 1', 99.99, NULL, '2023-08-15');

INSERT INTO spring_shoppingcartdb.Products (Code, Name, Price, Image, Create_Date)
VALUES ('P002', 'Product 2', 149.99, NULL, '2023-08-16');

INSERT INTO spring_shoppingcartdb.Products (Code, Name, Price, Image, Create_Date)
VALUES ('P003', 'Product 3', 199.99, NULL, '2023-08-17');

--Orders table
INSERT INTO Orders (ID, Order_Date, Order_Num, Amount, Customer_Name, Customer_Address, Customer_Email, Customer_Phone)
VALUES ('1', '2023-08-15', 1001, 150.00, 'John Doe', '123 Main St', 'john@example.com', '555-1234');

INSERT INTO Orders (ID, Order_Date, Order_Num, Amount, Customer_Name, Customer_Address, Customer_Email, Customer_Phone)
VALUES ('2', '2023-08-16', 1002, 250.00, 'Jane Smith', '456 Elm St', 'jane@example.com', '555-5678');

INSERT INTO Orders (ID, Order_Date, Order_Num, Amount, Customer_Name, Customer_Address, Customer_Email, Customer_Phone)
VALUES ('3', '2023-08-17', 1003, 180.00, 'Michael Johnson', '789 Oak St', 'michael@example.com', '555-9876');


--Order_Details table
INSERT INTO spring_shoppingcartdb.Order_Details (ID, ORDER_ID, PRODUCT_CODE, Quanity, Price, Amount)
VALUES ('OD001', '1', 'P001', 2, 99.99, 199.98);

INSERT INTO spring_shoppingcartdb.Order_Details (ID, ORDER_ID, PRODUCT_CODE, Quanity, Price, Amount)
VALUES ('OD002', '1', 'P002', 3, 149.99, 449.97);

INSERT INTO spring_shoppingcartdb.Order_Details (ID, ORDER_ID, PRODUCT_CODE, Quanity, Price, Amount)
VALUES ('OD003', '2', 'P003', 1, 199.99, 199.99);


select * from spring_shoppingcartdb.products;

select * from spring_shoppingcartdb.Order_Details;

select * from spring_shoppingcartdb.Orders;

select * from spring_shoppingcartdb.Accounts;

