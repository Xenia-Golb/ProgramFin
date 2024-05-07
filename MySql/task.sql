-- 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
DROP DATABASE IF EXISTS `Mans_friends`;
CREATE DATABASE IF NOT EXISTS `Mans_friends`;
USE Mans_friends;

-- 8. Создать таблицы с иерархией из диаграммы в БД

DROP TABLE IF EXISTS animals; 
CREATE TABLE animals
(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
	Class_name VARCHAR(20)
);
INSERT animals (Class_name)
VALUES 
('PackAnimals'),
('Pets');  
SELECT*FROM animals;

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Genus VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT pack_animals (Genus, Class_id)
VALUES 
('Horses', 1),
('Donkeys', 1),  
('Camels', 1); 
SELECT*FROM pack_animals;

DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Genus VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT pets (Genus, Class_id)
VALUES 
('Cats', 2),
('Dogs', 2),  
('Hamsters', 2);
SELECT*FROM pets;

-- 9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения

DROP TABLE IF EXISTS horses;
CREATE TABLE horses 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pack_animals (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT horses (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Быстрый', '2022-01-05', 'голопом, шагом, рысью, стоп', 1, 1),
('Гордый', '2023-01-01', "но-о, шагом, стоп", 1, 1),  
('Звезда', '2019-07-12', "пошла, шагом, стоп, но-о", 1, 1), 
('Лотос', '2018-11-10', "пошла, шагом, стоп, но-о", 1, 1),
('Молния', '2020-01-05', 'голопом, шагом, рысью, стоп', 1, 1);
SELECT*FROM horses;

DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pack_animals (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT donkeys (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Тюлень', '2023-04-10', "пошел, тпруу", 2, 1),
('Валенок', '2020-03-12', "пошел, тпруу", 2, 1),  
('Борзый', '2022-03-01', "пошел, тпруу", 2, 1);
SELECT*FROM donkeys;

DROP TABLE IF EXISTS camels;
CREATE TABLE camels 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pack_animals (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT camels (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Добрый', '2022-03-15', 'пошел, стоп', 3, 1),
('Али', '2019-08-10', "пошел, стоп", 3, 1),  
('Баба', '2019-08-10', "пошел, стоп", 3, 1), 
('Петрушка', '2023-01-01', "пошел, стоп", 3, 1);
SELECT*FROM camels; 

DROP TABLE IF EXISTS cats;
CREATE TABLE cats 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pets (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT cats (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Барсик', '2021-01-01', 'кыс-кыс', 1, 2),
('Машка', '2010-08-08', 'кыс-кыс', 1, 2), 
('Ричи', '2011-01-01', 'кыс-кыс', 1, 2), 
('Марс', '2023-01-01', 'кыс-кыс', 1, 2); 
SELECT*FROM cats;

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pets (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT dogs (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Люк', '2020-01-01', 'ко мне, лежать, лапу, голос, фу', 2, 2),
('Айра', '2022-06-12', 'сидеть, лежать, лапу', 2, 2),  
('Белка', '2019-03-01', 'сидеть, ко мне, лапу, след, фу', 2, 2), 
('Верный', '2019-03-01', 'сидеть, лежать, лапу, след, фас', 2, 2),
('Стрелка', '2020-05-10', 'сидеть, ко мне, фу, место', 2, 2);
SELECT*FROM dogs;

DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name_animals VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Genus_id int,
    Foreign KEY (Genus_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE,
    Class_id INT,
	Foreign KEY (Class_id) REFERENCES pets (Class_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT hamsters (Name_animals, Birthday, Commands, Genus_id, Class_id)
VALUES 
('Хом', '2021-10-12', 'есть', 3, 2),
('Джери', '2020-01-11', 'есть', 3, 2),  
('Том', '2023-06-11', 'есть', 3, 2), 
('Люся', '2022-05-10', 'есть', 3, 2);
SELECT*FROM hamsters;

-- 10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
-- питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
DELETE FROM camels
WHERE id>0;

SELECT * FROM horses 
UNION 
SELECT * FROM donkeys;

-- 11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
-- но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице

DROP VIEW IF EXISTS all_animals;
CREATE VIEW all_animals AS
SELECT * FROM horses
UNION
SELECT * FROM donkeys
UNION
SELECT * FROM dogs
UNION
SELECT * FROM cats
UNION
SELECT * FROM hamsters;
SELECT*FROM all_animals;

DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals
SELECT *,  TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS Age
FROM all_animals
WHERE Birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
SELECT*FROM young_animals;

-- 12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
-- прошлую принадлежность к старым таблицам.

SELECT h.*, a.Class_name, pa.Genus, ya.Age 
FROM horses h
LEFT JOIN young_animals ya ON ya.Name_animals = h.Name_animals
LEFT JOIN pack_animals pa ON pa.Id = h.Genus_id
LEFT JOIN animals a ON a.Id = h.Class_id
UNION 
SELECT d.*, a.Class_name, pa.Genus, ya.Age 
FROM donkeys d 
LEFT JOIN young_animals ya ON ya.Name_animals = d.Name_animals
LEFT JOIN pack_animals pa ON pa.Id = d.Genus_id
LEFT JOIN animals a ON a.Id = d.Class_id
UNION
SELECT c.*, a.Class_name, p.Genus, ya.Age 
FROM cats c
LEFT JOIN young_animals ya ON ya.Name_animals = c.Name_animals
LEFT JOIN pets p ON p.Id = c.Genus_id
LEFT JOIN animals a ON a.Id = c.Class_id
UNION
SELECT dg.*, a.Class_name, p.Genus, ya.Age 
FROM dogs dg
LEFT JOIN young_animals ya ON ya.Name_animals = dg.Name_animals
LEFT JOIN pets p ON p.Id = dg.Genus_id
LEFT JOIN animals a ON a.Id = dg.Class_id
UNION
SELECT hm.*, a.Class_name, p.Genus, ya.Age 
FROM hamsters hm
LEFT JOIN young_animals ya ON ya.Name_animals = hm.Name_animals
LEFT JOIN pets p ON p.Id = hm.Genus_id
LEFT JOIN animals a ON a.Id = hm.Class_id;