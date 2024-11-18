create table if not exists public.test (
    id int8 generated always as identity primary key,
    person_id int8 not null references public.person(id),
    duration_id int8 not null references public.duration(id),
    description varchar not null
);
