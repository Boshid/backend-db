create table if not exists public.employee_messages (
    id int8 generated always as identity primary key,
    message_id int8 not null references public.messages(id),
    employee_id int8 not null references public.employees(id)
);
