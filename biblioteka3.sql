# DROP DATABASE IF EXISTS Library;
CREATE DATABASE IF NOT EXISTS Library; 
USE Library;

 -- tworzenie trzech tabel
 
CREATE TABLE books (
    booksID INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    number_of_pages SMALLINT NOT NULL,
    publishing_house VARCHAR(50) NOT NULL,
    hard_cover ENUM('T', 'N'),
    year_of_publication SMALLINT,
    PRIMARY KEY (booksID)
);


# nowe ograniczenie UNIQUE
CREATE TABLE members (
    membersID INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street VARCHAR(50) NOT NULL,
    house_number VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code CHAR(6) NOT NULL,
    phone_number CHAR(8) NOT NULL,
    PRIMARY KEY (membersID),
    UNIQUE (phone_number)
);

# nowe ograniczenie ON DELETE CASCADE

CREATE TABLE borrowing (
    borrowingID INT AUTO_INCREMENT,
    booksID INT NOT NULL,
    membersID INT NOT NULL,
    borrowing_date DATE NOT NULL,
    return_date DATE,
    comments VARCHAR(200),
    FOREIGN KEY (booksID)
        REFERENCES books (booksID)
        ON DELETE CASCADE,
    FOREIGN KEY (membersID)
        REFERENCES members (membersID)
        ON DELETE CASCADE,
    PRIMARY KEY (borrowingID)
);


# ON DELETE CASCADE jeśli usunę czytelnika z tabeli members 
# to w tej (zależnej) tabeli (borrowing) rekordy (dotyczące tego użytkownika) będą też usunięte

-- wstawianie danych do tabeli books (216 książek)
    
INSERT INTO books (title, number_of_pages, publishing_house, hard_cover, year_of_publication) VALUES
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Szeptem Gwiazd', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności', 400, 'Portal Fantazji Books', 'T', 2022),
('Książka o czymś', 200, 'Gryfonia Press', NULL, 2020),
('Przykładowa Książka', 280, 'Wydawnictwo Szept', 'N', 2021),
('Niezwykła Książka', 350, 'Magia Literatury', NULL, 2019),
('Książka o niczym', 420, 'Księgarnia Zmysłów', 'N', 2020),
('Wielka Książka', 300, 'Wydawnictwo Przeznaczenie', NULL, 2018),
('Mała Książka', 380, 'Nimbus Books', 'T', 2022),
('Inna Książka', 250, 'Astralne Wydawnictwo', 'N', 2021),
('Tajemnicza Książka', 320, 'Książki Złudzeń', NULL, 2023),
('Fantastyczna Książka', 360, 'Portal Fantazji Books', 'T', 2024),
('Magiczna Książka', 400, 'Alchemiczne Wydawnictwo', 'N', 2020),
('Maze of Dreams', 400, 'Whisper Publishing', 'T', 2023),
('Shadows of Memory', 280, 'Senses Books', 'N', 2022),
('Mysterious Sonata', 350, 'Alchemy Press', 'T', 2024),
('Cloud of Hope', 420, 'Nimbus Books', 'T', 2023),
('Serpent of the Fiery Summer', 300, 'Magic Literature', 'N', 2021),
('Shreds of Time', 380, 'Destiny Publishing', 'T', 2022),
('Enchanted Hill', 250, 'Gryphon Press', 'N', 2024),
('Dark Portal', 320, 'Illusion Books', 'T', 2023),
('Whisper of Stars', 360, 'Astral Publishing', 'N', 2021),
('Key to Infinity', 400, 'Fantasy Portal Books', 'T', 2022),
('Book about Something', 200, 'Gryphon Press', NULL, 2020),
('Sample Book', 280, 'Whisper Publishing', 'T', 2021),
('Extraordinary Book', 350, 'Magic Literature', NULL, 2019),
('Book about Nothing', 420, 'Senses Books', 'N', 2020),
('Great Book', 300, 'Destiny Publishing', NULL, 2018),
('Small Book', 380, 'Nimbus Books', 'T', 2022),
('Another Book', 250, 'Astral Publishing', 'N', 2021),
('Mysterious Book', 320, 'Illusion Books', NULL, 2023),
('Fantastic Book', 360, 'Fantasy Portal Books', 'T', 2024),
('Magical Book', 400, 'Alchemy Press', 'N', 2020),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Szeptem Gwiazd', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności', 400, 'Portal Fantazji Books', 'T', 2022),
('Księga o czymś', 200, 'Gryfonia Press', NULL, 1935),
('Przykładowa Księga', 280, 'Wydawnictwo Szept', 'N', 1940),
('Niezwykła Księga', 350, 'Magia Literatury', NULL, 1930),
('Księga o niczym', 420, 'Księgarnia Zmysłów', 'N', 1925),
('Wielka Księga', 300, 'Wydawnictwo Przeznaczenie', NULL, 1945),
('Mała Księga', 380, 'Nimbus Books', 'T', 1937),
('Inna Księga', 250, 'Astralne Wydawnictwo', 'N', 1943),
('Tajemnicza Księga', 320, 'Książki Złudzeń', NULL, 1920),
('Fantastyczna Księga', 360, 'Portal Fantazji Books', 'T', 1939),
('Magiczna Księga', 400, 'Alchemiczne Wydawnictwo', 'N', 1944),
('Labirynt Kognitywnych Struktur', 400, 'Wydawnictwo Szept', 'T', 2023),
('Pamięć a Neuroplastyczność', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Sonata Neuronowa: Analiza Fonologiczna', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Nadzieja a Neurotransmisja', 420, 'Nimbus Books', 'T', 2023),
('Ognisty Mechanizm Wzrokowy', 300, 'Magia Literatury', 'N', 2021),
('Czasoprzestrzenne Rozdrobnienie: Analiza Statystyczna', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Wzgórze Algorytmów: Teoria Informatyki', 250, 'Gryfonia Press', 'N', 2024),
('Portal Kwantowy: Ekstrakcja Wiedzy', 320, 'Książki Złudzeń', 'T', 2023),
('Gwiazdowy Szept: Neurofizjologia Snów', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności: Wprowadzenie do Teorii Chaosu', 400, 'Portal Fantazji Books', 'T', 2022),
('Księga o Niewidzialnych Strukturach', 200, 'Gryfonia Press', NULL, 1935),
('Analiza Wielowymiarowa: Podstawy Statystyki', 280, 'Wydawnictwo Szept', 'T', 1940),
('Kwantowa Natura Czasu: Paradygmatyczne Studium', 350, 'Magia Literatury', NULL, 1930),
('Księga o Nicosci: Mechanizmy Poznawcze', 420, 'Księgarnia Zmysłów', 'N', 1925),
('Wielka Synteza: Transgresja i Integracja', 300, 'Wydawnictwo Przeznaczenie', NULL, 1945),
('Kognitywna Redukcja: Neurobiologia Intelektu', 380, 'Nimbus Books', 'T', 1937),
('Zaawansowane Algorytmy Obliczeniowe', 250, 'Astralne Wydawnictwo', 'N', 1943),
('Teoria Kwantowa Wiedzy: Filozoficzne Implikacje', 320, 'Książki Złudzeń', NULL, 1920),
('Mechanizmy Geniuszu: Neurofizjologia Twórczości', 360, 'Portal Fantazji Books', 'T', 1939),
('Integracyjne Paradygmaty: Synteza Wiedzy', 400, 'Alchemiczne Wydawnictwo', 'N', 1944),
('Labirynt Kognitywnych Struktur', 389, 'Wydawnictwo Szept', 'T', 2023),
('Pamięć a Neuroplastyczność', 277, 'Księgarnia Zmysłów', 'N', 2022),
('Sonata Neuronowa: Analiza Fonologiczna', 357, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Nadzieja a Neurotransmisja', 428, 'Nimbus Books', 'T', 2023),
('Ognisty Mechanizm Wzrokowy', 305, 'Magia Literatury', 'N', 2021),
('Czasoprzestrzenne Rozdrobnienie: Analiza Statystyczna', 384, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Wzgórze Algorytmów: Teoria Informatyki', 246, 'Gryfonia Press', 'N', 2024),
('Portal Kwantowy: Ekstrakcja Wiedzy', 319, 'Książki Złudzeń', 'T', 2023),
('Gwiazdowy Szept: Neurofizjologia Snów', 361, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności: Wprowadzenie do Teorii Chaosu', 407, 'Portal Fantazji Books', 'T', 2022),
('Księga o Niewidzialnych Strukturach', 202, 'Gryfonia Press', NULL, 1935),
('Analiza Wielowymiarowa: Podstawy Statystyki', 282, 'Wydawnictwo Szept', 'T', 1940),
('Kwantowa Natura Czasu: Paradygmatyczne Studium', 358, 'Magia Literatury', NULL, 1930),
('Księga o Nicosci: Mechanizmy Poznawcze', 417, 'Księgarnia Zmysłów', 'N', 1925),
('Wielka Synteza: Transgresja i Integracja', 302, 'Wydawnictwo Przeznaczenie', NULL, 1945),
('Kognitywna Redukcja: Neurobiologia Intelektu', 387, 'Nimbus Books', 'T', 1937),
('Zaawansowane Algorytmy Obliczeniowe', 255, 'Astralne Wydawnictwo', 'N', 1943),
('Teoria Kwantowa Wiedzy: Filozoficzne Implikacje', 333, 'Książki Złudzeń', NULL, 1920),
('Mechanizmy Geniuszu: Neurofizjologia Twórczości', 366, 'Portal Fantazji Books', 'T', 1939),
('Integracyjne Paradygmaty: Synteza Wiedzy', 401, 'Alchemiczne Wydawnictwo', 'N', 1944),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Szeptem Gwiazd', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności', 400, 'Portal Fantazji Books', 'T', 2022),
('Książka o czymś', 200, 'Gryfonia Press', NULL, 2020),
('Przykładowa Książka', 280, 'Wydawnictwo Szept', 'N', 2021),
('Niezwykła Książka', 350, 'Magia Literatury', NULL, 2019),
('Książka o niczym', 420, 'Księgarnia Zmysłów', 'N', 2020),
('Wielka Książka', 300, 'Wydawnictwo Przeznaczenie', NULL, 2018),
('Mała Książka', 380, 'Nimbus Books', 'T', 2022),
('Inna Książka', 250, 'Astralne Wydawnictwo', 'N', 2021),
('Tajemnicza Książka', 320, 'Książki Złudzeń', NULL, 2023),
('Fantastyczna Książka', 360, 'Portal Fantazji Books', 'T', 2024),
('Magiczna Książka', 400, 'Alchemiczne Wydawnictwo', 'N', 2020),
('Maze of Dreams', 400, 'Whisper Publishing', 'T', 2023),
('Shadows of Memory', 280, 'Senses Books', 'N', 2022),
('Mysterious Sonata', 350, 'Alchemy Press', 'T', 2024),
('Cloud of Hope', 420, 'Nimbus Books', 'T', 2023),
('Serpent of the Fiery Summer', 300, 'Magic Literature', 'N', 2021),
('Shreds of Time', 380, 'Destiny Publishing', 'T', 2022),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Szeptem Gwiazd', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności', 400, 'Portal Fantazji Books', 'T', 2022),
('Książka o czymś', 200, 'Gryfonia Press', NULL, 2020),
('Przykładowa Książka', 280, 'Wydawnictwo Szept', 'N', 2021),
('Niezwykła Książka', 350, 'Magia Literatury', NULL, 2019),
('Książka o niczym', 420, 'Księgarnia Zmysłów', 'N', 2020),
('Wielka Książka', 300, 'Wydawnictwo Przeznaczenie', NULL, 2018),
('Mała Książka', 380, 'Nimbus Books', 'T', 2022),
('Inna Książka', 250, 'Astralne Wydawnictwo', 'N', 2021),
('Tajemnicza Książka', 320, 'Książki Złudzeń', NULL, 2023),
('Fantastyczna Książka', 360, 'Portal Fantazji Books', 'T', 2024),
('Magiczna Książka', 400, 'Alchemiczne Wydawnictwo', 'N', 2020),
('Maze of Dreams', 400, 'Whisper Publishing', 'T', 2023),
('Shadows of Memory', 280, 'Senses Books', 'N', 2022),
('Mysterious Sonata', 350, 'Alchemy Press', 'T', 2024),
('Cloud of Hope', 420, 'Nimbus Books', 'T', 2023),
('Serpent of the Fiery Summer', 300, 'Magic Literature', 'N', 2021),
('Shreds of Time', 380, 'Destiny Publishing', 'T', 2022),
('Enchanted Hill', 250, 'Gryphon Press', 'N', 2024),
('Dark Portal', 320, 'Illusion Books', 'T', 2023),
('Whisper of Stars', 360, 'Astral Publishing', 'N', 2021),
('Key to Infinity', 400, 'Fantasy Portal Books', 'T', 2022),
('Book about Something', 200, 'Gryphon Press', NULL, 2020),
('Sample Book', 280, 'Whisper Publishing', 'T', 2021),
('Extraordinary Book', 350, 'Magic Literature', NULL, 2019),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Szeptem Gwiazd', 360, 'Astralne Wydawnictwo', 'N', 2021),
('Klucz do Nieskończoności', 400, 'Portal Fantazji Books', 'T', 2022),
('Książka o czymś', 200, 'Gryfonia Press', NULL, 2020),
('Przykładowa Książka', 280, 'Wydawnictwo Szept', 'N', 2021),
('Niezwykła Książka', 350, 'Magia Literatury', NULL, 2019),
('Książka o niczym', 420, 'Księgarnia Zmysłów', 'N', 2020),
('Wielka Książka', 300, 'Wydawnictwo Przeznaczenie', NULL, 2018),
('Mała Książka', 380, 'Nimbus Books', 'T', 2022),
('Inna Książka', 250, 'Astralne Wydawnictwo', 'N', 2021),
('Tajemnicza Książka', 320, 'Książki Złudzeń', NULL, 2023),
('Fantastyczna Książka', 360, 'Portal Fantazji Books', 'T', 2024),
('Magiczna Książka', 400, 'Alchemiczne Wydawnictwo', 'N', 2020),
('Maze of Dreams', 400, 'Whisper Publishing', 'T', 2023),
('Shadows of Memory', 280, 'Senses Books', 'N', 2022),
('Mysterious Sonata', 350, 'Alchemy Press', 'T', 2024),
('Cloud of Hope', 420, 'Nimbus Books', 'T', 2023),
('Serpent of the Fiery Summer', 300, 'Magic Literature', 'N', 2021),
('Shreds of Time', 380, 'Destiny Publishing', 'T', 2022),
('Enchanted Hill', 250, 'Gryphon Press', 'N', 2024),
('Dark Portal', 320, 'Illusion Books', 'T', 2023),
('Whisper of Stars', 360, 'Astral Publishing', 'N', 2021),
('Key to Infinity', 400, 'Fantasy Portal Books', 'T', 2022),
('Book about Something', 200, 'Gryphon Press', NULL, 2020),
('Sample Book', 280, 'Whisper Publishing', 'T', 2021),
('Extraordinary Book', 350, 'Magic Literature', NULL, 2019),
('Book about Nothing', 420, 'Senses Books', 'N', 2020),
('Great Book', 300, 'Destiny Publishing', NULL, 2018),
('Small Book', 380, 'Nimbus Books', 'T', 2022),
('Another Book', 250, 'Astral Publishing', 'N', 2021),
('Mysterious Book', 320, 'Illusion Books', NULL, 2023),
('Fantastic Book', 360, 'Fantasy Portal Books', 'T', 2024),
('Magical Book', 400, 'Alchemy Press', 'N', 2020),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Wąż Ognistego Lata', 300, 'Magia Literatury', 'N', 2021),
('Strzępy Czasu', 380, 'Wydawnictwo Przeznaczenie', 'T', 2022),
('Zaklęte Wzgórze', 250, 'Gryfonia Press', 'N', 2024),
('Mroczny Portal', 320, 'Książki Złudzeń', 'T', 2023),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Tajemnicza Sonata', 350, 'Alchemiczne Wydawnictwo', 'T', 2024),
('Obłok Nadziei', 420, 'Nimbus Books', 'T', 2023),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Cienie Pamięci', 280, 'Księgarnia Zmysłów', 'N', 2022),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023),
('Labirynt Marzeń', 400, 'Wydawnictwo Szept', 'T', 2023);

--  wstawianie danych do tabeli members (40 członków biblioteki)

INSERT INTO members (first_name, last_name, street, house_number, city, zip_code, phone_number) VALUES
('Jan', 'Kowalski', 'Kwiatowa', '10', 'Warszawa', '00-001', '12345678'),
('Anna', 'Nowak', 'Słoneczna', '20', 'Kraków', '30-002', '98765432'),
('Piotr', 'Wiśniewski', 'Leśna', '5', 'Gdańsk', '80-003', '55576677'),
('Maria', 'Dąbrowska', 'Lipowa', '15', 'Wrocław', '50-004', '11122233'),
('Andrzej', 'Zieliński', 'Polna', '8', 'Łódź', '90-005', '99988877'),
('Katarzyna', 'Kowalczyk', 'Ogrodowa', '3', 'Poznań', '60-006', '77766655'),
('Michał', 'Lewandowski', 'Mokra', '12', 'Szczecin', '70-007', '44455566'),
('Alicja', 'Woźniak', 'Rycerska', '7', 'Katowice', '40-008', '33322211'),
('Robert', 'Kamiński', 'Północna', '21', 'Gdynia', '81-009', '22253344'),
('Magdalena', 'Jankowska', 'Zachodnia', '6', 'Bydgoszcz', '80-010', '88899900'),
('Adam', 'Wójcik', 'Cicha', '14', 'Lublin', '20-011', '77711122'),
('Monika', 'Kwiatkowska', 'Wschodnia', '9', 'Rzeszów', '35-012', '66655544'),
('Tomasz', 'Kaczmarek', 'Słowiańska', '4', 'Olsztyn', '10-013', '11144477'),
('Karolina', 'Zawadzka', 'Długa', '11', 'Kielce', '25-014', '22277788'),
('Marcin', 'Szymański', 'Wiejska', '16', 'Opole', '45-015', '33388899'),
('Ewa', 'Kozłowska', 'Przemysłowa', '17', 'Zielona Góra', '65-016', '44499911'),
('Łukasz', 'Adamczyk', 'Zielona', '22', 'Częstochowa', '55-017', '55511122'),
('Patrycja', 'Piotrowska', 'Morska', '23', 'Radom', '30-018', '66622233'),
('Jakub', 'Grabowski', 'Parkowa', '18', 'Bielsko-Biała', '50-019', '77733344'),
('Aleksandra', 'Marciniak', 'Różana', '13', 'Tarnów', '40-020', '88844455'),
('Marcin', 'Kowalczyk', 'Klonowa', '24', 'Warszawa', '01-002', '11124233'),
('Monika', 'Lewandowska', 'Kwiatowa', '17', 'Kraków', '31-003', '22236344'),
('Paweł', 'Wójcik', 'Brzozowa', '8', 'Gdańsk', '81-004', '33364455'),
('Agnieszka', 'Nowakowska', 'Słoneczna', '5', 'Wrocław', '51-005', '44457566'),
('Kamil', 'Dąbrowski', 'Lipowa', '11', 'Łódź', '91-006', '55567677'),
('Natalia', 'Kamińska', 'Polna', '3', 'Poznań', '61-007', '66677788'),
('Mateusz', 'Zieliński', 'Ogrodowa', '9', 'Szczecin', '71-008', '77786899'),
('Karolina', 'Jankowska', 'Mokra', '6', 'Katowice', '41-009', '88899300'),
('Tomasz', 'Kowalski', 'Rycerska', '13', 'Gdynia', '82-010', '99903011'),
('Weronika', 'Adamczyk', 'Północna', '7', 'Bydgoszcz', '81-011', '00011122'),
('Daniel', 'Zawadzki', 'Zachodnia', '19', 'Lublin', '21-012', '11125233'),
('Magdalena', 'Kaczmarek', 'Cicha', '10', 'Rzeszów', '36-013', '22235344'),
('Bartosz', 'Szymański', 'Wschodnia', '4', 'Olsztyn', '11-014', '33344455'),
('Natalia', 'Kozłowska', 'Słowiańska', '18', 'Kielce', '26-015', '44455586'),
('Dominik', 'Piotrowski', 'Długa', '12', 'Opole', '46-016', '55566677'),
('Wiktoria', 'Grabowska', 'Wiejska', '15', 'Zielona Góra', '66-017', '66677728'),
('Aleksander', 'Marciniak', 'Przemysłowa', '20', 'Częstochowa', '56-018', '77789899'),
('Oliwia', 'Zielińska', 'Zielona', '25', 'Radom', '31-019', '88829900'),
('Kacper', 'Kowalczyk', 'Morska', '14', 'Bielsko-Biała', '51-020', '99910011'),
('Julia', 'Lewandowska', 'Parkowa', '16', 'Tarnów', '41-021', '00011152');

# uzupełniamy tabelę borrowing (uwaga - przestawione kolumny, 120 wypożyczeń)

INSERT INTO borrowing (membersID, booksID, borrowing_date, return_date, comments) VALUES
(1, 1, '2024-03-02', '2024-04-09', NULL),
(2, 2, '2024-03-02', '2024-04-08', NULL),
(3, 3, '2024-03-03', '2024-04-10', NULL),
(4, 4, '2024-03-03', NULL, 'Książka zniszczona'),
(5, 5, '2024-03-04', NULL, NULL),
(6, 6, '2024-03-04', NULL, NULL),
(7, 7, '2024-03-05', NULL, NULL),
(8, 8, '2024-04-05', '2024-04-11', NULL),
(9, 4, '2024-04-06', '2024-04-13', 'Książka z uszkodzoną okładką'),
(10, 10, '2024-04-06', '2024-04-12', NULL),
(11, 11, '2024-04-07', '2024-04-14', NULL),
(12, 12, '2024-04-07', '2024-04-13', NULL),
(13, 13, '2024-04-08', '2024-04-15', NULL),
(14, 14, '2024-04-08', '2024-04-14', NULL),
(15, 15, '2024-04-09', '2024-04-16', 'Książka z odręcznymi notatkami'),
(16, 16, '2024-04-09', '2024-04-15', NULL),
(17, 17, '2024-04-10', '2024-04-17', NULL),
(18, 18, '2024-04-10', '2024-04-16', NULL),
(19, 19, '2024-04-11', '2024-04-18', NULL),
(20, 20, '2024-04-11', '2024-04-17', NULL),
(21, 21, '2024-04-02', '2024-04-09', NULL),
(22, 22, '2024-04-02', '2024-04-08', NULL),
(23, 23, '2024-04-03', '2024-04-10', NULL),
(4, 24, '2024-04-03', '2024-04-09', NULL),
(25, 25, '2024-04-04', '2024-04-11', NULL),
(26, 26, '2024-04-04', '2024-04-10', NULL),
(27, 27, '2024-04-05', '2024-04-12', NULL),
(28, 28, '2024-04-05', '2024-04-11', 'Wypożyczający pytał o kolejne części'),
(29, 29, '2024-04-06', '2024-04-13', NULL),
(30, 30, '2024-04-06', '2024-04-12', NULL),
(31, 31, '2024-04-07', '2024-04-14', NULL),
(32, 32, '2024-04-07', '2024-04-13', NULL),
(33, 33, '2024-04-08', '2024-04-15', NULL),
(34, 4, '2024-04-08', '2024-04-14', NULL),
(35, 35, '2024-04-09', '2024-04-16', 'Wypożyczający pytał o inne książki tego autora'),
(36, 36, '2024-04-09', '2024-04-15', NULL),
(37, 37, '2024-04-10', '2024-04-17', NULL),
(38, 38, '2024-04-10', '2024-04-16', NULL),
(39, 39, '2024-04-11', '2024-04-18', NULL),
(40, 40, '2024-04-11', '2024-04-17', NULL),
(21, 111, '2024-04-02', '2024-04-09', NULL),
(22, 112, '2024-04-02', '2024-04-08', 'Wypożyczający pytał o inne książki tego autora'),
(23, 113, '2024-04-03', '2024-04-10', NULL),
(24, 114, '2024-04-03', '2024-04-09', NULL),
(25, 115, '2024-04-04', '2024-04-11', NULL),
(26, 116, '2024-04-04', '2024-04-10', NULL),
(27, 117, '2024-04-05', '2024-04-12', NULL),
(28, 118, '2024-04-05', '2024-04-11', 'Książka ma zniszczoną okładkę'),
(29, 119, '2024-04-06', '2024-04-13', NULL),
(30, 110, '2024-04-06', '2024-04-12', NULL),
(31, 120, '2024-04-07', '2024-04-14', NULL),
(32, 121, '2024-04-07', '2024-04-13', NULL),
(33, 131, '2024-04-08', NULL, NULL),
(34, 141, '2024-04-08', '2024-04-14', NULL),
(35, 151, '2024-04-09', NULL, NULL),
(36, 161, '2024-04-09', '2024-04-15', NULL),
(37, 171, '2024-04-10', '2024-04-17', NULL),
(38, 181, '2024-04-10', '2024-04-16', NULL),
(39, 191, '2024-04-11', '2024-04-18', NULL),
(40, 201, '2024-04-11', '2024-04-17', NULL),
(21, 4, '2024-03-02', '2024-03-09', NULL),
(22, 41, '2024-04-02', '2024-04-08', NULL),
(23, 42, '2024-04-03', '2024-04-10', NULL),
(24, 43, '2024-04-03', '2024-04-09', NULL),
(25, 44, '2024-04-04', '2024-04-11', NULL),
(26, 45, '2024-04-04', '2024-04-10', NULL),
(27, 46, '2024-04-05', '2024-04-12', NULL),
(28, 47, '2024-04-05', '2024-04-11', NULL),
(29, 48, '2024-04-06', '2024-04-13', NULL),
(30, 49, '2024-04-06', '2024-04-12', NULL),
(31, 50, '2024-04-07', NULL, NULL),
(32, 51, '2024-04-07', NULL, NULL),
(33, 52, '2024-04-08', '2024-04-15', NULL),
(34, 53, '2024-04-08', '2024-04-14', NULL),
(35, 54, '2024-04-09', '2024-04-16', NULL),
(36, 55, '2024-04-09', '2024-04-15', NULL),
(37, 56, '2024-04-10', '2024-04-17', NULL),
(38, 57, '2024-04-10', '2024-04-16', NULL),
(39, 58, '2024-04-11', '2024-04-18', NULL),
(40, 59, '2024-04-11', '2024-04-17', NULL),
(21, 60, '2024-04-02', '2024-04-09', NULL),
(22, 61, '2024-04-02', '2024-04-08', NULL),
(23, 62, '2024-04-03', '2024-04-10', NULL),
(24, 63, '2024-04-03', '2024-04-09', NULL),
(25, 64, '2024-04-04', '2024-04-11', NULL),
(26, 65, '2024-04-04', '2024-04-10', NULL),
(27, 66, '2024-04-05', '2024-04-12', NULL),
(28, 67, '2024-04-05', '2024-04-11', NULL),
(29, 68, '2024-04-06', '2024-04-13', NULL),
(30, 69, '2024-04-06', '2024-04-12', NULL),
(31, 70, '2024-04-07', '2024-04-14', NULL),
(32, 71, '2024-04-07', '2024-04-13', NULL),
(33, 72, '2024-04-08', '2024-04-15', NULL),
(34, 73, '2024-04-08', '2024-04-14', NULL),
(35, 74, '2024-04-09', NULL, NULL),
(36, 75, '2024-04-09', '2024-04-15', NULL),
(37, 76, '2024-04-10', '2024-04-17', NULL),
(38, 77, '2024-04-10', '2024-04-16', NULL),
(39, 78, '2024-04-11', '2024-04-18', NULL),
(40, 79, '2024-04-11', '2024-04-17', NULL),
(21, 80, '2024-04-02', '2024-04-09', NULL),
(22, 81, '2024-04-02', '2024-04-08', NULL),
(23, 82, '2024-04-03', '2024-04-10', NULL),
(24, 83, '2024-04-03', '2024-04-09', NULL),
(25, 84, '2024-04-04', '2024-04-11', NULL),
(26, 85, '2024-04-04', '2024-04-10', NULL),
(27, 86, '2024-04-05', '2024-04-12', NULL),
(4, 87, '2024-04-05', '2024-04-11', NULL),
(29, 88, '2024-04-06', '2024-04-13', NULL),
(30, 89, '2024-04-06', '2024-04-12', NULL),
(31, 90, '2024-04-07', '2024-04-14', NULL),
(32, 91, '2024-04-07', '2024-04-13', NULL),
(33, 92, '2024-04-08', '2024-04-15', NULL),
(34, 93, '2024-04-08', '2024-04-14', NULL),
(35, 94, '2024-04-09', '2024-04-16', NULL),
(36, 95, '2024-04-09', '2024-04-15', NULL),
(37, 96, '2024-04-10', NULL, NULL),
(38, 97, '2024-04-10', '2024-04-16', NULL),
(39, 98, '2024-04-11', '2024-04-18', NULL),
(40, 99, '2024-04-11', '2024-04-17', NULL);

-- ZAPYTANIA

SELECT 
    *
FROM
    members;

    
SELECT 
    *
FROM
    members
WHERE
    city = 'Warszawa';
    
SELECT 
    *
FROM
    borrowing;
    
    # jest 120 wypożyczeń
    
    
 --  LEFT JOIN wszystkie wiersze z tabeli po lewej stronie będą uwzględnione
 --  z prawej tabeli tylko wtedy, gdy są wyróżnione w lewej
SELECT 
    b.title, bor.borrowing_date, bor.return_date
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID;
    
# które książki są obecnie wypożyczone?    

SELECT 
    b.title, bor.borrowing_date, bor.return_date
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    bor.return_date IS NULL;
    
    # czy "Obłok Nadziei jest dostępny?
    
SELECT 
    b.title, bor.return_date
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    bor.return_date IS NOT NULL
        AND b.title = 'Obłok Nadziei';
        
# ktoś go kiedyś zwrócił - ale może znowy wypożyczył 
        
SELECT 
    *
FROM
    books
WHERE
    title = 'Obłok Nadziei';
    
    # tym razem do książek dołącz wypożyczenia
SELECT 
    b.title, bor.return_date
FROM
    borrowing bor
        RIGHT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    title = 'Obłok Nadziei';
    
# tym razem NULL może oznaczać - nie oddał lub książka jeszcze nie była wypożyczona
    
SELECT 
    b.booksID, b.title, bor.borrowing_date, bor.return_date
FROM
    borrowing bor
        RIGHT JOIN
    books b ON bor.booksID = b.booksID
WHERE
	title = 'Obłok Nadziei';


-- kto czyta jakie książki? 
SELECT 
    b.title,
    bor.borrowing_date,
    bor.return_date,
    m.first_name,
    m.last_name
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
        LEFT JOIN
    members m ON bor.membersID = m.membersID;  
    
   SELECT 
    b.title,
    bor.borrowing_date,
    bor.return_date,
    m.first_name,
    m.last_name
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
        LEFT JOIN
    members m ON bor.membersID = m.membersID
ORDER BY m.last_name;

   SELECT 
    b.title,
    bor.borrowing_date,
    bor.return_date,
    m.first_name,
    m.last_name
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
        LEFT JOIN
    members m ON bor.membersID = m.membersID
ORDER BY m.last_name, bor.borrowing_date DESC;

# wracamy do znaczenia ON DELETE CASCADE
SELECT 
    *
FROM
    books;
    
SELECT 
    *
FROM
    borrowing;
    
SELECT 
    *
FROM
    borrowing
WHERE
    booksID = 4;
    
DELETE FROM books 
WHERE
    booksID = 4;