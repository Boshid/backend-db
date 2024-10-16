create table if not exists public.data_messages (
    id int8 generated always as identity primary key,
    message_id int8 not null references public.messages(id),
    data_id int8 not null references public.data(id)
);
