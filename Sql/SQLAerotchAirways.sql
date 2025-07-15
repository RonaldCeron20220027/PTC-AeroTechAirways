CREATE DATABASE aerotech_airways;
GO
USE aerotech_airways;
GO

CREATE TABLE Cliente (
    id_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    NombreCliente NVARCHAR(50),
    Edad INT,
    TelefonoCliente VARCHAR(20),
    EmailCliente NVARCHAR(50),
    Pasaporte NVARCHAR(50)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    NombreEmpleado NVARCHAR(50),
    Cargo NVARCHAR(50),
    TelefonoEmpleado VARCHAR(20),
    EmailEmpleado NVARCHAR(50)
);

-- Tabla Cuenta (de acceso para empleados)
CREATE TABLE Cuenta (
    id_Cuenta INT IDENTITY(1,1) PRIMARY KEY,
    CorreoCuenta VARCHAR(50),
    ContrasenaCuenta VARCHAR(50),
    id_Empleado INT FOREIGN KEY REFERENCES Empleado(id_Empleado)
);

-- Tabla Compañía
CREATE TABLE Compania (
    id_Compania INT IDENTITY(1,1) PRIMARY KEY,
    NombreCompania NVARCHAR(50),
    DireccionCompania NVARCHAR(50),
    TelefonoCompania VARCHAR(20)
);

-- Tabla Origen
CREATE TABLE Origen (
    id_Origen INT IDENTITY(1,1) PRIMARY KEY,
    AeropuertoOrigen NVARCHAR(50),
    CiudadOrigen NVARCHAR(50),
    codCiudadOrigen NVARCHAR(50)
);

-- Tabla Destino
CREATE TABLE Destino (
    id_Destino INT IDENTITY(1,1) PRIMARY KEY,
    AeropuertoDestino NVARCHAR(50),
    CiudadDestino NVARCHAR(50),
    codCiudadDestino NVARCHAR(50)
);

-- Tabla Itinerario
CREATE TABLE Itinerario (
    id_Itinerario INT IDENTITY(1,1) PRIMARY KEY,
    id_Origen INT FOREIGN KEY REFERENCES Origen(id_Origen),
    id_Destino INT FOREIGN KEY REFERENCES Destino(id_Destino),
    Fecha DATE,
    Hora TIME
);

-- Tabla Vuelo
CREATE TABLE Vuelo (
    id_Vuelo INT IDENTITY(1,1) PRIMARY KEY,
    id_Compania INT FOREIGN KEY REFERENCES Compania(id_Compania),
    id_Itinerario INT FOREIGN KEY REFERENCES Itinerario(id_Itinerario),
    Capacidad INT,
    NumeroVuelo NVARCHAR(50)
);

-- Tabla Clase
CREATE TABLE Clase (
    id_Clase INT IDENTITY(1,1) PRIMARY KEY,
    NombreClase NVARCHAR(50) UNIQUE CHECK (NombreClase IN ('Económico', 'Turista', 'AVE'))
);

-- Tabla Preferencia de Asiento
CREATE TABLE PreferenciaAsiento (
    id_Preferencia INT IDENTITY(1,1) PRIMARY KEY,
    TipoPreferencia NVARCHAR(50) UNIQUE CHECK (TipoPreferencia IN ('Ventana', 'Pasillo', 'Central'))
);

-- Tabla Pasaje
CREATE TABLE Pasaje (
    id_Pasaje INT IDENTITY(1,1) PRIMARY KEY,
    id_Cliente INT FOREIGN KEY REFERENCES Cliente(id_Cliente),
    id_Vuelo INT FOREIGN KEY REFERENCES Vuelo(id_Vuelo),
    id_Clase INT FOREIGN KEY REFERENCES Clase(id_Clase),
    id_Preferencia INT FOREIGN KEY REFERENCES PreferenciaAsiento(id_Preferencia),
    Asiento NVARCHAR(50),
    Valor INT,
    FechaCompra DATE
);

-- Tabla Equipaje
CREATE TABLE Equipaje (
    id_Equipaje INT IDENTITY(1,1) PRIMARY KEY,
    id_Pasaje INT FOREIGN KEY REFERENCES Pasaje(id_Pasaje),
    Peso INT,
    TipoEquipaje NVARCHAR(50),
    DescripcionEquipaje NVARCHAR(100)
);

