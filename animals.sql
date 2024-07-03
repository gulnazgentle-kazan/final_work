#Создание базы данных
CREATE DATABASE my_animals;
USE my_animals;

#Создание таблицы с собаками
CREATE TABLE dogs (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с собаками
INSERT INTO dogs (name, command, birth)
VALUES ('Пушистик', 'Голос', '2023-07-03'),
('Ушастик', 'Фас', '2023-07-03'),
('Халк', 'Лапу', '2021-07-03');

#Создание таблицы с котами
CREATE TABLE cats (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с котами
INSERT INTO cats (name, command, birth)
VALUES ('Колян', 'Кс-кс', '2017-02-03'),
('Годзилла', 'Брысь', '2014-07-03'),
('Рысь', 'Место', '2023-07-03');

#Создание таблицы с хомяками
CREATE TABLE hamsters (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с хомяками
INSERT INTO hamsters (name, command, birth)
VALUES ('Белла', 'Сидеть', '2024-01-03'),
('Джу', 'Есть', '2023-07-03'),
('Хома', 'Место', '2023-02-03');

#Создание таблицы с лошадями
CREATE TABLE horses (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с лошадями
INSERT INTO horses (name, command, birth)
VALUES ('Рыжик', 'Ноооо', '2023-07-03'),
('Дарья', 'Рррысь', '2020-02-03'),
('Пушинка', 'Ко мне', '2024-02-03');

#Создание таблицы с верблюдами
CREATE TABLE camels (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с верблюдами
INSERT INTO camels (name, command, birth)
VALUES ('Двушка', 'Встать', '2020-07-03'),
('Горбуша', 'Лечь', '2020-02-03');

#Создание таблицы с ослами
CREATE TABLE donkeys (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
command VARCHAR(45) NOT NULL,
birth DATE NOT NULL);

#Заполнение таблицы с ослами
INSERT INTO donkeys (name, command, birth)
VALUES ('Малыш', 'Сидеть', '2019-07-03'),
('Иа', 'Галоп', '2017-07-03'),
('Кудряш', 'Идти', '2022-07-03');

#Вывод всех созданных таблиц с животными
SELECT * FROM dogs;
SELECT * FROM cats;
SELECT * FROM hamsters;
SELECT * FROM horses;
SELECT * FROM camels;
SELECT * FROM donkeys;

#Удаление таблицы верблюды
DROP TABLE camels;

#Объединение таблиц лошади и ослы
CREATE TABLE packAnimals (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL)
SELECT name, command, birth
FROM horses
UNION 
SELECT name, command, birth
FROM donkeys;

#Вывод таблицы с вьючными животными
SELECT * FROM packAnimals; 

#Объединение таблиц собаки, кошки, хомяки
CREATE TABLE petAnimals (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL)
SELECT name, command, birth
FROM dogs
UNION 
SELECT name, command, birth
FROM cats
UNION 
SELECT name, command, birth
FROM hamsters;

#Вывод таблицы с домашними животными
SELECT * FROM petAnimals; 

#Создание таблицы Молодые животные
CREATE TABLE youngAnimals (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL)
SELECT name, command, birth,
FLOOR(DATEDIFF(NOW(), birth) / 30) AS months_since_date
FROM packAnimals
UNION
SELECT name, command, birth,
FLOOR(DATEDIFF(NOW(), birth) / 30) AS months_since_date
FROM petAnimals
WHERE FLOOR(DATEDIFF(NOW(), birth) / 30) > 1 OR
FLOOR(DATEDIFF(NOW(), birth) / 30) < 3;
SELECT * FROM youngAnimals;

# Объединенная таблица всех таблиц с сохраненным полем, указывающим на прошлую принадлежность к старым таблицам.
CREATE TABLE allTables (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL)
SELECT name, command, birth,
'dogs' as firstTable
FROM dogs UNION
SELECT name, command, birth,
'cats' as firstTable
FROM cats UNION
SELECT name, command, birth,
'hamsters' as firstTable
FROM hamsters UNION
SELECT name, command, birth,
'horses' as firstTable
FROM horses UNION
SELECT name, command, birth,
'camels' as firstTable
FROM camels UNION
SELECT name, command, birth,
'donkeys' as firstTable
FROM donkeys;

#Вывод объединенной таблицы
SELECT * FROM allTables;
