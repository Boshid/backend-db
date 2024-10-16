create table if not exists public.additional (
    id int8 generated always as identity primary key,
    data_id int8 not null references public.data(id),
    field1 text,
    field2 text,
    field3 text
);
