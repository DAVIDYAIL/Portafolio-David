CREATE DATABASE portafolio;
USE portafolio;

CREATE TABLE proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500) NOT NULL
);

CREATE TABLE habilidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO proyectos (nombre, descripcion)
VALUES
(
    'Dashboard de indicadores logísticos',
    'Proyecto desarrollado para visualizar y analizar indicadores de operación mediante Power BI.'
),
(
    'Control de inventario',
    'Herramienta para apoyar el seguimiento de stock y facilitar el análisis de inventario.'
);

INSERT INTO habilidades (nombre)
VALUES
('Power BI'),
('SQL'),
('Excel'),
('Power Query'),
('Automatización de procesos');

CREATE USER 'portafolio_user'@'localhost'
IDENTIFIED BY 'TU_CLAVE';

GRANT SELECT ON portafolio.*
TO 'portafolio_user'@'localhost';

FLUSH PRIVILEGES;



