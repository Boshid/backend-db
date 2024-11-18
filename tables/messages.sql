create table if not exists public.messages (
    id int8 generated always as identity primary key,
    body text,
    task_link varchar -- ссылка (с возможностью конвертации в graphql на фронте) пример: task[id=1].duration.employee
);
