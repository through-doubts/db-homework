/*Для получения отдела получаем сначала начальника, затем всех его подчиненных.*/

CREATE OR REPLACE FUNCTION GetDepartment(_head_id INT)
RETURNS TABLE (
    id INT,
    head_id INT,
    name TEXT
) AS $$
BEGIN
RETURN QUERY
SELECT * FROM Employee e WHERE e.id = _head_id
UNION ALL
SELECT * FROM Employee e WHERE e.head_id = _head_id;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM GetDepartment(7) ORDER BY id;