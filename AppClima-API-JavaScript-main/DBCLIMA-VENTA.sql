CREATE DATABASE [DBVENTA]
GO

USE [DBVENTA]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Categoria
ADD CONSTRAINT FK_Categoria_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Categoria
ADD CONSTRAINT FK_Categoria_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Categoria
ADD CONSTRAINT FK_Categoria_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

SELECT *
FROM [Categoria]
GO

-- INSERT
INSERT INTO [Categoria]
	(descripcion, esActivo, CreationUser)
VALUES
	('Computadoras', 1, 1),
	('Laptop', 1, 1),
	('Monitores', 1, 1),
	('Microfono', 1, 2),
	('Teclados', 1, 2),
	('UPC',1, 2),
	('Mouse', 1, 3),
	('Auriculares', 1, 3)
GO

-- UPDATE
UPDATE [Categoria]
SET descripcion = '',
    esActivo = 0,
    ModifyDate = GETDATE(),
    UserMod = 1
WHERE idCategoria = 2;
GO

-- Deleted
UPDATE [Categoria]
SET DeletedDate = GETDATE(),
    UserDeleted = 1,
	Deleted = 0
WHERE idCategoria = 2;
GO

/****** Object:  Table [dbo].[Configuracion]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

/****** Object:  Table [dbo].[Menu]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[icono] [varchar](30) NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Negocio
ADD CONSTRAINT FK_Negocio_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Negocio
ADD CONSTRAINT FK_Negocio_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Negocio
ADD CONSTRAINT FK_Negocio_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

/****** Object:  Table [dbo].[NumeroCorrelativo]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroCorrelativo](
	[idNumeroCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idNumeroCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[idSuplidor] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
 CONSTRAINT [PK__Producto__07F4A1322C7516D6] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

/****** Object:  Table [dbo].[Rol]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplidor]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplidor](
	[idSuplidor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](40) NOT NULL,
	[contacto] [nvarchar](30) NOT NULL,
	[direccion] [nvarchar](60) NOT NULL,
	[ciudad] [nvarchar](15) NOT NULL,
	[region] [nvarchar](15) NULL,
	[codigo_postal] [nvarchar](10) NULL,
	[pais] [nvarchar](15) NOT NULL,
	[telefono] [nvarchar](24) NOT NULL,
	[fax] [nvarchar](24) NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[idSuplidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Suplidor
ADD CONSTRAINT FK_Suplidor_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Suplidor
ADD CONSTRAINT FK_Suplidor_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Suplidor
ADD CONSTRAINT FK_Suplidor_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

SELECT * FROM [Suplidor]
GO

/****** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	/*[idRol] [int] NULL,*/
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,	
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

SELECT *
FROM [Usuario]
GO

SELECT *
FROM [Usuario]
WHERE idUsuario = 2
GO

INSERT INTO [Usuario]
	(nombre,telefono,correo, esActivo, CreationUser)
VALUES
	('Pedro', '(809) 698-3742', 'pedrodj@gmail.com', 1, 1),
	('Emilio', '(849) 698-6952', 'luisvp@gmail.com', 1, 1),
	('Jorge', '(829) 318-1972', 'jorvejv@gmail.com', 1, 1)
GO

/****** Object:  Table [dbo].[Venta]    Script Date: 5/20/2023 9:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	/*[idTipoDocumentoVenta] [int] NULL,*/
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
	[CreationUser] [int] NOT NULL,
    [CreationDate] [datetime] DEFAULT GETDATE() NOT NULL,
    [UserMod] [int] NULL,
    [ModifyDate] [datetime] DEFAULT NULL,
    [UserDeleted] [int] NULL,
    [DeletedDate] [datetime] DEFAULT NULL,
    [Deleted] BIT DEFAULT 0 NOT NULL
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- relaciones
ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_CreationUser FOREIGN KEY (CreationUser) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_UserMod FOREIGN KEY (UserMod) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE Venta
ADD CONSTRAINT FK_Venta_UserDeleted FOREIGN KEY (UserDeleted) REFERENCES Usuario(idUsuario);
GO

ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF__Producto__fechaR__49C3F6B7]  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO

ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO

ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO

ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Producto]
GO

ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO

ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK__Producto__idCate__48CFD27E] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO

ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK__Producto__idCate__48CFD27E]
GO

ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Suplidor] FOREIGN KEY([idSuplidor])
REFERENCES [dbo].[Suplidor] ([idSuplidor])
GO

ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Suplidor]
GO

ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO

ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO

/*ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO*/

/*ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO*/

ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO