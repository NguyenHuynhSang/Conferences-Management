USE [master]
GO
/****** Object:  Database [Conferences]    Script Date: 4/29/2019 8:49:20 AM ******/
CREATE DATABASE [Conferences]
GO
ALTER DATABASE [Conferences] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Conferences] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Conferences] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Conferences] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Conferences] SET ARITHABORT OFF 
GO
ALTER DATABASE [Conferences] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Conferences] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Conferences] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Conferences] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Conferences] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Conferences] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Conferences] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Conferences] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Conferences] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Conferences] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Conferences] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Conferences] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Conferences] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Conferences] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Conferences] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Conferences] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Conferences] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Conferences] SET RECOVERY FULL 
GO
ALTER DATABASE [Conferences] SET  MULTI_USER 
GO
ALTER DATABASE [Conferences] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Conferences] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Conferences] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Conferences] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Conferences] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Conferences', N'ON'
GO
ALTER DATABASE [Conferences] SET QUERY_STORE = OFF
GO
USE [Conferences]
GO
/****** Object:  Table [dbo].[About]    Script Date: 4/29/2019 8:49:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](250) NULL,
	[Detall] [ntext] NULL,
	[IsDelete] [bit] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/29/2019 8:49:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[IdAccount] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](20) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[TypeAccount] [int] NOT NULL,
	[IsDelete] [bit] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/29/2019 8:49:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/29/2019 8:49:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[CreatedDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Content] [nvarchar](250) NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 4/29/2019 8:49:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiThao]    Script Date: 4/29/2019 8:49:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHoiThao] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[NgayDienRa] [datetime] NULL,
	[NoiDienRa] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_HoiThao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiThaoDetail]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThaoDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDHoiThao] [bigint] NOT NULL,
	[IDSpeaker] [int] NOT NULL,
 CONSTRAINT [PK_HoiThaoDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](250) NULL,
	[Link] [nvarchar](250) NULL,
	[Targer] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_MeNu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [bigint] NULL,
	[TacGia] [nvarchar](250) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDHoiThao] [bigint] NULL,
	[NgayDienRa] [datetime] NULL,
	[ChiTiet] [nvarchar](500) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleDetail]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDSchedule] [bigint] NULL,
	[TieuDe] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
	[IDSpeaker] [int] NULL,
	[Image] [nvarchar](250) NULL,
	[StartHour] [time](7) NULL,
	[EndHour] [time](7) NULL,
 CONSTRAINT [PK_ScheduleDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHoiThao] [int] NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speaker]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speaker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Speaker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[IDTopic] [bigint] NOT NULL,
	[TopicMenu] [nvarchar](50) NULL,
	[ChuDe] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 4/29/2019 8:49:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeAccount](
	[IdTypeAccount] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](250) NOT NULL,
	[IsDelete] [bit] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_TypeAccount] PRIMARY KEY CLUSTERED 
(
	[IdTypeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (2, N'admin', N'admin', NULL, NULL, NULL, NULL, 1, 0, NULL, CAST(N'2019-04-16T23:03:32.707' AS DateTime), NULL, CAST(N'2019-04-16T23:03:32.707' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (9, N'tester', N'tester', N'0123', N'Nguyễn ', N'HCM', N'adsa@gmail.com', 2, NULL, NULL, NULL, NULL, CAST(N'2019-04-26T17:05:58.060' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (17, N'adminc', N'test1', N'0123456', N'GDgd', N'dfds', N'xcvx@gmail.com', 2, NULL, NULL, CAST(N'2019-04-28T09:47:42.867' AS DateTime), NULL, CAST(N'2019-04-28T09:47:56.663' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status], [DiaChi], [SDT], [Email]) VALUES (2, N'Công ty ABC', 0, N'Nga Nam ', N'0123', N'sfasdsa@gmail.com')
INSERT [dbo].[Contact] ([ID], [Content], [Status], [DiaChi], [SDT], [Email]) VALUES (1002, N'Staup JM', 1, N'HCM', N'012345679', N'asdsz@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [SDT], [DiaChi], [Status], [Content]) VALUES (CAST(N'2019-06-12T00:00:00.000' AS DateTime), 1, N'fb01', N'0123456789', N'hcm', 1, N'test fb01')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [SDT], [DiaChi], [Status], [Content]) VALUES (CAST(N'2019-05-18T00:00:00.000' AS DateTime), 2, N'fb02', N'0987654321', N'hn', 0, N'test fb02')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[HoiThao] ON 

INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Không có hội thảo nào mới', N'Chưa có mô tả nảo hết ấy', NULL, N'Vô cùng', CAST(N'2019-04-18T06:00:04.923' AS DateTime), NULL, CAST(N'2019-04-28T08:18:18.717' AS DateTime), NULL, 0)
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Hội Đồng đan', NULL, NULL, N'HCM', CAST(N'2019-04-18T06:00:55.620' AS DateTime), NULL, CAST(N'2019-04-27T11:16:59.310' AS DateTime), NULL, 0)
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Hội thảo Khoa học Quốc tế ', N'thông báo mời tham dự Hội thảo Khoa học Quốc tế   với chủ đề: Các Phương pháp và Chiến lược dạy học nhằm cải tiến giảng dạy đại học   Chương trình cụ thể như sau:  Thời gian: Từ 8:00 đến 16:30, thứ Sáu, ngày 29 tháng 3 năm 2019   Địa điểm: Phòng D201 - D202, Trường Đại học Khoa học Xã hội & Nhân văn  Số 10-12 Đinh Tiên Hoàng, Phường Bến Nghé, Quận 1, Tp. Hồ Chí Minh  Ngôn ngữ: tiếng Anh, tiếng Việt', CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'HCM', CAST(N'2019-04-27T11:11:07.713' AS DateTime), NULL, CAST(N'2019-04-28T08:29:03.843' AS DateTime), NULL, 1)
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Hội đồng Khoa học Quốc tế', N'Hội đồng Khoa học Quốc tế (tiếng Anh: International Science Council viết tắt là ISC) là tổ chức phi chính phủ, phi lợi nhuận quốc tế cao nhất dành cho hợp tác quốc tế vì sự tiến bộ của khoa học. Các thành viên của ISC là các cơ quan khoa học quốc gia và các liên hiệp khoa học quốc tế.  Hội đồng Khoa học Quốc tế ISC từ tháng 7/2018 là hợp nhất của Hội đồng Quốc tế về Khoa học (ICSU, International Council for Science, dịch là "Hội đồng Khoa học Quốc tế") và Hội đồng Khoa học Xã hội Quốc tế (ISSC, International Social Science Council). Quyết định hợp nhất được đưa ra tại cuộc gặp của ICSU và ISSC ở Đài Bắc, Đài Loan tháng 10/2017 [1][2].  Hội đồng Khoa học Quốc tế trước đây có tên tiếng Anh là International Council for Science), được viết tắt là ICSU theo tên cũ của nóː Hội đồng Quốc tế các Liên hiệp Khoa học. Tính đến năm 2017, ICSU bao gồm 122 thành viên khoa học quốc gia đa ngành, liên kết, các quan sát viên, đại diện cho 142 quốc gia và 31 Liên hiệp khoa học quốc tế [3] và có 22 tổ chức khoa học liên kết.[4]  Trụ sở ISC đặt tại 5 rue Auguste-Vacquerie, 16e arrondissement, Paris, Pháp. Chủ tịch ISC đầu tiên, nhiệm kỳ 2018-2022, là Daya Reddy từ Nam Phi. Giám đốc điều hành từ 3/2015 là Heide Hackmann [5]. Các cựu chủ tịch gần đây có:', CAST(N'2019-09-12T00:00:00.000' AS DateTime), N'Thành phố HCM', CAST(N'2019-04-28T15:34:43.813' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[HoiThao] OFF
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] ON 

INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (1, 1, 1)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (2, 1, 10)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (3, 1, 11)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (4, 1, 12)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10004, 3, 13)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10005, 3, 11)
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (1, N'Trang chủ', N'/Home', N'_blank', 1, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (2, N'Giới Thiệu', N'/gioi-thieu', N' _self', 1, 2, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (4, N'Liên hệ', N'/Contact', N'_self', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chinh')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Tren')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (9, 3, CAST(N'2019-07-06T00:00:00.000' AS DateTime), N'Hội thảo Khoa học Quốc tế 07/Jul/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (10, 3, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Hội thảo Khoa học Quốc tế 07/Jun/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (11, 4, CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'Hội đồng Khoa học Quốc tế20/Sep/2019')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[ScheduleDetail] ON 

INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (1, 1, N'Mo mang', N'Hiha', 2, NULL, CAST(N'05:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (2, 1, N'Dien thuyet', N'haha', 2, NULL, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (3, 2, N'Ket thuc', N'ket thuc', 2, NULL, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10005, 9, N'Mở màng', N'<p>C&agrave; ph&ecirc; c&aacute;c kiểu</p>
', 12, N'/Data/images/schedule_9.jpg', CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10006, 9, N'Thuyết giảng 1', N'<p>Gi&aacute;o sư ABC thuyết giảng về XYZ</p>
', 12, N'/Data/images/gallery_8.jpg', CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10007, 10, N'Bắt đầu ngày 2', N'<p>ads</p>
', 12, N'/Data/images/speaker_6.jpg', CAST(N'14:03:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10008, 10, N'Cà phê tiếp', N'<p>Cafe th&ocirc;i m&agrave;</p>
', 11, N'/Data/images/schedule_9.jpg', CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10010, 10, N'Bế mạc', N'<p>Bế mạc rồi người ơi</p>
', 13, N'/Data/images/blog_1.jpg', CAST(N'21:00:00' AS Time), CAST(N'22:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ScheduleDetail] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (1, 1, N'/Data/files/cuoc-cach-mang-cong-nghiep-4-0-vao-cong-nghe-may-che-bien-go.jpg', CAST(N'2019-04-28T10:47:17.617' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (2, 3, N'/Data/images/bgimage.jpg', CAST(N'2019-04-28T11:32:23.383' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (3, 3, N'/Data/images/bg1.jpg', CAST(N'2019-04-28T11:32:41.743' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (4, 3, N'/Data/images/about_intro_1.jpg', CAST(N'2019-04-28T11:57:08.447' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (5, 3, N'/Data/images/contact_page.jpg', CAST(N'2019-04-28T11:57:24.597' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (6, 3, N'/Data/images/about_intro_2.jpg', CAST(N'2019-04-28T11:57:59.917' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[Speaker] ON 

INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (10, N'Cyber Jone', N'Dr. Analitic', N'test@gmai.com', N'0123456789', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (11, N'Bùi Đang Quy', N'Culi', N'fdg@gmail.com', N'0123456', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4)(1).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (12, N'jeu', N'Dr. Analitic', N'sua', N'144', CAST(N'2019-04-22T09:48:08.737' AS DateTime), N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (13, N'Tony Tèo', N'CEo', N'nguyen@gmail.com', N'012345679', CAST(N'2019-04-27T11:14:31.330' AS DateTime), N'admin', NULL, NULL, 1, N'/Data/files/les.jpg')
SET IDENTITY_INSERT [dbo].[Speaker] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, NULL, 1, N'Menu233123', N'buổi sáng 9 03 am', NULL, CAST(N'2019-06-12T00:00:00.000' AS DateTime), N'admin', NULL, N'admin', 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'http://tapchicongthuong.vn/images/Uploaded/Share/2018/10/23/CMCN-40.jpg', 3, N'Cách mạng Công nghiệp', N'Cách mạng Công nghiệp lần thứ nhất', N'<p><strong>C&aacute;ch mạng C&ocirc;ng nghiệp 4.0</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&quot; đang diễn ra tại nhiều nước ph&aacute;t triển. N&oacute; mang đến cho nh&acirc;n loại cơ hội để thay đổi bộ mặt c&aacute;c nền kinh tế</span></p>
', NULL, NULL, CAST(N'2019-04-28T11:09:45.640' AS DateTime), NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'https://techtalk.vn/wp-content/uploads/2018/07/AI-governance-lead-696x392.jpg', 3, N'Trí tuệ nhân tạo', N'Trí tuệ nhân tạo', N'<p><strong>Tr&iacute; tuệ nh&acirc;n tạo</strong><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;hay&nbsp;</span><strong>tr&iacute; th&ocirc;ng minh nh&acirc;n tạo</strong><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;(</span><a href="https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Anh" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Tiếng Anh">tiếng Anh</a><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">:&nbsp;</span><em>artificial intelligence</em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;hay&nbsp;</span><em>machine intelligence</em><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">, thường được viết tắt l&agrave;&nbsp;</span><strong>AI</strong><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">) l&agrave; tr&iacute; tuệ được biểu diễn bởi bất cứ một hệ thống nh&acirc;n tạo n&agrave;o. Thuật ngữ n&agrave;y thường d&ugrave;ng để n&oacute;i đến c&aacute;c&nbsp;</span><a href="https://vi.wikipedia.org/wiki/M%C3%A1y_t%C3%ADnh" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Máy tính">m&aacute;y t&iacute;nh</a><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;c&oacute; mục đ&iacute;ch kh&ocirc;ng nhất định v&agrave; ng&agrave;nh&nbsp;</span><a href="https://vi.wikipedia.org/wiki/Khoa_h%E1%BB%8Dc" style="text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;" title="Khoa học">khoa học</a><span style="color:rgb(34, 34, 34); font-family:sans-serif; font-size:14px">&nbsp;nghi&ecirc;n cứu về c&aacute;c l&yacute; thuyết v&agrave; ứng dụng của tr&iacute; tuệ nh&acirc;n tạo.</span><sup><a href="https://vi.wikipedia.org/wiki/Tr%C3%AD_tu%E1%BB%87_nh%C3%A2n_t%E1%BA%A1o#cite_note-:0-1" style="text-decoration-line: none; color: rgb(11, 0, 128); background: none;">[1]</a></sup></p>
', NULL, NULL, CAST(N'2019-04-28T11:08:11.597' AS DateTime), NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'http://image.sggp.org.vn/w570/Uploaded/2019/dureixrxkw/2017_05_03/khoa-hoc_jrjx.jpg', 3, N'Công nghệ Vi sinh', N'Công nghệ Vi sinh', N'<p><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">chức năng của Ph&ograve;ng&nbsp;</span><strong>C&ocirc;ng nghệ Vi sinh</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;l&agrave; thực hiện c&aacute;c nghi&ecirc;n cứu cơ bản v&agrave; ứng dụng, ph&aacute;t triển sản phẩm phục vụ n&ocirc;ng nghiệp</span></p>
', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'/Data/files/cuoc-cach-mang-cong-nghiep-4-0-vao-cong-nghe-may-che-bien-go.jpg', 3, N'Cách mạng Công nghiệp 4.0', N'Cách mạng Công nghiệp 4.0', N'<p><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&quot;C&aacute;ch mạng&nbsp;</span><strong>C&ocirc;ng nghiệp 4.0</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&quot; đang diễn ra tại nhiều nước ph&aacute;t triển. N&oacute; mang đến cho nh&acirc;n loại cơ hội để thay đổi bộ mặt c&aacute;c nền kinh tế</span></p>
', NULL, NULL, CAST(N'2019-04-27T12:31:30.237' AS DateTime), NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'https://www.mhlnews.com/sites/mhlnews.com/files/styles/article_featured_retina/public/blockchain_2.gif?itok=skdt98tS', 3, N' Công nghệ blockchain ', N' Công nghệ blockchain ', N'<p>Blockchain l&agrave; một c&ocirc;ng nghệ cho ph&eacute;p truyền tải dữ liệu một c&aacute;ch an to&agrave;n dựa v&agrave;o hệ thống m&atilde; ho&aacute; v&ocirc; c&ugrave;ng phức tạp, &nbsp;tương tự cuốn sổ c&aacute;i kế to&aacute;n của một c&ocirc;ng ty, nơi m&agrave; tiền mặt được gi&aacute;m s&aacute;t chặt chẽ. Trong trường hợp n&agrave;y Blockchain l&agrave; một cuốn sổ c&aacute;i kế to&aacute;n hoạt động trong lĩnh vực kỹ thuật số.</p>

<p>Blockchain sở hữu t&iacute;nh năng v&ocirc; c&ugrave;ng đặc biệt đ&oacute; l&agrave; việc truyền tải dữ liệu kh&ocirc;ng đ&ograve;i hỏi một trung gian để x&aacute;c nhận th&ocirc;ng tin. Hệ thống Blockchain tồn tại rất nhiều n&uacute;t độc lập c&oacute; khả năng x&aacute;c thực th&ocirc;ng tin m&agrave; kh&ocirc;ng đ&ograve;i hỏi &ldquo;dấu hiệu của niềm tin&rdquo;. Th&ocirc;ng tin trong Blockchain kh&ocirc;ng thể bị thay đổi v&agrave; chỉ được bổ sung th&ecirc;m khi c&oacute; sự đồng thuận của tất cả c&aacute;c n&uacute;t trong hệ thống. Đ&acirc;y l&agrave; một hệ thống bảo mật an to&agrave;n cao trước khả năng bị đ&aacute;nh cắp dữ liệu. Ngay cả khi một phần của hệ thống Blockchain sụp đổ, những m&aacute;y t&iacute;nh v&agrave; c&aacute;c n&uacute;t kh&aacute;c sẽ tiếp tục bảo vệ th&ocirc;ng tin v&agrave; giữ cho mạng lưới tiếp tục hoạt động.</p>
', CAST(N'2019-04-27T14:06:30.350' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Topic] OFF
SET IDENTITY_INSERT [dbo].[TypeAccount] ON 

INSERT [dbo].[TypeAccount] ([IdTypeAccount], [TypeName], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (1, N'admin', 0, NULL, CAST(N'2019-04-16T22:57:27.090' AS DateTime), NULL, CAST(N'2019-04-16T22:57:27.090' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TypeAccount] ([IdTypeAccount], [TypeName], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (2, N'guest', 0, NULL, CAST(N'2019-04-16T22:59:55.667' AS DateTime), NULL, CAST(N'2019-04-16T22:59:55.667' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TypeAccount] OFF
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoiThao] ADD  CONSTRAINT [DF_HoiThao_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoiThao] ADD  CONSTRAINT [DF_HoiThao_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Speaker] ADD  CONSTRAINT [DF_Speaker_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Speaker] ADD  CONSTRAINT [DF_Speaker_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [DF_Topic_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TypeAccount] ADD  CONSTRAINT [DF_TypeAccount_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[TypeAccount] ADD  CONSTRAINT [DF_TypeAccount_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TypeAccount] ADD  CONSTRAINT [DF_TypeAccount_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
USE [master]
GO
ALTER DATABASE [Conferences] SET  READ_WRITE 
GO
