USE [GesinV2]
GO
/****** Object:  Table [dbo].[Activos]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Config_Usuario]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Criticidad]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Estacion]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[EstadoOT]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Funcion]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Mantenedor]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 12/11/2022 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[Codigo] [nvarchar](20) NOT NULL,
	[IdFuncion] [int] NOT NULL,
 CONSTRAINT [PK__Mantened__3214EC07B9735D82] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reportes]    Script Date: 12/11/2022 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reportes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSubsistema] [int] NOT NULL,
	[Ubicacion] [nvarchar](100) NOT NULL,
	[IdEstacion] [int] NOT NULL,
	[Operador_reporte] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](400) NOT NULL,
	[Fechaaveria] [datetime] NOT NULL,
	[IdCriticidad] [int] NOT NULL,
	[IdSM] [int] NOT NULL,
	[OT] [int] NULL,
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
/****** Object:  Table [dbo].[Rol]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Sistema]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[SM]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Subsistema]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 12/11/2022 16:37:24 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2022 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Codigo] [int] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activos] ON 
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (1, N'GAT  01 fuera de servicio.', 1)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (2, N'GAT 01, no valida.', 1)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (5, N'GAT 02 , pictograma con caracteres erroneos', 1)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (6, N'POS 1 fuera de servicio', 2)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (7, N'POS 1, monitor se muestra en azul', 2)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (8, N'POS 2, impresora con atasco', 2)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (9, N'1 Lampara no enciende ', 5)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (10, N'Tomacorriente sin energia', 5)
GO
INSERT [dbo].[Activos] ([Id], [Descripcion], [Idsubsistema]) VALUES (11, N'Falla de energia ', 5)
GO
SET IDENTITY_INSERT [dbo].[Activos] OFF
GO
SET IDENTITY_INSERT [dbo].[Config_Usuario] ON 
GO
INSERT [dbo].[Config_Usuario] ([Id], [Background], [IdUsuario]) VALUES (1, N'#860909', 6)
GO
INSERT [dbo].[Config_Usuario] ([Id], [Background], [IdUsuario]) VALUES (2, N'#1225af', 1)
GO
SET IDENTITY_INSERT [dbo].[Config_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Criticidad] ON 
GO
INSERT [dbo].[Criticidad] ([Id], [Nombre]) VALUES (1, N'Bajo Impacto')
GO
INSERT [dbo].[Criticidad] ([Id], [Nombre]) VALUES (2, N'Alto Impacto')
GO
SET IDENTITY_INSERT [dbo].[Criticidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Estacion] ON 
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (1, N'C. Heroes')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (2, N'F. Camaño')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (3, N'A. Abel')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (4, N'Mama Tingo')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (5, N'J. P. Duarte L1')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (6, N'Casandra Damiron')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (7, N'Los Tainos')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (8, N'P. L. Cedeño')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (9, N'P. Batle')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (10, N'C. Bona')
GO
INSERT [dbo].[Estacion] ([Id], [Nombre]) VALUES (11, N'Cristian Candelario')
GO
SET IDENTITY_INSERT [dbo].[Estacion] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoOT] ON 
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (1, N'Creada')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (2, N'Reportada')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (3, N'Creada Reportada')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (4, N'Falsa Averia')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (5, N'Cerrada')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (6, N'Reutilizar')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (7, N'Duplicada')
GO
INSERT [dbo].[EstadoOT] ([Id], [Nombre]) VALUES (8, N'Sin Estado')
GO
SET IDENTITY_INSERT [dbo].[EstadoOT] OFF
GO
SET IDENTITY_INSERT [dbo].[Funcion] ON 
GO
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (1, N'Call Center')
GO
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (2, N'Tecnico')
GO
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (3, N'Operador')
GO
INSERT [dbo].[Funcion] ([Id], [Nombre]) VALUES (4, N'Electromecanica')
GO
SET IDENTITY_INSERT [dbo].[Funcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Mantenedor] ON 
GO
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (1, N'Opret')
GO
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (2, N'Thales')
GO
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (3, N'Liriano')
GO
INSERT [dbo].[Mantenedor] ([Id], [Nombre]) VALUES (4, N'Exergia')
GO
SET IDENTITY_INSERT [dbo].[Mantenedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (1, N'Ronal Gomez', N'1245      ', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (2, N'Honey Minaya', N'1246      ', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (3, N'Katherine Brigewater', N'3256      ', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (4, N'Pedro Xavier', N'4587      ', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (5, N'Melina Felipe', N'7441      ', 1)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (7, N'veruzca', N'4586', 3)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (8, N'isidro', N'145', 2)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (9, N'Wilson Garcia', N'4796', 4)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (10, N'Edgar Coste', N'4758', 4)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (11, N'Yuliana manzueta', N'4797', 4)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (14, N'Cristian Candelario', N'4792', 4)
GO
INSERT [dbo].[Persona] ([Id], [Nombre], [Codigo], [IdFuncion]) VALUES (15, N'Katherine Gonzalez', N'4795', 4)
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Reportes] ON 
GO
INSERT [dbo].[Reportes] ([Id], [IdSubsistema], [Ubicacion], [IdEstacion], [Operador_reporte], [Descripcion], [Fechaaveria], [IdCriticidad], [IdSM], [OT], [IdEstadoOT], [Comentario], [Fechanotificacion], [Mantenedor_notificar], [Fechainicio], [Fechafinal], [IdUsuarios], [Mantenedor_reparo], [Operador_Cierre], [IdUsuario_Actualizo], [CodigoOperador_reporte], [CodigoOperador_Cierre], [IdSistema], [Idmantenedor]) VALUES (1, 1, N'Anden 1', 8, N'Wilson Garcia', N'GAT 01 fuera de servicio.', CAST(N'2022-11-12T15:43:00.000' AS DateTime), 1, 4, 1234, 5, N'', NULL, N'Pedro Xavier', CAST(N'2022-11-12T15:45:00.000' AS DateTime), CAST(N'2022-11-12T15:45:00.000' AS DateTime), 1, N'isidro', N'4796', 1, N'4796', N'Wilson Garcia', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Reportes] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (1, N'administrador')
GO
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (2, N'vendedor')
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sistema] ON 
GO
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (1, N'Ventas de titulos')
GO
INSERT [dbo].[Sistema] ([Id], [Nombre]) VALUES (2, N'Baja Tension')
GO
SET IDENTITY_INSERT [dbo].[Sistema] OFF
GO
SET IDENTITY_INSERT [dbo].[SM] ON 
GO
INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (4, N'Maximo              ')
GO
INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (5, N'APK                 ')
GO
INSERT [dbo].[SM] ([Id], [Nombre]) VALUES (10, N'Gesin               ')
GO
SET IDENTITY_INSERT [dbo].[SM] OFF
GO
SET IDENTITY_INSERT [dbo].[Subsistema] ON 
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (1, N'CPP                 ', 1, 2)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (2, N'POS                 ', 1, 2)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (4, N'Puesta Tierra', 2, 4)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (5, N'Otros Suministro electrico              ', 2, 4)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (6, N'Motores Tales', 1, 2)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (7, N'CPMR', 1, 2)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (8, N'Para rayos', 2, 4)
GO
INSERT [dbo].[Subsistema] ([Id], [Nombre], [IdSistema], [IdMantenedor]) VALUES (9, N'SEAs', 2, 4)
GO
SET IDENTITY_INSERT [dbo].[Subsistema] OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (1, N'Cuarto BT')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (2, N'Cuarto AT')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (3, N'AT/BT')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (4, N'Mezzanine')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (5, N'Vestibulo')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (6, N'Anden 1')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (7, N'Anden 2')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (8, N'Acceso')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (9, N'Boleteria')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (10, N'CCI')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (11, N'Baños')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (12, N'Disponible')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (13, N'TIM')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (14, N'Nave de Generacion')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (15, N'Exterior')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (16, N'Cuarto COM')
GO
INSERT [dbo].[Ubicacion] ([Id], [Nombre]) VALUES (17, N'Cuarto de Enclavamiento')
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Codigo], [UserName], [Password], [IdRol], [Fecha]) VALUES (1, N'Wilson         ', N'Garcia              ', 4796, N'wgarcia   ', 12345, 1, NULL)
GO
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Codigo], [UserName], [Password], [IdRol], [Fecha]) VALUES (6, N'Yuliana        ', N'Manzuet             ', 4794, N'Ymazueta  ', 12345, 2, NULL)
GO
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
