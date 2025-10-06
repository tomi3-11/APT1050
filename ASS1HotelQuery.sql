use Hotel
DROP TABLE IF EXISTS tBooking;
DROP TABLE IF EXISTS tRoom;
DROP TABLE IF EXISTS tGuest;
DROP TABLE IF EXISTS tHotel;

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

SELECT 
    tGuest.guestNo, 
    tGuest.guestName, 
    tHotel.hotelName, 
    tHotel.City
FROM tGuest
INNER JOIN tBooking ON tGuest.guestNo = tBooking.guestNo
INNER JOIN tHotel ON tBooking.hotelNo = tHotel.hotelNo
WHERE tHotel.City = 'New York';

