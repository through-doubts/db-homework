/*Для добавления сотрудника нужно просто вставить его в единственную таблицу, указать уникальный идентификатор, руководителя и имя.*/

WITH update AS (
    SELECT COUNT(*) + 1 AS id, NULL::INT AS head_id, 'Linus Torvalds' AS name FROM Employee
)

INSERT INTO Employee (id, head_id, name) SELECT id, head_id, name FROM update;