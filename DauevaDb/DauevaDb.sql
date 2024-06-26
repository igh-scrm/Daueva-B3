USE [master]
GO
/****** Object:  Database [Kondi]    Script Date: 11.06.2024 22:10:09 ******/
CREATE DATABASE [Kondi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kondi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kondi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kondi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kondi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Kondi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kondi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kondi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kondi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kondi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kondi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kondi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kondi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kondi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kondi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kondi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kondi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kondi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kondi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kondi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kondi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kondi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kondi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kondi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kondi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kondi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kondi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kondi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kondi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kondi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kondi] SET  MULTI_USER 
GO
ALTER DATABASE [Kondi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kondi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kondi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kondi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kondi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kondi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kondi] SET QUERY_STORE = ON
GO
ALTER DATABASE [Kondi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Kondi]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](50) NULL,
	[Master_id] [bigint] NULL,
	[Request_id] [bigint] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[Equipment_Id] [bigint] NOT NULL,
	[EquipmentModel] [nvarchar](50) NOT NULL,
	[Problem] [nvarchar](100) NOT NULL,
	[Status_Id] [bigint] NOT NULL,
	[Complectiondate] [date] NULL,
	[RepairPats] [nvarchar](500) NULL,
	[Master_id] [bigint] NULL,
	[Client_id] [bigint] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Login] [nchar](10) NOT NULL,
	[Password] [nchar](10) NOT NULL,
	[UserType_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTypes]    Script Date: 11.06.2024 22:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UsersTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [Message], [Master_id], [Request_id]) VALUES (1, N'Всё сделаем!', 12, 21)
INSERT [dbo].[Comments] ([id], [Message], [Master_id], [Request_id]) VALUES (2, N'Всё сделаем!', 13, 22)
INSERT [dbo].[Comments] ([id], [Message], [Master_id], [Request_id]) VALUES (3, N'Починим в момент.', 13, 23)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [Name]) VALUES (1, N'Кондиционер')
INSERT [dbo].[Equipment] ([id], [Name]) VALUES (2, N'Увлажнитель воздуха')
INSERT [dbo].[Equipment] ([id], [Name]) VALUES (3, N'Сушилка для рук')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [StartDate], [Equipment_Id], [EquipmentModel], [Problem], [Status_Id], [Complectiondate], [RepairPats], [Master_id], [Client_id]) VALUES (21, CAST(N'2023-06-06' AS Date), 1, N'TCL TAC-12CHSA/TPG-W белый', N'Не охлаждает воздух', 1, NULL, N'', 12, 17)
INSERT [dbo].[Requests] ([Id], [StartDate], [Equipment_Id], [EquipmentModel], [Problem], [Status_Id], [Complectiondate], [RepairPats], [Master_id], [Client_id]) VALUES (22, CAST(N'2023-05-05' AS Date), 1, N'Electrolux EACS/I-09HAT/N3_21Y белый', N'Выключается сам по себе', 1, NULL, N'', 13, 18)
INSERT [dbo].[Requests] ([Id], [StartDate], [Equipment_Id], [EquipmentModel], [Problem], [Status_Id], [Complectiondate], [RepairPats], [Master_id], [Client_id]) VALUES (23, CAST(N'2022-07-07' AS Date), 2, N'Xiaomi Smart Humidifier 2', N'Пар имеет неприятный запах', 2, CAST(N'2023-01-01' AS Date), N'', 13, 19)
INSERT [dbo].[Requests] ([Id], [StartDate], [Equipment_Id], [EquipmentModel], [Problem], [Status_Id], [Complectiondate], [RepairPats], [Master_id], [Client_id]) VALUES (26, CAST(N'2023-08-02' AS Date), 2, N'Polaris PUH 2300 WIFI IQ Home', N'Увлажнитель воздуха продолжает работать при предельном снижении уровня воды', 3, NULL, N'', NULL, 18)
INSERT [dbo].[Requests] ([Id], [StartDate], [Equipment_Id], [EquipmentModel], [Problem], [Status_Id], [Complectiondate], [RepairPats], [Master_id], [Client_id]) VALUES (28, CAST(N'2023-08-02' AS Date), 3, N'Ballu BAHD-1250', N'Не работает', 3, NULL, N'', NULL, 19)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Готово к выдаче')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Новая заявка')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (11, N'Широков', N'Василий', N'Матвеевич', N'89210563128', N'login1    ', N'pass1     ', 1)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (12, N'Кудрявцева', N'Ева', N'Ивановна', N'89535078985', N'login2    ', N'pass2     ', 2)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (13, N'Гончарова', N'Ульяна', N'Ярославовна', N'89210673849', N'login3    ', N'pass3     ', 2)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (14, N'Гусева', N'Виктория', N'Данииловна', N'89990563748', N'login4    ', N'pass4     ', 4)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (15, N'Баранов', N'Артём', N'Юрьевич', N'89994563847', N'login5    ', N'pass5     ', 4)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (16, N'Овчинников', N'Фёдор', N'Никитич', N'89219567849', N'login6    ', N'pass6     ', 3)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (17, N'Петров', N'Никита', N'Артёмович', N'89219567841', N'login7    ', N'pass7     ', 3)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (18, N'Ковалева', N'Софья', N'Владимировна', N'89219567842', N'login8    ', N'pass8     ', 3)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (19, N'Кузнецов', N'Сергей', N'Матвеевич', N'89219567843', N'login9    ', N'pass9     ', 1)
INSERT [dbo].[Users] ([id], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [UserType_Id]) VALUES (20, N'Беспалова', N'Екатерина', N'Даниэльевна', N'89219567844', N'login10   ', N'pass10    ', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTypes] ON 

INSERT [dbo].[UsersTypes] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[UsersTypes] ([Id], [Name]) VALUES (2, N'Специалист')
INSERT [dbo].[UsersTypes] ([Id], [Name]) VALUES (3, N'Заказчик')
INSERT [dbo].[UsersTypes] ([Id], [Name]) VALUES (4, N'Оператор')
SET IDENTITY_INSERT [dbo].[UsersTypes] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([Request_id])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([Master_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Equipment] FOREIGN KEY([Equipment_Id])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Equipment]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Status]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([Master_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([Client_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersTypes] FOREIGN KEY([UserType_Id])
REFERENCES [dbo].[UsersTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersTypes]
GO
USE [master]
GO
ALTER DATABASE [Kondi] SET  READ_WRITE 
GO
