create or replace procedure create_person(session_id_val int8, fio_value varchar)
language sql
begin atomic
    insert into person(fio) values (fio_value);
end;
