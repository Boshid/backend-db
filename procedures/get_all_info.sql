create or replace function get_all_info(session_id_val int8, data_id_value int8)
returns table (
        "dataId" int8,
        "employeeId" int8,
        "personId" int8,
        "fio" text,
        "roleId" int8,
        "field" text,
        "additionalFields" text
)
language sql
begin atomic
    select
        ge.data_id as "dataId",
        ge.id as "employeeId",
        ge.person as "personId",
        p.fio,
        ge.role as "roleId",
        ga.field,
        gaf.additional_fields as "additionalFields"
    from get_employee(data_id_value) as ge
    left join (select * from get_additional(data_id_value)) as ga on ge.data_id = ga.id
    left join (select * from get_additional_fields(data_id_value)) as gaf on ge.role = gaf.id
    left join person as p on ge.person = p.id;
end;
