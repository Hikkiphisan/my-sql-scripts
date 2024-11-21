SELECT * FROM databasename.persons;


create database s;

CREATE TABLE s.Products (
    productCode VARCHAR(50) PRIMARY KEY,
    productName VARCHAR(100),
    productLine VARCHAR(50),
    productScale VARCHAR(10),
    productVendor VARCHAR(100),
    productDescription TEXT,
    quantityInStock INT,
    buyPrice DECIMAL(10, 2),
    MSRP DECIMAL(10, 2)
);


INSERT INTO s.Products (
    productCode, productName, productLine, productScale,
    productVendor, productDescription, quantityInStock,
    buyPrice, MSRP
) VALUES
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 
 'This replica features working kickstand, front sus...', 7933, 48.81, 95.70),

('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 
 'Turnable front wheels; steering function; detailed...', 7305, 98.58, 214.30),

('S10_2016', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:10', 'Highway 66 Mini Classics', 
 'Official Moto Guzzi logos and insignias, saddle ba...', 6625, 68.99, 118.94),

('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', '1:10', 'Red Start Diecast', 
 'Model features, official Harley Davidson logos and...', 5582, 91.02, 193.66),

('S10_4757', '1972 Alfa Romeo GTA', 'Classic Cars', '1:10', 'Motor City Art Classics', 
 'Features include: Turnable front wheels; steering ...', 3252, 85.68, 136.00),

('S10_4962', '1962 LanciaA Delta 16V', 'Classic Cars', '1:10', 'Second Gear Diecast', 
 'Features include: Turnable front wheels; steering ...', 6791, 103.42, 147.74),

('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12', 'Autoart Studio Design', 
 'Hood, doors and trunk all open to reveal highly de...', 68, 95.34, 194.57),

('S12_1108', '2001 Ferrari Enzo', 'Classic Cars', '1:12', 'Second Gear Diecast', 
 'Turnable front wheels; steering function; detailed...', 3619, 95.59, 207.80);

Select productCode,productName,count(productScale) as "CountProductScale"
from s.Products
group by productCode, productName, productScale;


select status from s.Products

select productVendor, count(productcode) --Nếu sử dụng groupby 
from s.Products
where productline = 'Motorcycles'
group by productVendor
order by productVendor


















use s;
-- Tạo bảng orders
CREATE TABLE orders (
    ordernumber INT PRIMARY KEY,
    status VARCHAR(50)
);

-- Tạo bảng orderdetails
CREATE TABLE orderdetails (
    ordernumber INT,
    productcode VARCHAR(20),
    quantityOrdered INT,
    priceEach DECIMAL(10, 2),
    FOREIGN KEY (ordernumber) REFERENCES orders(ordernumber)
);

-- Chèn dữ liệu vào bảng orders
INSERT INTO orders (ordernumber, status) VALUES
(10101, 'Shipped'),
(10102, 'Shipped'),
(10103, 'In Progress'),
(10104, 'Shipped'),
(10105, 'Cancelled');

-- Chèn dữ liệu vào bảng orderdetails
INSERT INTO orderdetails (ordernumber, productcode, quantityOrdered, priceEach) VALUES
(10101, 'P001', 10, 15.00),
(10101, 'P002', 5, 20.00),
(10102, 'P003', 3, 25.00),
(10103, 'P004', 7, 12.50),
(10104, 'P001', 10, 15.00),
(10104, 'P005', 8, 40.00),
(10105, 'P002', 5, 20.00);

select *
from orderdetails;
select *
from orders;


select status, sum(quantityOrdered * priceEach) as amount
from orders 
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status


select sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;