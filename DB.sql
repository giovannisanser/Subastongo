-- Database: subastongo

-- DROP DATABASE subastongo;

CREATE DATABASE subastongo
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
ALTER USER postgres with encrypted password 'dmsdemo';
ALTER ROLE postgres WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE subastongo  TO postgres;
ALTER ROLE postgres LOGIN;



