
-- Utfört av Alexander Johansson YH25

CREATE DATABASE inlamning1; -- skapar databasen som motsvarar en liten bokhandel
USE inlamning1; -- använder databasen för konfigurering

CREATE TABLE Kunder (   -- Skapa Kunder-tabellen
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Epost VARCHAR(255) UNIQUE NOT NULL,
    Telefon VARCHAR(30) NOT NULL,
    Adress VARCHAR(50) NOT NULL
);


CREATE TABLE Bocker (  -- Skapa Bocker-tabellen
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    Forfattare VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Titel VARCHAR(50) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0),
    Lagerstatus INT NOT NULL
);


CREATE TABLE Bestallningar (  -- Skapa Bestallningar-tabellen
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Totalbelopp DECIMAL(10,2) NOT NULL CHECK (Totalbelopp > 0),
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
);


CREATE TABLE Orderrader (   -- Skapa Orderrader-tabellen
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN INT NOT NULL,
    Ordernummer INT NOT NULL,
    Antal INT NOT NULL CHECK (Antal > 0),
    FOREIGN KEY (Ordernummer) REFERENCES Bestallningar(Ordernummer),
    FOREIGN KEY (ISBN) REFERENCES Bocker(ISBN)
);


INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES -- Skapa kunder i kunder-tabellen.
    ('Paul Atreides', 'paul.atreides@dune.com', '123', 'Arrakis'),
    ('Duncan Idaho', 'duncan.idaho@dune.com', '456', 'Arrakis'),
    ('Glossu Rabban', 'glossu.rabban@dune.com', '789', 'Arrakis');


INSERT INTO Bocker (Titel, Pris, Genre, Forfattare, Lagerstatus) VALUES -- Skapa produkter i produkter-tabellen.
    ('Dune', 199.99, 'Sci-fi', 'Frank Herbert', 10),
    ('Chronicles of the Spice Horizon', 149.99, 'Sci-fi', 'Ravrek al-Dahim', 3),
    ('Dune: House Atreides', 199.99, 'Sci-fi', 'Brian Herbet', 5);



SELECT * FROM Kunder; -- Hämtar data från Kunder-tabellen.

SELECT * FROM Kunder WHERE Namn = 'Paul Atreides';  -- Hämtar endast specifik namndata från Kunder-tabellen .

SELECT * FROM Bocker WHERE Pris > 100; -- Hämtar endast produkter över 100kr från Produkter-tabellen .

SELECT * FROM Bocker ORDER BY Pris DESC; -- Hämtar data med sorterat pris från Produkter-tabellen
