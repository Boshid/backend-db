create or replace function get_person(session_id_val int8, person_id int8)
returns setof person
language sql
begin atomic
    select * from person p
    where p.id = person_id;
end;