# DROP DATABASE IF EXISTS Library;
CREATE DATABASE IF NOT EXISTS Library; 
USE Library;

CREATE TABLE books (
    booksID INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(32) NOT NULL,
    number_of_pages SMALLINT NOT NULL,
    publishing_house VARCHAR(32) NOT NULL,
    PRIMARY KEY (booksID)
);

INSERT INTO `books` (
title,
number_of_pages,
publishing_house
)VALUES 
("Labirynt Marzeń", 400, "Wydawnictwo Szept"),
("Cienie Pamięci", 280, "Księgarnia Zmysłów"),
("Tajemnicza Sonata", 350, "Alchemiczne Wydawnictwo"),
("Obłok Nadziei", 420, "Nimbus Books"),
("Wąż Ognistego Lata", 300, "Magia Literatury"),
("Strzępy Czasu", 380, "Wydawnictwo Przeznaczenie"),
("Zaklęte Wzgórze", 250, "Gryfonia Press"),
("Mroczny Portal", 320, "Książki Złudzeń"),
("Szeptem Gwiazd", 360, "Astralne Wydawnictwo"),
("Klucz do Nieskończoności", 400, "Portal Fantazji Books");


SELECT 
    *
FROM
    books;
    
SELECT 
    title, number_of_pages
FROM
    books
WHERE
    number_of_pages >= 400;
