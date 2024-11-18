create table if not exists public.task_text (
    id int8 generated always as identity primary key,
    task_id int8 not null references public.task(id),
    text_id int8 not null references public.text(id)
);
