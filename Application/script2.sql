USE [master]
GO
/****** Object:  Database [DbHardware]    Script Date: 12.03.2024 16:09:20 ******/
CREATE DATABASE [DbHardware]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbHardware', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbHardware.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbHardware_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbHardware_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbHardware] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbHardware].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbHardware] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbHardware] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbHardware] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbHardware] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbHardware] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbHardware] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbHardware] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbHardware] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbHardware] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbHardware] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbHardware] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbHardware] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbHardware] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbHardware] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbHardware] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbHardware] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbHardware] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbHardware] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbHardware] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbHardware] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbHardware] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbHardware] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbHardware] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbHardware] SET  MULTI_USER 
GO
ALTER DATABASE [DbHardware] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbHardware] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbHardware] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbHardware] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbHardware] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbHardware] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbHardware] SET QUERY_STORE = OFF
GO
USE [DbHardware]
GO
/****** Object:  Table [dbo].[AuthorizationHistory]    Script Date: 12.03.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizationHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateAndTime] [datetime] NOT NULL,
	[Status] [nvarchar](150) NOT NULL,
	[IdEmployee] [int] NULL,
 CONSTRAINT [PK_AuthorizationHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12.03.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[IdSupervisor] [int] NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 12.03.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[IdEmployee] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.03.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuthorizationHistory] ON 

INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (1, CAST(N'2024-03-11T14:17:06.043' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (2, CAST(N'2024-03-11T14:18:22.997' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (3, CAST(N'2024-03-11T14:21:45.210' AS DateTime), N'Не успешно', NULL)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (4, CAST(N'2024-03-11T14:21:55.360' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (5, CAST(N'2024-03-11T14:32:41.180' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (6, CAST(N'2024-03-11T14:33:07.470' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (7, CAST(N'2024-03-11T14:33:30.940' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (8, CAST(N'2024-03-11T14:38:50.827' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (9, CAST(N'2024-03-11T14:47:44.003' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (10, CAST(N'2024-03-11T14:49:59.750' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (11, CAST(N'2024-03-11T14:50:47.610' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (12, CAST(N'2024-03-11T14:53:00.050' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (13, CAST(N'2024-03-11T15:17:24.310' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (14, CAST(N'2024-03-11T15:18:17.783' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (15, CAST(N'2024-03-11T15:18:54.623' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (16, CAST(N'2024-03-11T15:19:27.203' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (17, CAST(N'2024-03-11T15:19:51.343' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (18, CAST(N'2024-03-11T15:21:35.680' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (19, CAST(N'2024-03-11T15:22:02.757' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (20, CAST(N'2024-03-11T15:22:35.820' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (21, CAST(N'2024-03-11T15:31:41.773' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (22, CAST(N'2024-03-11T15:33:01.197' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (23, CAST(N'2024-03-11T15:34:08.237' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (24, CAST(N'2024-03-11T15:40:05.703' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (25, CAST(N'2024-03-11T15:41:34.950' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (26, CAST(N'2024-03-11T15:42:08.973' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (27, CAST(N'2024-03-11T15:42:45.807' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (28, CAST(N'2024-03-11T15:43:47.530' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (29, CAST(N'2024-03-11T15:48:56.400' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (30, CAST(N'2024-03-11T16:12:35.817' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (31, CAST(N'2024-03-11T16:16:37.007' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (32, CAST(N'2024-03-11T16:16:48.133' AS DateTime), N'Успешно', 6)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (33, CAST(N'2024-03-11T16:18:42.363' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (34, CAST(N'2024-03-11T16:21:55.847' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (35, CAST(N'2024-03-11T16:23:31.077' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (36, CAST(N'2024-03-11T16:29:24.710' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (37, CAST(N'2024-03-11T16:29:48.773' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (38, CAST(N'2024-03-11T16:30:16.623' AS DateTime), N'Успешно', 3)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (39, CAST(N'2024-03-11T16:30:32.110' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (40, CAST(N'2024-03-11T16:33:25.727' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (41, CAST(N'2024-03-11T16:34:42.220' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (42, CAST(N'2024-03-11T16:34:47.943' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (43, CAST(N'2024-03-12T13:01:25.127' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (44, CAST(N'2024-03-12T13:09:14.110' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (45, CAST(N'2024-03-12T13:41:43.773' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (46, CAST(N'2024-03-12T13:44:38.477' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (47, CAST(N'2024-03-12T13:44:46.970' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (48, CAST(N'2024-03-12T13:44:52.713' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (49, CAST(N'2024-03-12T13:52:29.837' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (50, CAST(N'2024-03-12T14:03:33.843' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (51, CAST(N'2024-03-12T14:04:16.213' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (52, CAST(N'2024-03-12T14:04:21.743' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (53, CAST(N'2024-03-12T14:34:39.003' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (54, CAST(N'2024-03-12T14:39:32.717' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (55, CAST(N'2024-03-12T14:43:30.660' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (56, CAST(N'2024-03-12T14:44:50.893' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (57, CAST(N'2024-03-12T14:52:42.690' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (58, CAST(N'2024-03-12T14:52:56.663' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (59, CAST(N'2024-03-12T14:53:01.643' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (60, CAST(N'2024-03-12T14:53:07.550' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (61, CAST(N'2024-03-12T14:53:24.527' AS DateTime), N'Успешно', 7)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (62, CAST(N'2024-03-12T14:53:58.630' AS DateTime), N'Успешно', 12)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (63, CAST(N'2024-03-12T14:58:04.347' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (64, CAST(N'2024-03-12T15:08:03.560' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (65, CAST(N'2024-03-12T15:12:01.467' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (66, CAST(N'2024-03-12T15:13:32.980' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (67, CAST(N'2024-03-12T15:14:19.823' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (68, CAST(N'2024-03-12T15:14:27.107' AS DateTime), N'Успешно', 2)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (69, CAST(N'2024-03-12T15:14:37.313' AS DateTime), N'Успешно', 3)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (70, CAST(N'2024-03-12T15:14:42.710' AS DateTime), N'Успешно', 4)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (71, CAST(N'2024-03-12T15:14:47.647' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (72, CAST(N'2024-03-12T15:15:17.993' AS DateTime), N'Успешно', 6)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (73, CAST(N'2024-03-12T15:20:28.860' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (74, CAST(N'2024-03-12T15:20:50.150' AS DateTime), N'Успешно', 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (75, CAST(N'2024-03-12T15:21:37.647' AS DateTime), N'Успешно', 5)
INSERT [dbo].[AuthorizationHistory] ([Id], [DateAndTime], [Status], [IdEmployee]) VALUES (76, CAST(N'2024-03-12T16:03:09.323' AS DateTime), N'Успешно', 5)
SET IDENTITY_INSERT [dbo].[AuthorizationHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (1, N'Шилов Вольдемар Степанович', N'log1', N'123', N'89023456789', 19, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (2, N'Мясников Власий Лаврентьевич', N'log2', N'123', N'89024567782', 19, 2)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (3, N'Макаров Овидий Вячеславович', N'log3', N'123', N'89034536712', 19, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (4, N'Рябов Валентин Миронович', N'log4', N'123', N'89085556677', 15, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (5, N'Архипов Валентин Богуславович', N'log5', N'123', N'89025647899', 5, 3)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (6, N'Федосеев Август Аристархович', N'log6', N'123', N'89087776655', 15, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (7, N'Козлов Азарий Владимирович', N'log7', N'123', N'89702223455', 15, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (8, N'Кондратьев Владислав Агафонович', N'log8', N'123', N'89057778888', 15, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (9, N'Лапин Альфред Александрович', N'log9', N'123', N'89056893399', 5, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (12, N'Тимофеев Май Филиппович', N'log10', N'123', N'86890334056', 5, 2)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (14, N'Сидоров Арсений Богуславович', N'log11', N'123', N'89903345667', 5, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (15, N'Самсонов Егор Тимофеевич', N'log12', N'123', N'89056778883', 15, 3)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (17, N'Журавлёв Панкрат Валерьянович', N'log13', N'123', N'89025674835', 5, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (18, N'Жуков Виталий Проклович', N'log14', N'123', N'89056789909', 19, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [Login], [Password], [PhoneNumber], [IdSupervisor], [IdRole]) VALUES (19, N'Якушев Гордий Гордеевич', N'log15', N'123', N'89045678899', 15, 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (1, N'М0123ТНС312', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\1.jpg', N'Интернет маршрутизатор D-Link DIR-815 ', N'Description', 1, 1)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (2, N'М234ТНС12', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\2.jpg', N'Интернет маршрутизатор D-Link DIR-842', N'Description', 2, 2)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (3, N'М567ТНС87', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\3.jpg', N'Интернет маршрутизатор D-Link DIR-825 ', N'Description', 3, 5)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (5, N'М455ТНС567', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\4.jpg', N'Коммутатор D-Link DES-1008P ', N'Description', 4, 6)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (6, N'М8888ТНС231', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\5.jpg', N'Интернет маршрутизатор D-Link DIR-825 ', N'Description', 5, 2)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (8, N'М67ТНС98008', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор Switch D-Link DGS-1008MP ', N'Description', 6, 4)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (9, N'М43535ТНС2677', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Интернет маршрутизатор D-link DWR-921 ', N'Description', 1, 5)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (10, N'М535623ТНС8899', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор D-Link DES-3200-28 ', N'Description', 2, 7)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (11, N'М431ТНС7647', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Интернет маршрутизатор D-Link DIR-645 ', N'Description', 3, 1)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (12, N'М654ТНС878', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор D-Link DGS-1210-28P ', N'Description', 4, 6)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (13, N'М634ТНС67', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор Switch D-Link ', N'Description', 5, 8)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (17, N'М877ТНС132', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор Hewlett Packard Enterprise OfficeConnect 1405-8G v3 ', N'Description', 6, 14)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (18, N'АО567-ТНС-11', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP OfficeConnect 1420-8G ', N'Description', 1, 12)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (19, N'АО567-ТНС-12', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Точка доступа HP ProCurve ', N'Description', 2, 14)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (20, N'АО567-ТНС-13', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP 1420-24G-2SFP', N'Description', 3, 5)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (21, N'АО567-ТНС-14', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP 3100-24 v2 EI ', N'Description', 4, 14)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (22, N'СД12ТНС_01', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP 5500-24G EI #JD377A', N'Description', 5, 14)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (23, N'СД12ТНС_02', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP Enterprise 1950-24G-2SFP+-2XGT ', N'Description', 6, 5)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (24, N'СД12ТНС_03', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP Aruba 2530-24-PoE+ ', N'Description', 1, 15)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (25, N'СД12ТНС_04', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор HP Aruba 2530-48-PoE+  ', N'Description', 2, 3)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (26, N'СД12ТНС_05', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Трансивер X2-10GB-LX4 Cisco ', N'Description', 3, 6)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (27, N'СД12ТНС_06', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Точка доступа Cisco ', N'Description', 4, 7)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (28, N'СД12ТНС_07', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор Cisco ', N'Description', 5, 8)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (29, N'СД12ТНС_08', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Точка доступа Cisco ', N'Description', 6, 9)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (30, N'СД12ТНС_09', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Точка доступа Cisco ', N'Description', 1, 12)
INSERT [dbo].[Equipment] ([Id], [SerialNumber], [Photo], [Name], [Description], [RoomNumber], [IdEmployee]) VALUES (31, N'СД12ТНС_10', N'D:\42П\Поздов\Учебная практика (7 модуль)\HardwareApp\Images\placeholder.jpg', N'Коммутатор Switch D-Link DES-1008D ', N'Description', 2, 14)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Сотрудник')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Руководитель группы')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[AuthorizationHistory]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizationHistory_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[AuthorizationHistory] CHECK CONSTRAINT [FK_AuthorizationHistory_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([IdSupervisor])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Employee]
GO
USE [master]
GO
ALTER DATABASE [DbHardware] SET  READ_WRITE 
GO
