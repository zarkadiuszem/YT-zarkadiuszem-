# jaka jest siłą związku (współczynnik korelacji r Pearsona)
# między "grubością" książki (liczbą stron), a czasem wypożyczenia?
# problem - ktoś może wypożyczyć kilka książek ...

USE Library;
SELECT 
    *
FROM
    borrowing;
    
SELECT 
    borrowing_date, return_date, return_date - borrowing_date AS czas_wyp
FROM
    borrowing;
    
    
SELECT 
    borrowing_date, return_date, DATEDIFF(return_date, borrowing_date) AS czas_wyp
FROM
    borrowing;
    
SELECT 
    DATEDIFF(bor.return_date, bor.borrowing_date) AS czas_wyp,
    b.number_of_pages
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID;
    
SELECT 
    b.number_of_pages AS x,
    DATEDIFF(bor.return_date, bor.borrowing_date) AS y
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    bor.return_date IS NOT NULL;
    
# zmienne definiowane przez użytkownika zaczynamy od @
# := to operator przypisania (= to operator porównania)
# można też użyć wyrażenia SET z =
SET @zmienna1 = 1;
SELECT @zmienna2 := 2;
SELECT @zmienna1, @zmienna2;

SELECT 
    @sredniax := AVG(b.number_of_pages),
    @sredniay := AVG(DATEDIFF(bor.return_date, bor.borrowing_date))
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    bor.return_date IS NOT NULL;
    
select @sredniax, @sredniay;

SELECT 
    b.number_of_pages AS x,
    DATEDIFF(bor.return_date, bor.borrowing_date) AS y
FROM
    borrowing bor
        LEFT JOIN
    books b ON bor.booksID = b.booksID
WHERE
    bor.return_date IS NOT NULL;

-- Tworzymy widok 

CREATE VIEW BorrowingInfo AS
    SELECT 
        b.number_of_pages AS x,
        DATEDIFF(bor.return_date, bor.borrowing_date) AS y
    FROM
        borrowing bor
            LEFT JOIN
        books b ON bor.booksID = b.booksID
    WHERE
        bor.return_date IS NOT NULL;
        
SELECT 
    *
FROM
    BorrowingInfo;
        
SELECT 
    x * @sredniax
FROM
    BorrowingInfo;

select 
(sum((x - @sredniax)*(y - @sredniay)))/
((power(sum(power((x - @sredniax), 2)), 0.5)) * (power(sum(power((y - @sredniay), 2)), 0.5)))
from
BorrowingInfo;

select 
(sum((x - @sredniax)*(y - @sredniay)))/
((power(sum(power((x - @sredniax), 2)), 0.5)) * (power(sum(power((y - @sredniay), 2)), 0.5))) AS 'r Pearsona'
from
BorrowingInfo;

    

    