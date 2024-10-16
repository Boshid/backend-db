create type fields as enum ('field1', 'field2', 'field3');

create table if not exists public.roles (
    id int8 generated always as identity primary key,
    name varchar,
    function_id int8 not null references public.functions_name(id),
    field_id int8 not null references public.fields_name(id)
);
