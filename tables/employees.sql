create table if not exists public.employees (
    id int8 generated always as identity unique,
    person_id int8 not null references public.person(id),
    role_id int8 not null references public.roles(id)
);
