/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO Category
VALUES (1, 'Продукты'),
(2, 'Бытовая химия');

INSERT INTO Products
VALUES (1, 'Хлеб'),
(2, 'Молоко'),
(3, 'Шампунь'),
(4, 'Книга')
 
INSERT INTO ProductsCategory
VALUES (1, 1),
(2, 1),
(3, 2)
GO

select p.[name] as [Имя продукта], c.[name] as [Имя категории]
from Products p
left join ProductsCategory pc on p.id = pc.products_id
left join Category c on c.id = pc.category_id
order by p.[name], c.[name]
