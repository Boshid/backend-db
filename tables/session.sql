create table if not exists public.session (
    id int8 generated always as identity primary key,
    person_id int8 not null references public.person(id),
    device_id varchar not null,
    enabled bool default true not null,
    expire_date timestamp(6) not null
);
