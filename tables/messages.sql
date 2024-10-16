create table if not exists public.messages (
    id int8 generated always as identity primary key,
    body text,
    data_link varchar -- ссылка (с возможностью конвертации в graphql на фронте) пример: data[id=1].additional.employee
);
