USE [master]
GO
/****** Object:  Database [Library]    Script Date: 1/8/2025 7:09:14 AM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = ON
GO
ALTER DATABASE [Library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[B_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NULL,
	[auther] [nvarchar](50) NULL,
	[location] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[p_id] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[B_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrowing]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrowing](
	[B_id] [int] NOT NULL,
	[m_id] [int] NULL,
	[due_date] [date] NULL,
	[return_date] [date] NULL,
	[returned] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[B_id] [int] NOT NULL,
	[c_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[address] [nvarchar](150) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_member] PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[m_id] [int] NOT NULL,
	[phone_n] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher]    Script Date: 1/8/2025 7:09:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
 CONSTRAINT [PK_publisher] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (1, N'أباطيل وأسمار', N'محمود شاكر', N'QA 600.K57 2009', 7, 3)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (2, N'أبيات الاستشهاد دراسة وشرح', N'محمد الحمد', N'PR 9199.3.R59 A6 2018', 3, 20)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (3, N'أروبا والتخلف في افريقيا', N'والتر رودني', N'HF 5548.8 .M74 2020', 9, 10)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (4, N'أسرار العربية', N'الأنباري', N'LB 2395.7 .A37 2015', 2, 14)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (5, N'أسلمة المعرفة المبادئ العامة وخطة العمل', N'د. إسماعيل راجي الفاروقي', N'PS 3563 .C337 W47 2007', 8, 15)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (6, N'أطلس السيرة النبوية', N'المغلوث', N'QC 981.8 .C5 C54 2016', 1, 8)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (7, N'إدارة الوقت بين التراث والمعاصرة', N'محمد امين شحادة', N'HD 30.28 .G85 2021', 5, 9)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (8, N'إشكالية التحيز', N'عبد الوهاب المسيري', N'LB 1027.9 .G46 2014', 4, 21)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (9, N'مداخل الاعجاز', N'محمود شاكر', N'QP 356.46 .S44 2019', 6, 3)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (10, N'ارتياض العلوم', N'مشاري الشثري', N'BF 637 .C6 W55 2017', 10, 17)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (11, N'استراتيجية ابن باديس في تدبر القرآن وأثرها في نهضة الأمة', N'محمد زرمان', N'PR 6063 .C3 Z46 2013', 8, 16)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (12, N'استعمار مصر', N'تيموثي ميتشل', N'HD 57.7 .D687 2011', 2, 19)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (13, N'نمط صعب ونمط مخيف', N'محمود شاكر', N'TR 183 .C38 2005', 7, 3)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (14, N'إغاثة اللهفان في مصائد الشيطان', N'ابن قيم الجوزيه', N'PE 1128 .A2 M37 2010', 3, 18)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (15, N'الظاهرة القرآنية', N'مالك بن نبي', N'QA 76.9 .D343 S66 2012', 5, 1)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (16, N'شروط النهضة', N'مالك بن نبي', N'HF 5387 .B76 2008', 1, 1)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (17, N'اسواق العرب في الجاهلية', N'سعيد الافغاني', N'PN 6727 .O5 M66 2019', 9, 2)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (18, N'اشراقات قرآنية', N'سلمان العودة', N'QA 76.73 .C153 M34 2016', 6, 4)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (19, N'اشهر 50 خرافة في علم النفس', N'جون روشيو', N'RC 451.4 .E93 T46 2014', 4, 13)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (20, N'اطلس الحضارة الإسلامية', N'اسماعيل الفاروقي', N'PS 3603 .H475 W37 2006', 10, 11)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (21, N'اطلس تاريخ الاسلام', N'حسين مؤنس', N'LB 3051 .R43 2018', 3, 6)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (22, N'اقتضاء الصراط المستقيم لمخالفة أصحاب الجحيم', N'ابن تيمية', N'HG 181 .S47 2015', 8, 7)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (23, N'القوس العذراء', N'محمود شاكر', N'QA 76.9 .D5 L56 2020', 7, 3)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (24, N'اقتضاء العلم العمل', N'الخطيب البغدادي', N'HF 5415.1265 .G67 2017', 4, 5)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (25, N' الأخطاء الستة للحركة الإسلامية في المغرب', N'فريد الانصاري', N'PS 3558 .I45 A6 2013', 2, 12)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (26, N'الاعمال الكاملة لمالك بن نبي', N'مالك بن نبي', N'QH 431 .G53 2011', 5, 1)
INSERT [dbo].[Books] ([B_id], [title], [auther], [location], [quantity], [p_id]) VALUES (37, N'الكتاب', N'سيبويه', N'تنايبشتنميبك', 4, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (13, 12, CAST(N'2023-07-21' AS Date), CAST(N'2023-10-21' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (4, 19, CAST(N'2023-11-18' AS Date), CAST(N'2024-08-18' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (22, 6, CAST(N'2024-01-05' AS Date), CAST(N'2024-04-05' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (11, 5, CAST(N'2023-08-14' AS Date), CAST(N'2023-11-14' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (15, 14, CAST(N'2024-01-24' AS Date), CAST(N'2024-04-24' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (22, 18, CAST(N'2023-10-30' AS Date), CAST(N'2024-01-30' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (8, 12, CAST(N'2023-11-01' AS Date), CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (26, 17, CAST(N'2023-09-07' AS Date), CAST(N'2023-12-07' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (22, 7, CAST(N'2023-10-03' AS Date), CAST(N'2024-01-03' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (18, 5, CAST(N'2023-12-29' AS Date), CAST(N'2024-03-29' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (19, 9, CAST(N'2023-10-15' AS Date), CAST(N'2024-01-15' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (2, 10, CAST(N'2023-07-13' AS Date), CAST(N'2023-10-13' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (16, 19, CAST(N'2023-09-27' AS Date), CAST(N'2023-12-27' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (24, 8, CAST(N'2023-08-28' AS Date), CAST(N'2023-11-28' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (17, 5, CAST(N'2023-11-23' AS Date), CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (2, 16, CAST(N'2023-08-01' AS Date), CAST(N'2023-11-01' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (15, 12, CAST(N'2024-01-17' AS Date), CAST(N'2024-04-17' AS Date), 1)
INSERT [dbo].[borrowing] ([B_id], [m_id], [due_date], [return_date], [returned]) VALUES (10, 5, CAST(N'2024-05-05' AS Date), CAST(N'2024-11-20' AS Date), 0)
GO
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (1, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (2, N'لغة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (3, N'تاريخ')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (4, N'لغة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (5, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (6, N'سيرة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (7, N'تطوير الذات')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (8, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (9, N'قرآن')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (9, N'لغة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (10, N'علم')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (11, N'قرآن')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (12, N'تاريخ')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (13, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (14, N'تزكية')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (15, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (16, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (17, N'سيرة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (18, N'قرآن')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (19, N'علم نفس')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (20, N'تاريخ')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (21, N'تاريخ')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (22, N'فقه')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (23, N'لغة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (24, N'علم')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (24, N'وعي')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (25, N'سياسة')
INSERT [dbo].[category] ([B_id], [c_name]) VALUES (26, N'وعي')
GO
SET IDENTITY_INSERT [dbo].[member] ON 

INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (1, N'محمد علي عبدالله', N'123 شارع الجمهورية، القاهرة', N'mohamed.abdelrahman@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (2, N'فاطمة علي حسين', N'456 شارع العباسية، الإسكندرية', N'amira.ali@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (3, N'يوسف محمد علي', N'789 شارع الجيزة، الجيزة', N'youssef.mahmoud@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (4, N'سارة عمر حسن', N'101 شارع مصر الجديدة، القاهرة', N'nour.abdullah@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (5, N'عبدالرحمن علي محمود', N'234 شارع المهندسين، الإسكندرية', N'lamia.mustafa@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (6, N'لينا فوزي حسن', N'567 شارع المنيل، القاهرة', N'ahmed.ibrahim@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (7, N'علياء مصطفى عبدالله', N'890 شارع فيصل، الجيزة', N'marwa.mohamed@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (8, N'حسنين جمال عبدالله', N'1234 شارع الزمالك، القاهرة', N'omar.youssef@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (9, N'نور عادل محمود', N'5678 شارع العابدين، الإسكندرية', N'haidar.emad@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (10, N'محمود أحمد علي', N'91011 شارع المعادي، القاهرة', N'sara.mustafa@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (11, N'سلمى يوسف حسن', N'1213 شارع المنصورة، الإسكندرية', N'mahmoud.hassan@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (12, N'عمر محمود مصطفى', N'1415 شارع الدقي، القاهرة', N'norhan.omar@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (13, N'أميرة محمد علي', N'1617 شارع السلام، الإسكندرية', N'mohamed.omar@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (14, N'حسن عبدالله مصطفى', N'1819 شارع الشيراتون، القاهرة', N'nour.emad@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (15, N'رنا علي حسين', N'2021 شارع الزاوية، الإسكندرية', N'salma.iman@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (16, N'علاء محمد جمال', N'2223 شارع الحرية، القاهرة', N'asmaa.ahmed@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (17, N'جميلة عادل محمود', N'2425 شارع المنصورة، الجيزة', N'omar.youssef@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (18, N'زينب يوسف علي', N'2627 شارع السكة الحديد، الإسكندرية', N'malak.hassan@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (19, N'أحمد حسين محمود', N'2829 شارع الجامعة، القاهرة', N'hani.mustafa@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (20, N'فاطمة جمال عبدالله', N'3031 شارع رمسيس، الإسكندرية', N'fatma.mahmoud@gmail.com')
INSERT [dbo].[member] ([m_id], [name], [address], [Email]) VALUES (26, N'محمد', N'نيمكباشسنب', N'mo@mo')
SET IDENTITY_INSERT [dbo].[member] OFF
GO
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (1, N'01012345678')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (2, N'01123456789')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (3, N'01234567890')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (4, N'01010987654')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (5, N'01198765432')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (6, N'01287654321')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (7, N'01019283746')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (8, N'01128374659')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (9, N'01237465980')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (10, N'01045678901')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (11, N'01134567890')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (12, N'01223456789')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (13, N'01098765432')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (14, N'01187654321')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (15, N'01276543210')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (16, N'01056473829')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (17, N'01167584930')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (18, N'01238475691')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (19, N'01059873624')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (20, N'01198653247')
INSERT [dbo].[phone] ([m_id], [phone_n]) VALUES (26, N'0102345671')
GO
SET IDENTITY_INSERT [dbo].[publisher] ON 

INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (1, N'دار الفكر', N'daralfikr@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (2, N'دار الكتب العلمية', N'daralkutub@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (3, N'شركة القدس للنشر والتوزيع', N'alquds@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (4, N'دار السلام', N'darelsalam@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (5, N'دار الحجاز للنشروالتوزيع', N'daralhijaz@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (6, N'دار سعد الدين', N'darsaad@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (7, N'دار عالم الكتب', N'daralamal@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (8, N'دار الفكر المعاصر', N'daralfikrmaasir@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (9, N'دار إبن الجوزي للنشر', N'ibnuljouzi@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (10, N'المجلس الوطني للثقافة والفنون الأداب', N'almojals@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (11, N'مكتبة العبيكان', N'alobikan@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (12, N'مطبعة الكلمة', N'matbaatkalemah@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (13, N'هنداوي', N'hindawi@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (14, N'دار الأرقم بن أبي الأرقم', N'dararqam@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (15, N'دار البحوث العلمية', N'daralbahoth@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (16, N'جمعية المحافظة على القرآن الكريم', N'jameeatalfizah@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (17, N'مركز البيان', N'markazalbayan@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (18, N'مكتبة الصفا للنشر والتوزيع', N'maktabatsafa@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (19, N'مدارات للأبحاث والنشر', N'madaratresearch@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (20, N'ابن خزيمة', N'ibnkhozima@gmail.com')
INSERT [dbo].[publisher] ([p_id], [name], [Email]) VALUES (21, N'المعهد العالمي للفكر الإسلامي', N'almaahad@gmail.com')
SET IDENTITY_INSERT [dbo].[publisher] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_publisher] FOREIGN KEY([p_id])
REFERENCES [dbo].[publisher] ([p_id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_publisher]
GO
ALTER TABLE [dbo].[borrowing]  WITH CHECK ADD  CONSTRAINT [FK_borrowing_Books] FOREIGN KEY([B_id])
REFERENCES [dbo].[Books] ([B_id])
GO
ALTER TABLE [dbo].[borrowing] CHECK CONSTRAINT [FK_borrowing_Books]
GO
ALTER TABLE [dbo].[borrowing]  WITH CHECK ADD  CONSTRAINT [FK_borrowing_member] FOREIGN KEY([m_id])
REFERENCES [dbo].[member] ([m_id])
GO
ALTER TABLE [dbo].[borrowing] CHECK CONSTRAINT [FK_borrowing_member]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category_Books] FOREIGN KEY([B_id])
REFERENCES [dbo].[Books] ([B_id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category_Books]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_phone_member] FOREIGN KEY([m_id])
REFERENCES [dbo].[member] ([m_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_phone_member]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
