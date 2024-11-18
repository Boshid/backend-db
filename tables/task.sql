create table if not exists public.task (
    id int8 generated always as identity primary key,
    title varchar not null,
    parent_id int8 references public.task(id),
    person_id int8 references public.person(id),
    duration_id int8 references public.duration(id)
);
