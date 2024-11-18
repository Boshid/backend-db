create table if not exists public.task_messages (
    id int8 generated always as identity primary key,
    message_id int8 not null references public.messages(id),
    task_id int8 not null references public.task(id)
);
