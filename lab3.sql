--- Creating the Database
CREATE DATABASE Movies;

--- Creating the four entities/tables
--- Director Table
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    DirectorName VARCHAR(30) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

--- Genres Table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(30) NOT NULL,
    AgeGuide VARCHAR(20) NOT NULL,
    Notes Text
);

--- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL,
    Notes Text
);

--- Movies Table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    ReleaseDate DateTime,
    MovieLength Time,
    GenreID INT NOT NULL,
    CategoryID INT NOT NULL,
    Rating Text,
    Notes Text
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)




/*
Queries for manipulating the tables created


 */

 --- b) i.
 SELECT * FROM Movies;

 --- b) ii.
 SELECT CategoryID, CategoryName FROM Categories;

 --- b) iii.
 SELECT * FROM Directors
 WHERE CategoryName = 'romance'
 order by CategoryID asc;

 --- b) iv.
SELECT MovieID, Title, ReleaseDate FROM Movies
WHERE ReleaseDate > '1st January 2020';

 --- b) v.
SELECT TOP 3 * FROM Movies
WHERE ReleaseDate < '31st December 2020'
order by ReleaseDate desc;

