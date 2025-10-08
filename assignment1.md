# Assignemnt 1 

## Question 1

Consider two Tables, tEmployee and tDepartment with the fields shown (in brackets)
tEmployee (EmpNo, FirstName, LastName, JobTitle, HireDate, Salary, Dept No)
tDepartment (DeptNo, DeptName, Location)

#### a. Create the Tables in MS SQL Server, and set most __appropriate data types__ for each column.

#### b. Identify and set an appropriate **Primary Key** for each table.
```sql

CREATE TABLE tDepartment (
    DeptNo INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
)

CREATE TABLE tEmployee (
    EmpNo INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    HireDate Date NOT NULL,
    Salary DECIMAL(8, 0),
    DeptNo INT, 
    FOREIGN KEY (DeptNo) REFERENCES tDepartment(DeptNo)
)


```


#### C. Polpulate the tEmployee with 10 records and tDepartment with 4 records

```sql
-- Department table 

INSERT INTO tDepartment (DeptNo, DeptName, Location) VALUES
(10, 'Human Resources', 'Nairobi'),
(20, 'Finance', 'Mombasa'),
(30, 'IT', 'Kisumu'),
(40, 'Marketing', 'Eldoret');

-- Employee table
INSERT INTO tEmployee (EmpNo, FirstName, LastName, JobTitle, HireDate, Salary, DeptNo) VALUES
(1001, 'Alice', 'Mwangi', 'HR Manager', '2018-03-15', 95000, 10),
(1002, 'Brian', 'Otieno', 'Recruiter', '2020-06-10', 60000, 10),
(1003, 'Cynthia', 'Kariuki', 'Accountant', '2019-02-01', 75000, 20),
(1004, 'David', 'Ouma', 'Financial Analyst', '2021-08-22', 70000, 20),
(1005, 'Esther', 'Njoroge', 'Software Engineer', '2017-11-12', 110000, 30),
(1006, 'Felix', 'Mutua', 'System Administrator', '2019-09-25', 90000, 30),
(1007, 'Grace', 'Kamau', 'IT Support', '2022-01-15', 55000, 30),
(1008, 'Henry', 'Odhiambo', 'Marketing Executive', '2020-05-05', 65000, 40),
(1009, 'Irene', 'Wambui', 'Content Strategist', '2021-03-30', 60000, 40),
(1010, 'James', 'Njenga', 'Graphic Designer', '2023-02-10', 58000, 40);


```

#### D. Write query to display all fields in tEmployee
```sql

SELECT * FROM tEmployee;

```

#### E. Write a query to display the employee number, FirstName, LastName and HireDate. From tEmployee displayed in ascending Order using HireDate.

```sql

SELECT EmpNo, FirstName, LastName, HireDate
FROM tEmployee
ORDER BY HireDate asc;

```

#### F. Write a query to display the EmpNo, FirstName, LastName and DepName of employees in particular department.

```sql

SELECT EmpNo, FirstName, LastName, tDepartment.DeptName
FROM tEmployee
INNER JOIN tDepartment
ON tEmployee.DeptNo = tDepartment.DeptNo
WHERE tDepartment.DeptName = 'Human Resources'

```






## Question 2
#### a. Create the Tables in  MS SQL server, set most appropriate data types for each column and set appropriate Primary Key / Composite Key for each Table.

```sql

CREATE TABLE tHotel (
    hotelNo INT PRIMARY KEY,
    hotelName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE tRoom (
    roomNo INT,
    hotelNo INT,
    roomType VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (roomNo, hotelNo),
    FOREIGN KEY (hotelNo) REFERENCES tHotel(hotelNo)
);

CREATE TABLE tGuest (
    guestNo INT PRIMARY KEY,
    guestName VARCHAR(100) NOT NULL,
    guestAddress VARCHAR(150) NOT NULL
);

CREATE TABLE tBooking (
    hotelNo INT,
    guestNo INT,
    roomNo INT,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    PRIMARY KEY (hotelNo, guestNo, roomNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES tHotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES tGuest(guestNo),
    FOREIGN KEY (roomNo, hotelNo) REFERENCES tRoom(roomNo, hotelNo)
);

```

#### b. Populate each of the Tables with at least 10 records

```sql

-- Hotels
INSERT INTO tHotel VALUES
(1, 'Grand Palace', 'New York'),
(2, 'Ocean View', 'Miami'),
(3, 'Mountain Retreat', 'Denver'),
(4, 'City Lights', 'Chicago'),
(5, 'Lakeside Inn', 'Orlando'),
(6, 'Sunrise Hotel', 'San Diego'),
(7, 'Desert Oasis', 'Phoenix'),
(8, 'Riverfront Hotel', 'Dallas'),
(9, 'Skyline Suites', 'Seattle'),
(10, 'Harbor Hotel', 'Boston');

-- Rooms (at least 2 per hotel)
INSERT INTO tRoom VALUES
(101, 1, 'Single', 120.00), (102, 1, 'Double', 180.00),
(201, 2, 'Suite', 300.00),  (202, 2, 'Double', 200.00),
(301, 3, 'Single', 100.00), (302, 3, 'Double', 160.00),
(401, 4, 'Suite', 350.00),  (402, 4, 'Single', 130.00),
(501, 5, 'Double', 170.00), (502, 5, 'Suite', 290.00),
(601, 6, 'Single', 150.00), (602, 6, 'Double', 220.00),
(701, 7, 'Single', 140.00), (702, 7, 'Suite', 260.00),
(801, 8, 'Double', 200.00), (802, 8, 'Suite', 320.00),
(901, 9, 'Single', 180.00), (902, 9, 'Double', 240.00),
(1001, 10, 'Single', 160.00), (1002, 10, 'Suite', 280.00);

-- Guests
INSERT INTO tGuest VALUES
(1, 'Alice Johnson', '123 Main St, New York'),
(2, 'Bob Smith', '456 Ocean Dr, Miami'),
(3, 'Carol White', '789 Hill Rd, Denver'),
(4, 'David Brown', '101 State St, Chicago'),
(5, 'Eva Green', '202 Lakeview, Orlando'),
(6, 'Frank Moore', '303 Sunrise Blvd, San Diego'),
(7, 'Grace Lee', '404 Desert Rd, Phoenix'),
(8, 'Henry Young', '505 River St, Dallas'),
(9, 'Ivy King', '606 Skyline Ave, Seattle'),
(10, 'Jack Wilson', '707 Harbor Ln, Boston');

-- Bookings (valid foreign keys only)
INSERT INTO tBooking VALUES
(1, 1, 101, '2025-10-01', '2025-10-05'), -- Alice, New York
(1, 2, 102, '2025-09-20', '2025-09-25'), -- Bob, New York
(2, 3, 201, '2025-08-10', '2025-08-15'), -- Carol, Miami
(2, 4, 202, '2025-07-01', '2025-07-03'), -- David, Miami
(3, 5, 301, '2025-06-05', '2025-06-10'), -- Eva, Denver
(4, 6, 401, '2025-05-15', '2025-05-20'), -- Frank, Chicago
(5, 7, 501, '2025-04-10', '2025-04-15'), -- Grace, Orlando
(6, 8, 601, '2025-03-01', '2025-03-05'), -- Henry, San Diego
(9, 9, 901, '2025-02-12', '2025-02-16'), -- Ivy, Seattle
(10, 10, 1001, '2025-01-20', '2025-01-25'); -- Jack, Boston


```

#### c. Write a query to display the names of quests booked in a particular hotel in *New York* . Your query should retrieve some records.

```sql

SELECT 
    tGuest.guestNo, 
    tGuest.guestName, 
    tHotel.hotelName, 
    tHotel.City
FROM tGuest
INNER JOIN tBooking ON tGuest.guestNo = tBooking.guestNo
INNER JOIN tHotel ON tBooking.hotelNo = tHotel.hotelNo
WHERE tHotel.City = 'New York';

```
