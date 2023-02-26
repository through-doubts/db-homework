/*Сперва ищется минимальный общий предок в списксах подчинения, затем строится сам путь с помощью конкатенации путей до этого общего предка.*/
/*Общий предок всегда найдется, потому что существует генеральный директор.*/

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


CREATE OR REPLACE FUNCTION Path(_id1 INT, _id2 INT)
RETURNS TABLE (
    id INT,
    head_id INT,
    name TEXT,
    level INT
) AS $$
BEGIN
RETURN QUERY
WITH MinLevels AS (SELECT s1.level AS level1, s2.level AS level2 FROM SubmissionList(_id1) s1 JOIN SubmissionList(_id2) s2 ON (s1.id = s2.id)
WHERE s1.level + s2.level = (SELECT MIN(s1.level + s2.level) FROM SubmissionList(_id1) s1 JOIN SubmissionList(_id2) s2 ON (s1.id = s2.id)))
(SELECT * FROM SubmissionList(_id1) AS s1 WHERE s1.level <= (SELECT level1 FROM MinLevels))
UNION ALL
(SELECT s2.id, s2.head_id, s2.name, s2.level AS level2 FROM SubmissionList(_id2) AS s2 WHERE s2.level < (SELECT level2 FROM MinLevels) ORDER BY level2 DESC);
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM Path(77, 777);