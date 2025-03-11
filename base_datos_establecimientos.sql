CREATE DATABASE datos_establecimientos;
USE datos_establecimientos;

-- Tabla de Asentamientos
CREATE TABLE Asentamientos (
    id_asentamiento INT AUTO_INCREMENT PRIMARY KEY, 
    nombre_asent VARCHAR(65),
    tipo_asent VARCHAR(40),
    tipo_vial VARCHAR(40),
    edificio VARCHAR(50),
    numero_ext VARCHAR(50)
);

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal VARCHAR(6),
    cve_num VARCHAR(5),
    cve_loc VARCHAR(8),
    id_asentamiento INT,
    FOREIGN KEY (id_asentamiento) REFERENCES Asentamientos(id_asentamiento) ON DELETE SET NULL
);

-- Tabla de Coordenadas
CREATE TABLE Coordenadas (
    id_coordenada INT AUTO_INCREMENT PRIMARY KEY, 
    id_ubicacion INT,
    latitud DECIMAL(12,8),
    longitud DECIMAL(12,8),
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion)
);

-- Tabla de Establecimientos
CREATE TABLE Establecimientos (
    id_establecimiento INT PRIMARY KEY,
    nombre_estab VARCHAR(220) NOT NULL,
    razo_social VARCHAR(220),
    codigo_act VARCHAR(8),
    fecha_alta DATE,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion) ON DELETE SET NULL
);

-- Tabla de Telefonos
CREATE TABLE Telefonos (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY, 
    id_establecimiento INT,
    telefono VARCHAR(15),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);

-- Tabla de Correos Electrónicos
CREATE TABLE Correos (
    id_correoelec INT AUTO_INCREMENT PRIMARY KEY, 
    id_establecimiento INT,
    correoelec VARCHAR(70),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);

-- Tabla de Sitios Web
CREATE TABLE SitiosWeb (
    id_web INT AUTO_INCREMENT PRIMARY KEY,
    id_establecimiento INT,
    web VARCHAR(90),
    FOREIGN KEY (id_establecimiento) REFERENCES Establecimientos(id_establecimiento) ON DELETE CASCADE
);
