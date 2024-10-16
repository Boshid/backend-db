create table if not exists public.executor (
    id int8 generated always as identity primary key,
    name varchar,
    additional_id int8 not null references public.additional(id),
    role_id int8 not null references public.roles(id),
    employee_id int8 not null references public.employees(id)
);
