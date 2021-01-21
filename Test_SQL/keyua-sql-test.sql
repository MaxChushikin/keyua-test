/*
    1.	Для	заданного	списка	товаров	получить	названия	всех	категорий,	в	которых
    представлены	товары.
    Выборка	для	нескольких	товаров	(пример:	ids	=	(9,	14,	6,	7,	2)	).
*/

SELECT DISTINCT c.category_id, cd.name FROM `category` c LEFT JOIN `product_to_category` p2c ON (c.category_id = p2c.category_id) LEFT JOIN `category_description` cd ON (c.category_id = cd.category_id) LEFT JOIN `product` p ON (p.product_id = p2c.product_id) WHERE p.product_id IN (28, 29, 30, 31, 31)
---------------------------------------


/*
    2.	Для	заданноий категории	получить	список	предложений всех	товаров	из	этой
    категории.	Каждая	категория	может	иметь	несколько	подкатегорий.
    Пример:
    Выбираю	все	товары	из	категории	компьютеры	(id	=	2)	и	подкатегории	(id	=3
    (ноутбуки),	id	=	4	(планшеты), id	=	5	(гибриды)	).
*/

-- Получаю полный список всех дочерних категорий строкой через запятуую
SELECT GROUP_CONCAT(c.category_id ORDER BY c.category_id ASC SEPARATOR ', ') AS categories
    FROM (SELECT cp.category_id AS category_id
        FROM category_path cp
        LEFT JOIN category c1 ON (cp.category_id = c1.category_id)
        LEFT JOIN category c2 ON (cp.path_id = c2.category_id)
        WHERE c2.category_id = {$category_id}) as c

-- Теперь список категорий можно использовать для выборки товаров
SELECT * FROM product_to_category p2c LEFT JOIN product p ON (p2c.product_id = p.product_id) WHERE p2c.category_id IN ({$categories})
---------------------------------------


/*
    3.	Для	заданного	списка	категории9получить	количество	уникальных	товаров	в
    каждои9категории.
    Выборка	для	нескольких	категории9(пример:	ids	=	(2,	3,	4)	).
*/

SELECT DISTINCT c.category_id, COUNT(p.product_id) FROM category c
    LEFT JOIN product_to_category p2c ON (c.category_id = p2c.category_id)
    LEFT JOIN product p ON (p2c.product_id = p.product_id)
    WHERE c.category_id IN (34, 18, 20) GROUP BY c.category_id
---------------------------------------


/*
    4.	Для	заданного	списка	категории9получить	количество	единиц	каждого	товара
    которыи9входит	в	указанные	категории.
    Выборка	для	нескольких	категории9(пример:	ids	=	(3,	4,	5)	).
*/

SELECT c.category_id, SUM(p.quantity) FROM category c
    LEFT JOIN product_to_category p2c ON (c.category_id = p2c.category_id)
    LEFT JOIN product p ON (p2c.product_id = p.product_id)
    WHERE c.category_id IN (34, 18, 20) GROUP BY c.category_id
---------------------------------------