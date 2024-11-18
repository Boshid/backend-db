create table if not exists public.duration (
    id int8 generated always as identity primary key,
    name varchar not null,
    start_date timestamp(6) not null,
    end_date timestamp(6) not null
);
