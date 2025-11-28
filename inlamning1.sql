
-- Utfört av Alexander Johansson YH25

CREATE DATABASE inlamning1; -- skapar databasen som motsvarar en liten bokhandel
USE inlamning1; -- använder databasen för att kunna ändra/läsa av innehållet i databasen.


 -- Skapa Kunder-tabellen med fem attributer som innehåller kundinformation
CREATE TABLE Kunder (   
    KundID INT AUTO_INCREMENT PRIMARY KEY, 
    Namn VARCHAR(100) NOT NULL, 
    Epost VARCHAR(255) UNIQUE NOT NULL, 
    Telefon VARCHAR(30) NOT NULL,
    Adress VARCHAR(100) NOT NULL
);

 -- Skapa Bocker-tabellen med sex attributer som innehåller information om böcker
CREATE TABLE Bocker (  
    ISBN BIGINT PRIMARY KEY, -- Böckernas ID nummer i form av ISBN (ISBN är unikt för boken)
    Forfattare VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Titel VARCHAR(50) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0), 
    Lagerstatus INT NOT NULL
);

-- Skapa Bestallningar-tabellen med fyra attributer som innehåller information om beställning
CREATE TABLE Bestallningar ( 
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Totalbelopp DECIMAL(10,2) NOT NULL CHECK (Totalbelopp > 0),
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID) -- Lånar primärnyckel från KundID i Kunder-tabellen
);


-- Skapa Orderrader-tabellen med fyra attributer som innehåller orderinformation
CREATE TABLE Orderrader (   
    OrderradID INT AUTO_INCREMENT PRIMARY KEY, 
    ISBN BIGINT NOT NULL,
    Ordernummer INT NOT NULL,
    Antal INT NOT NULL CHECK (Antal > 0), 
    FOREIGN KEY (Ordernummer) REFERENCES Bestallningar(Ordernummer), -- Lånar primärnyckel från ordernummer i Bestallningar-tabellen 
    FOREIGN KEY (ISBN) REFERENCES Bocker(ISBN) -- Lånar primärnyckel från ISBN i Böcker-tabellen 
);

-- Infogar data i kunder-tabellen
INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES 
    ('Paul Atreides', 'paul.atreides@dune.com', '123', 'Arrakis'),
    ('Duncan Idaho', 'duncan.idaho@dune.com', '456', 'Arrakis'),
    ('Glossu Rabban', 'glossu.rabban@dune.com', '789', 'Arrakis');


INSERT INTO Bocker (ISBN, Titel, Pris, Genre, Forfattare, Lagerstatus) VALUES -- Infogar data i böcker-tabellen
    ('9834032234', 'Dune', 199.99, 'Sci-fi', 'Frank Herbert', 10), 
    ('9634982340', 'Chronicles of the Spice Horizon', 149.99, 'Sci-fi', 'Ravrek al-Dahim', 3),
    ('9324234311', 'Dune: House Atreides', 199.99, 'Sci-fi', 'Brian Herbet', 5);

-- För att få fram resultat visuellt från tabellerna.

SELECT * FROM Kunder; -- Hämtar data från Kunder-tabellen.

SELECT * FROM Kunder WHERE Namn = 'Paul Atreides';  -- Hämtar endast specifik namndata från Kunder-tabellen .

SELECT * FROM Bocker WHERE Pris > 100; -- Hämtar endast produkter över 100kr från Produkter-tabellen .

SELECT * FROM Bocker ORDER BY Pris DESC; -- Hämtar data med sorterat pris från Produkter-tabellen


/*
Där det står NOT NULL måste det stå något. 
Primary key samt UNIQUE NOT NULL är unika värden som MÅSTE vara unika.
ISBN är som böckernas "personnummer" är unikt och ändras inte. 

När man exekverar raderna 1-54 så skapas databasen, tabellerna + attributerna samt lite data infogas även i tabellerna.
Jag har adderat några SELECT FROM så att man kan visa resultat av tabellerna rent visuellt.

*/
