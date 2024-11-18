insert into public.functions_name(name) values
('func1'),
('func2'),
('func3');

insert into public.fields_name(name) values
('field1'),
('field2'),
('field3');

insert into roles(name, function_id, field_id) values
('admin', 1, 1),
('maintainer', 2, 2),
('reporter', 3, 3);

insert into task(id) values
(1),
(2),
(3);

insert into duration(task_id, field1, field2, field3) values
(1, 'ceo', 'cto', 'cfo'),
(2, 'pm', 'sdm', 'teamlead'),
(3, 'backend-developer', 'frontend-developer', 'software tester');

insert into person(fio) values
('Иванов Иван Иванович'),
('Петров Петр Петрович'),
('Сергеев Сергей Сергеевич');

insert into employees(person_id, role_id) values
(1, 1),
(2, 2),
(3, 3);

insert into task_executors(name, duration_id, role_id, employee_id) values
('executor1', 1, 1, 1),
('executor2', 2, 2, 2),
('executor3', 3, 3, 3);

insert into executor_roles(executor_id, role_id) values
(1, 1),
(2, 2),
(3, 3);

insert into employees_roles(employee_id, role_id) values
(1, 1),
(2, 2),
(3, 3);