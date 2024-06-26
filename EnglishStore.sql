USE [master]
GO
/****** Object:  Database [EnglishStore_BobrikobAA]    Script Date: 09.04.2024 11:03:35 ******/
CREATE DATABASE [EnglishStore_BobrikobAA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnglishStore_BobrikobAA', FILENAME = N'/var/opt/mssql/data/EnglishStore_BobrikobAA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnglishStore_BobrikobAA_log', FILENAME = N'/var/opt/mssql/data/EnglishStore_BobrikobAA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnglishStore_BobrikobAA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET RECOVERY FULL 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET  MULTI_USER 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET QUERY_STORE = OFF
GO
USE [EnglishStore_BobrikobAA]
GO
/****** Object:  User [alexm]    Script Date: 09.04.2024 11:03:35 ******/
CREATE USER [alexm] FOR LOGIN [alexm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 09.04.2024 11:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartWorkDate] [date] NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.04.2024 11:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 09.04.2024 11:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[SaleTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.04.2024 11:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (1, N'Princeton Review', CAST(N'2015-01-06' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (2, N'Кнорус', CAST(N'2017-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (3, N'Яуза', CAST(N'2015-10-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (4, N'Аванта+', CAST(N'2017-02-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (5, N'Dorling Kindersley', CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (6, N'Delta Publishing', CAST(N'2017-05-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (7, N'Проспект', CAST(N'2017-11-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (8, N'Express Publishing', CAST(N'2016-09-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (9, N'Эксмо-Пресс', CAST(N'2018-02-26' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (10, N'Розовый жираф', CAST(N'2017-09-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (11, N'Стандарт-Коллекция', CAST(N'2015-11-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (12, N'Медиарама', CAST(N'2016-10-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (13, N'Вагриус', CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (14, N'Академкнига', CAST(N'2015-05-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (15, N'Прогресс', CAST(N'2018-06-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (16, N'Возвращение', CAST(N'2017-01-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (17, N'АСТ', CAST(N'2017-10-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (18, N'Ladybird', CAST(N'2017-02-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (19, N'ЛитРес', CAST(N'2017-06-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (20, N'Матезис', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (21, N'Gallimard', CAST(N'2016-08-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (22, N'Современник', CAST(N'2016-03-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (23, N'Алгоритм', CAST(N'2015-07-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (24, N'Антология', CAST(N'2017-06-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (25, N'Росмэн', CAST(N'2017-04-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (26, N'Просвещение', CAST(N'2018-03-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (27, N'Мир хобби', CAST(N'2016-09-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (28, N'Попурри', CAST(N'2015-05-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (29, N'Феникс', CAST(N'2016-09-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (30, N'Абрис', CAST(N'2017-10-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (31, N'Де Агостини', CAST(N'2015-08-08' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (32, N'Виват', CAST(N'2018-04-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (33, N'Весь мир', CAST(N'2017-10-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (34, N'Велес-ВА', CAST(N'2017-09-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (35, N'Дрофа', CAST(N'2015-08-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (36, N'Эксмо', CAST(N'2015-03-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (37, N'Аврора', CAST(N'2016-09-24' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (38, N'Cambridge', CAST(N'2015-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (39, N'Планета', CAST(N'2017-11-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (40, N'Вита Нова', CAST(N'2017-03-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (41, N'РОССПЭН', CAST(N'2017-09-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (42, N'Мир', CAST(N'2017-11-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (43, N'Росток', CAST(N'2017-10-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (44, N'Питер', CAST(N'2018-05-06' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (45, N'Вита-Пресс', CAST(N'2016-10-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (46, N'Литературная Россия', CAST(N'2015-02-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (47, N'Флинта', CAST(N'2017-04-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (48, N'Академический проект', CAST(N'2016-12-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (49, N'ИНФРА-М', CAST(N'2015-11-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartWorkDate]) VALUES (50, N'Прометей', CAST(N'2017-02-11' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (1, N'Super Minds. Level 4. Workbook with Online Resources', N' Товары школы\701132.jpg', 38, 0, 1210.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (2, N'Super Minds. Workbook 2 with Online Resources', N' Товары школы\701128.jpg', 38, 1, 1200.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (3, N'Eyes Open. Level 3. Student''s Book', N' Товары школы\700890.jpg', 38, 1, 1350.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (4, N'Advanced Grammar in Use. Book without Answers', N' Товары школы\700673.jpg', 38, 1, 1850.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (5, N'Английский на каждый день', N' Товары школы\698477.jpg', 17, 1, 670.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (6, N'English for Everyone. English Vocabulary Builder', N' Товары школы\715802.jpg', 5, 1, 1980.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (7, N'Cracking GMAT Premium 2020 Edition. 6 Practice Tests', N' Товары школы\724652.jpg', 1, 1, 3140.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (8, N'Учебник английского языка. Полный курс', N' Товары школы\729944.jpg', 36, 1, 1000.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (9, N'Английский без страха для тех, кому за...', N' Товары школы\720888.jpg', 17, 1, 290.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (10, N'Grammarway 2. Teacher''s Book. Elementary', N' Товары школы\702075.jpg', 8, 1, 910.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (11, N'Tree or Three? An elementary pronunciation course', N' Товары школы\701141.jpg', 38, 1, 1870.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (12, N'Prism Reading. Intro. Student''s Book', N' Товары школы\699858.jpg', 38, 1, 2930.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (13, N'Think. Level 3. B1+. Student''s Book', N' Товары школы\701135.jpg', 38, 1, 1640.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (14, N'Учим английский язык с енотами-полиглотами', N' Товары школы\724934.jpg', 17, 1, 340.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (15, N'Super Minds. Workbook 1 with Online Resources', N' Товары школы\701125.jpg', 38, 1, 1230.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (16, N'Говори как английская королева. The Queen''s English and how to use it', N' Товары школы\699791.jpg', 17, 1, 420.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (17, N'Dive in! Blue', N' Товары школы\729198.jpg', 6, 1, 630.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (18, N'Вся грамматика английского языка в таблицах. Учебное пособие', N' Товары школы\716788.jpg', 47, 1, 390.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (19, N'New Enterprise A2. Workbook with digibook app', N' Товары школы\701884.jpg', 8, 1, 1220.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (20, N'Eyes Open Level 1 Student''s Book', N' Товары школы\700889.jpg', 38, 1, 1340.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (21, N'Английский язык. Популярный иллюстрированный самоучитель', N' Товары школы\726891.jpg', 17, 1, 400.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (22, N'Grammarway 1. Book with Answers. Beginner', N' Товары школы\702074.jpg', 8, 1, 1270.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (23, N'Business Vocabulary in Use. Advanced. Book with Answers', N' Товары школы\700674.jpg', 38, 1, 2220.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (24, N'Разговорный английский в диалогах. Учебное пособие', N' Товары школы\730838.jpg', 2, 1, 1140.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (25, N'Английский без барьеров. For beginners', N' Товары школы\722958.jpg', 44, 1, 420.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (26, N'Pocket English Grammar (Карманная грамматика английского языка). Справочное пособие', N' Товары школы\690825.jpg', 49, 1, 390.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (27, N'Evolve. Level 1. Student''s Book', N' Товары школы\702640.jpg', 38, 0, 1840.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (28, N'Реальный English. Как подружиться с грамматикой раз и навсегда', N' Товары школы\704508.jpg', 29, 1, 690.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (29, N'English Vocabulary in Use. Advanced. Book with Answers', N' Товары школы\700703.jpg', 38, 0, 1860.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (30, N'Быстрый английский. Тренажер по чтению', N' Товары школы\715170.jpg', 17, 1, 240.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (31, N'Деловой английский язык. (Бакалавриат и магистратура). Учебное пособие', N' Товары школы\712853.jpg', 2, 1, 1080.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (32, N'Английский язык. Самые нужные правила', N' Товары школы\729858.jpg', 17, 1, 180.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (33, N'Legal English. Английский язык для юристов. Учебник', N' Товары школы\707289.jpg', 49, 1, 2720.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (34, N'OK English! Все правила английского языка с упражнениями', N' Товары школы\694544.jpg', 17, 1, 370.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (35, N'Dive in! Orange', N' Товары школы\729200.jpg', 6, 1, 650.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (36, N'Английская грамматика. Просто и понятно: правила, модели, упражнения. Учебное пособие', N' Товары школы\716808.jpg', 50, 1, 2060.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (37, N'Grammar in Use. Intermediate. Student''s Book without Answers', N' Товары школы\700903.jpg', 38, 0, 1740.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (38, N'Современная английская грамматика в таблицах', N' Товары школы\721525.jpg', 9, 1, 340.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (39, N'Everyday Vocabulary + Grammar. For Intermediate Students. Учебное пособие', N' Товары школы\722745.jpg', 24, 1, 1180.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (40, N'English for Everyone. English Idioms', N' Товары школы\715801.jpg', 5, 1, 2290.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (41, N'Вся грамматика английского языка. Теория и практика', N' Товары школы\724335.jpg', 17, 1, 410.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (42, N'Говорим по-английски', N' Товары школы\706297.jpg', 32, 1, 220.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (43, N'Business Vocabulary in Use. Intermediate. Book with Answers and Enhanced ebook', N' Товары школы\700676.jpg', 38, 1, 2690.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (44, N'Безупречная английская грамматика. Простые правила и увлекательные тесты', N' Товары школы\723769.jpg', 17, 1, 720.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (45, N'Exam Booster For Advanced Without Ans Key + Audio', N' Товары школы\714676.jpg', 38, 1, 1300.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (46, N'Grammar in Use. Intermediate. Student''s Book with Answers and Interactive eBook', N' Товары школы\700900.jpg', 38, 0, 2380.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (47, N'Английская грамматика в схемах и таблицах', N' Товары школы\713804.jpg', 17, 1, 170.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (48, N'Английский язык. Тренажер по чтению', N' Товары школы\710082.jpg', 17, 1, 170.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (49, N'Английский язык для технических специальностей. Учебное пособие', N' Товары школы\730048.jpg', 49, 0, 2550.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (50, N'Интенсивный английский 4 в 1: говорим, читаем, пишем, слушаем', N' Товары школы\716807.jpg', 50, 1, 1840.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (51, N'Английские пословицы и поговорки. Учебное пособие', N' Товары школы\714143.jpg', 47, 0, 260.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (52, N'Super Minds. Level 3. Workbook with Online Resources', N' Товары школы\701130.jpg', 38, 1, 1200.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (53, N'Английский язык. Времена глаголов', N' Товары школы\710081.jpg', 17, 1, 150.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (54, N'Английский курсив: прописи', N' Товары школы\715875.jpg', 3, 0, 300.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (55, N'Английский язык. Фразовые глаголы', N' Товары школы\710083.jpg', 17, 1, 160.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (56, N'English for Beginners: Everyday English', N' Товары школы\693086.jpg', 18, 1, 330.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (57, N'Курс английской разговорной речи. Учебное пособие', N' Товары школы\722820.jpg', 50, 1, 1790.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (58, N'New Enterprise A2 Student''s Book with DigiBooks App', N' Товары школы\701882.jpg', 8, 1, 1650.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (59, N'Business Vocabulary in Use. Advanced. Book with Answers and Enhanced ebook', N' Товары школы\700675.jpg', 38, 1, 2840.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (60, N'Prepare. Level 2. Student''s Book', N' Товары школы\701088.jpg', 38, 0, 1780.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (61, N'Your Space Level 2 Student''s Book', N' Товары школы\701151.jpg', 38, 1, 1380.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (62, N'Вся английская грамматика в схемах и таблицах', N' Товары школы\729025.jpg', 17, 0, 370.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (63, N'Dive in! Green', N' Товары школы\729199.jpg', 6, 0, 640.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (64, N'English Grammar Today Book with Workbook', N' Товары школы\700707.jpg', 38, 0, 4110.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (65, N'Разговорная грамматика английского языка', N' Товары школы\725306.jpg', 17, 1, 360.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (66, N'Think. Level 3. B1+. Workbook with Online Practice', N' Товары школы\701138.jpg', 38, 1, 1140.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (67, N'Английский язык за 3 месяца. Быстрый восстановитель знаний', N' Товары школы\714131.jpg', 17, 1, 270.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (68, N'Prepare. Level 4. B1. Student''s Book', N' Товары школы\701097.jpg', 38, 1, 1810.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (69, N'Английский язык. Идиомы (полезные карточки)', N' Товары школы\729857.jpg', 17, 1, 140.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (70, N'Английский язык. Все времена и глаголы в схемах и таблицах', N' Товары школы\729495.jpg', 17, 1, 350.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (71, N'Английский с нуля. Учебное пособие', N' Товары школы\716806.jpg', 50, 1, 1840.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (72, N'English Vocabulary in Use. Elementary. Book with Answers and Enhanced eBook', N' Товары школы\700704.jpg', 38, 1, 2380.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (73, N'Каллиграфия. Английский курсив. Самоучитель', N' Товары школы\721737.jpg', 3, 0, 270.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (74, N'Ship or Sheep? An intermediate pronunciation course', N' Товары школы\701112.jpg', 38, 1, 2210.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (75, N'Eyes Open. Level 3. Workbook with Online Practice', N' Товары школы\700891.jpg', 38, 1, 1110.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (76, N'New Enterprise A2 - Grammar Book (with Digibooks App)', N' Товары школы\701883.jpg', 8, 1, 1250.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (77, N'Cracking the GRE Premium Edition with 6 Practice Tests, 2020', N' Товары школы\730252.jpg', 1, 1, 3110.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (78, N'Prepare. Level 5. B1. Student''s Book', N' Товары школы\701098.jpg', 38, 1, 1790.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (79, N'Английский язык для менеджеров. Учебное пособие', N' Товары школы\693032.jpg', 50, 1, 1280.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (80, N'Учебник английского языка. Часть 2', N' Товары школы\717996.jpg', 36, 1, 690.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (81, N'Быстрый английский для начинающих', N' Товары школы\714137.jpg', 17, 1, 230.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (82, N'Prepare. Level 3. A2. Student''s Book', N' Товары школы\701094.jpg', 38, 1, 1810.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (83, N'Тренажер по чтению. Самый быстрый способ выучить английский язык', N' Товары школы\718058.jpg', 17, 0, 120.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (84, N'English Vocabulary in Use. Upper-Intermediate. Book with Answers', N' Товары школы\700705.jpg', 38, 1, 1890.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (85, N'Professional English for PR Students: People and Society', N' Товары школы\716803.jpg', 50, 1, 780.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (86, N'Английский язык. Идиомы', N' Товары школы\713805.jpg', 17, 1, 130.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (87, N'Elementary Vocabulary + Grammar. Foe Beginners and Pre-Intermediate Students. Учебное пособие', N' Товары школы\731489.jpg', 24, 0, 960.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (88, N'Самый быстрый способ выучить неправильные английские глаголы', N' Товары школы\718057.jpg', 17, 1, 70.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (89, N'English Grammar in Use. Book without Answers', N' Товары школы\700691.jpg', 38, 0, 1760.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (90, N'Английская грамматика. Самое важное. Учебное пособие (мини)', N' Товары школы\726085.jpg', 7, 1, 80.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (91, N'Grammar in Use Intermediate Student''s Book with Answers Self-study Reference and Practice', N' Товары школы\700901.jpg', 38, 1, 1950.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (92, N'English Grammar in Use. Book with Answers', N' Товары школы\700689.jpg', 38, 1, 1950.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (93, N'Английский для малышей и мам @my_english_baby. Как воспитать билингвального ребенка', N' Товары школы\718408.jpg', 17, 1, 390.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (94, N'Грамматический профиль. Grammar Profile. Учебное пособие', N' Товары школы\710904.jpg', 47, 0, 450.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (95, N'Английский язык на пальцах', N' Товары школы\712495.jpg', 17, 0, 360.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (96, N'Prepare. Level 2. A2. Workbook with Audio Download', N' Товары школы\701093.jpg', 38, 1, 1340.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (97, N'Учебник английского языка. Часть 1', N' Товары школы\713136.jpg', 36, 1, 710.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (98, N'Грамматика английского языка. Просто и доступно. Учебное пособие', N' Товары школы\696499.jpg', 47, 0, 450.0000)
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (99, N'Безупречный английский. Самоучитель для начинающих', N' Товары школы\727495.jpg', 17, 1, 680.0000)
GO
INSERT [dbo].[Product] ([ID], [Name], [Image], [ManufacturerID], [IsActive], [Price]) VALUES (100, N'Your Space. Level 1. Student''s Book', N' Товары школы\701149.jpg', 38, 1, 1370.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (1, 92, 1, CAST(N'2019-10-13T18:32:07.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (2, 74, 1, CAST(N'2019-03-11T10:27:29.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (3, 90, 1, CAST(N'2019-08-10T12:07:36.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (4, 89, 1, CAST(N'2019-05-22T12:24:47.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (5, 46, 2, CAST(N'2019-02-09T11:35:40.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (6, 93, 2, CAST(N'2019-07-13T14:32:24.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (7, 20, 1, CAST(N'2019-05-26T17:13:18.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (8, 92, 1, CAST(N'2019-03-28T17:54:22.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (9, 37, 2, CAST(N'2019-10-22T18:55:53.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (10, 1, 2, CAST(N'2019-03-04T09:40:36.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (11, 51, 1, CAST(N'2019-09-17T19:38:39.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (12, 28, 2, CAST(N'2019-04-16T18:09:32.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (13, 24, 1, CAST(N'2019-05-10T12:22:42.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (14, 37, 2, CAST(N'2019-04-13T08:33:20.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (15, 21, 1, CAST(N'2019-01-31T14:42:16.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (16, 23, 3, CAST(N'2019-03-29T18:41:11.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (17, 45, 1, CAST(N'2019-08-18T14:30:13.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (18, 44, 2, CAST(N'2019-05-19T08:41:55.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (19, 54, 2, CAST(N'2019-03-30T19:10:48.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (20, 95, 1, CAST(N'2019-06-02T14:46:15.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (21, 20, 3, CAST(N'2019-07-05T08:24:15.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (22, 26, 2, CAST(N'2019-08-29T16:31:11.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (23, 38, 3, CAST(N'2019-03-06T11:18:08.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (24, 91, 3, CAST(N'2019-04-03T12:42:05.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (25, 69, 2, CAST(N'2019-02-21T13:28:29.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (26, 76, 1, CAST(N'2019-09-03T17:04:32.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (27, 70, 2, CAST(N'2019-09-26T12:19:46.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (28, 69, 3, CAST(N'2019-09-21T12:53:52.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (29, 15, 1, CAST(N'2019-01-04T08:12:33.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (30, 53, 2, CAST(N'2019-12-07T08:32:42.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (31, 58, 2, CAST(N'2019-06-20T10:54:48.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (32, 35, 1, CAST(N'2019-02-27T08:29:25.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (33, 82, 3, CAST(N'2019-03-02T19:18:48.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (34, 59, 1, CAST(N'2019-07-10T16:39:00.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (35, 65, 3, CAST(N'2019-11-01T19:54:54.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (36, 35, 2, CAST(N'2019-08-26T16:34:31.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (37, 73, 3, CAST(N'2019-08-06T13:00:27.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (38, 25, 2, CAST(N'2019-11-23T16:07:16.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (39, 58, 1, CAST(N'2019-10-15T14:11:24.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (40, 20, 3, CAST(N'2019-03-02T15:31:42.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (41, 99, 3, CAST(N'2019-02-10T14:04:05.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (42, 97, 1, CAST(N'2019-11-29T15:42:24.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (43, 17, 1, CAST(N'2019-07-23T14:24:10.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (44, 25, 2, CAST(N'2019-12-08T17:21:01.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (45, 97, 1, CAST(N'2019-04-09T16:06:23.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (46, 86, 2, CAST(N'2019-02-22T08:55:02.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (47, 76, 2, CAST(N'2019-08-17T11:37:30.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (48, 92, 3, CAST(N'2019-03-11T12:49:22.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (49, 16, 1, CAST(N'2019-03-19T10:57:38.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (50, 31, 1, CAST(N'2019-10-17T17:07:08.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (51, 89, 2, CAST(N'2019-11-26T13:02:13.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (52, 18, 3, CAST(N'2019-02-16T09:44:38.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (53, 20, 3, CAST(N'2019-12-31T17:19:38.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (54, 2, 1, CAST(N'2019-11-19T11:34:00.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (55, 48, 1, CAST(N'2019-09-13T16:55:09.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (56, 72, 2, CAST(N'2019-12-14T10:34:25.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (57, 58, 1, CAST(N'2019-05-20T17:49:34.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (58, 100, 2, CAST(N'2019-03-26T14:45:59.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (59, 57, 2, CAST(N'2019-09-14T19:44:46.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (60, 75, 1, CAST(N'2019-09-06T10:24:55.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (61, 61, 3, CAST(N'2019-05-09T13:33:22.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (62, 93, 2, CAST(N'2019-03-06T13:39:56.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (63, 17, 1, CAST(N'2019-03-29T08:40:19.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (64, 43, 2, CAST(N'2019-07-25T19:00:10.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (65, 3, 3, CAST(N'2019-10-13T09:57:09.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (66, 75, 3, CAST(N'2019-01-06T10:51:04.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (67, 2, 1, CAST(N'2019-04-10T14:04:35.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (68, 83, 1, CAST(N'2019-05-13T17:13:38.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (69, 73, 1, CAST(N'2019-07-25T16:06:16.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (70, 58, 2, CAST(N'2019-03-18T17:03:33.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (71, 21, 3, CAST(N'2019-01-05T13:50:53.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (72, 17, 2, CAST(N'2019-03-25T18:38:55.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (73, 6, 3, CAST(N'2019-08-13T18:20:29.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (74, 62, 2, CAST(N'2019-03-25T10:52:42.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (75, 45, 2, CAST(N'2019-02-18T08:40:43.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (76, 48, 3, CAST(N'2019-02-28T19:19:21.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (77, 65, 1, CAST(N'2019-06-28T15:42:50.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (78, 23, 3, CAST(N'2019-11-04T18:31:26.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (79, 79, 2, CAST(N'2019-11-09T14:55:07.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (80, 53, 2, CAST(N'2019-05-17T09:47:47.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (81, 74, 2, CAST(N'2019-05-29T15:34:54.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (82, 26, 1, CAST(N'2019-04-11T17:27:37.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (83, 69, 1, CAST(N'2019-04-15T11:50:19.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (84, 84, 1, CAST(N'2019-12-04T08:46:24.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (85, 60, 2, CAST(N'2019-02-04T09:53:35.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (86, 2, 3, CAST(N'2019-03-07T15:56:29.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (87, 67, 1, CAST(N'2019-03-04T16:01:38.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (88, 17, 1, CAST(N'2019-10-01T16:57:46.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (89, 72, 1, CAST(N'2019-05-23T10:20:58.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (90, 95, 1, CAST(N'2019-06-10T10:36:57.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (91, 50, 2, CAST(N'2019-04-24T09:16:41.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (92, 80, 2, CAST(N'2019-03-09T14:50:50.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (93, 93, 1, CAST(N'2019-06-09T19:44:58.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (94, 37, 3, CAST(N'2019-10-09T09:47:44.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (95, 84, 3, CAST(N'2019-07-29T08:20:37.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (96, 34, 2, CAST(N'2019-12-16T11:29:06.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (97, 50, 2, CAST(N'2019-08-28T10:57:04.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (98, 64, 2, CAST(N'2019-06-01T10:23:36.000' AS DateTime))
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (99, 37, 1, CAST(N'2019-02-04T19:48:02.000' AS DateTime))
GO
INSERT [dbo].[Sale] ([ID], [ProductID], [Count], [SaleTime]) VALUES (100, 76, 1, CAST(N'2019-10-13T15:39:35.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password]) VALUES (1, N'admin', N'123')
INSERT [dbo].[User] ([ID], [Login], [Password]) VALUES (2, N'user', N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
USE [master]
GO
ALTER DATABASE [EnglishStore_BobrikobAA] SET  READ_WRITE 
GO
