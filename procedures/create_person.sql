create or replace procedure create_person(fio_value varchar)
language sql
begin atomic
    insert into person(fio) values (fio_value);
end;
