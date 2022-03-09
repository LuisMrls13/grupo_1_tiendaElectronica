create table Categoria
(
    id_categoria int          not null
        primary key,
    categoria    varchar(100) null
);

create table Direccion
(
    id_direccion int auto_increment
        primary key,
    direccion    varchar(100) not null,
    id_usuario   int          not null
);

create table Imagenes
(
    id_imagenes int auto_increment
        primary key,
    imagenes    varchar(100) not null,
    id_modelo   varchar(100) not null
);

create table Marca
(
    id_marca    int          not null
        primary key,
    marca       varchar(100) null,
    clave_marca varchar(100) null
);

create table Modelos
(
    id_modelo           int auto_increment
        primary key,
    modelo              varchar(100) not null,
    id_marca            int          null,
    existencia_cantidad int(2)       null,
    precio              float(6, 4)  null,
    id_categoria        int          null,
    descripcion         varchar(50)  null,
    constraint Models_modelo_uindex
        unique (modelo),
    constraint Modelos_id_modelo_fk
        foreign key (id_modelo) references Imagenes (id_imagenes),
    constraint Models_Categoria_fk
        foreign key (id_categoria) references Categoria (id_categoria)
            on update cascade on delete cascade,
    constraint Models_marca_fk
        foreign key (id_marca) references Marca (id_marca)
            on update cascade on delete cascade
);

create table Carrito_compras
(
    id_carrito_compras int auto_increment
        primary key,
    id_usuario         int          not null,
    id_modelo          varchar(100) not null,
    cantidad           varchar(100) not null,
    id_color           int          not null,
    constraint Carrito_compras_id_modelo_fk
        foreign key (id_carrito_compras) references Modelos (id_modelo)
            on update cascade on delete cascade
);

alter table Categoria
    add constraint Categoria_id_categoria_fk
        foreign key (id_categoria) references Modelos (id_modelo)
            on update cascade on delete cascade;

create table Color
(
    id_color int          not null
        primary key,
    color    varchar(100) null,
    constraint Color_id_color_fk
        foreign key (id_color) references Carrito_compras (id_carrito_compras)
            on update cascade on delete cascade
);

alter table Carrito_compras
    add constraint Carrito_compras_id_color_fk
        foreign key (id_carrito_compras) references Color (id_color)
            on update cascade on delete cascade;

alter table Marca
    add constraint Marca_id_marca_fk
        foreign key (id_marca) references Modelos (id_modelo)
            on update cascade on delete cascade;

create table Modelo_color
(
    id_modelo_color int auto_increment
        primary key,
    id_modelo       varchar(100) null,
    id_color        varchar(100) null,
    constraint Modelo_color_id_color_fk
        foreign key (id_modelo_color) references Color (id_color)
            on update cascade on delete cascade
);

alter table Color
    add constraint id_color_fk
        foreign key (id_color) references Modelo_color (id_modelo_color)
            on update cascade on delete cascade;

create table Telefonos
(
    id_telefono int auto_increment
        primary key,
    telefono    int null,
    id_usuario  int null,
    constraint Telefonos_id_usuario_fk
        foreign key (id_usuario) references Direccion (id_direccion)
            on update cascade on delete cascade
);

alter table Direccion
    add constraint Direccion_id_usuario_fk
        foreign key (id_usuario) references Telefonos (id_usuario)
            on update cascade on delete cascade;

create table Usuarios
(
    id_usuario         int auto_increment
        primary key,
    usuario            varchar(100) not null,
    nombre_completo    varchar(100) not null,
    foto_de_perfil     float(6, 4)  not null,
    miembro_plus       varchar(100) not null,
    correo_electronico int          not null,
    constraint Usuarios_id_usuario_fk
        foreign key (id_usuario) references Carrito_compras (id_carrito_compras)
            on update cascade on delete cascade
);

alter table Carrito_compras
    add constraint Carrito_compras_id_usuario_fk
        foreign key (id_carrito_compras) references Usuarios (id_usuario)
            on update cascade on delete cascade;

create table Metodo_pago
(
    id_metodo_pago       int auto_increment
        primary key,
    pago                 varchar(100) null,
    nombre_titular       varchar(100) null,
    numero_de_tarjeta    int          not null,
    fecha_de_vencimiento smallint     not null,
    id_usuario           int          not null,
    constraint Metodo_pago_id_metodo_pago_fk
        foreign key (id_metodo_pago) references Usuarios (id_usuario)
            on update cascade on delete cascade
);

