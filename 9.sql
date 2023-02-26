/*Непонятно в задании, что значит "в порядке подчинения", поэтому вывел в порядке поиска в глубину.*/
/*Первым столбцом идет длина префикса, иначе уровень подчинения, вторам столбцом идет имя вместе с этим префиксом. Сам префикс вычисляется в рекурсивном запросе.*/

WITH RECURSIVE Tmp AS (
    SELECT e.id, e.head_id, e.name, '' AS prefix FROM Employee e WHERE e.id = 1 /*Стартуем с ген. директора.*/

    UNION ALL

    SELECT e1.id, e1.head_id, e1.name, concat(e2.prefix, ' ') AS prefix FROM Employee e1 JOIN Tmp e2 ON (e1.head_id = e2.id)
    WHERE e1.head_id IS NOT NULL
) SEARCH DEPTH FIRST BY id SET ordering
SELECT length(prefix) as l, concat(prefix, name) AS name, id, head_id FROM Tmp ORDER BY ordering;