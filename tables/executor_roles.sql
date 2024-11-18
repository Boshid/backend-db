create table if not exists public.executor_roles (
    executor_id int8 references public.executor(id) on update cascade on delete cascade,
    role_id int8 references public.roles(id) on update cascade on delete cascade,
    primary key (executor_id, role_id)
);

create function check_executor_roles_mandatory_relationship()
returns trigger as $$
begin
  if not exists (select 1 from roles where id = new.role_id) then
    raise exception 'role_id % does not exist in roles', new.role_id;
  end if;

  if not exists (select 1 from task_executors where id = new.executor_id) then
    raise exception 'executor_id % does not exist in executor', new.executor_id;
  end if;

  return new;
end;
$$
language plpgsql;

create trigger trg_executor_roles_mandatory_relationship
before insert or update on executor_roles
for each row execute function check_executor_roles_mandatory_relationship();
