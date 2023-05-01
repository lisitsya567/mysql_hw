-- 1. Вывести суммарное количество единиц техники на складе (не товарных позиций, а товаров!)
SELECT title SUM FROM test.hardware
-- 2. Вывести какие товары на складе закончились
SELECT title FROM test.hardware WHERE amount = 0;
-- 3. Вывести среднюю цену монитора
SELECT title, AVG(price) FROM test.hardware WHERE title LIKE '%Монитор%' GROUP BY title;
-- 4. Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT title FROM test.hardware WHERE title LIKE '%Клавиатура%' ORDER BY price ASC;
-- 5. Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального
SELECT amount, tag FROM test.hardware GROUP BY tag ORDER BY amount DESC;
-- 6 Вывести количество товарных позиций со скидками на складе
SELECT title, amount FROM test.hardware WHERE tag LIKE '%discount%';
-- 7. Вывести название и цену самой дорогой новинки
SELECT title, price FROM test.hardware WHERE tag LIKE '%new%' GROUP BY title, price ORDER BY price DESC;
-- 8. Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO hardware (title, price, amount, tag) VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new');
-- 9. Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2
DELETE FROM test.hardware WHERE title LIKE '%Очки%';