SCRIPT_DIR_REL=$(dirname ${BASH_SOURCE[0]})

cat $SCRIPT_DIR_REL/graph.csv | psql postgres postgres -c "COPY Employee(id, head_id, name) FROM STDIN WITH (FORMAT csv);"