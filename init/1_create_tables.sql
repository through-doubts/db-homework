/*Используется примитивная модель графа на основе списков смежности. Отделы не моделируются отдельно, идентификатор начальника служит описанием отдела.*/

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    head_id INT NULL REFERENCES Employee,
    name TEXT
);