/*С помощью рекурсивных запросов достаем цепочку подчинения.*/

CREATE OR REPLACE FUNCTION SubmissionList(_id INT)
RETURNS TABLE (
    id INT,
    head_id INT,
    name TEXT,
    level INT
) AS $$
BEGIN
RETURN QUERY
WITH RECURSIVE List AS (
    SELECT e.id, e.head_id, e.name, 0 AS level FROM Employee e WHERE e.id = _id

    UNION ALL

    SELECT e2.id, e2.head_id, e2.name, e1.level + 1 AS level FROM List e1 JOIN Employee e2 ON (e1.head_id = e2.id)
)
SELECT * FROM List;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM SubmissionList(1212);