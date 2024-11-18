create table if not exists public.task_executors (
    id int8 generated always as identity primary key references public.executor_roles(id),
    name varchar not null,
    duration_id int8 not null references public.duration(id),
    employee_id int8 not null references public.employees(id),
    person_id int8 not null references public.person(id),
    task_id int8 not null references public.task(id)
);
