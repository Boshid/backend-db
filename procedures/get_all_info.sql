create or replace function get_all_info(task_id_value int8)
returns table (
        "taskId" int8,
        "employeeId" int8,
        "personId" int8,
        "fio" text,
        "roleId" int8,
        "field" text,
        "durationFields" text
)
language sql
begin atomic
    select
        ge.task_id as "taskId",
        ge.id as "employeeId",
        ge.person as "personId",
        p.fio,
        ge.role as "roleId",
        ga.field,
        gaf.duration_fields as "durationFields"
    from get_employee(task_id_value) as ge
    left join (select * from get_duration(task_id_value)) as ga on ge.task_id = ga.id
    left join (select * from get_duration_fields(task_id_value)) as gaf on ge.role = gaf.id
    left join person as p on ge.person = p.id;
end;
