USE [gesinV2]
GO
/****** Object:  Table [dbo].[Activos]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[Idsubsistema] [int] NOT NULL,
 CONSTRAINT [PK_DescripcionSelect] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config_Usuario]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config_Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Background] [nvarchar](60) NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Config_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criticidad]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criticidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK__Criticid__3214EC072AAA1D7E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estacion]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
 CONSTRAINT [PK__Zona__3214EC07EB4F6B46] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoOT]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoOT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__EstadoOT__3214EC076B4849B4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Funcionmantenedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mantenedor]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Empresa_mantenedora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Codigo] [nvarchar](20) NOT NULL,
	[IdFuncion] [int] NOT NULL,
 CONSTRAINT [PK__Mantened__3214EC07B9735D82] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reportes]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reportes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSubsistema] [int] NOT NULL,
	[Ubicacion] [nvarchar](100) NOT NULL,
	[IdEstacion] [int] NOT NULL,
	[Operador_reporte] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](400) NOT NULL,
	[Fechaaveria] [datetime] NOT NULL,
	[IdCriticidad] [int] NOT NULL,
	[IdSM] [int] NOT NULL,
	[OT] [bigint] NULL,
	[IdEstadoOT] [int] NOT NULL,
	[Comentario] [nvarchar](400) NULL,
	[Fechanotificacion] [datetime] NULL,
	[Mantenedor_notificar] [nvarchar](50) NULL,
	[Fechainicio] [datetime] NULL,
	[Fechafinal] [datetime] NULL,
	[IdUsuarios] [int] NOT NULL,
	[Mantenedor_reparo] [nvarchar](50) NULL,
	[Operador_Cierre] [nvarchar](50) NULL,
	[IdUsuario_Actualizo] [int] NULL,
	[CodigoOperador_reporte] [nvarchar](50) NULL,
	[CodigoOperador_Cierre] [nvarchar](50) NULL,
	[IdSistema] [int] NOT NULL,
	[Idmantenedor] [int] NOT NULL,
 CONSTRAINT [PK_Reportes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sistema]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sistema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sistema_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Sistema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subsistema]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subsistema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[IdSistema] [int] NOT NULL,
	[IdMantenedor] [int] NOT NULL,
 CONSTRAINT [PK_Subsistema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Ubicacio__3214EC0785DF5FEA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/12/2022 20:29:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activos] ON 

INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (1, N'GAT  01 fuera de servicio.', 1)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (2, N'GAT 01, no valida.', 1)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (5, N'GAT 02 , pictograma con caracteres erroneos', 1)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (6, N'POS 1 fuera de servicio', 2)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (7, N'POS 1, monitor se muestra en azul', 2)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (8, N'POS 2, impresora con atasco', 2)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (9, N'1 Lampara no enciende ', 5)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (10, N'Tomacorriente sin energia', 5)
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (11, N'Falla de energia ', 5)
SET IDENTITY_INSERT [dbo].[Activos] OFF
GO
SET IDENTITY_INSERT [dbo].[Config_Usuario] ON 

INSERT [dbo].[Config_Usuario] ([Id], [Background], [IdUsuario]) VALUES (1, N'#860909', 6)
INSERT [dbo].[Config_Usuario] ([Id], [Background], [IdUsuario]) VALUES (2, N'#182162', 1)
SET IDENTITY_INSERT [dbo].[Config_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Criticidad] ON 

INSERT [dbo].[Criticidad] ([Id], [Nombre]) VALUES (1, N'Bajo Impacto')
INSERT [dbo].[Criticidad] ([Id], [Nombre]) VALUES (2, N'Alto Impacto')
SET IDENTITY_INSERT [dbo].[Criticidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Estacion] ON 

INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (1, N'C. Heroes')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (2, N'F. Camaño')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (3, N'A. Abel')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (4, N'J. Balaguer')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (5, N'C. Damiron')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (6, N'J. Bosch')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (7, N'J. P. Daarte L1')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (8, N'P. Batlle')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (9, N'P. L. Cedeño')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (10, N'L. Tainos')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (11, N'M. Gomez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (12, N'H. Mirabal')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (13, N'P. Gomez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (14, N'G. Luperon')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (15, N'G. U. Gilbert')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (16, N'M. Tingo ')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (17, N'M. Montez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (18, N'P. Bono')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (19, N'F. G. Billini')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (20, N'U. F. Espaillat')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (21, N'P. Mir')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (22, N'F. B. Goico')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (23, N'J. U. Garcia Saleta')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (24, N'J. P. Duarte L2')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (25, N'R. F. Dominguez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (26, N'M. Baez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (27, N'R. Caceres')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (28, N'H. Vasquez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (29, N'M. de JS. Galvan')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (30, N'E. Brito')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (31, N'E. Pepin')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (32, N'R. Duarte')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (33, N'T. M. de Vasquez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (34, N'C. Bona')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (35, N'TIM')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (36, N'Deposito')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (37, N'T1')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (38, N'T2')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (39, N'T3')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (40, N'T4')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (41, N'Int. C. de los Héroes - F. Caamaño')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (42, N'Int. F. Caamaño - A. Abel')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (43, N'Int. A. Abel - J. Balaguer')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (44, N'Int. J. Balaguer - C. Damirón')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (45, N'Int. C. Damirón - J. Bosch')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (46, N'Int. J. Bosch - J. P. Duarte')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (47, N'Int. J. P. Duarte - P. Batlle')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (48, N'Int. P. Batlle - P. L. Cedeño')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (49, N'Int. L. Tainos - M. Gómez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (50, N'Int. M. Montez - P. F. Bonó')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (51, N'Int. P. F. Bonó - F. G. Billini')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (52, N'Int. F. G. Billini - U. F. Espaillat')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (53, N'Int. U. F. Espaillat - P. Mir')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (54, N'Int. P. Mir - F. B. Goico')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (55, N'Int. F. B. Goico - J. U. Garcia Saleta')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (56, N'Int. J. U. Garcia Saleta - J. P. Duarte')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (57, N'Int. J. P. Duarte - R. F. Dominguez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (58, N'Int. R. F. Dominguez - M. Báez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (59, N'Int. M. Báez - R. Cácere')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (60, N'Int. R. Cáceres - H. Váquez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (61, N'Int. H. Váquez - M. de js. Galván')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (62, N'Int. M. de js. Galván - E. Brito')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (63, N'Centro de Generacion')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (64, N'Ofic. Adm. de OPRET')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (65, N'Linea 1')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (66, N'Linea 2')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (67, N'Patios y Talleres')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (68, N'Int. T1-T2')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (69, N'Int. T2-T3')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (70, N'Int. T3-T4')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (71, N'Int. M. Gomez - H. Mirabal')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (72, N'Int. H. Mirabal - P. Gomez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (73, N'Int. P. Gomez - G. Luperon')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (74, N'Int. G. Luperon - G. Gilbert')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (75, N'int. G. Gilbert - M. Tingo')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (76, N'Int. E. Brito - E. Pepin')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (77, N'Int. E. Pepin - R. Duarte')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (78, N'Int. R. Duarte - T. M. de Vasquez')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (79, N'Int. T. M. de Vasquez - C. Bona')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (80, N'PMC')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (81, N'SEA Isabela')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (82, N'SEA Paraiso')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (83, N'SEA UASD')
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (84, N'Teleferico')
SET IDENTITY_INSERT [dbo].[Estacion] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoOT] ON 

INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (1, N'Creada')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (2, N'Reportada')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (3, N'Creada Reportada')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (4, N'Falsa Averia')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (5, N'Cerrada')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (6, N'Reutilizar')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (7, N'Duplicada')
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (8, N'Sin Estado')
SET IDENTITY_INSERT [dbo].[EstadoOT] OFF
GO
SET IDENTITY_INSERT [dbo].[Funcion] ON 

INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (1, N'Call Center')
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (2, N'Tecnico')
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (3, N'Operador')
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (4, N'Electromecanica')
SET IDENTITY_INSERT [dbo].[Funcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Mantenedor] ON 

INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (1, N'CCS')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (2, N'OPRET')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (3, N'LIRIANO')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (4, N'VEGAZO')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (5, N'THALES')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (6, N'SOFRATESA')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (7, N'ATSO')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (8, N'SIEMENS')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (9, N'EXERGIA')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (10, N'SERVINCA')
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (11, N'ASCH')
SET IDENTITY_INSERT [dbo].[Mantenedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1, N'Ronal Gomez', N'1245      ', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (2, N'Honey Minaya', N'1246      ', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (3, N'Katherine Brigewater', N'3256      ', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (4, N'Pedro Xavier', N'4587      ', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (5, N'Melina Felipe', N'7441      ', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (7, N'veruzca', N'4586', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (8, N'isidro', N'145', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (9, N'Wilson Garcia', N'4796', 4)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (10, N'Edgar Coste', N'4758', 4)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (11, N'Yuliana manzueta', N'4797', 4)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (14, N'Cristian Candelario', N'4792', 4)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (15, N'Katherine Gonzalez', N'4795', 4)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (16, N'Alejandro Morla ', N'1235', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (17, N'Alexander Ortiz', N'1236', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (18, N'Alexio Sosa ', N'1237', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (19, N'Alexis Canela', N'1238', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (20, N'Alvaro De Peña', N'1239', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (21, N'Álvaro Heredia', N'1240', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (22, N'Andrés Cabral', N'1241', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (23, N'Angel Bello', N'1242', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (24, N'Angel Rodriguez', N'1243', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (25, N'Angel Santana', N'1244', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (26, N'Argenis Andújar', N'1245', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (27, N'Arrecio Sosa', N'1246', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (28, N'Carlos Ferreira ', N'1247', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (29, N'Carlos Mejia', N'1248', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (30, N'Carlos Paulino ', N'1249', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (31, N'Celso Pérez', N'1250', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (32, N'Cesar Batista ', N'1251', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (33, N'Cesar de los Santos ', N'1252', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (34, N'Cesar Felix', N'1253', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (35, N'Cesar Santana', N'1254', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (36, N'Cristian Beriguete', N'1255', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (37, N'Danny Alcantara ', N'1256', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (38, N'Dario Bock', N'1257', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (39, N'Dario Gomez ', N'1258', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (40, N'Dario Martinez', N'1259', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (41, N'Dario Morenos', N'1260', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (42, N'David De La Cruz', N'1261', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (43, N'David Duran', N'1262', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (44, N'Deivi Duran', N'1263', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (45, N'Dimos Alvarado', N'1264', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (46, N'Dionisio Blanco ', N'1265', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (47, N'Dionisio Perez', N'1266', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (48, N'Domingo Hernandez', N'1267', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (49, N'Doris Alcantara ', N'1268', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (50, N'Douglas Lara', N'1269', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (51, N'Duval Ramirez', N'1270', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (52, N'Eddy Mena ', N'1271', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (53, N'Eddy Rafael ', N'1272', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (54, N'Edgar de la Cruz ', N'1273', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (55, N'Edward Sánchez', N'1274', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (56, N'Elias Alcantara', N'1275', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (57, N'Elias Batista', N'1276', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (58, N'Eliezer Diaz ', N'1277', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (59, N'Elvin Perez', N'1278', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (60, N'Elvin Tiburcio ', N'1279', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (61, N'Emil Morales', N'1280', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (62, N'Esmil Morales', N'1281', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (63, N'Felix Alcantara', N'1282', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (64, N'Félix de León', N'1283', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (65, N'Fernando Moreno', N'1284', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (66, N'Francisco de Jesus', N'1285', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (67, N'Francisco Diaz', N'1286', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (68, N'Francisco Estevez', N'1287', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (69, N'Franklin Gomez', N'1288', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (70, N'Freddy Abreu', N'1289', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (71, N'Freddy Bone', N'1290', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (72, N'Freddy Perez ', N'1291', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (73, N'Gabriel Aquino ', N'1292', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (74, N'Hansel Geraldino ', N'1293', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (75, N'Hector Liriano', N'1294', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (76, N'Heriberto Bello', N'1295', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (77, N'Hilario Abad', N'1296', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (78, N'Ivan Perez ', N'1297', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (79, N'Jean Carlos Fulgencio ', N'1298', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (80, N'Jean de la Cruz ', N'1299', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (81, N'Jhon Veloz ', N'1300', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (82, N'Jhonatan del Villar ', N'1301', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (83, N'Joedy Tamares', N'1302', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (84, N'Joel Beltre ', N'1303', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (85, N'Jonathan Duverge', N'1304', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (86, N'Jonathan Ulloa', N'1305', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (87, N'Jordy Tavares', N'1306', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (88, N'Jorge Felix', N'1307', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (89, N'Jorge Pena', N'1308', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (90, N'Jorge Perez', N'1309', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (91, N'Jorge Santana ', N'1310', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (92, N'Jorge Sebastian', N'1311', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (93, N'Jose Lopez', N'1312', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (94, N'Jose Martinez', N'1313', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (95, N'Jose Miguel', N'1314', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (96, N'Jose Pena ', N'1315', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (97, N'Jose Ramos', N'1316', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (98, N'Jose Rodriguez', N'1317', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (99, N'Jose Roque ', N'1318', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (100, N'Jose Rosa', N'1319', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (101, N'Juan Berroa ', N'1320', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (102, N'Juan Carlos Cruz ', N'1321', 2)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (103, N'Juan Duran', N'1322', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (104, N'Juan Moreta ', N'1323', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (105, N'Juan Roque', N'1324', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (106, N'Juan Rosa ', N'1325', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (107, N'Julio Arias', N'1326', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (108, N'Julio Felix', N'1327', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (109, N'Julio Santana', N'1328', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (110, N'julio serrano', N'1329', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (111, N'Junior Vargas ', N'1330', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (112, N'Kevin Castillo', N'1331', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (113, N'Keyber Encarnacion', N'1332', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (114, N'Lebron Jimenez', N'1333', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (115, N'Leo Paniagua', N'1334', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (116, N'Leonida Lopez', N'1335', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (117, N'Lorenzo Capellan', N'1336', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (118, N'Luis Alberto Ramon', N'1337', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (119, N'Luis Cuevas', N'1338', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (120, N'Luis de la Rosa', N'1339', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (121, N'Luis Lopez ', N'1340', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (122, N'Luis Lorenzo', N'1341', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (123, N'Luis Marcos', N'1342', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (124, N'Luis Morales ', N'1343', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (125, N'Luis Nin', N'1344', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (126, N'Luis Pinales', N'1345', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (127, N'Luis Ramirez', N'1346', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (128, N'Luis Rodriguez', N'1347', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (129, N'Manuel Brito', N'1348', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (130, N'Manuel Pena ', N'1349', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (131, N'Marcelino Bencosme', N'1350', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (132, N'Marcos Pinales', N'1351', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (133, N'Martin Tapia', N'1352', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (134, N'Martires Tapia', N'1353', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (135, N'Máximo Santana ', N'1354', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (136, N'Melvin Marte', N'1355', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (137, N'Miguel Guzman', N'1356', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (138, N'Miguel Lebron', N'1357', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (139, N'Miguel nivar', N'1358', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (140, N'Modesto Contreras', N'1359', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (141, N'Modesto Guillen', N'1360', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (142, N'Modesto Navarro', N'1361', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (143, N'Nicolas Ramos', N'1362', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (144, N'Nilson Diaz', N'1363', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (145, N'Noelvis Vargas ', N'1364', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (146, N'Noriel Figuereo', N'1365', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (147, N'norvi Figueroa ', N'1366', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (148, N'Omar Ruiz', N'1367', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (149, N'Onesimo Martinez', N'1368', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (150, N'Orlando Lopez ', N'1369', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (151, N'Oscar Peña', N'1370', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (152, N'Pablo Arnaud', N'1371', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (153, N'Rafael de Leon ', N'1372', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (154, N'Rafael Ogando ', N'1373', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (155, N'Rafael Peralta', N'1374', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (156, N'Raimer Ramirez', N'1375', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (157, N'Raimon Cesar', N'1376', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (158, N'Ramon Diaz', N'1377', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (159, N'Ramon Figuereo', N'1378', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (160, N'Ramon Francisco', N'1379', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (161, N'Ramon Otañez', N'1380', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (162, N'Ramond Jimenez', N'1381', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (163, N'Raybel Ramirez ', N'1382', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (164, N'Raymon Jimenez', N'1383', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (165, N'Ricardo Nin', N'1384', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (166, N'Richard Méndez', N'1385', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (167, N'Richard Santana', N'1386', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (168, N'Robert Encarnacion', N'1387', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (169, N'Robert Minier', N'1388', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (170, N'Roberto Lebron', N'1389', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (171, N'Ronny Vasquez', N'1390', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (172, N'Rubén Gómez', N'1391', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (173, N'Rubén Minier', N'1392', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (174, N'Rufino Lantigua', N'1393', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (175, N'Sacarias Vazquez', N'1394', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (176, N'Samuel Amparo', N'1395', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (177, N'Selso Perez', N'1396', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (178, N'Sergio Paulino', N'1397', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (179, N'Victor de la Cruz ', N'1398', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (180, N'Vilario Abad', N'1399', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (181, N'Vladimir Diaz', N'1400', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (182, N'Vladimir Roa', N'1401', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (183, N'Waddin Ramírez', N'1402', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (184, N'Waldy Parra ', N'1403', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (185, N'Wellinton Batista', N'1404', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (186, N'Wellinton Ramirez', N'1405', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (187, N'WIkin Medina', N'1406', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (188, N'Wilber Ramon ', N'1407', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (189, N'Wilkin Medina ', N'1408', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (190, N'William Linares', N'1409', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (191, N'William Ramírez', N'1410', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (192, N'Wilson del Pozo', N'1411', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (193, N'Yahaira Lugo', N'1412', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (194, N'Yoldy Tramar', N'1413', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (195, N'Zacarias Vasquez', N'1414', 2)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (196, N'  Rafael Ogando ', N'1576', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (197, N' Brian A. Polanco', N'1594', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (198, N' Luis Miguel Liriano', N'1608', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (199, N'Abigail Gonzalez', N'1630', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (200, N'Adrian Hernandez', N'1622', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (201, N'Albaro De Peña', N'1531', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (202, N'Alexander Ortiz', N'1512', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (203, N'Alexander Paulino', N'1445', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (204, N'Alexander Urbáez', N'1432', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (205, N'Alexis Canela', N'1598', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (206, N'Alexis Sosa', N'1559', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (207, N'Alvaro Heredia', N'1541', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (208, N'Ammy Mesa', N'1463', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (209, N'Ana de Paula', N'1494', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (210, N'Angel Cuevas', N'1603', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (211, N'Angel Melendez ', N'1615', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (212, N'Anyelina Pineda ', N'1581', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (213, N'Argenis Andújar', N'1460', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (214, N'Aury Reyes', N'1515', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (215, N'Carina Rodriguez', N'1574', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (216, N'Carlos Gabriel ', N'1554', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (217, N'Carlos Gonzalez', N'1522', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (218, N'Carlos Guzmán ', N'1521', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (219, N'Carlos Solano', N'1454', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (220, N'Carlos Toribio ', N'1556', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (221, N'Celso Perez', N'1538', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (222, N'Cesar de los Santos', N'1628', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (223, N'Claudio Ventura', N'1443', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (224, N'Cristopher Caraballo  ', N'1590', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (225, N'David de la Cruz ', N'1492', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (226, N'Dionicio Toribio', N'1465', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (227, N'Domingo Hernandez', N'1537', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (228, N'Donald Santana', N'1542', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (229, N'Duglas Lara ', N'1558', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (230, N'Edwin Montaño', N'1490', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (231, N'Elías Alcántara', N'1516', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (232, N'Evelin Leon', N'1607', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (233, N'Federico Garcia', N'1525', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (234, N'Felipe Amancio', N'1600', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (235, N'Felix Alcantara', N'1508', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (236, N'Fernando Moreno', N'1468', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (237, N'Francisco Adames', N'1450', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (238, N'Francisco Ramírez', N'1425', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (239, N'Francisco Santana', N'1500', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (240, N'Franco Villanueva', N'1530', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (241, N'Freddy Abreu', N'1548', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (242, N'Freddy Bone', N'1446', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (243, N'Gilfredo Severino', N'1504', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (244, N'Guillermo Martinez', N'1429', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (245, N'Hancel Geraldino', N'1629', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (246, N'Henry Nuñez', N'1618', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (247, N'Honey Minaya', N'1452', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (248, N'Humberto Canela ', N'1547', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (249, N'Ing. Veras ', N'1506', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (250, N'Isidros Cruz ', N'1565', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (251, N'Ismael Cayó', N'1482', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (252, N'Israel Vasquez', N'1610', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (253, N'Ivan Perez ', N'1551', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (254, N'Jacinto Perez', N'1588', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (255, N'Jaeckel Miguel Liriano', N'1489', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (256, N'Jesus Bonilla ', N'1441', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (257, N'Joan Vivenes', N'1597', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (258, N'Johenry Peralta', N'1475', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (259, N'Jonathan Capellan ', N'1582', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (260, N'Jonathan Guzman', N'1451', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (261, N'Jose Moreno', N'1617', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (262, N'Jose Nuñez', N'1589', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (263, N'Jose Peña', N'1527', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (264, N'Juan Berroa', N'1487', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (265, N'Juan Castillo', N'1544', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (266, N'Juan Cubilete', N'1534', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (267, N'Juan Herrera', N'1503', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (268, N'Juan Ramon Victoria', N'1540', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (269, N'Juan Roque', N'1526', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (270, N'Juan Victoria', N'1545', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (271, N'Kaira Gomez ', N'1578', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (272, N'Karina Rodriguez', N'1449', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (273, N'Katherine Bridgewater', N'1549', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (274, N'Kelvin Polanco', N'1505', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (275, N'Keyli Febrier', N'1631', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (276, N'Licy Peña ', N'1602', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (277, N'Lisairy Pena ', N'1570', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (278, N'Luigi García', N'1532', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (279, N'Luis Cordero ', N'1609', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (280, N'Luis Lara', N'1580', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (281, N'Luis Miguel Liriano', N'1476', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (282, N'Luis Morel', N'1427', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (283, N'Luis Pinales', N'1447', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (284, N'Luis Ramon Tineo', N'1623', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (285, N'Luis Rodriguez', N'1431', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (286, N'Manolo Ramon', N'1579', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (287, N'Manuel de Dios', N'1495', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (288, N'Manuel Pena ', N'1488', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (289, N'Manuel Rivas', N'1627', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (290, N'Marcos Taveras', N'1517', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (291, N'Marggie Gonzales', N'1510', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (292, N'Martiza Olivo', N'1568', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (293, N'Melido de  la Cruz', N'1529', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (294, N'Melina Felipe', N'1470', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (295, N'Michael Smith', N'1448', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (296, N'Miguel Estevez', N'1536', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (297, N'Miguel Molina', N'1479', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (298, N'Miguel Nivar ', N'1473', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (299, N'Modesto Guillen', N'1502', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (300, N'Moises Garcie', N'1511', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (301, N'Moises Salcié', N'1462', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (302, N'Nayeli Meran ', N'1620', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (303, N'Nicolas Ramos', N'1455', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (304, N'Noriel Figuereo ', N'1509', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (305, N'Omar Basora', N'1528', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (306, N'Oniel Estevez', N'1434', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (307, N'Orlando Sosa', N'1520', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (308, N'Oscar Jimenez ', N'1577', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (309, N'Oscar Ruiz ', N'1561', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (310, N'Pablo Castillo', N'1436', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (311, N'Patri Perez', N'1478', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (312, N'Pedro Morales', N'1438', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (313, N'Pedro Xavier Reyes  ', N'1543', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (314, N'Quirobel Cuevas', N'1469', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (315, N'Ramon Vargas', N'1499', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (316, N'Ramon Acevedo ', N'1567', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (317, N'Ramon Francisco ', N'1563', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (318, N'Ramon Otáñez', N'1519', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (319, N'Ramona Perez', N'1440', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (320, N'Raymond Jiménez ', N'1428', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (321, N'Ricardo CCS', N'1466', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (322, N'Richard Mendez', N'1458', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (323, N'Richard Santana', N'1566', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (324, N'Roberto Lebrón', N'1481', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (325, N'Roman Cabrera', N'1501', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (326, N'Ruben Gomez', N'1535', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (327, N'Ruben Minier', N'1457', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (328, N'Skiferd Reyes ', N'1619', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (329, N'Starlin Alcantara ', N'1624', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (330, N'Starlin Lantigua', N'1591', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (331, N'Uvalmi parra', N'1616', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (332, N'Víctor Soriano', N'1437', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (333, N'Vladimir Diaz', N'1507', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (334, N'Vladimir Roa', N'1461', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (335, N'Vladimir Vargas', N'1513', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (336, N'Waddy Montáz', N'1555', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (337, N'Wander Fulcar', N'1572', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (338, N'Wilman Ramirez ', N'1471', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (339, N'Wilmer Pimentel', N'1595', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (340, N'Wilson Del Pozo', N'1453', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (341, N'Yajahira Lugo', N'1484', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (342, N'Yanelis Placencio', N'1497', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (343, N'Yerlin Sierra', N'1560', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (344, N'Ysidro Cruz', N'1573', 1)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (345, N'Ignacio Rios', N'3775', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (346, N'Jhonattan De La Cruz', N'1766', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (347, N'Jose antonio', N'262', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (348, N'Joel Clase', N'2522', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (349, N'Alvin Tavarez', N'751', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (350, N'Juan Marte', N'2586', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (351, N'Roberto Cerda', N'1443', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (352, N'Jefry Altides', N'784', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (353, N'Erika Rodriguez', N'3095', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (354, N'Anthony Paredes', N'1948', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (355, N'Darvin Perez', N'2641', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (356, N'Elba Reyes', N'2604', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (357, N'Suleiny CalcaÃ±', N'2566', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (358, N'Erik Jimenez', N'3164', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (359, N'Francis PeÃ±', N'1776', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (360, N'Madelin Taveras', N'2608', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (361, N'Flor Silverio', N'580', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (362, N'Anyela De La Cruz', N'2607', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (363, N'Franklin Reyes', N'725', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (364, N'Alexander Dominguez', N'478', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (365, N'Stephanie Mercedes', N'196', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (366, N'Juan Jimenez', N'791', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (367, N'Maynichi Serrano', N'621', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (368, N'Ramon Diaz', N'629', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (369, N'Estarlin Lopez', N'578', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (370, N'Julio Brito', N'2588', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (371, N'Miguel Brazoban', N'3573', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (372, N'Jesus Bonilla', N'3784', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (373, N'Mercedes Javier', N'2983', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (374, N'Angie Reynoso', N'956', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (375, N'Alberto Carrasco', N'3780', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (376, N'Karina Morel', N'2593', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (377, N'Soribel Luciano', N'2609', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (378, N'Ileana Batista', N'591', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (379, N'Judith De Los Santos', N'792', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (380, N'Pedro Sanchez', N'803', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (381, N'Jancer Castillo', N'594', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (382, N'Carolina Mateo', N'2611', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (383, N'Fraysina Fortuna', N'775', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (384, N'Geidy Reinoso', N'2529', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (385, N'Jael Prensa', N'593', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (386, N'Juan Marte', N'3585', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (387, N'Julio Hernandez', N'1788', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (388, N'Chasmir Siri', N'659', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (389, N'Natalia Vargas', N'802', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (390, N'Nicaury Diaz', N'1952', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (391, N'Leonel Escoto', N'688', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (392, N'Raysa Ferreras', N'724', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (393, N'Ramon Cerda', N'3048', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (394, N'Marggie Gonzalez', N'693', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (395, N'Edward Rivero', N'202', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (396, N'Jose Calderon', N'507', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (397, N'Abraham Santana', N'1937', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (398, N'Yineuddy PeÃ±', N'1787', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (399, N'Berky Reynoso', N'1772', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (400, N'Brian Negron', N'756', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (401, N'Cindy Torres', N'763', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (402, N'Edwin Melenciano', N'490', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (403, N'Evelyn Torres', N'158', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (404, N'Lissette Morla', N'1999', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (405, N'Geidy Marrero', N'3030', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (406, N'Anny Del Orbe', N'754', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (407, N'Edward Sosa', N'663', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (408, N'Jose Javier', N'3015', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (409, N'Milagros Grullon', N'624', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (410, N'Lorenzo Selmo', N'690', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (411, N'Fabio Acosta', N'772', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (412, N'Wascar Ynfante', N'1959', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (413, N'Johanna Duran', N'681', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (414, N'Tamilka Meran', N'638', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (415, N'Yanery Herrera', N'639', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (416, N'MiguelFernandez', N'623', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (417, N'Miguel Andujar', N'2576', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (418, N'Johanna Baez', N'1996', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (419, N'Wilmer Romero', N'809', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (420, N'Natividad Francisco', N'1986', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (421, N'Fanny Perdomo', N'497', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (422, N'Leony Monsanto', N'1203', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (423, N'Ariela Alcantara', N'717', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (424, N'Maria Gomez', N'1686', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (425, N'Suleica Restituyo', N'1958', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (426, N'Anthony Tavarez', N'1962', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (427, N'Carolina Ruiz', N'567', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (428, N'Rodolfo Aguasvivas', N'3781', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (429, N'Inyira Nathaniel', N'2513', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (430, N'Nelson Paulino', N'696', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (431, N'Yanelis Medina', N'1655', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (432, N'LuciaVentura', N'608', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (433, N'Roberto Alexis', N'726', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (434, N'Johanny Medina', N'787', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (435, N'Grecia Garcia', N'777', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (436, N'Crisary Cabrera', N'764', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (437, N'Matilde Fulgencio', N'521', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (438, N'Jose PeÃ±', N'2546', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (439, N'Hidalgo Cordero', N'1764', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (440, N'Griseli Felix', N'778', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (441, N'Andres Nunez', N'752', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (442, N'Juan Castillo', N'1768', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (443, N'Guillermo Martinez', N'3785', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (444, N'Yuneidis Gonzalez', N'646', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (445, N'Luis Mosquea', N'626', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (446, N'Angela Del Villar', N'2597', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (447, N'Johanna PeÃ±', N'786', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (448, N'Jose Santos', N'2966', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (449, N'Wellbys Feliz', N'542', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (450, N'Michael Smith', N'249', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (451, N'Yessica Perez', N'641', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (452, N'Rafael Figuereo', N'2842', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (453, N'Hector Perez', N'587', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (454, N'Yanill Hernandez', N'640', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (455, N'Yinaly Miranda', N'3187', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (456, N'Bellanirys De Oleo', N'563', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (457, N'Henry German', N'678', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (458, N'Rafael Zapata', N'380', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (459, N'Emily German', N'577', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (460, N'Gueny Marquez', N'584', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (461, N'Carlos MontaÃ±', N'758', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (462, N'Miguel Santana', N'522', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (463, N'Geronimo Encarnacion', N'807', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (464, N'Engel Rodriguez', N'2941', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (465, N'Guillermina Reyes', N'502', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (466, N'Manuel del Rosario', N'9804', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (467, N'Ramon Rondon', N'354', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (468, N'Eleazar Arias', N'2591', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (469, N'Kathering  NuÃ±e', N'2969', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (470, N'Johanna Febles', N'597', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (471, N'Magdelin Santillana', N'517', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (472, N'Begnis Gonell', N'755', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (473, N'Hector Mateo', N'1798', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (474, N'Miguel Molina', N'259', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (475, N'Robert Caba', N'806', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (476, N'Anais Feliz', N'2552', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (477, N'Pablo Marte', N'3948', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (478, N'Yajahira Lugo', N'163', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (479, N'Radycel Cuello', N'804', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (480, N'Jose Lopez', N'1940', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (481, N'Luis Cordero', N'3425', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (482, N'Ramses Vargas', N'3401', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (483, N'Edwin SusaÃ±', N'1784', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (484, N'Gissell Heredia', N'447', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (485, N'Edwin MontaÃ±', N'2955', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (486, N'Roman Cabrera', N'2815', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (487, N'Fara Baez', N'2825', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (488, N'Luis Encarnacion', N'515', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (489, N'Abel De La Rosa', N'750', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (490, N'Ronald Gomez', N'534', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (491, N'Eugenio Acosta', N'670', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (492, N'Joan Vivenes', N'721', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (493, N'Francisco Herrera', N'672', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (494, N'Ruth Roman', N'3737', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (495, N'Andris Jimenez', N'753', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (496, N'Juan Reynoso', N'870', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (497, N'Beridania Tejeda', N'653', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (498, N'Geuris Novas', N'263', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (499, N'Angela Medina', N'557', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (500, N'Ivan Garcia', N'29', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (501, N'Melisa Arias', N'2550', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (502, N'Ramon Montero', N'22', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (503, N'Edwyn Tapia', N'573', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (504, N'Carlos Leonardo', N'760', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (505, N'Glenny Batista', N'583', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (506, N'Luis Abreu', N'2523', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (507, N'Carlos Gonzalez', N'565', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (508, N'Jovanny Paulino', N'2964', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (509, N'Leny MuÃ±o', N'38', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (510, N'Solano Tejeda', N'862', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (511, N'Jose PeÃ±', N'684', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (512, N'Carlos Gomez', N'3288', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (513, N'Yudelkis Lopez', N'2541', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (514, N'Luis Mosquea', N'2166', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (515, N'Fernando Guzman', N'1988', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (516, N'Marcia Baez', N'692', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (517, N'Rachelis Diaz', N'3542', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (518, N'Griseli Felix', N'556', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (519, N'Stefany  Mota', N'709', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (520, N'Kenia Richard', N'794', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (521, N'Ivan Perez', N'782', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (522, N'Luis Estevez', N'797', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (523, N'Santa Canela', N'536', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (524, N'Francisco Tejeda', N'128', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (525, N'Matias Nina', N'875', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (526, N'Raudy Manuel Thomas', N'3067', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (527, N'Geuris Acosta', N'675', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (528, N'Brina Morillo', N'757', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (529, N'Begnis Gonell', N'7552', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (530, N'Yudelka Manzueta', N'644', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (531, N'Willy Tejeda', N'3949', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (532, N'Juan Morel', N'687', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (533, N'Laura Donastor', N'3702', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (534, N'Sarihels Peguero', N'706', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (535, N'Elvin Perez', N'9802', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (536, N'Fraysina Fortuna', N'7754', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (537, N'Victor Mojica', N'1954', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (538, N'Fausto Batista', N'3157', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (539, N'Ronny Brito', N'3098', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (540, N'Merlyn Navarro', N'622', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (541, N'Victor Trinidad', N'3731', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (542, N'Cesar Burgos', N'1602', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (543, N'Socorro Betemit', N'469', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (544, N'Gilfredo Severino', N'3782', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (545, N'Luciano Carela', N'41', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (546, N'Joan Fabian', N'734', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (547, N'Jose Santos', N'2963', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (548, N'Verania Acosta', N'2558', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (549, N'Veronica Heredia', N'808', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (550, N'Ernesto de Leon', N'770', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (551, N'Luis De La Rosa', N'2602', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (552, N'Juan Martes.', N'2585', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (553, N'Geuris Novas', N'2637', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (554, N'Marcos Gomez', N'3857', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (555, N'Liza Capellan', N'2787', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (556, N'Catalina Sanchez', N'2961', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (557, N'Rosa Cruz', N'3529', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (558, N'Fidel Estrella', N'2596', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (559, N'Lina Arias', N'2630', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (560, N'Catalina Sanchez', N'2161', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (561, N'Paulina Santos', N'3160', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (562, N'Anyela Medina', N'3578', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (563, N'Nelson Guzman', N'1271', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (564, N'Raysi MuÃ±o', N'2973', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (565, N'Rosa Liz Espinosa', N'3017', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (566, N'Scarlet Elvira', N'1992', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (567, N'Paola Rodriguez', N'3561', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (568, N'Yajahira Abreu', N'2624', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (569, N'Edwin abreu', N'3563', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (570, N'Elizabeth Polanco', N'2526', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (571, N'Christopher Castillo', N'2560', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (572, N'Carlos  Cruz', N'2715', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (573, N'Edwar Sosa', N'363', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (574, N'Catalina Sanchez', N'961', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (575, N'Jorge Joa', N'1603', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (576, N'Miosotis Reyes', N'3597', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (577, N'Claritza Cuevas', N'1957', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (578, N'Erick Martinez', N'3716', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (579, N'Yulissa Mateo', N'3643', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (580, N'Escarlet Marmolejos', N'7992', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (581, N'Angel Annel Lopez', N'3861', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (582, N'Andy Pineda', N'1157', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (583, N'Carlos Cruz', N'1715', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (584, N'Francis Mejia', N'880', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (585, N'Lissette Sanchez', N'689', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (586, N'Paula Fortunato', N'2554', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (587, N'Jose PeÃ±', N'414', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (588, N'Ricardo Polanco', N'703', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (589, N'Manuela Soriano', N'3898', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (590, N'Evan Martinez', N'671', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (591, N'Eleazar Arias', N'2511', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (592, N'Rafael Figuereo', N'2844', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (593, N'Alfonso Hernandez', N'2817', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (594, N'Dario Brito', N'4003', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (595, N'Mauricio Demorici', N'910', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (596, N'Ruben Minaya', N'137', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (597, N'Rafael Laureano', N'1579', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (598, N'Alfozo Hernandez', N'2813', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (599, N'Joan Fortuna', N'3727', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (600, N'Alejandro Ruiz', N'176', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (601, N'Juana Morel', N'602', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (602, N'Emily German', N'2578', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (603, N'Lina Arias', N'305', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (604, N'Ilianov PeÃ±', N'779', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (605, N'Raylin Alcantara', N'919', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (606, N'Juan Martinez', N'185', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (607, N'Alberto Carrasco', N'1780', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (608, N'Mauricio Reyes', N'1230', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (609, N'Maria Isabel Lopez', N'222', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (610, N'Edward Encarnacion', N'662', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (611, N'Alfonso Hernandez', N'2617', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (612, N'Edwin  Paniagua', N'40', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (613, N'Miguel Puntiel', N'1943', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (614, N'Maris Leydis', N'3237', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (615, N'Alfonso Hernandez', N'12', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (616, N'Eddy Rodriguez', N'767', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (617, N'Werki Rivas', N'268', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (618, N'Rafael Veloz', N'1805', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (619, N'Pamela Roque', N'3133', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (620, N'Liza Capellan', N'1689', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (621, N'Alberto Carrasco', N'2780', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (622, N'Dawlin Rosado', N'207', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (623, N'Pamela Duran', N'187', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (624, N'Milagros de Paula', N'3743', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (625, N'Jean Robert Chaubadindeguy', N'10', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (626, N'Pedro Morales', N'3336', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (627, N'Evelin NuÃ±e', N'1875', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (628, N'Diogenes de la Cruz', N'3997', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (629, N'Kelvin Polanco', N'286', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (630, N'Matias nina', N'1202', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (631, N'Edgar Coste', N'4191', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (632, N'Jose Manuel PeÃ±', N'3023', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (633, N'Marco Taveras', N'1822', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (634, N'Anuelis Rijo', N'974', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (635, N'Esther Uben Vidal', N'2571', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (636, N'Fernando Antonio Lara Sanchez', N'579', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (637, N'Kenwa Silverio', N'3579', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (638, N'Luis Encarnacion', N'938', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (639, N'Yajahira Lugo', N'1635', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (640, N'Grecia Garcia', N'7777', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (641, N'David Gonzalez', N'766', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (642, N'Misael Enrique Salcedo Gonzalez', N'3568', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (643, N'Gabriela Perez', N'1984', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (644, N'Ruth Ydalia Vasquez', N'3735', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (645, N'Genesis De La Cruz Ramirez', N'2980', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (646, N'Andreina Rochel Reyes Heredia', N'475', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (647, N'Yadira Toribio', N'1918', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (648, N'Digna Almonte', N'1675', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (649, N'Marcia Marcolina', N'592', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (650, N'Nathali Caroline Peguero Cabrera', N'3520', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (651, N'Hectar Andia Gonzalez Sanchez', N'3007', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (652, N'Chesare Cabrera Roque', N'3551', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (653, N'Bernardo Alejandro Aquino', N'3709', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (654, N'Victor Mojica', N'1904', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (655, N'Anyelissa Paredes Cordero', N'1946', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (656, N'Johanna Febles', N'529', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (657, N'Keyla Arisleyda Polanco Ortiz', N'2922', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (658, N'Edison Ysmael Calderon Feliz', N'2958', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (659, N'Nicol M. Luciano De Los Santos', N'3730', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (660, N'Camilo Benitez', N'654', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (661, N'Cesarina Smil Montero Perez', N'2600', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (662, N'Carlos Baez', N'2528', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (663, N'Miosotis  Solano Herrera', N'3519', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (664, N'Fausto Bautista', N'2157', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (665, N'Fabio Espinal', N'914', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (666, N'Carolay y. Aguasvivas Rodriguez', N'3757', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (667, N'Arabelly Aquino Garcia', N'1771', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (668, N'Paloma Reyes Vizcaino', N'1936', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (669, N'Teresa Mercedes Sanchez Perez', N'2639', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (670, N'Ambi Dario Casanova M.', N'3576', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (671, N'Ruth Vasquez', N'735', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (672, N'Elizabeth Cruz', N'1362', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (673, N'Jenifer Sabala', N'2992', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (674, N'Mario Emilio Estrella Rodriguez', N'2645', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (675, N'Nazaret E. Tineo', N'3080', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (676, N'Mario Estrella', N'2535', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (677, N'Maria Isabel Feliz Feliz', N'2698', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (678, N'Domingo Hernandez', N'2670', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (679, N'Verusca R, PeÃ±a Dote', N'3029', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (680, N'Edward Cruz', N'179', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (681, N'Elizabeth Paulino Henriquez', N'491', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (682, N'Diana Eliza Ramon Moquete', N'3756', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (683, N'Mario Estella', N'3645', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (684, N'Danissel Martinez', N'3117', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (685, N'Orlando Sosa', N'973', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (686, N'Rosa Maria Rojas Kelly', N'3902', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (687, N'Ingrid Silver', N'505', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (688, N'Leonarda Abreu', N'3079', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (689, N'Yurielis Pichardo', N'2003', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (690, N'Carmen Maziel Perez Beltre', N'2965', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (691, N'Genesis de la Cruz', N'1980', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (692, N'Adalberto Castillo Castillo', N'647', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (693, N'VIctor de la Cruz', N'396', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (694, N'Pedro Navarro', N'6301', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (695, N'Alejandro Hansen', N'4310', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (696, N'Kendy Cruz', N'3661', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (697, N'Jose Rodriguez', N'3718', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (698, N'Jorge Medina', N'217', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (699, N'Jean Alcantara', N'2561', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (700, N'Perla Mota', N'239', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (701, N'Yessica Perez', N'492', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (702, N'Adri Aracena', N'548', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (703, N'Maynichi Serrano', N'2521', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (704, N'Angel Lopez', N'2861', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (705, N'Olga Vasiliou Mendez', N'526', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (706, N'Ana Estevez', N'473', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (707, N'Caridad Lisette', N'3725', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (708, N'Fraysina Fortuna', N'7756', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (709, N'Edwin Bobes', N'373', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (710, N'Fernando Soriano', N'205', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (711, N'Socorro Betemit', N'459', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (712, N'Nestor Ramirez', N'4477', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (713, N'Amada NuÃ±e', N'3773', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (714, N'Jose Trinidad', N'4533', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (715, N'Joaquin Tineo', N'1143', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (716, N'Stephanie Mercedes', N'1968', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (717, N'Wendy Deyanira Rojas Rosario', N'712', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (718, N'Gregorio Batista', N'134', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (719, N'Joe Reynoso', N'860', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (720, N'Enmanuel Decamps', N'1840', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (721, N'Solano Tejeda', N'8622', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (722, N'Jose Acosta', N'4542', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (723, N'Jose PeÃ±', N'4014', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (724, N'Alexandra P. Estevez Perez', N'551', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (725, N'Osvaldo  Castillo', N'2814', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (726, N'Israel Castillo', N'1366', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (727, N'Jean Luis Alcantara', N'2661', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (728, N'Erick Augusto', N'3593', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (729, N'Raysa Hernandez', N'3883', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (730, N'Sajaira Jimenez', N'1765', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (731, N'Lorenzo Telmo', N'2501', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (732, N'Jose antonio', N'2622', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (733, N'Joan Peguero', N'4060', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (734, N'Nelson Paulino', N'969', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (735, N'Joel Feliz', N'680', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (736, N'Madeline santillana', N'971', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (737, N'Kismerca Cabrera', N'3940', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (738, N'Jorge Perez', N'2935', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (739, N'Brina Morillo', N'1222', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (740, N'Asbel Santana', N'3779', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (741, N'Carmen Batista', N'1674', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (742, N'Maria Hernandez', N'1934', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (743, N'Tayre Valerio', N'2981', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (744, N'Ruben Minaya', N'136', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (745, N'Stephanie Mercedes', N'1966', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (746, N'Yanira E. Marte', N'3581', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (747, N'Belquis Moreno', N'1767', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (748, N'Angel Annel Lopez', N'3582', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (749, N'Dauris Rosario', N'4515', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (750, N'Sandra de la Rosa', N'2710', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (751, N'Diana Henriquez', N'3521', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (752, N'Ana Cabral', N'1606', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (753, N'Angel Annel Lopez', N'3851', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (754, N'Rosanna Soto', N'2540', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (755, N'Deyvi Encarnacion', N'911', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (756, N'Jose Perez', N'3458', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (757, N'Juan De La Cruz', N'4367', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (758, N'Raymond Espinal', N'2929', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (759, N'Emilia Marte', N'494', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (760, N'Franck Moreno', N'3667', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (761, N'Rafael Peralta', N'4372', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (762, N'Emely Bautista', N'665', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (763, N'Virgilio Mejia', N'4182', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (764, N'Jose Herrera', N'4369', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (765, N'Stephanie Mercedes', N'1961', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (766, N'Ruben dario vicente', N'799', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (767, N'Edgar Ruiz', N'4569', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (768, N'Daniel Bello', N'210', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (769, N'Anthony  Sierra Veloz', N'3168', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (770, N'Geidy Reinoso', N'25299', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (771, N'Cesarina Chalas', N'284', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (772, N'Francisco Ramirez', N'192', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (773, N'Ariela Alcantara', N'171', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (774, N'Yanill Hernandez', N'1187', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (775, N'Marco de la Rosa', N'4370', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (776, N'Tania Rodriguez', N'1605', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (777, N'Leonidas Lopez', N'442', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (778, N'Diana Henriquez', N'3523', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (779, N'Johanny Medina', N'771', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (780, N'Johanny Gautier', N'326', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (781, N'Maria Jimenez', N'2705', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (782, N'Reinaldo Espinal', N'728', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (783, N'Rosa Amada', N'906', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (784, N'Julio Cesar', N'1119', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (785, N'Carmen Cruz', N'4065', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (786, N'Stephanie Mercedes', N'1967', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (787, N'Cristiba Veltre', N'3772', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (788, N'Daneuris Gomez', N'43', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (789, N'Luceila Brito', N'2951', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (790, N'Marcos Gomez', N'6857', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (791, N'Elias Alcantara', N'4661', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (792, N'Juan Morel', N'607', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (793, N'Kirsis de Dios', N'3610', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (794, N'Luis Ramirez', N'4368', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (795, N'Michael de la Cruz', N'4655', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (796, N'Paloma Reyes Vizcaino', N'686', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (797, N'Liza Capellan', N'525', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (798, N'Carlos Paulino', N'4690', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (799, N'Yselsa Nolasco', N'2957', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (800, N'Miguel Molina', N'2592', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (801, N'Pedro Morales', N'2336', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (802, N'Natividad Francisco', N'745', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (803, N'Oscar Jimenez', N'4776', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (804, N'Jose Ovalles', N'4686', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (805, N'Misael Lorenzo', N'4709', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (806, N'Laura Figueroa', N'3032', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (807, N'Socorro Betemit', N'3555', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (808, N'Eudis Vidal', N'669', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (809, N'Juan Salcedo', N'434', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (810, N'Rafael Laureano', N'1576', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (811, N'Andreina Reyes', N'465', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (812, N'Yoel Vizcaino', N'4689', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (813, N'Howar Jaruzelski  Batista Feliz', N'2568', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (814, N'Altagracia  Quiroz De Leon', N'1998', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (815, N'Garibaldy Antonio PeÃ±a Abre', N'3571', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (816, N'Juan Alberto Jimenez Ogando', N'3700', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (817, N'Kirsy Graciosa De Los Santos', N'4128', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (818, N'Emmanuel  Puello Medrano', N'4077', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (819, N'Miguel Antonio Ramos Moya', N'1979', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (820, N'Divina Martinez Rijo', N'3973', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (821, N'Rosanna Fulgencio Hernandez', N'3040', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (822, N'Icaurys Evelina Estevez Rodriguez', N'3575', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (823, N'Victor Diaz', N'2808', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (824, N'Jhonfi Adames', N'4680', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (825, N'Jose Perez', N'4775', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (826, N'lisbehtr santana', N'2856', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (827, N'Katherine  NuÃ±e', N'793', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (828, N'Toni Rosario', N'3004', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (829, N'Andreina Reyes', N'980', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (830, N'Rafael Ogando', N'891', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (831, N'Judith Laureano', N'2689', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (832, N'Genesis De La Cruz Ramirez', N'2756', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (833, N'Luis Lopez', N'4706', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (834, N'Melquicedec Vasquez', N'104', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (835, N'Laura Hernandez', N'3552', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (836, N'Juan Tavarez', N'1360', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (837, N'Paula Fortunato', N'254', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (838, N'Marcos Gomez', N'1922', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (839, N'Juan Roque ', N'ST611', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (840, N'Ranulfo Duran ', N'ST365', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (841, N'Daniel Dereurs', N'ST364', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (842, N'Victor Santos', N'ST359', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (843, N'Wilkin Rivas', N'ST268', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (844, N'Ronny Aguasvivas', N'ST214', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (845, N'Jerson Romero ', N'ST20', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (846, N'Ramon Herrera', N'ST195', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (847, N'Gregorio Batista', N'ST134', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (848, N'Francisco Ramirez', N'ST125', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (849, N'Arleni Cabrera ', N'ST09300', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (850, N' Wilkin Florentino     ', N'ST04', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (851, N'Napoleon Lorenzo', N'ST035', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (852, N'Miguel Tineo', N'ST032', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (853, N'Anmy Mesa', N'ST0319', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (854, N'Evelin Torres     ', N'ST0158', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (855, N'Wilmer Pimentel', N'ST0111', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (856, N'Alexander Feliz', N'ST0096', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (857, N'Ivan Garcia', N'ST0029', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (858, N'Luis Morel ', N'ST001', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (859, N'Ammi Mesa', N'ST000', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (860, N'Alexander Paulino ', N'ST00', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (861, N'Gregorio Batista ', N'ST0', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (862, N'Reynaldo Maldonado', N'ST 7', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (863, N'Abel acevedo', N'ST 215', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (864, N'Oscar Ruiz ', N'ST 001', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (865, N'Alexander Paulino', N'ST', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (866, N'Joerick F. Almonte Artiles', N'SI00', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (867, N'Napoleon Lorenzo', N'MR0035', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (868, N'Ruben Vicente', N'EX0799', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (869, N'Honey Minaya     ', N'EX0068', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (870, N'Skifferd Reyes', N'EX0053', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (871, N'Junior Rodriguez', N'EX0041', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (872, N'Pablo Castillo', N'EX0032', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (873, N'Honney Minaya ', N'EX002', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (874, N' Manuel Encarnacion    ', N'EX0016', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (875, N'Deivi Belon', N'EX0014', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (876, N' Oniel Estevez    ', N'EX00', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (877, N'Kelvin Mateo', N'EX0', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (878, N'Mayor Ventura', N'CESMET', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (879, N' Arlenis Cabrera    ', N'ALS01', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (880, N'Andy Pineda', N'417537', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (881, N'Camilo Benitez', N'8788', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (882, N'Elena Jimenez', N'7227', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (883, N'Yomairy Cabrera', N'6425', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (884, N'Angel Melendez   ', N'6140', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (885, N'Oneiris Lora ', N'6127', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (886, N' Felipe  Amancio   ', N'6015', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (887, N'Cesar de los Santos', N'5835', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (888, N'Anyelo Santana ', N'5744', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (889, N'Maria del Carmen ', N'5735', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (890, N'Endelis De Jesus', N'5464', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (891, N'Cesar Garcia', N'5442', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (892, N'Jeniffer Noesi', N'5430', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (893, N'Eloy Duarte', N'5416', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (894, N'Melina Felipe  ', N'5414', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (895, N'Diana Cierra ', N'5406', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (896, N'Roberto Hodge', N'5403', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (897, N'Dahiana Sanchez    ', N'5380', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (898, N'Carlos Gutierrez', N'5294', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (899, N'Ruth Reyes ', N'5281', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (900, N'Mirna Lopez     ', N'5278', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (901, N'Darvin Feliz', N'5274', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (902, N'Marlen Vasquez', N'5272', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (903, N'Sofia Lantigua', N'5250', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (904, N' Leonardo    Monegro ', N'5238', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (905, N'  Ronny Castillo', N'5175', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (906, N'Rosa Aquino', N'5174', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (907, N'Laura Sanchez', N'5173', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (908, N'Ismael Garcia', N'5170', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (909, N' Rosmery Ramirez    ', N'5163', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (910, N'Marcos Belliar', N'5151', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (911, N'Madelin Diaz', N'5144', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (912, N'Ivan Calderon', N'5137', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (913, N'Carmen Mosquea ', N'5128', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (914, N'Jorge Esteffany', N'5124', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (915, N'Jonalbel la antigua     ', N'5123', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (916, N'Jacinto Perez  ', N'5090', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (917, N'Roselys Fortunato ', N'5081', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (918, N'Perla Hiciano', N'5047', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (919, N'Carmen Goris', N'5029', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (920, N'Lisarry Jaquez', N'5010', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (921, N'Grabriela Kilguer ', N'4998', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (922, N' Rafael Beltre', N'4907', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (923, N'Pedro Xavier Reyes ', N'4820', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (924, N'Yuliana Manzueta', N'4797', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (925, N'Wilson garcia', N'4796', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (926, N'Onervis Mateo', N'4795', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (927, N'Katherine Gonzalez', N'4794', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (928, N'cristian candelario', N'4792', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (929, N'Angel Almanzar', N'4790', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (930, N'joan rondon', N'4774', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (931, N'Elias Estrella', N'4772', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (932, N'Daniela German ', N'4759', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (933, N'Andreina Rochel Reyes Heredia', N'4757', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (934, N'Rubby Vasquez', N'4738', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (935, N'Socorro Betemit', N'4691', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (936, N'Jhonfi Adames   ', N'4680', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (937, N'Juan De La Cruz', N'4667', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (938, N'Claudia Sanchez', N'4621', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (939, N'Claudia Torres', N'4590', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (940, N'Lucero Martinez', N'4583', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (941, N'Raisa Rosario', N'4581', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (942, N'Rosa Guzman', N'4557', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (943, N'Ramon Montero', N'4535', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (944, N'Niky Bautista', N'4529', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (945, N'Cristian Puello', N'4475', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (946, N'Maicol Luna', N'4471', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (947, N'Ismael peralta', N'4366', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (948, N' Vannesa Melo', N'4339', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (949, N'Agrispina de los Santos', N'4325', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (950, N'Esmerlin Rodriguez', N'4324', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (951, N'Katherine Grullon ', N'4322', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (952, N'Rosanna Rodriguez', N'4239', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (953, N'Angela Crespo', N'4235', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (954, N'Ana Infante', N'4222', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (955, N'  Francisco Moserrati   ', N'4202', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (956, N'Ruth Puello', N'4161', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (957, N'Luz Medina', N'4155', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (958, N'Ruth Puello', N'4146', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (959, N'Ruth Puello   ', N'4143', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (960, N'Lucenny de la Cruz', N'4120', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (961, N'Anthony Santiago', N'4088', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (962, N'Geraldine Tejeda', N'4079', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (963, N'Yeimy Perez', N'4069', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (964, N'Donaida Acosta', N'4068', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (965, N'Olivia Cedano', N'3967', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (966, N'Oscar Cuevas', N'3956', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (967, N'Angel Cuevas', N'3950', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (968, N'leydy vasquez', N'3935', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (969, N'Gricel Garcia Messina     ', N'3901', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (970, N'Yohaira Guzman', N'3820', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (971, N'Lenny Acosta', N'3766', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (972, N'Gilfredo Severino', N'3732', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (973, N'Cruz Reyes', N'3717', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (974, N'Bernardo Alejandro Aquino   ', N'3709', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (975, N'Maribel Ruiz', N'3653', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (976, N'Roselin Baez', N'3646', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (977, N'Yanira E. Marte   ', N'3581', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (978, N'Chistoper Castillo', N'3560', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (979, N'Carolay Yasmin Aguasvivas Rodriguez', N'3557', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (980, N'Sheila Danisa Casado', N'3550', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (981, N'Eric Martinez', N'3516', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (982, N'Bernardo Aquino', N'3509', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (983, N'Belkis martes', N'3195', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (984, N'Annety Pena', N'3189', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (985, N'Heidon Matos', N'3156', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (986, N'Marlene Casimiro ', N'3138', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (987, N'Gabriela Soto', N'3072', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (988, N'Cheressade de la Cruz', N'3071', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (989, N'Rossanna Maria de Vargas', N'3010', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (990, N'Luis Gonzalez', N'3008', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (991, N'Victor Mojica', N'2954', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (992, N'Fanny Perdomo', N'2939', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (993, N'Antonio Fiis', N'2934', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (994, N'Rady Reyes', N'2897', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (995, N'Rolfy Hernandez', N'2888', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (996, N'Jose Manuel', N'2826', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (997, N'Rafael Ogando', N'2810', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (998, N'Alfonso Hernandez', N'2807', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (999, N'Jose Martinez', N'2790', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1000, N'Juana Mercedes Cabreja', N'2748', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1001, N'Juana Gonzalez', N'2747', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1002, N'Kelvin Borterbe', N'2704', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1003, N'Maria Gomez     ', N'2686', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1004, N'Rafael Baez   ', N'2615', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1005, N'Diogenny  Herrera', N'2589', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1006, N' Junior Linares ', N'2565', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1007, N'Yeimi Lopez', N'2530', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1008, N'Eva Peralta', N'2012', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1009, N'Juan Castillo', N'1939', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1010, N'Julio Cesar Acevedo', N'1841', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1011, N'Desire de la Cruz', N'1794', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1012, N'Damarys Mateo', N'1743', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1013, N'Rosi Arbelo', N'1734', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1014, N'Maria Isabel', N'1698', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1015, N'Gabriela Perez', N'1684', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1016, N'Yajaira abreu', N'1626', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1017, N'Marcelo Rodriguez ', N'1588', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1018, N'Erica Rodriguez', N'1395', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1019, N'Jose Herrera', N'1307', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1020, N'Orlando Sosa', N'1305', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1021, N'Hernesto de Leon ', N'1226', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1022, N' David Gonzalez   ', N'1224', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1023, N'Zoila Beltres', N'1218', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1024, N'Yaneli Herrera', N'1188', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1025, N'Juan Morel     ', N'1120', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1026, N'Merlyn Navarro', N'1117', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1027, N'Mauricio De Morici', N'1115', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1028, N'Starling Lopez     ', N'1103', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1029, N'Carolina Ruiz', N'1101', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1030, N'Carlos Gonzales', N'1100', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1031, N'Michael Smith', N'1060', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1032, N'Altagracia Kiros', N'998', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1033, N'Ana Stevez ', N'991', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1034, N' Richard Sosa', N'986', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1035, N'Edwin Melenciano', N'981', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1036, N'Casilda Rodriguez ', N'960', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1037, N'Elizabeth Paulino', N'958', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1038, N'Ileana Batista', N'951', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1039, N'Welvis Feliz', N'935', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1040, N'Camilo Benitez', N'888', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1041, N'Jose Antonio', N'887', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1042, N'Sonia Campusano', N'882', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1043, N'Carolina Ruiz ', N'801', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1044, N'Ramon  vargas', N'796', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1045, N'Jefrie Altivez ', N'785', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1046, N'Ariela Alcantara', N'716', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1047, N'Luis Encarnacion', N'715', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1048, N'Yamel Batista', N'714', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1049, N'Cristian Garcia', N'660', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1050, N'Itzel Mejia', N'652', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1051, N' Geury Nova    ', N'647', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1052, N'Adalberto Castillo Castillo', N'645', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1053, N'Yomairy Cabrera', N'642', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1054, N'Carlos Leonardo', N'635', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1055, N'Ivan Perez ', N'631', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1056, N'wilmer pimentel', N'608', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1057, N'Geidy Vasquez', N'572', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1058, N'Jhonarvert Antigua', N'523', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1059, N'Ileana Batista', N'498', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1060, N'Marxlenin Hernandez', N'489', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1061, N'Glennys Batista', N'487', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1062, N'Adry Aracena', N'479', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1063, N'Jhoanna Febles', N'467', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1064, N'Guenny Marquez ', N'461', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1065, N'Johanny Gautier', N'450', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1066, N'Leonidas Lopez', N'443', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1067, N'Leonidas Lopez     ', N'442', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1068, N'Daritza Rosario', N'416', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1069, N'Victor soriano', N'387', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1070, N'Victor Santos', N'359', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1071, N'Laura Henrriquez ', N'358', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1072, N'Juan Herrera', N'356', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1073, N'Kevin Peralta', N'349', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1074, N'Teresita Vazquez', N'320', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1075, N'Ammi Mesa     ', N'319', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1076, N'Jovanny Ramirez', N'299', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1077, N'Alexander Paulino', N'288', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1078, N'Kelvin Polanco', N'286', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1079, N'Edit Garcia', N'283', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1080, N'Ariel Rodriguez     ', N'269', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1081, N'Carlos Acebedo', N'265', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1082, N'Elba Reyes', N'260', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1083, N'  Miguel Molina', N'259', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1084, N'Jose Basora ', N'255', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1085, N'honey Minaya', N'255', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1086, N'Esther Beato', N'215', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1087, N'Francisco Ramirez', N'192', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1088, N'Jose de Jesus', N'152', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1089, N'Fernando Lara', N'147', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1090, N'Jose Basora ', N'133', 3)
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1092, N'Roal Gomez', N'1245', 3)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Reportes] ON 

INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 1, 4, 1234, 5, N'', CAST(N'2022-11-17T20:01:00.000' AS DateTime), N'Pedro Xavier', CAST(N'2022-11-17T20:02:00.000' AS DateTime), CAST(N'2022-11-17T20:02:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (2, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 2, 4, 1234, 2, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (3, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 1, 4, 1234, 6, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (4, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T17:50:00.000' AS DateTime), 1, 4, 1234, 4, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'4796', 1, N'4796', N'Wilson Garcia', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (5, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T17:54:00.000' AS DateTime), 1, 4, 1234, 6, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'4796', 1, N'4796', N'Wilson Garcia', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (6, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T17:50:00.000' AS DateTime), 1, 4, 1234, 7, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (7, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T17:50:00.000' AS DateTime), 1, 4, 1234, 7, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (8, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T18:18:00.000' AS DateTime), 1, 4, 1234, 7, N'', CAST(N'2022-11-18T18:45:00.000' AS DateTime), N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'4796', 1, N'4796', N'Wilson Garcia', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (9, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-17T18:07:00.000' AS DateTime), 1, 4, 1234, 7, N'', CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'Pedro Xavier', CAST(N'2022-11-17T19:56:00.000' AS DateTime), CAST(N'2022-11-17T19:56:00.000' AS DateTime), 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (10, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-18T21:35:00.000' AS DateTime), 1, 4, 2332, 7, N'', CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'Pedro Xavier', CAST(N'2022-11-17T19:56:00.000' AS DateTime), CAST(N'2022-11-17T19:56:00.000' AS DateTime), 1, N'isidro', N'', 1, N'4796', N'', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1010, 1, N'Acceso', 10, N'Wilson Garcia', N'GAT 01, no valida.', CAST(N'2022-11-22T16:26:00.000' AS DateTime), 1, 4, 0, 3, N'', CAST(N'2022-11-22T16:26:00.000' AS DateTime), N'Pedro Xavier', NULL, NULL, 1, N'', N'', 1, N'4796', N'', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1011, 1, N'Acceso', 10, N'Wilson Garcia', N'GAT 01, no valida.', CAST(N'2022-11-22T16:26:00.000' AS DateTime), 2, 4, 123456, 1, N'', CAST(N'2022-11-22T16:26:00.000' AS DateTime), N'', NULL, NULL, 1, N'', N'', 1, N'4796', N'', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1012, 5, N'Mezzanine', 3, N'Wilson Garcia', N'1 Lampara no enciende', CAST(N'2022-11-22T16:38:00.000' AS DateTime), 1, 4, 0, 5, N'', NULL, N'Katherine Brigewater', NULL, NULL, 1, N'', N'', 1, N'4796', N'sss', 2, 4)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1013, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 1, 4, 6767, 3, N'', NULL, N'Katherine Brigewater', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'', 1, N'4796', N'', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1014, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 1, 4, 6767, 7, N'', NULL, N'Katherine Brigewater', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'', NULL, N'4796', N'', 1, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1015, 50, N'Baños', 1, N'Wilson Garcia', N'pileta tapada', CAST(N'2022-11-23T19:23:00.000' AS DateTime), 1, 4, 2, 5, N'', CAST(N'2022-11-23T19:24:00.000' AS DateTime), N'Melina Felipe', NULL, NULL, 1, N'isidro', N'Wilson Garcia', 1, N'4796', N'4796', 6, 2)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (2015, 90, N'Anden 1', 9, N'Wilson Garcia', N'GAT 05 fuera de servicio.', CAST(N'2022-12-03T17:08:00.000' AS DateTime), 1, 4, 0, 8, N'', NULL, N'', NULL, NULL, 1, N'', N'', NULL, N'4796', N'', 10, 5)
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (2016, 21, N'CCI', 10, N'Yuliana manzueta', N'CCTV fuera de servicio', CAST(N'2022-12-03T17:11:00.000' AS DateTime), 1, 4, 21474836473333332, 3, N'', CAST(N'2022-12-03T17:12:00.000' AS DateTime), N'Katherine Brigewater', NULL, NULL, 1, N'', N'', 1, N'4797', N'', 4, 5)
SET IDENTITY_INSERT [dbo].[Reportes] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (1, N'administrador')
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (2, N'vendedor')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sistema] ON 

INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (1, N'Sistemas Auxiliares')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (2, N'Cable')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (3, N'Refrigeracion')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (4, N'Telecomunicaciones')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (5, N'Equipos de Taller')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (6, N'Mantenimiento Civil')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (7, N'Seguridad Contra Incendios')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (8, N'Señalizacion')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (9, N'Suministro Servicio Electrico')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (10, N'Control y Venta de Titulos')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (11, N'Trenes')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (12, N'Transporte Vertical')
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (13, N'Vias Ferreas')
SET IDENTITY_INSERT [dbo].[Sistema] OFF
GO
SET IDENTITY_INSERT [dbo].[SM] ON 

INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (4, N'Maximo              ')
INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (5, N'APK                 ')
INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (10, N'Gesin               ')
SET IDENTITY_INSERT [dbo].[SM] OFF
GO
SET IDENTITY_INSERT [dbo].[Subsistema] ON 

INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (1, N'Bombeo de Agua - CCS', 1, 1)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (2, N'Bombeo de Agua Fecales - CCS', 1, 1)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (4, N'Bombeo de Agua - OPRET', 1, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (5, N'Bombeo de Agua Fecales - OPRET', 1, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (6, N'Aires Acondicionados - LIRIANO', 3, 3)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (7, N'Ventilacion - LIRIANO', 3, 3)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (8, N'Aires Acondicionados - OPRET', 3, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (9, N'Ventilacion - OPRET', 3, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (11, N'Aires Acondicionados - VEGAZO', 3, 4)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (12, N'Ventilacion - VEGAZO', 3, 4)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (14, N'Telefonia', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (15, N'Anti Intrusion', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (16, N'Radio Tetra', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (17, N'Interfonia', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (18, N'Megafonia', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (19, N'Scada', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (20, N'Cronometria', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (21, N'CCTV', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (22, N'Control de Presencia', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (23, N'Red de Comunicaciones', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (24, N'Red Ethernet de Estacion', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (25, N'Red de Otros Sistemas', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (26, N'Equipamento Cuarto COM', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (27, N'Videowalls y otros Equipos del PMC', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (28, N'Centro de servidores', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (29, N'Platoforma Logica', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (30, N'Control de Acceso', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (31, N'ATS-SCADA', 4, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (32, N'Torso de Foso', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (33, N'Torno Horizontal', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (34, N'Prensa de Calr Ejes', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (35, N'Vehiculos Auxiliares', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (36, N'Otros Equipos de Taller', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (37, N'Utiles y Herramientas', 5, 6)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (42, N'Otros Equipos de Taller', 5, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (43, N'Utiles y Herramientas', 5, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (44, N'Puentes', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (45, N'Tunel y Estructura Soterradas', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (47, N'Estructuras - Elevado', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (48, N'Estructuras - Edificios', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (49, N'Albañileria', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (50, N'Plomeria', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (51, N'Cerrajeria', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (52, N'Cristaleria', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (53, N'Pintura', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (54, N'Carpinteria', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (55, N'Control de Plagas', 6, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (56, N'DCI', 7, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (57, N'PCI', 7, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (59, N'Extintores', 7, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (60, N'Motores de agujas - SIEMENS', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (61, N'Contadores de Ejes - SIEMENS', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (63, N'Señales - SIEMENS', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (64, N'Enclavamiento', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (65, N'Plataforma Logica', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (66, N'Baliza', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (67, N'Elementos de Tecnologia VICOS', 8, 8)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (68, N'Motores de agujas - THALES', 8, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (69, N'Contadores de Ejes - THALES', 8, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (70, N'Señales - THALES', 8, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (71, N'SEAs', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (72, N'Nave Emergencia - EXERGIA', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (73, N'Baja Tension - EXERGIA', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (74, N'Puesta a Tierra -EXERGIA', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (75, N'Pararrayos', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (76, N'Otros Suministro Energia - EXERGIA', 9, 9)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (77, N'Catenaria', 9, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (78, N'CTs', 9, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (79, N'Anillo MT', 9, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (80, N'SETs', 9, 7)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (81, N'Baja Tension - OPRET', 9, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (82, N'Puesta Tierra - OPRET', 9, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (83, N'Nave Emergencia - OPRET', 9, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (84, N'Otros de Suministro Energia - OPRET', 9, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (85, N'Nave Emergencia -SERVINCA', 9, 10)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (86, N'Otros de Suministro Energia - SERVINCA', 9, 10)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (87, N'POST', 10, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (88, N'Centro de Servidores', 10, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (89, N'Plataforma Logica', 10, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (90, N'Puntos de Control de Peaje', 10, 5)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (91, N'Ascensores', 12, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (92, N'Escaleras', 12, 2)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (93, N'Carril', 13, 11)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (97, N'ADV', 13, 11)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (98, N'Toperas', 13, 11)
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (99, N'Engrase', 13, 11)
SET IDENTITY_INSERT [dbo].[Subsistema] OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 

INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (1, N'Cuarto BT')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (2, N'Cuarto AT')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (3, N'AT/BT')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (4, N'Mezzanine')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (5, N'Vestibulo')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (6, N'Anden 1')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (7, N'Anden 2')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (8, N'Acceso')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (9, N'Boleteria')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (10, N'CCI')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (11, N'Baños')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (12, N'Cuarto Disponible')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (13, N'TIM')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (14, N'Nave de Generacion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (15, N'Exterior')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (16, N'Cuarto COM')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (17, N'Cuarto de Enclavamiento')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (18, N'Exterior')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (19, N'Almacen')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (20, N'Area de baños')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (21, N'Aula de formacion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (22, N'Edf. Auxiliar')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (23, N'Cuarto de Maquinas')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (24, N'Cabina de anden')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (25, N'Cuarto de Conductores')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (26, N'Cabina POMA')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (27, N'Cuarto Electrico')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (28, N'Parqueo')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (29, N'Garita')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (30, N'Cancha OPRET')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (31, N'Cuarto de Compresores')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (32, N'Cuarto de Bombeo fecal')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (33, N'Cuarto de Objetos Perdidos')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (34, N'Cuarto de Conserjeria')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (35, N'Sala PMC')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (36, N'CGI')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (37, N'Cocina')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (38, N'Galeria Comercial')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (39, N'Deposito')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (40, N'Carnetizacion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (41, N'Interestacion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (42, N'Linea 1')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (43, N'Linea 2')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (44, N'Linea 2B')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (45, N'Material Movil')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (46, N'Museo')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (47, N'Oficinas')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (48, N'Paso Peatonal L1-L2')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (49, N'Transfer')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (50, N'Playa de via')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (51, N'Via')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (52, N'Puesto de Mantenimiento')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (53, N'Recepcion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (54, N'Salida de emergencia')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (55, N'Salon de Reunion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (56, N'Sotano')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (57, N'Subestacion')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (58, N'SEA')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (59, N'SET')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (60, N'Teleferico')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (61, N'Tunel')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (62, N'Via de Prueba')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (63, N'Zona de abordaje')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (64, N'Patio')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (65, N'Patinillo')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (66, N'Oficinas Administravas')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (67, N'Cuarto de los Responsables')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (68, N'Cuarto de Seguridad CESMET')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (69, N'Fosa de via')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (70, N'Comedor')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (71, N'Azotea')
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (72, N'Paso Peatonal L2B-TSD')
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Codigo], [UserName], [Password], [IdRol], [Fecha]) VALUES (1, N'Wilson         ', N'Garcia              ', N'4796', N'wgarcia   ', N'12345', 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Codigo], [UserName], [Password], [IdRol], [Fecha]) VALUES (6, N'Yuliana        ', N'Manzueta            ', N'4794', N'Ymazueta  ', N'12345', 2, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Codigo], [UserName], [Password], [IdRol], [Fecha]) VALUES (7, N'Ayesha', N'Montero', N'3951', N'amontero', N'12345', 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Activos]  WITH CHECK ADD  CONSTRAINT [FK_DescripcionSelect_Subsistema] FOREIGN KEY([Idsubsistema])
REFERENCES [dbo].[Subsistema] ([Id])
GO
ALTER TABLE [dbo].[Activos] CHECK CONSTRAINT [FK_DescripcionSelect_Subsistema]
GO
ALTER TABLE [dbo].[Config_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Config_Usuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Config_Usuario] CHECK CONSTRAINT [FK_Config_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Funcion] FOREIGN KEY([IdFuncion])
REFERENCES [dbo].[Funcion] ([Id])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Funcion]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Criticidad] FOREIGN KEY([IdCriticidad])
REFERENCES [dbo].[Criticidad] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Criticidad]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Estacion] FOREIGN KEY([IdEstacion])
REFERENCES [dbo].[Estacion] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Estacion]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_EstadoOT] FOREIGN KEY([IdEstadoOT])
REFERENCES [dbo].[EstadoOT] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_EstadoOT]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Mantenedor] FOREIGN KEY([Idmantenedor])
REFERENCES [dbo].[Mantenedor] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Mantenedor]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Sistema] FOREIGN KEY([IdSistema])
REFERENCES [dbo].[Sistema] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Sistema]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_SM] FOREIGN KEY([IdSM])
REFERENCES [dbo].[SM] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_SM]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Subsistema] FOREIGN KEY([IdSubsistema])
REFERENCES [dbo].[Subsistema] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Subsistema]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_UsuarioActualizo] FOREIGN KEY([IdUsuario_Actualizo])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_UsuarioActualizo]
GO
ALTER TABLE [dbo].[Reportes]  WITH CHECK ADD  CONSTRAINT [FK_Reportes_Usuarios] FOREIGN KEY([IdUsuarios])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Reportes] CHECK CONSTRAINT [FK_Reportes_Usuarios]
GO
ALTER TABLE [dbo].[Subsistema]  WITH CHECK ADD  CONSTRAINT [FK_Subsistema_Mantenedor] FOREIGN KEY([IdMantenedor])
REFERENCES [dbo].[Mantenedor] ([Id])
GO
ALTER TABLE [dbo].[Subsistema] CHECK CONSTRAINT [FK_Subsistema_Mantenedor]
GO
ALTER TABLE [dbo].[Subsistema]  WITH CHECK ADD  CONSTRAINT [FK_Subsistema_Sistema] FOREIGN KEY([IdSistema])
REFERENCES [dbo].[Sistema] ([Id])
GO
ALTER TABLE [dbo].[Subsistema] CHECK CONSTRAINT [FK_Subsistema_Sistema]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
