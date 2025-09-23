--🔹 Teoriya:

--TOP 10 – natijani faqat eng yuqorisidan cheklab olish.

--TOP PERCENT – umumiy natijaning foizini olish.

--TOP – kompaniyada eng yuqori maosh olgan 5 nafar xodimni ko‘rsatish.


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'John Doe', 2000),
(2, 'Anna Smith', 3500),
(3, 'David Lee', 4000),
(4, 'Sarah Kim', 5000),
(5, 'James Bond', 6000),
(6, 'Maria White', 7000);

-- TOP
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;

-- TOP PERCENT
SELECT TOP 50 PERCENT * FROM Employees ORDER BY Salary desc

SELECT * FROM Employees

2. DISTINCT

🔹 Teoriya:

DISTINCT – dublikat qiymatlarni olib tashlaydi.

🔹 Real hayotda:

Mijozlar ro‘yxatidan bir xil shahar nomlarini faqat bir marta olish.

drop table Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'John', 'Tashkent'),
(2, 'Anna', 'Tashkent'),
(3, 'David', 'Samarkand'),
(4, 'Sarah', 'Bukhara'),
(5, 'James', 'Samarkand');

select * from Customers

-- Faqat turli shaharlar
SELECT DISTINCT City FROM Customers;

-- Bir nechta column bilan
SELECT DISTINCT FullName, City FROM Customers;

3. ISNULL va COALESCE
Teoriya:

ISNULL(expr, val) → agar NULL bo‘lsa, val ni qaytaradi.

COALESCE(expr1, expr2, expr3, …) → birinchi NULL bo‘lmagan qiymatni qaytaradi.


Real hayotda:

Telefon raqami yo‘q bo‘lsa, "N/A" deb ko‘rsatish.

Ma’lumot manbalari bir nechta ustunlarda bo‘lsa – birinchisini olib chiqish.


CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50)
);


select * from Contacts
INSERT INTO Contacts VALUES
(1, 'John', NULL, 'john@mail.com'),
(2, 'Anna', '998901112233', NULL),
(3, 'David', NULL, NULL);

select * from Contacts
-- ISNULL
SELECT Name, ISNULL(Phone , Email, 'N/A') AS Phone
FROM Contacts;
select * from Contacts
-- COALESCE
SELECT ContactID, COALESCE(Phone, Email, '2') AS PreferredContact
FROM Contacts;


4. ORDER BY
🔹 Teoriya:

ASC → o‘sish tartibida.

DESC → kamayish tartibida.

Bir nechta ustunlar bilan ham ishlatiladi.


SELECT * FROM Employees ORDER BY Salary DESC
SELECT * FROM Employees ORDER BY FullName DESC;
SELECT * FROM Employees ORDER BY Salary DESC, FullName ASC;
SELECT * FROM Employees ORDER BY Salary DESC


5. WHERE Clause
🔹 Teoriya:

Shartli filtr:

=, >, <, >=, <=, <>

AND, OR, NOT

IN, BETWEEN


SELECT * FROM Employees WHERE Salary >= 4000;
SELECT * FROM Employees WHERE Salary BETWEEN 3000 AND 6000;
SELECT * FROM Customers WHERE City IN ('Tashkent', 'Samarkand');
SELECT * FROM Employees WHERE NOT Salary < 4000;

drop table Employees
-- 1. Jadval yaratamiz
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(50),
    City VARCHAR(30),
    Salary DECIMAL(10,2),
    Phone VARCHAR(20) NULL
);

-- 2. Ma'lumot kiritamiz
INSERT INTO Employees (EmpID, FullName, City, Salary, Phone) VALUES
(1, 'Ali Karimov', 'Tashkent', 2500, NULL),
(2, 'Sardor Rasulov', 'Samarqand', 4800, '998901112233'),
(3, 'Dilshod Akramov', 'Bukhara', 3200, '998901234567'),
(4, 'Sanjar Bekov', 'Tashkent', 6100, NULL),
(5, 'Madina Usmonova', 'Andijan', 2900, '998935556677'),
(6, 'Shahnoza Karimova', 'Samarqand', 7000, '998977778899');

select * from Employees

SELECT TOP 2 FullName, Salary
FROM Employees
ORDER BY Salary ASC;



Shaharlarni faqat bir marta, alfavit tartibida chiqaring.


SELECT DISTINCT City
FROM Employees
ORDER BY City;



Puzzle 3

Telefon raqami NULL bo‘lganlarni “Telefon mavjud emas” deb chiqaring.


SELECT FullName,
       ISNULL(Phone, 'Telefon mavjud emas') AS PhoneInfo
FROM Employees;


6. LIKE va Wildcards

LIKE → pattern bo‘yicha qidirish.

% – bir nechta belgi

_ – bitta belgi

Ismi A bilan boshlanadigan mijozlarni chiqarish.

Katalogdan kod ichida -2 bo‘lgan buyurtmalarni topish.

SELECT * FROM Customers WHERE FullName LIKE '%A';
SELECT * FROM Customers WHERE FullName LIKE '_a%';

7. ESCAPE

Wildcard belgilarning o‘zini qidirish uchun ESCAPE ishlatiladi.


CREATE TABLE Codes (
    ID INT PRIMARY KEY,
    Code VARCHAR(20)
);

INSERT INTO Codes VALUES
(1, 'A%123'),
(2, 'B_456'),
(3, 'C%_789');

select * from Codes
-- % ni literal qidirish
SELECT * FROM Codes WHERE Code LIKE '%\%%' ESCAPE '\';

-- _ ni literal qidirish
SELECT * FROM Codes WHERE Code LIKE '%\_%' ESCAPE '\';


8. ANY va ALL

🔹 Teoriya:

ANY → shart bitta qiymatga mos kelsa yetarli.

ALL → hamma qiymatlar shartga mos bo‘lishi kerak.

Talabaning yoshi har qanday o‘qituvchidan katta (ANY).

Talabaning yoshi hamma o‘qituvchilardan katta (ALL).
drop table Students

CREATE TABLE Teachers (
    TID INT PRIMARY KEY,
    Age INT
);

INSERT INTO Teachers VALUES (1, 30), (2, 40), (3, 50);

CREATE TABLE Students (
    SID INT PRIMARY KEY,
    Age INT
);

INSERT INTO Students VALUES (1, 25), (2, 35), (3, 55);

select * from Teachers
select * from Students
-- ANY
SELECT * FROM Students
WHERE Age > ANY (SELECT Age FROM Teachers);

-- ALL
SELECT * FROM Students
WHERE Age > ALL (SELECT Age FROM Teachers);


SELECT column_list
FROM table_name
WHERE conditions
GROUP BY group_list
HAVING group_condition
ORDER BY order_list

drop table Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'iPhone-13', 'Phone', 900),
(2, 'Galaxy-S21', 'Phone', 850),
(3, 'MacBook-Pro', 'Laptop', 2000),
(4, 'ThinkPad_X1', 'Laptop', 1800),
(5, 'Dell-123', 'Laptop', 1200),
(6, 'Sony-TV-55', 'TV', 1100),
(7, 'LG_TV_65', 'TV', 1500);

select * from Products

Nomida “-” belgisi bo‘lgan mahsulotlarni toping.


SELECT * 
FROM Products
WHERE ProductName LIKE '%-%';

📌 Ikkinchi belgisi “a” bo‘lgan mahsulotlarni chiqaring.


SELECT * 
FROM Products
WHERE ProductName LIKE '_a%';



CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Books VALUES
(1, 'Math Basics', 50),
(2, 'SQL Guide', 70),
(3, 'Data Science', 90),
(4, 'AI Intro', 120);

CREATE TABLE Students2 (
    SID INT PRIMARY KEY,
    FullName VARCHAR(50),
    BookPrice DECIMAL(10,2)
);

INSERT INTO Students2 VALUES
(1, 'Azizbek', 40),
(2, 'Dilshod', 60),
(3, 'Malika', 100),
(4, 'Kamola', 130);

select * from Books
select * from Students2
Eng arzon kitob narxidan ham kam narxga kitob olgan o‘quvchilarni chiqaring.

select * from Books
select * from Students2
SELECT FullName, BookPrice
FROM Students2
WHERE BookPrice < ANY (SELECT Price FROM Books);


3 ta eng qimmat kitob narxidan ham qimmat sotib olgan o‘quvchini chiqaring.



SELECT FullName, BookPrice
FROM Students2
WHERE BookPrice > ALL (
    SELECT TOP 3 Price 
    FROM Books
    ORDER BY Price DESC
);
