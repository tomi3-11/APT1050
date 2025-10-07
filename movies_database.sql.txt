--- Creating the Database
CREATE DATABASE Movies;

--- Creating the four entities/tables
--- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL,
    Notes Text
);

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

--- Movies Table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    ReleaseDate DateTime,
    MovieLength Time,
    GenreID INT NOT NULL,
    CategoryID INT NOT NULL,
    Rating Text,
    Notes Text,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ==============================
-- POPULATE TABLES WITH DATA
-- ==============================

-- Insert into Categories
INSERT INTO Categories (CategoryID, CategoryName, Notes) VALUES
(1, 'Action', 'High-paced movies with fights, explosions, and stunts'),
(2, 'Comedy', 'Light-hearted movies meant to make the audience laugh'),
(3, 'Drama', 'Serious themes focusing on character development'),
(4, 'Horror', 'Scary films with supernatural or psychological themes'),
(5, 'Romance', 'Love and relationship focused stories'),
(6, 'Sci-Fi', 'Futuristic science and technology concepts'),
(7, 'Fantasy', 'Imaginative worlds with magic and mythical creatures'),
(8, 'Thriller', 'Suspenseful movies full of tension'),
(9, 'Animation', 'Movies created using animation techniques'),
(10, 'Documentary', 'Non-fictional, informative films');

-- Insert into Directors
INSERT INTO Directors (DirectorID, DirectorName, CategoryID) VALUES
(1, 'Christopher Nolan', 1),
(2, 'Quentin Tarantino', 1),
(3, 'Steven Spielberg', 2),
(4, 'Martin Scorsese', 3),
(5, 'James Wan', 4),
(6, 'Greta Gerwig', 5),
(7, 'Ridley Scott', 6),
(8, 'Peter Jackson', 7),
(9, 'Alfred Hitchcock', 8),
(10, 'Hayao Miyazaki', 9);

-- Insert into Genres
INSERT INTO Genres (GenreID, GenreName, AgeGuide, Notes) VALUES
(1, 'Superhero', 'PG-13', 'Based on comic books, superhuman characters'),
(2, 'Romantic Comedy', 'PG', 'Romance mixed with humor'),
(3, 'Crime Drama', 'R', 'Dark stories about crime and justice'),
(4, 'Slasher', 'R', 'Horror with serial killers'),
(5, 'Historical Romance', 'PG-13', 'Romantic story in a historical setting'),
(6, 'Space Opera', 'PG-13', 'Sci-fi set in space with epic scale'),
(7, 'Epic Fantasy', 'PG-13', 'Magical worlds with large scale adventures'),
(8, 'Psychological Thriller', 'R', 'Mind-bending suspense and twists'),
(9, 'Anime', 'PG', 'Japanese-style animation'),
(10, 'Nature Documentary', 'G', 'Films about wildlife and nature');

-- Insert into Movies
INSERT INTO Movies (MovieID, Title, ReleaseDate, MovieLength, GenreID, CategoryID, Rating, Notes) VALUES
(1, 'The Dark Knight', '2008-07-18', '02:32:00', 1, 1, '9/10', 'Batman vs Joker'),
(2, 'Inception', '2010-07-16', '02:28:00', 6, 6, '8.8/10', 'Dream manipulation'),
(3, 'Pulp Fiction', '1994-10-14', '02:34:00', 3, 1, '8.9/10', 'Crime anthology'),
(4, 'Jurassic Park', '1993-06-11', '02:07:00', 6, 2, '8.1/10', 'Dinosaurs return'),
(5, 'The Godfather', '1972-03-24', '02:55:00', 3, 3, '9.2/10', 'Mafia family'),
(6, 'The Conjuring', '2013-07-19', '01:52:00', 4, 4, '7.5/10', 'Supernatural horror'),
(7, 'La La Land', '2016-12-09', '02:08:00', 2, 5, '8.0/10', 'Romantic musical'),
(8, 'Blade Runner 2049', '2017-10-06', '02:44:00', 6, 6, '8.0/10', 'Futuristic sci-fi'),
(9, 'The Lord of the Rings: Fellowship of the Ring', '2001-12-19', '02:58:00', 7, 7, '8.8/10', 'Epic fantasy adventure'),
(10, 'Spirited Away', '2001-07-20', '02:05:00', 9, 9, '8.6/10', 'Anime fantasy');
