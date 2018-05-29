-- Table: public."Rol"

-- DROP TABLE public."Rol";

CREATE TABLE public."Rol"
(
    pk_rol_id integer NOT NULL,
    rol_descripcion character varying(32) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Rol_pkey" PRIMARY KEY (pk_rol_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Rol"
    OWNER to postgres;
	
	
-- Table: public."TipoUsuario"

-- DROP TABLE public."TipoUsuario";

CREATE TABLE public."TipoUsuario"
(
    pk_tipousuario_id integer NOT NULL,
    tipousuario_descripcion character varying(64) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "TipoUsuario_pkey" PRIMARY KEY (pk_tipousuario_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."TipoUsuario"
    OWNER to postgres;

	
-- Table: public."Pais"

-- DROP TABLE public."Pais";

CREATE TABLE public."Pais"
(
    pk_pais_id integer NOT NULL,
    pais_nombre character varying(64) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pais_pkey" PRIMARY KEY (pk_pais_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Pais"
    OWNER to postgres;
	
	
-- Table: public."Departamento"

-- DROP TABLE public."Departamento";

CREATE TABLE public."Departamento"
(
    pk_departamento_id integer NOT NULL,
    fk_pais_id integer NOT NULL,
    departamento_nombre character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Departamento_pkey" PRIMARY KEY (pk_departamento_id),
    CONSTRAINT "Pais" FOREIGN KEY (fk_pais_id)
        REFERENCES public."Pais" (pk_pais_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Departamento"
    OWNER to postgres;
	


-- Table: public."Ciudad"

-- DROP TABLE public."Ciudad";

CREATE TABLE public."Ciudad"
(
    pk_ciudad_id integer NOT NULL,
    fk_departamento_id integer NOT NULL,
    ciudad_nombre character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Ciudad_pkey" PRIMARY KEY (pk_ciudad_id),
    CONSTRAINT "Departamento" FOREIGN KEY (fk_departamento_id)
        REFERENCES public."Departamento" (pk_departamento_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Ciudad"
    OWNER to postgres;
	

	
-- Table: public."Usuario"

-- DROP TABLE public."Usuario";

CREATE TABLE public."Usuario"
(
    pk_usuario_id integer NOT NULL,
    fk_ciudad_id integer NOT NULL,
    fk_rol_id integer NOT NULL,
    fk_tipousuario_id integer NOT NULL,
    CONSTRAINT "Usuario_pkey" PRIMARY KEY (pk_usuario_id),
    CONSTRAINT ciudad FOREIGN KEY (fk_ciudad_id)
        REFERENCES public."Ciudad" (pk_ciudad_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT rol FOREIGN KEY (fk_rol_id)
        REFERENCES public."Rol" (pk_rol_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "tipoUsuario" FOREIGN KEY (fk_tipousuario_id)
        REFERENCES public."TipoUsuario" (pk_tipousuario_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Usuario"
    OWNER to postgres;
