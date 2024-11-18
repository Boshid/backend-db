#!/usr/bin/env bash

psql_command="psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_DB"

sql_table_files=(
  "task.sql"
  "duration.sql"
  "functions_name.sql"
  "fields_name.sql"
  "roles.sql"
  "person.sql"
  "session.sql"
  "employees.sql"
  "task_executors.sql"
  "executor_roles.sql"
  "employees_roles.sql"
  "messages.sql"
  "employee_messages.sql"
  "executor_messages.sql"
  "task_messages.sql"
)

sql_procedure_files=(
  "get_all_task.sql"
  "get_person.sql"
  "get_duration.sql"
  "get_duration_fields.sql"
  "get_session.sql"
  "get_device_users.sql"
  "get_employee.sql"
  "get_all_info.sql"
  "create_employee.sql"
  "create_task.sql"
  "create_duration.sql"
  "create_person.sql"
  "create_session.sql"
  "close_session.sql"
)

sql_seed_files=(
  "seed.sql"
)

for file in "${sql_table_files[@]}"; do
    psql_command+=" --file ./tables/$file"
done

for file in "${sql_seed_files[@]}"; do
    psql_command+=" --file ./seed/$file"
done

for file in "${sql_procedure_files[@]}"; do
    psql_command+=" --file ./procedures/$file"
done

eval "$psql_command"
