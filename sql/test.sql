create table users
(
    id            serial8,
    login         varchar   not null,
    password      varchar   not null,
    registered_at timestamp not null,
    primary key (id)
);

create table users_data
(
    id              serial8,
    user_id         int8    not null,
    document_number varchar not null,
    first_name      varchar not null,
    last_name       varchar not null,
    birthdate       date    not null,
    primary key (id),
    unique (user_id),
    foreign key (user_id) references users (id)
);

insert into users (login, password, registered_at)
values ('alex32', 'pass123x2', '2017-07-23 15:05:24'),
       ('mark777', 'password22', '2017-05-15 22:01:13');

insert into users_data (user_id, document_number, first_name, last_name, birthdate)
values (1, '2450900122', 'Alexander', 'Marks', '1958-05-22'),
       (2, '2460850240', 'Mark', 'Antony', '1970-02-24');

select *
from users
right join users_data ud on users.id = ud.user_id;

select first_name, u.id
from users_data
left join users u on u.id = users_data.user_id