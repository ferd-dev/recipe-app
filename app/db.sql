create database recipe_app;

create table categories(
    id int(11) primary key auto_increment,
    name varchar(255) not null
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;

create table recipes(
    id int(11) primary key auto_increment,
    category_id int(11) not null,
    user_id int(11) not null,
    image varchar(255) not null,
    name varchar(255) not null,
    description text,
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;

create table ingredients(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    name varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;

create table steps(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    number int(11) not null,
    description text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;

create table recipe_images(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    image varchar(255) not null,
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;

create table users(
    id int(11) primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    type enum('admin', 'user') default 'user',
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
), charset=utf8;