CREATE TABLE [Empleado] (
  [id_empleado] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(100),
  [apellido] varchar(100),
  [email] varchar(100),
  [legajo] varchar(20),
  [rol] varchar(30)
)
GO

CREATE TABLE [Solicitud] (
  [id_solicitud] int PRIMARY KEY IDENTITY(1, 1),
  [fecha_creacion] date,
  [fecha_gasto] date,
  [importe] decimal(10,2),
  [descripcion_gasto] varchar(255),
  [estado] varchar(30),
  [motivo_rechazo] varchar(255),
  [archivo_comprobante] varchar(255),
  [id_empleado] int
)
GO

CREATE TABLE [Liquidacion] (
  [id_liquidacion] int PRIMARY KEY IDENTITY(1, 1),
  [fecha_liquidacion] date,
  [importe] decimal(10,2),
  [id_solicitud] int,
  [id_analista] int
)
GO

ALTER TABLE [Solicitud] ADD FOREIGN KEY ([id_empleado]) REFERENCES [Empleado] ([id_empleado])
GO

ALTER TABLE [Solicitud] ADD FOREIGN KEY ([id_solicitud]) REFERENCES [Liquidacion] ([id_solicitud])
GO

ALTER TABLE [Liquidacion] ADD FOREIGN KEY ([id_analista]) REFERENCES [Empleado] ([id_empleado])
GO
