create table if not exists public.person_messages (
    id int8 generated always as identity primary key,
    message_id int8 not null references public.messages(id),
    person_id int8 not null references public.person(id)
);
