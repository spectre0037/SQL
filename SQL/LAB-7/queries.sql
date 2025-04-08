CREATE TABLE Books (
    isbn VARCHAR(14) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publication_year INTEGER CHECK (publication_year > 0),
    price NUMERIC CHECK (price >= 0)
);
-- Insert values
INSERT INTO Books VALUES
('978-1982127794', '1984', 'George Orwell', 1949, 9.99),
('978-0141187761', 'To Kill a Mockingbird', 'Harper Lee', 1960, 12.50),
('978-0061120084', 'To Kill a Mockingbird', 'Harper Lee', 1960, 5.00);


--task-1
do $$
<<task_1>>
declare
	book_count_by_harperLee INTEGER :=0;
begin
	SELECT count(*)
	INTO book_count_by_harperLee
	FROM Books
	WHERE author ='Harper Lee';

	RAISE NOTICE 'Number of books of the author harper lee are %',book_count_by_harperLee;
end task_1 $$;


--task-2

DO $$
<<Task_2>>
DECLARE 
	books_1970 VARCHAR;
BEGIN
	SELECT title
	into books_1970
	FROM books
	WHERE publication_year < 1970;

	RAISE NOTICE 'BOOKS BEFORE 1970 are : %' , books_1970;
END task_3 $$;

--task-3

DO $$
<<Task_3>>
DECLARE 
	Book_price NUMERIC;
BEGIN
	SELECT price
	into Book_price
	FROM Books
	WHERE isbn = '978-0141187761';

	RAISE NOTICE 'BOOK PRICE ARE : %' , Book_price;
	
END Task_3 $$;


--task-4


DO $$
<<task_4>>
BEGIN
    IF EXISTS (
        SELECT title 
		FROM Books 
		WHERE isbn = '978-1983126694'
    ) THEN
        RAISE NOTICE 'Book Found: %',(SELECT title FROM Books WHERE isbn = '978-1983126694');
    ELSE
        RAISE NOTICE 'Book with ISBN 978-1983126694 not found.';
    END IF;
END task_4 $$;


--task-5

do $$
<<task_5>>
declare
  Book_price Books.price%type;
  price_status varchar(50);
begin

  select price into priceb
  from Books;
  

  CASE
    WHEN Book_price > 0 AND Book_price < 3.99 THEN
      price_status := 'AVERAGE';
    WHEN Book_price > 4 AND Book_price < 7.99 THEN
      price_status := 'FINE';
    WHEN Book_price > 8 AND Book_price < 10.99 THEN
      price_status := 'EXPENSIVE';
    WHEN Book_price > 11 AND Book_price < 14.99 THEN
      price_status := 'VERY EXPENSIVE';
    ELSE
      price_status := 'UNDEFINED';
  END CASE;

  raise notice '%', price_status;

end task_5 $$;


--task-6

DO $$
<<task_6>>
DECLARE 
	Numb INTEGER :=1;
	counter INTEGER :=1;
BEGIN
	WHILE counter <11
	LOOP
	RAISE NOTICE 'Value : %',counter*3;
	counter :=counter +1;
	END LOOP;
END task_6 $$;



