/*Ранг сотрудника - это длина пути от корня, который посчитан в задании 5.*/

CREATE OR REPLACE FUNCTION Rank(_id INT)
RETURNS TABLE (rank BIGINT) AS $$
BEGIN
RETURN QUERY
WITH RECURSIVE List AS (
    SELECT e.id, e.head_id, e.name FROM Employee e WHERE e.id = _id

    UNION ALL

    SELECT e2.id, e2.head_id, e2.name FROM List e1 JOIN Employee e2 ON (e1.head_id = e2.id)
)
SELECT COUNT(*) AS rank FROM List;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM Rank(1212);