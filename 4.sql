/*Листовыми сотрудниками являются те, id которых не представлен в колонке head_id.*/

SELECT * FROM Employee e1 LEFT JOIN Employee e2 ON e1.id = e2.head_id WHERE e2.id IS NULL ORDER BY e1.id;