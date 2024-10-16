create table if not exists public.executor_messages (
    id int8 generated always as identity primary key,
    message_id int8 not null references public.messages(id),
    executor_id int8 not null references public.executor(id)
);
