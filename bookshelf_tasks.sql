-- 1. Найти автора с самым большим числом книг и вывести его имя
SELECT
	books.title,
	authors.name
FROM books
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
GROUP BY books.title, authors.name
ORDER BY authors.name DESC
;
-- 2. Вывести пять самых старых книг у которых указан год издания
SELECT 
	books.title,
    books.year
FROM books
JOIN authors_books ON authors_books.books_id = books.id
WHERE year IS NOT NULL
ORDER BY year
LIMIT 5
;
-- 3. Вывести общее количество книг на полке в кабинете
SELECT COUNT(books.title)
FROM books 
JOIN authors_books ON authors_books.books_id = books.id
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.id = '1'
;
-- 4. Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне
SELECT
books.title as 'Книга',
authors.name as 'Автор',
books.year as 'Год'
FROM books
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
JOIN shelves ON books.shelves_id = shelves.id
WHERE books.shelves_id = 4
;
-- 5. Вывести названия и годы издания книг, написанных автором 'Лев Толстой'
SELECT
	books.title as 'Книга',
    books.year as 'Год'
FROM books
JOIN authors_books ON authors_books.books_id = books.id 
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name = 'Лев Толстой'
;
-- 6. Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"
SELECT
	books.title as 'Книга',
    authors.name as 'Автор'
FROM books
JOIN authors_books ON authors_books.books_id = books.id 
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name  LIKE 'А%'
;
-- 7. Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»
SELECT
	books.title as 'Книга',
    authors.name as 'Автор'
FROM books
JOIN authors_books ON authors_books.books_id = books.id 
JOIN authors ON authors_books.authors_id = authors.id
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.title LIKE '%Верхняя%' or '%Нижняя%'
;
-- 8. Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД
UPDATE books
SET friends_id = 'Иванов Иван' 
WHERE books.title = 'Божественная комедия' AND authors.name = 'Данте Алигьери'
;
-- 9. Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете
INSERT INTO shelves (title) 
VALUES ('Полка в кабинете')