/*С помощью рекурсивных запросов достаем число детей для сотрудника, т.к. идентификатором отдела является его руководитель.*/

CREATE OR REPLACE FUNCTION EmployeeCount(_id INT)
RETURNS TABLE (count BIGINT) AS $$
BEGIN
RETURN QUERY
WITH RECURSIVE Bfs AS (
    SELECT e.id, e.head_id, e.name FROM Employee e WHERE e.id = _id

    UNION ALL

    SELECT e1.id, e1.head_id, e1.name FROM Employee e1 JOIN Bfs e2 ON (e1.head_id = e2.id)
)
SELECT COUNT(*) as count FROM Bfs;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM EmployeeCount(12);