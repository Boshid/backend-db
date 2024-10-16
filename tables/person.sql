create table if not exists public.person (
    id int8 generated always as identity primary key,
    fio varchar
);
