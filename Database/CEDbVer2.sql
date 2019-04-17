USE [master]
GO
/****** Object:  Database [Conferences]    Script Date: 4/17/2019 9:02:40 PM ******/
CREATE DATABASE [Conferences]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Conferences', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JACK\MSSQL\DATA\Conferences.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Conferences_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.JACK\MSSQL\DATA\Conferences_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Conferences] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Conferences].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
ALTER DATABASE [Conferences] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[About]    Script Date: 4/17/2019 9:02:41 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 4/17/2019 9:02:41 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 4/17/2019 9:02:41 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/17/2019 9:02:41 PM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 4/17/2019 9:02:41 PM ******/
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
/****** Object:  Table [dbo].[HoiThao]    Script Date: 4/17/2019 9:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHoiThao] [nvarchar](50) NULL,
	[NgayDienRa] [datetime] NULL,
	[NoiDienRa] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_HoiThao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiThaoDetail]    Script Date: 4/17/2019 9:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThaoDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDHoiThao] [bigint] NOT NULL,
	[IDSpeaker] [int] NOT NULL,
	[IDAccount] [bigint] NOT NULL,
 CONSTRAINT [PK_HoiThaoDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/17/2019 9:02:42 PM ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 4/17/2019 9:02:42 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 4/17/2019 9:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [bigint] NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/17/2019 9:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[Link] [nvarchar](250) NULL,
	[Discription] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Speaker]    Script Date: 4/17/2019 9:02:42 PM ******/
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
 CONSTRAINT [PK_Speaker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 4/17/2019 9:02:42 PM ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 4/17/2019 9:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicDetail]    Script Date: 4/17/2019 9:02:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDTopic] [int] NULL,
	[ChuDe] [nchar](10) NULL,
	[Content] [nvarchar](250) NULL,
 CONSTRAINT [PK_TopicDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 4/17/2019 9:02:42 PM ******/
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
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (3, N'test1', N'test1', N'0123456', N'Nguyen Van B', N'Soc Trang', N'cbvcb', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (4, N'test2', N'test2', N'0123', N'Nguyen Van A', N'Soc Trang', N'adasdas', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (5, N'test2', N'test2', N'0123', N'Nguyen Van A', N'Soc Trang', N'adasdas', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status], [DiaChi], [SDT], [Email]) VALUES (2, N'Công ty ABC', 1, N'Nga Nam ', N'0123', N'sfasdsa@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (1, N'Trang chủ', N'/', N'_blank', 1, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (2, N'Giới Thiệu', N'/gioi-thieu', N' _self', 1, 2, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', N'_self', 1, 3, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (4, N'Liên hệ', N'/Contact', N'_self', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chinh')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Tren')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
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
