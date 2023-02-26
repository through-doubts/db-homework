## Используется база данных Postgresql

Создание таблиц находится в скрипте 1_create_tables.sql, наполнение в 2_fill_tables.sh.

Сами решения заданий находятся в файлах [1-10].sql, каждое решение сопровождено очень кратким комментарием.

## Как можно запустить?

1. `docker-compose up`
2. `psql -h 0.0.0.0 postgres postgres`. Пароль: password
3. Можно выполнять запросы [1-10].sql. `\i [1-10].sql`

Скрипты для инициализации лежат в папке `init`, можно их запустить без docker.