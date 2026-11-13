
-- =========================================
-- Question 1: Achieving First Normal Form (1NF)
-- =========================================

-- The original ProductDetail table had several
-- products stored in one column.
-- To achieve 1NF, each product is stored in its
-- own row instead of having multiple products
-- in a single cell.

-- Create a new table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Add the products one by one
INSERT INTO ProductDetail_1NF
(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- =========================================
-- Question 2: Achieving Second Normal Form (2NF)
-- =========================================

-- In the original OrderDetails table,
-- CustomerName depended only on OrderID
-- instead of the full composite primary key.
-- This is known as a partial dependency.
--
-- To fix this, I have separated the data into
-- two tables: Orders and OrderItems.

-- Create the Orders table to store customer details
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderItems table to store products
-- and their quantities for each order
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert customer and order information
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert the products and their quantities
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
