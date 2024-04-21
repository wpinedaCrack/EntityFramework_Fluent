USE [BDEntityFrameworkFLUENT]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Categoria_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Categoria_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ObtenerCategorias]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ObtenerCategorias] as
select c.Categoria_Id, c.Nombre, c.Activo, c.FechaCreacion
from Categoria c
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticuloEtiqueta]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticuloEtiqueta](
	[Articulo_Id] [int] NOT NULL,
	[Etiqueta_Id] [int] NOT NULL,
 CONSTRAINT [PK_ArticuloEtiqueta] PRIMARY KEY CLUSTERED 
(
	[Etiqueta_Id] ASC,
	[Articulo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleUsuario]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleUsuario](
	[DetalleUsuario_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [nvarchar](max) NOT NULL,
	[Deporte] [nvarchar](max) NULL,
	[Mascota] [nvarchar](max) NULL,
 CONSTRAINT [PK_DetalleUsuario] PRIMARY KEY CLUSTERED 
(
	[DetalleUsuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[Etiqueta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[Etiqueta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas](
	[idnota] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](50) NULL,
	[descripcion] [nvarchar](200) NULL,
	[fecha] [date] NOT NULL,
	[usuario_id] [int] NULL,
 CONSTRAINT [PK_notas] PRIMARY KEY CLUSTERED 
(
	[idnota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Articulo]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Articulo](
	[Articulo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](20) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Calificacion] [float] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Categoria_Id] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Articulo] PRIMARY KEY CLUSTERED 
(
	[Articulo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[DetalleUsuario_Id] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240419035028_InicialFluentAPI', N'6.0.0')
GO
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (1, 1)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (1, 2)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (1, 3)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (1, 4)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (2, 1)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (2, 4)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (3, 3)
INSERT [dbo].[ArticuloEtiqueta] ([Articulo_Id], [Etiqueta_Id]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [FechaCreacion], [Activo]) VALUES (1, N'Categoria 1', CAST(N'2024-04-18' AS Date), 0)
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [FechaCreacion], [Activo]) VALUES (2, N'Categoria 2', CAST(N'2024-04-05' AS Date), 1)
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [FechaCreacion], [Activo]) VALUES (3, N'Categoria 3', CAST(N'2024-04-17' AS Date), 1)
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [FechaCreacion], [Activo]) VALUES (4, N'Categoria 4', CAST(N'2024-04-13' AS Date), 1)
INSERT [dbo].[Categoria] ([Categoria_Id], [Nombre], [FechaCreacion], [Activo]) VALUES (5, N'Categoria 5', CAST(N'2024-04-20' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([Etiqueta_Id], [Titulo], [Fecha]) VALUES (1, N'Samsung', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[Etiqueta] ([Etiqueta_Id], [Titulo], [Fecha]) VALUES (2, N'Lenovo', CAST(N'2024-04-14' AS Date))
INSERT [dbo].[Etiqueta] ([Etiqueta_Id], [Titulo], [Fecha]) VALUES (3, N'Apple', CAST(N'2024-04-17' AS Date))
INSERT [dbo].[Etiqueta] ([Etiqueta_Id], [Titulo], [Fecha]) VALUES (4, N'Articulos Gamer', CAST(N'2024-04-18' AS Date))
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Articulo] ON 

INSERT [dbo].[Tbl_Articulo] ([Articulo_Id], [Titulo], [Descripcion], [Calificacion], [Fecha], [Categoria_Id]) VALUES (1, N'Teclado Genius', N'Teclado Genius', 3, CAST(N'2024-04-19' AS Date), 1)
INSERT [dbo].[Tbl_Articulo] ([Articulo_Id], [Titulo], [Descripcion], [Calificacion], [Fecha], [Categoria_Id]) VALUES (2, N'Mouses00', N'Mouses00 Generico', 3, CAST(N'2024-04-17' AS Date), 2)
INSERT [dbo].[Tbl_Articulo] ([Articulo_Id], [Titulo], [Descripcion], [Calificacion], [Fecha], [Categoria_Id]) VALUES (3, N'PC Gamer', N'PC Gamer', 3, CAST(N'2024-04-11' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Tbl_Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Email], [Direccion], [DetalleUsuario_Id]) VALUES (1, N'panfilo', N'panfilo@gmail.com', N'calle 127 14 32', NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Email], [Direccion], [DetalleUsuario_Id]) VALUES (2, N'samuel', N'samu@gmail.com', N'calle 69b no 79-12', NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Email], [Direccion], [DetalleUsuario_Id]) VALUES (3, N'Camilo', N'Camilo@gmail.com', N'call 12 9-94', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[ArticuloEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloEtiqueta_Etiqueta_Etiqueta_Id] FOREIGN KEY([Etiqueta_Id])
REFERENCES [dbo].[Etiqueta] ([Etiqueta_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticuloEtiqueta] CHECK CONSTRAINT [FK_ArticuloEtiqueta_Etiqueta_Etiqueta_Id]
GO
ALTER TABLE [dbo].[ArticuloEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloEtiqueta_Tbl_Articulo_Articulo_Id] FOREIGN KEY([Articulo_Id])
REFERENCES [dbo].[Tbl_Articulo] ([Articulo_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticuloEtiqueta] CHECK CONSTRAINT [FK_ArticuloEtiqueta_Tbl_Articulo_Articulo_Id]
GO
ALTER TABLE [dbo].[Tbl_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Articulo_Categoria_Categoria_Id] FOREIGN KEY([Categoria_Id])
REFERENCES [dbo].[Categoria] ([Categoria_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Articulo] CHECK CONSTRAINT [FK_Tbl_Articulo_Categoria_Categoria_Id]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_DetalleUsuario_DetalleUsuario_Id] FOREIGN KEY([DetalleUsuario_Id])
REFERENCES [dbo].[DetalleUsuario] ([DetalleUsuario_Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_DetalleUsuario_DetalleUsuario_Id]
GO
/****** Object:  StoredProcedure [dbo].[SpObtenerUsuarioId]    Script Date: 20/04/2024 10:43:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpObtenerUsuarioId] @idUsuario int as
set nocount on;
select * from dbo.Usuario u
where u.Id = @idUsuario
GO
