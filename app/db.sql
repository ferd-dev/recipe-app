create database recipe_app;

create table users(
    id int(11) primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    type enum('admin', 'user') default 'user',
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
) charset=utf8;

create table categories(
    id int(11) primary key auto_increment,
    name varchar(255) not null,
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
) charset=utf8;

create table recipes(
    id int(11) primary key auto_increment,
    category_id int(11) not null,
    user_id int(11) not null,
    image varchar(255) not null,
    name varchar(255) not null,
    description text,
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (category_id) references categories(id),
    foreign key (user_id) references users(id)
) charset=utf8;

create table ingredients(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    name varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (recipe_id) references recipes(id)
) charset=utf8;

create table steps(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    number int(11) not null,
    description text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (recipe_id) references recipes(id)
) charset=utf8;

create table recipe_images(
    id int(11) primary key auto_increment,
    recipe_id int(11) not null,
    image varchar(255) not null,
    is_active tinyint(1) default 1,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (recipe_id) references recipes(id)
) charset=utf8;

-- add data
INSERT INTO categories (name) VALUES
('Desayunos'),
('Almuerzos'),
('Cenas'),
('Postres'),
('Aperitivos'),
('Sopas y Cremas'),
('Ensaladas'),
('Platos Vegetarianos'),
('Platos Rápidos'),
('Comida Internacional');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(1, 1, 'tacos_pollo.jpg', 'Tacos de Pollo', 'Tacos de pollo sazonados con especias y servidos en tortillas de maíz.');
INSERT INTO ingredients (recipe_id, name) VALUES
(1, 'Pechuga de pollo'),
(1, 'Tortillas de maíz'),
(1, 'Cilantro fresco'),
(1, 'Cebolla picada'),
(1, 'Jugo de limón'),
(1, 'Sal y pimienta'),
(1, 'Aceite de oliva');
INSERT INTO steps (recipe_id, number, description) VALUES
(1, 1, 'Corta el pollo en tiras y sazónalo con sal, pimienta y jugo de limón.'),
(1, 2, 'Calienta el aceite en una sartén y cocina el pollo hasta que esté dorado.'),
(1, 3, 'Calienta las tortillas y sirve el pollo con cilantro y cebolla picada.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(7, 2, 'ensalada_cesar.jpg', 'Ensalada César', 'Una clásica ensalada César con aderezo cremoso.');
INSERT INTO ingredients (recipe_id, name) VALUES
(2, 'Lechuga romana'),
(2, 'Crutones'),
(2, 'Parmesano rallado'),
(2, 'Aderezo César'),
(2, 'Pechuga de pollo');
INSERT INTO steps (recipe_id, number, description) VALUES
(2, 1, 'Lava y corta la lechuga.'),
(2, 2, 'Cocina la pechuga de pollo y córtala en tiras.'),
(2, 3, 'Mezcla la lechuga con crutones, parmesano y aderezo César. Añade el pollo.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(2, 1, 'pasta_carbonara.jpg', 'Pasta Carbonara', 'Un plato clásico italiano con huevo, queso y panceta.');
INSERT INTO ingredients (recipe_id, name) VALUES
(3, 'Pasta'),
(3, 'Huevo'),
(3, 'Panceta'),
(3, 'Queso parmesano'),
(3, 'Sal y pimienta');
INSERT INTO steps (recipe_id, number, description) VALUES
(3, 1, 'Cocina la pasta en agua con sal.'),
(3, 2, 'Fríe la panceta hasta que esté crujiente.'),
(3, 3, 'Mezcla la pasta con el huevo batido, la panceta y el queso.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(6, 2, 'sopa_tomate.jpg', 'Sopa de Tomate', 'Una sopa reconfortante hecha con tomates frescos.');
INSERT INTO ingredients (recipe_id, name) VALUES
(4, 'Tomates frescos'),
(4, 'Cebolla'),
(4, 'Ajo'),
(4, 'Caldo de pollo'),
(4, 'Albahaca');
INSERT INTO steps (recipe_id, number, description) VALUES
(4, 1, 'Sofríe la cebolla y el ajo en una olla.'),
(4, 2, 'Añade los tomates y el caldo de pollo, cocina a fuego lento.'),
(4, 3, 'Licúa la sopa y sirve con albahaca fresca.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(4, 1, 'brownies_chocolate.jpg', 'Brownies de Chocolate', 'Brownies esponjosos y deliciosos, perfectos para los amantes del chocolate.');
INSERT INTO ingredients (recipe_id, name) VALUES
(5, 'Chocolate amargo'),
(5, 'Mantequilla'),
(5, 'Harina'),
(5, 'Azúcar'),
(5, 'Huevos'),
(5, 'Nueces');
INSERT INTO steps (recipe_id, number, description) VALUES
(5, 1, 'Derrite el chocolate con la mantequilla.'),
(5, 2, 'Mezcla los ingredientes secos y los huevos con el chocolate.'),
(5, 3, 'Vierte en un molde y hornea a 180°C por 25 minutos.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(2, 2, 'pizza_margarita.jpg', 'Pizza Margarita', 'Pizza clásica con salsa de tomate, mozzarella y albahaca.');
INSERT INTO ingredients (recipe_id, name) VALUES
(6, 'Masa de pizza'),
(6, 'Salsa de tomate'),
(6, 'Queso mozzarella'),
(6, 'Albahaca fresca');
INSERT INTO steps (recipe_id, number, description) VALUES
(6, 1, 'Extiende la masa de pizza.'),
(6, 2, 'Cubre con salsa de tomate y queso.'),
(6, 3, 'Hornea a 220°C por 15 minutos y añade la albahaca.');

INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(1, 1, 'panqueques.jpg', 'Panqueques', 'Panqueques esponjosos, ideales para el desayuno.');
INSERT INTO ingredients (recipe_id, name) VALUES
(7, 'Harina'),
(7, 'Leche'),
(7, 'Huevos'),
(7, 'Azúcar'),
(7, 'Mantequilla');
INSERT INTO steps (recipe_id, number, description) VALUES
(7, 1, 'Mezcla todos los ingredientes hasta obtener una masa homogénea.'),
(7, 2, 'Vierte la masa en una sartén caliente con mantequilla.'),
(7, 3, 'Cocina hasta que se formen burbujas y voltea para dorar por el otro lado.');


INSERT INTO recipes (category_id, user_id, image, name, description) VALUES
(5, 2, 'guacamole.jpg', 'Guacamole', 'Guacamole fresco y delicioso, perfecto como acompañamiento.');
INSERT INTO ingredients (recipe_id, name) VALUES
(8, 'Aguacates'),
(8, 'Cilantro'),
(8, 'Jugo de limón'),
(8, 'Cebolla'),
(8, 'Tomate');
INSERT INTO steps (recipe_id, number, description) VALUES
(8, 1, 'Machaca los aguacates en un tazón.'),
(8, 2, 'Añade el cilantro, jugo de limón, cebolla y tomate picados.'),
(8, 3, 'Mezcla bien y ajusta la sazón con sal y pimienta.');
