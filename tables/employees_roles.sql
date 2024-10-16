create table if not exists public.employees_roles (
    employee_id int8 references public.employees(id) on update cascade on delete cascade,
    role_id int8 references public.roles(id) on update cascade on delete cascade,
    primary key (employee_id, role_id)
);

create function check_employees_roles_mandatory_relationship()
returns trigger as $$
begin
  if not exists (select 1 from roles where id = new.role_id) then
    raise exception 'role_id % does not exist in roles', new.role_id;
  end if;

  if not exists (select 1 from employees where id = new.employee_id) then
    raise exception 'employee_id % does not exist in employee', new.employee_id;
  end if;

  return new;
end;
$$
language plpgsql;

create trigger trg_employee_roles_mandatory_relationship
before insert or update on employees_roles
for each row execute function check_employees_roles_mandatory_relationship();
