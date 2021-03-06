USE [master]
GO
/****** Object:  Database [Conferences]    Script Date: 7/3/2019 6:18:25 AM ******/
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
/****** Object:  Table [dbo].[About]    Script Date: 7/3/2019 6:18:25 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/3/2019 6:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[IdAccount] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](20) NULL,
	[Image] [nvarchar](250) NULL,
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
/****** Object:  Table [dbo].[Blog]    Script Date: 7/3/2019 6:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDBlogCategory] [nchar](10) NULL,
	[Title] [nvarchar](250) NULL,
	[ShotDescription] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[IDSpeaker] [int] NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 7/3/2019 6:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 7/3/2019 6:18:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHoiNghi] [int] NULL,
	[IDAccount] [int] NULL,
	[NoiDung] [nvarchar](250) NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 7/3/2019 6:18:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[CreatedDate] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[TieuDe] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[HoiThao]    Script Date: 7/3/2019 6:18:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHoiThao] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[NgayDienRa] [datetime2](7) NULL,
	[NoiDienRa] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TrangThaiToChuc] [nvarchar](50) NULL,
	[NgayKetThuc] [datetime2](7) NULL,
 CONSTRAINT [PK_HoiThao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiThaoDetail]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 7/3/2019 6:18:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[content] [nvarchar](250) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[IDHoiThao] [int] NULL,
 CONSTRAINT [PK_LoaiVe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[ScheduleDetail]    Script Date: 7/3/2019 6:18:26 AM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 7/3/2019 6:18:27 AM ******/
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
/****** Object:  Table [dbo].[Speaker]    Script Date: 7/3/2019 6:18:27 AM ******/
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
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 7/3/2019 6:18:27 AM ******/
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
/****** Object:  Table [dbo].[TaiTro]    Script Date: 7/3/2019 6:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiTro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHoiThao] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_TaiTro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 7/3/2019 6:18:27 AM ******/
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
/****** Object:  Table [dbo].[TrangThaiToChuc]    Script Date: 7/3/2019 6:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiToChuc](
	[ID] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrangThaiToChuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 7/3/2019 6:18:27 AM ******/
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
/****** Object:  Table [dbo].[Ve]    Script Date: 7/3/2019 6:18:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDLoaiVe] [int] NULL,
	[NgayMua] [datetime] NULL,
	[IDAccount] [int] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (2, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, CAST(N'2019-04-16T23:03:32.707' AS DateTime), NULL, CAST(N'2019-04-16T23:03:32.707' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (19, N'nguyensang', N'123456', N'012345679', NULL, N'Nguyễn Huỳnh Sáng', N'Thành phố HCM', N'sang@gmail.com', 2, NULL, NULL, CAST(N'2019-05-09T20:07:17.230' AS DateTime), NULL, CAST(N'2019-06-25T22:09:10.853' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (21, N'sang123', N'sang123', N'0123456790', N'/Data/files/97018554-criminal-cat-at-the-police-station-photo-on-white-background.jpg', N'Nguyen Huynh Sang', N'Sóc trăng', N'sang@gmail.com', 1, NULL, NULL, CAST(N'2019-06-25T22:31:29.890' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (22, N'tester123', N'tester123', N'0123456789', N'/Data/files/les.jpg', N'Nguyen van a', N'Soc trang', N'abc@gmail.com', 2, NULL, NULL, CAST(N'2019-07-02T14:08:38.320' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (23, N'test1234', N'test1234', N'0123456789', NULL, N'Nguyễn Hoàng Nam', N'Soc trang', N'abcca@gmail.com', 2, NULL, NULL, CAST(N'2019-07-02T22:16:03.447' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [Image], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (24, N'admincp', N'tester123', N'0123456', N'/Data/files/download.jpg', N'Nguyen van a', N'Soc trang', N'abc@gmail.com', 1, NULL, NULL, CAST(N'2019-07-03T05:15:51.387' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [IDBlogCategory], [Title], [ShotDescription], [Image], [IDSpeaker], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, NULL, N'Phát hiện vụ sáp nhập thiên hà cách đây 13 tỷ năm', N'Nhờ hệ thống kính viễn vọng tại Chile, các nhà khoa học quan sát được vụ sáp nhập thiên hà cổ xưa nhất trong chòm sao Sextans.', N'/Data/files/download.jpg', NULL, N'<h1>Ph&aacute;t hiện vụ s&aacute;p nhập thi&ecirc;n h&agrave; c&aacute;ch đ&acirc;y 13 tỷ năm</h1>

<p>Nhờ hệ thống k&iacute;nh viễn vọng tại Chile, c&aacute;c nh&agrave; khoa học quan s&aacute;t được vụ s&aacute;p nhập thi&ecirc;n h&agrave; cổ xưa nhất trong ch&ograve;m sao Sextans.</p>

<h4><a href="https://vnexpress.net/khoa-hoc/buc-anh-nhin-nguoc-qua-khu-13-3-ty-nam-cua-vu-tru-3918293.html#ctr=related_news_click" style="margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative; padding-left: 10px !important;" title="Bức ảnh nhìn ngược quá khứ 13,3 tỷ năm của vũ trụ">Bức ảnh nh&igrave;n ngược qu&aacute; khứ 13,3 tỷ năm của vũ trụ</a>&nbsp; / &nbsp;<a href="https://vnexpress.net/infographics/ket-qua-vu-va-cham-giua-hai-thien-ha-milky-va-andromeda-3769732.html#ctr=related_news_click" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative;" title="Kết quả vụ va chạm giữa hai thiên hà Milky và Andromeda">Kết quả vụ va chạm giữa hai thi&ecirc;n h&agrave; Milky v&agrave; Andromeda</a></h4>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><img alt="Hình ảnh của hệ thống kính viễn vọng ALMA cho thấy dấu hiệu oxy (xanh lá), carbon (xanh nước biển) và&nbsp;bụi (đỏ) của B14-65666. Ảnh: ALMA/Hubble." src="https://i-vnexpress.vnecdn.net/2019/06/20/Thien-ha1-9920-1561020788.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></td>
		</tr>
		<tr>
			<td>
			<p>H&igrave;nh ảnh của hệ thống k&iacute;nh viễn vọng ALMA cho thấy dấu hiệu oxy (xanh l&aacute;), carbon (xanh nước biển) v&agrave;&nbsp;bụi (đỏ) của B14-65666. Ảnh:&nbsp;<em>ALMA/Hubble.</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p>Nh&oacute;m nghi&ecirc;n cứu Nhật Bản quan s&aacute;t được c&aacute;c dấu hiệu oxy, carbon v&agrave; bụi trong thi&ecirc;n h&agrave; B14-65666 nhờ hệ thống k&iacute;nh viễn vọng ALMA tại Chile,&nbsp;<em>Fox News</em>&nbsp;h&ocirc;m nay đưa tin. Đ&acirc;y l&agrave; thi&ecirc;n h&agrave; cổ xưa nhất t&igrave;m thấy cả ba dấu hiệu n&agrave;y.</p>

<p>Khi so s&aacute;nh c&aacute;c dấu hiệu, nh&oacute;m chuy&ecirc;n gia x&aacute;c định B14-65666 thực chất gồm hai thi&ecirc;n h&agrave; kết hợp lại. Điều n&agrave;y đồng nghĩa đ&acirc;y l&agrave; vụ s&aacute;p nhập thi&ecirc;n h&agrave; cổ xưa nhất từng quan s&aacute;t được.</p>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><img alt="Minh họa hai thiên hà sáp nhập thành&nbsp;B14-65666.  Ảnh: NAOJ." src="https://i-vnexpress.vnecdn.net/2019/06/20/Thien-ha-trong-bai-3714-1561020788.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></td>
		</tr>
		<tr>
			<td>
			<p>Minh họa hai thi&ecirc;n h&agrave; s&aacute;p nhập th&agrave;nh&nbsp;B14-65666. Ảnh:<em>&nbsp;NAOJ.</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p>B14-65666 nằm trong ch&ograve;m sao Sextans. T&iacute;n hiệu từ đ&acirc;y phải vượt qua 13 tỷ năm &aacute;nh s&aacute;ng mới chạm tới Tr&aacute;i Đất, theo Takuya Hashimoto, nh&agrave; nghi&ecirc;n cứu tại Hội ph&aacute;t triển khoa học Nhật Bản v&agrave; Đại học Waseda. Do đ&oacute;, c&aacute;c nh&agrave; khoa học c&oacute; thể quan s&aacute;t h&igrave;nh ảnh B14-65666 c&aacute;ch đ&acirc;y 13 tỷ năm, chưa đầy một tỷ năm sau vụ nổ Big Bang.</p>

<p>&quot;Việc d&ograve; được s&oacute;ng v&ocirc; tuyến từ oxy, carbon v&agrave; bụi ở vật thể như vậy chứng tỏ ALMA c&oacute; khả năng lớn trong việc nghi&ecirc;n cứu kh&ocirc;ng gian xa&quot;, Hashimoto nhận định.</p>

<p>C&aacute;c nh&agrave; khoa học sẽ tiếp tục sử dụng những nghi&ecirc;n cứu tương tự để kh&aacute;m ph&aacute; khởi nguồn của vũ trụ. &quot;Vũ trụ sơ khai c&oacute; vẻ l&agrave; thời kỳ rất th&uacute; vị đối với thi&ecirc;n h&agrave;. Nhiều vụ va chạm dữ dội xảy ra v&agrave; kh&ocirc;ng hề giống c&aacute;c cấu tr&uacute;c c&oacute; trật tự m&agrave; ch&uacute;ng ta thường thấy trong giai đoạn sau&quot;, Dan Marrone, gi&aacute;o sư tại Đại học Arizona, nhận x&eacute;t.</p>
', CAST(N'2019-06-25T20:07:16.590' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[Blog] ([ID], [IDBlogCategory], [Title], [ShotDescription], [Image], [IDSpeaker], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, N'Tên lửa SpaceX sắp mang theo 3,7 tấn vệ tinh lên quỹ đạo', N'Các kỹ sư hoàn tất việc sắp xếp 24 vệ tinh cho lần phóng thứ ba đầy thách thức của tên lửa Falcon Heavy.', N'/Data/files/download%20(2).jpg', NULL, N'<h1>T&ecirc;n lửa SpaceX sắp mang theo 3,7 tấn vệ tinh l&ecirc;n quỹ đạo</h1>

<p>C&aacute;c kỹ sư ho&agrave;n tất việc sắp xếp 24 vệ tinh cho lần ph&oacute;ng thứ ba đầy th&aacute;ch thức của t&ecirc;n lửa Falcon Heavy.</p>

<h4><a href="https://vnexpress.net/khoa-hoc/trung-quoc-lan-dau-tien-phong-thanh-cong-ten-lua-day-tu-mat-bien-3934230.html#ctr=related_news_click" style="margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative; padding-left: 10px !important;" title="Trung Quốc lần đầu tiên phóng thành công tên lửa đẩy từ mặt biển">Trung Quốc lần đầu ti&ecirc;n ph&oacute;ng th&agrave;nh c&ocirc;ng t&ecirc;n lửa đẩy từ mặt biển</a>&nbsp; / &nbsp;<a href="https://vnexpress.net/khoa-hoc/ten-lua-hang-nang-moi-cua-my-phat-no-khi-thu-nghiem-3931606.html#ctr=related_news_click" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative;" title="Tên lửa hạng nặng mới của Mỹ phát nổ khi thử nghiệm">T&ecirc;n lửa hạng nặng mới của Mỹ ph&aacute;t nổ khi thử nghiệm</a></h4>

<p>SpaceX đang chuẩn bị cho lần ph&oacute;ng chở số lượng h&agrave;ng h&oacute;a lớn nhất của t&ecirc;n lửa Falcon Heavy, dự kiến diễn ra tại Trung t&acirc;m Vũ trụ Kennedy, bang Florida, Mỹ, ng&agrave;y 24/6. T&ecirc;n lửa sẽ đưa 24 vệ tinh cho chương tr&igrave;nh Space Test Program-2 (STP-2) của Kh&ocirc;ng qu&acirc;n Mỹ l&ecirc;n quỹ đạo.</p>

<p>Trung t&acirc;m Hệ thống T&ecirc;n lửa v&agrave; Vũ trụ kh&ocirc;ng qu&acirc;n, cơ quan phụ tr&aacute;ch chương tr&igrave;nh STP-2, đăng l&ecirc;n mạng x&atilde; hội h&igrave;nh ảnh 24 vệ tinh b&ecirc;n trong khoang chở h&agrave;ng của Falcon Heavy. &quot;Khối h&agrave;ng nặng 3.700 kg cho STP-2 đ&atilde; được sắp xếp xong. H&atilde;y quan s&aacute;t trước khi t&ecirc;n lửa Falcon Heavy ph&oacute;ng lần đầu ti&ecirc;n cho Bộ Quốc ph&ograve;ng&quot;, trung t&acirc;m n&agrave;y th&ocirc;ng b&aacute;o.</p>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:350px">
	<tbody>
		<tr>
			<td><img alt="Các vệ tinh được đặt bên trong tên lửa Falcon Heavy. Ảnh: Space." src="https://i-vnexpress.vnecdn.net/2019/06/20/24-ve-tinh-trong-bai-1638-1561001607.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></td>
		</tr>
		<tr>
			<td>
			<p>C&aacute;c vệ tinh được đặt b&ecirc;n trong t&ecirc;n lửa Falcon Heavy. Ảnh:&nbsp;<em>Space.</em></p>
			</td>
		</tr>
	</tbody>
</table>

<p>Đ&acirc;y sẽ l&agrave; lần thứ ba SpaceX ph&oacute;ng Falcon Heavy, t&ecirc;n lửa mạnh nhất thế giới, nhưng l&agrave; lần đầu ti&ecirc;n mang nhiều vệ tinh c&ugrave;ng l&uacute;c. Lần ph&oacute;ng đầu ti&ecirc;n l&agrave; một thử nghiệm diễn ra th&aacute;ng 2/2018 nhằm đưa xe điện Tesla v&agrave; người nộm Starman bay v&agrave;o kh&ocirc;ng gian. Th&aacute;ng 4 năm nay, Falcon Heavy tiếp tục đưa Arabsat-6A, vệ tinh lớn nặng 6.460 kg l&ecirc;n quỹ đạo. Hai ống ph&oacute;ng của tầng t&ecirc;n lửa thứ nhất lần đ&oacute; sẽ được t&aacute;i sử dụng cho nhiệm vụ STP-2 sắp tới.</p>

<p>Loạt vệ tinh STP-2 được chế tạo bởi NASA, qu&acirc;n đội, Cục Quản l&yacute; Kh&iacute; quyển v&agrave; Đại dương Quốc gia Mỹ, c&aacute;c nh&oacute;m sinh vi&ecirc;n từ nhiều trường đại học. Trong số n&agrave;y c&oacute; một vệ tinh dạng đồng hồ nguy&ecirc;n tử của NASA v&agrave; vệ tinh để thử nghiệm chất đốt mới cho t&agrave;u vũ trụ.</p>

<p>&quot;Đ&acirc;y sẽ l&agrave; một trong những lần ph&oacute;ng th&aacute;ch thức nhất lịch sử SpaceX với việc đốt ch&aacute;y 4 động cơ tầng tr&ecirc;n ri&ecirc;ng rẽ, ba quỹ đạo triển khai t&aacute;ch biệt v&agrave; tổng thời gian nhiệm vụ hơn 6 tiếng&quot;, SpaceX cho biết. Khả năng chở đồng thời nhiều vệ tinh v&agrave; sử dụng ống ph&oacute;ng t&ecirc;n lửa đẩy cũ l&agrave; những dấu mốc quan trọng trong nhiệm vụ n&agrave;y.</p>

<p>SpaceX thường xuy&ecirc;n t&aacute;i sử dụng c&aacute;c ống ph&oacute;ng tầng đầu ti&ecirc;n của t&ecirc;n lửa Falcon 9 v&agrave; Dragon, t&agrave;u chở h&agrave;ng d&ugrave;ng để đưa h&agrave;ng h&oacute;a của NASA l&ecirc;n Trạm Vũ trụ Quốc tế (ISS). H&atilde;ng n&agrave;y tiếp tục ph&aacute;t triển c&ocirc;ng nghệ t&aacute;i sử dụng t&ecirc;n lửa để giảm chi ph&iacute; du h&agrave;nh vũ trụ.</p>

<p>Trước đ&acirc;y, SpaceX cũng từng ph&oacute;ng c&ugrave;ng l&uacute;c rất nhiều vệ tinh bằng t&ecirc;n lửa Falcon 9. T&ecirc;n lửa n&agrave;y từng đưa 64 vệ tinh nhỏ th&aacute;ng 12/2018 v&agrave; 60 vệ tinh Internet l&ecirc;n quỹ đạo&nbsp;th&aacute;ng 5 năm nay.</p>
', CAST(N'2019-06-25T20:59:37.373' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[Blog] ([ID], [IDBlogCategory], [Title], [ShotDescription], [Image], [IDSpeaker], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, NULL, N'Trận ''sóng thần bia'' càn quét đường phố London năm 1814', N'Trận lụt bia với cơn sóng cao 5 m nằm trong số tai nạn hy hữu và kỳ lạ nhất ở London, từng cướp đi sinh mạng của 8 người.', N'/Data/files/helio-castroneves-quote-ill-do-my-best-thats-all-i-can-promise.jpg', NULL, N'<h1><span style="font-size:14px">Trận &#39;s&oacute;ng thần bia&#39; c&agrave;n qu&eacute;t đường phố London năm 1814</span></h1>

<p><span style="font-size:14px">Trận lụt bia với cơn s&oacute;ng cao 5 m nằm trong số tai nạn hy hữu v&agrave; kỳ lạ nhất ở London, từng cướp đi sinh mạng của 8 người.</span></p>

<h4><span style="font-size:14px"><a href="https://vnexpress.net/khoa-hoc/cong-ty-anh-bien-banh-mi-thua-thanh-bia-3824585.html#ctr=related_news_click" style="margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative; padding-left: 10px !important;" title="Công ty Anh biến bánh mì thừa thành bia">C&ocirc;ng ty Anh biến b&aacute;nh m&igrave; thừa th&agrave;nh bia</a></span></h4>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><span style="font-size:14px"><img alt="Phố New Street chịu ảnh hưởng nặng nề nhất từ trận lụt bia. Ảnh: Drinksfeed." src="https://i-vnexpress.vnecdn.net/2019/06/22/VNE-Beer-5064-1561202900.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></span></td>
		</tr>
		<tr>
			<td>
			<p><span style="font-size:14px">Phố New Street chịu ảnh hưởng nặng nề nhất từ trận lụt bia. Ảnh:&nbsp;<em>Drinksfeed.</em></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:14px">Vụ bể th&ugrave;ng chứa bia xảy ra ở nh&agrave; m&aacute;y nấu bia&nbsp;Meux and Company tr&ecirc;n đường Tottenham Court tại London, quận St Gilest, Anh, v&agrave;o chiều tối h&ocirc;m 17/10/1814, tạo ra trận s&oacute;ng thần cao tới 4,6 m, ph&aacute; hủy nhiều nh&agrave; cửa v&agrave; giết chết 8 người. Nguy&ecirc;n nh&acirc;n tai nạn bắt nguồn từ đoạn đai sắt nặng khoảng 260 kg bao quanh bụng th&ugrave;ng bia cao ngang t&ograve;a nh&agrave; ba tầng tụt khỏi vị tr&iacute;.</span></p>

<p><span style="font-size:14px">Chiếc th&ugrave;ng chứa gần 610.000 l&iacute;t bia bị bung đai bảo vệ v&agrave; vỡ tan t&agrave;nh. Sức mạnh của h&agrave;ng trăm tấn bia đổ &agrave;o ra ph&aacute; hỏng van an to&agrave;n của hai th&ugrave;ng c&ograve;n lại, g&acirc;y ra một vụ nổ d&acirc;y chuyền. Kết quả l&agrave; hơn 1.470.000 l&iacute;t bia c&ugrave;ng c&aacute;c mảnh vỡ cuồn cuộn chảy về ph&iacute;a bức tường đằng sau nh&agrave; m&aacute;y, l&agrave;m bức tường gạch mỏng đổ sập l&ecirc;n người Eleanor Cooper, nh&acirc;n vi&ecirc;n phục vụ ở qu&aacute;n rượu Tavistock Arms s&aacute;t b&ecirc;n cạnh.</span></p>

<p><span style="font-size:14px">Cơn lũ bia tiếp tục tr&agrave;n v&agrave;o c&aacute;c con hẻm, cuốn phăng mọi đồ đạc tr&ecirc;n đường. Do đường phố tại đ&acirc;y kh&ocirc;ng c&oacute; hệ thống tho&aacute;t nước, d&ograve;ng lũ m&agrave;u đen thẳng tiến đến những ng&ocirc;i nh&agrave; ph&iacute;a trước. Người d&acirc;n phải tr&egrave;o l&ecirc;n đồ đạc để khỏi bị chết đuối khi s&oacute;ng thần tr&agrave;n v&agrave;o nh&agrave;.</span></p>

<p><span style="font-size:14px">D&ograve;ng chảy ầm ầm cuốn tr&ocirc;i b&agrave; Mary Banfield v&agrave; con g&aacute;i Hannah 4 tuổi ở một căn nh&agrave; tr&ecirc;n phố New Street, nhấn ch&igrave;m họ giữa biển bia. Căn nh&agrave; cũ kĩ kh&ocirc;ng thể chống đỡ sức c&ocirc;ng ph&aacute; của hơn ngh&igrave;n tấn bia n&ecirc;n đổ sụp, gạch đ&aacute; tr&uacute;t l&ecirc;n đầu những người b&ecirc;n dưới, giết chết Anne Saville, cư d&acirc;n sống ở tầng hầm, c&ugrave;ng 4 người kh&aacute;c tham dự đ&aacute;m tang con trai c&ocirc;.&nbsp;</span></p>

<p><span style="font-size:14px">T&ograve;a &aacute;n ph&aacute;n quyết sự việc xảy ra do nguy&ecirc;n nh&acirc;n nằm ngo&agrave;i tầm kiểm so&aacute;t của con người. Thiệt hại sau trận lụt ước t&iacute;nh khoảng 23.000 bảng Anh. Nh&agrave; m&aacute;y Meux and Company được Quốc hội Anh ho&agrave;n trả tiền thuế 7.250 bảng Anh cho h&agrave;ng triệu l&iacute;t bia bị chảy mất.&nbsp;Tuy nhi&ecirc;n, c&aacute;c nạn nh&acirc;n kh&ocirc;ng nhận được bồi thường. Trận lụt bia n&agrave;y đ&atilde; g&oacute;p phần th&uacute;c đẩy cuộc c&aacute;ch mạng thay thế th&ugrave;ng ủ men bằng gỗ sang th&ugrave;ng l&oacute;t b&ecirc; t&ocirc;ng v&agrave; kim loại.&nbsp;</span></p>
', CAST(N'2019-06-25T21:16:21.867' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[Blog] ([ID], [IDBlogCategory], [Title], [ShotDescription], [Image], [IDSpeaker], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, NULL, N'Bằng chứng đầu tiên về con lai giữa cá voi và kỳ lân biển', N'Các phân tích cho thấy hộp sọ được lưu giữ tại một bảo tàng ở Đan Mạch thuộc về con lai giữa hai loài cá voi ở Bắc Cực.', N'/Data/files/con-lai-1461-1561173373.jpg', NULL, N'<h1>Bằng chứng đầu ti&ecirc;n về con lai giữa c&aacute; voi v&agrave; kỳ l&acirc;n biển</h1>

<p>C&aacute;c ph&acirc;n t&iacute;ch cho thấy hộp sọ được lưu giữ tại một bảo t&agrave;ng ở Đan Mạch thuộc về con lai giữa hai lo&agrave;i c&aacute; voi ở Bắc Cực.</p>

<h4><a href="https://vnexpress.net/khoa-hoc/con-lai-cuc-hiem-giua-gau-bac-cuc-va-gau-xam-3876791.html#ctr=related_news_click" style="margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative; padding-left: 10px !important;" title="Con lai cực hiếm giữa gấu Bắc Cực và gấu xám">Con lai cực hiếm giữa gấu Bắc Cực v&agrave; gấu x&aacute;m</a></h4>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><img alt="Hộp sọ cá voi lai tại&nbsp;Bảo tàng Lịch sử Tự nhiên Đan Mạch. Ảnh: Phys." src="https://i-vnexpress.vnecdn.net/2019/06/22/con-lai-1461-1561173373.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></td>
		</tr>
		<tr>
			<td>
			<p>Hộp sọ c&aacute; voi lai tại&nbsp;Bảo t&agrave;ng Lịch sử Tự nhi&ecirc;n Đan Mạch. Ảnh:&nbsp;<em>Phys</em>.</p>
			</td>
		</tr>
	</tbody>
</table>

<p>C&aacute;c nh&agrave; khoa học từ Đại học Copenhagen, Đan Mạch h&ocirc;m 20/6 cho biết đ&atilde; t&igrave;m thấy bằng chứng đầu ti&ecirc;n về khả năng giao phối ch&eacute;o giữa c&aacute; voi trắng v&agrave; kỳ l&acirc;n biển. C&aacute;c ph&acirc;n t&iacute;ch ADN v&agrave; đồng vị bền tr&ecirc;n một hộp sọ c&aacute; voi &quot;dị thường&quot; được lưu giữ tại Bảo t&agrave;ng Lịch sử Tự nhi&ecirc;n Đan Mạch cho thấy mẫu vật thuộc về một c&aacute; thể lai giữa hai lo&agrave;i.</p>

<p>Kỳ l&acirc;n biển v&agrave; c&aacute; voi trắng l&agrave; hai lo&agrave;i c&aacute; voi c&oacute; răng đặc hữu ở v&ugrave;ng Bắc Cực. Ch&uacute;ng l&agrave; họ h&agrave;ng gần nhất của nhau, c&oacute; k&iacute;ch thước gần tương đương nhưng kh&aacute;c nhau về h&igrave;nh th&aacute;i v&agrave; h&agrave;nh vi. Kỳ l&acirc;n biển đặc trưng bởi chiếc ng&agrave; d&agrave;i, thẳng, c&oacute; r&atilde;nh xoắn ốc v&agrave; th&acirc;n h&igrave;nh m&agrave;u n&acirc;u x&aacute;m. Trong khi đ&oacute;, c&aacute; voi trắng c&oacute; những chiếc răng h&igrave;nh n&oacute;n giống nhau, xếp th&agrave;nh hai h&agrave;ng v&agrave; con trưởng th&agrave;nh c&oacute; m&agrave;u trắng ho&agrave;n to&agrave;n.</p>

<p>Con lai được x&aacute;c định l&agrave; kết quả giao phối ch&eacute;o giữa một con c&aacute; voi trắng đực v&agrave; kỳ l&acirc;n biển c&aacute;i. Hộp sọ n&oacute; c&oacute; nhiều n&eacute;t tương đồng với c&aacute; voi bố mẹ, tuy nhi&ecirc;n, cấu tr&uacute;c răng của con vật lại c&oacute; sự kh&aacute;c biệt lớn. N&oacute; c&oacute; những chiếc răng d&agrave;i nằm ngang, h&igrave;nh xoắn ốc v&agrave; kh&ocirc;ng đồng nhất.</p>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><img alt="Hình ảnh mô phỏng&nbsp;con lai giữa cá voi trắng và kỳ lân biển. Ảnh: Phys." src="https://i-vnexpress.vnecdn.net/2019/06/22/ca-voi-lai-6704-1561173373.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></td>
		</tr>
		<tr>
			<td>
			<p>Đồ họa&nbsp;m&ocirc; phỏng&nbsp;con lai giữa c&aacute; voi trắng v&agrave; kỳ l&acirc;n biển. Ảnh:&nbsp;<em>Phys</em>.</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&quot;Con c&aacute; voi n&agrave;y c&oacute; bộ răng thật kỳ qu&aacute;i. C&aacute;c ph&acirc;n t&iacute;ch đồng vị c&ograve;n cho thấy n&oacute; c&oacute; chế độ ăn ho&agrave;n to&agrave;n kh&aacute;c so với bố mẹ, nguy&ecirc;n nh&acirc;n c&oacute; thể do cấu tr&uacute;c răng ảnh hưởng đến c&aacute;ch t&igrave;m kiếm thức ăn của n&oacute;. Con vật săn mồi ở c&aacute;c cột nước s&acirc;u hoặc b&ecirc;n dưới đ&aacute;y biển&quot;, Tiến sĩ Mikkel Skovrind từ Bảo t&agrave;ng Lịch sử Tự nhi&ecirc;n Đan Mạch, đồng t&aacute;c giả của nghi&ecirc;n cứu cho biết.</p>

<p>C&aacute;c nh&agrave; khoa học chưa x&aacute;c định được nguy&ecirc;n nh&acirc;n th&uacute;c đẩy hai lo&agrave;i giao phối với nhau. Đ&acirc;y l&agrave; một hiện tượng mới, chưa từng được quan s&aacute;t hay ghi lại trước đ&acirc;y. Ph&aacute;t hiện của nh&oacute;m nghi&ecirc;n cứu đ&atilde; được c&ocirc;ng bố tr&ecirc;n tạp ch&iacute;&nbsp;<em>Scientific Reports.</em></p>
', CAST(N'2019-06-25T21:17:47.083' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[Blog] ([ID], [IDBlogCategory], [Title], [ShotDescription], [Image], [IDSpeaker], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, NULL, N'Giải cứu sóc đỏ kẹt đầu trong lỗ cống', N'Sóc đỏ gặp sự cố khiến lính cứu hỏa của thành phố Dortmund phải nạy nắp cống lên mang đến phòng khám thú y.', N'/Data/files/Soc-trong-bai-4006-1561284999.jpg', NULL, N'<h1><span style="font-size:16px">Giải cứu s&oacute;c đỏ kẹt đầu trong lỗ cống</span></h1>

<p><span style="font-size:16px">S&oacute;c đỏ gặp sự cố khiến l&iacute;nh cứu hỏa của th&agrave;nh phố Dortmund phải nạy nắp cống l&ecirc;n mang đến ph&ograve;ng kh&aacute;m th&uacute; y.</span></p>

<h4><span style="font-size:16px"><a href="https://vnexpress.net/khoa-hoc/buc-anh-soc-an-thit-ran-gay-sot-mang-3927739.html#ctr=related_news_click" style="margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; box-sizing: border-box; text-rendering: geometricprecision; color: rgb(102, 102, 102); text-decoration-line: none; display: inline; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: 16px; position: relative; padding-left: 10px !important;" title="Bức ảnh sóc ăn thịt rắn gây sốt mạng">Bức ảnh s&oacute;c ăn thịt rắn g&acirc;y sốt mạng</a></span></h4>

<table align="center" border="0" cellpadding="3" cellspacing="0" class="tplCaption" style="border-collapse:collapse; box-sizing:border-box; margin:10px auto; max-width:100%; padding:0px; text-rendering:geometricprecision; width:500px">
	<tbody>
		<tr>
			<td><span style="font-size:16px"><img alt="Sóc đỏ mắc kẹt khi chui lên từ chiếc lỗ trên nắp cống. Ảnh: Feuerwehr Dortmund." src="https://i-vnexpress.vnecdn.net/2019/06/23/Soc-trong-bai-4006-1561284999.jpg" style="border:0px; box-sizing:border-box; font-size:0px; line-height:0; margin:0px; max-width:100%; padding:0px; text-rendering:geometricprecision" /></span></td>
		</tr>
		<tr>
			<td>
			<p><span style="font-size:16px">S&oacute;c đỏ mắc kẹt khi chui l&ecirc;n từ chiếc lỗ tr&ecirc;n nắp cống. Ảnh:&nbsp;<em>Feuerwehr Dortmund.</em></span></p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:16px">L&iacute;nh cứu hỏa, cảnh s&aacute;t v&agrave; b&aacute;c sĩ th&uacute; y tham gia giải cứu một con s&oacute;c đỏ ở th&agrave;nh phố Dortmund, Đức,&nbsp;<em>Independent&nbsp;</em>h&ocirc;m 22/6 đưa tin. Trước đ&oacute;, Sở cứu hỏa Dortmund nhận được th&ocirc;ng b&aacute;o về việc con s&oacute;c gặp nạn tr&ecirc;n một con đường gần c&ocirc;ng vi&ecirc;n th&agrave;nh phố.</span></p>

<p><span style="font-size:16px">Khi đến nơi, họ thấy n&oacute; th&ograve; đầu l&ecirc;n khỏi một chiếc lỗ tr&ecirc;n nắp cống. Sau v&agrave;i nỗ lực giải tho&aacute;t kh&ocirc;ng th&agrave;nh, nh&oacute;m l&iacute;nh cứu hỏa phải nạy cả chiếc nắp l&ecirc;n v&agrave; đưa đến một ph&ograve;ng kh&aacute;m th&uacute; y. Trong l&uacute;c đ&oacute;, cảnh s&aacute;t được điều tới để canh chừng miệng cống bị hở.</span></p>

<p><span style="font-size:16px">C&aacute;c b&aacute;c sĩ th&uacute; y g&acirc;y m&ecirc; cho s&oacute;c đỏ, cẩn thận đưa n&oacute; ra khỏi chiếc lỗ rồi tiến h&agrave;nh chữa trị c&aacute;c vết thương nhẹ tr&ecirc;n cổ. Con vật sẽ được thả về tự nhi&ecirc;n sau khi phục hồi ho&agrave;n to&agrave;n. Trong khi đ&oacute;, chiếc nắp cống cũng được mang trả về vị tr&iacute; ban đầu.</span></p>
', CAST(N'2019-06-25T21:19:05.443' AS DateTime), N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status], [DiaChi], [SDT], [Email]) VALUES (1002, N'<p>C&ocirc;ng ty tổ chức hội nghị khoa học abc xyz</p>
', 1, N'HCM', N'012345679', N'asdsz@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T21:02:20.693' AS DateTime), 1, N'sad', N'sdas@gmail.com', N'sadas', 1, N'sadfas')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T22:11:52.890' AS DateTime), 2, N'Nguyen Jame', NULL, NULL, NULL, NULL)
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T22:12:38.403' AS DateTime), 3, N'Nguyen Van A', N'xzcxzc@gmail.com', N'asdas', NULL, N'ds asfasf')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T22:20:09.773' AS DateTime), 4, N'ab cuk', N'sdsxxf@gmail.com', N'juk cs a qwrw fsdsa gxbx faf', 1, N'juk cs a qwrw fsdsa gxbx faf')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T22:20:25.333' AS DateTime), 5, N'asda', N'xdzcxzc@gmail.com', N'xzxsd', 1, N'asd')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-04-30T22:33:50.173' AS DateTime), 6, N'Ajura', N'nhgg@gmail', N'nhgg gmailajukr', 1, N'vxv')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-05-03T13:26:27.183' AS DateTime), 7, N'Nguyễn Hoàng ', N'nukecola@gmail.com', N'adas', 1, N'bla bla')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-06-26T23:03:06.900' AS DateTime), 8, N'yup', N'yup', N'yup', 1, N'yup')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-06-26T23:03:17.323' AS DateTime), 9, N'yup', N'yup', N'yup', 1, N'yup')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-07-02T21:32:54.513' AS DateTime), 10, N'a', N'a', N'a', 1, N'a')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-07-02T21:32:59.170' AS DateTime), 11, N'a', N'aa', N'a', 1, N'a')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-07-02T21:35:28.093' AS DateTime), 12, N'a', N'a', N'a', 1, N'a')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-07-02T21:35:31.780' AS DateTime), 13, N'a', N'a', N'a', 1, N'a')
INSERT [dbo].[FeedBack] ([CreatedDate], [ID], [Name], [Email], [TieuDe], [Status], [Content]) VALUES (CAST(N'2019-07-02T21:35:36.593' AS DateTime), 14, N'a', N'âsasa', N'a', 1, N'a')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[HoiThao] ON 

INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (1, N'Không có hội thảo nào mới', N'Chưa có mô tả nảo hết ấy', CAST(N'2020-03-03T00:00:00.0000000' AS DateTime2), N'Vô cùng', CAST(N'2019-04-18T06:00:04.923' AS DateTime), NULL, CAST(N'2019-04-28T08:18:18.717' AS DateTime), NULL, 0, N'Chưa diễn ra', CAST(N'2020-03-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (2, N'Hội Đồng đan', NULL, CAST(N'2020-02-02T00:00:00.0000000' AS DateTime2), N'HCM', CAST(N'2019-04-18T06:00:55.620' AS DateTime), NULL, CAST(N'2019-04-27T11:16:59.310' AS DateTime), NULL, 0, N'Chưa diễn ra', CAST(N'2020-02-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (3, N'Hội thảo Khoa học Quốc tế ', N'<p>th&ocirc;ng b&aacute;o mời tham dự Hội thảo Khoa học Quốc tế với chủ đề: C&aacute;c Phương ph&aacute;p v&agrave; Chiến lược dạy học nhằm cải tiến giảng dạy đại học Chương tr&igrave;nh cụ thể như sau: Thời gian: Từ 8:00 đến 16:30, thứ S&aacute;u, ng&agrave;y 29 th&aacute;ng 3 năm 2019 Địa điểm: Ph&ograve;ng D201 - D202, Trường Đại học Khoa học X&atilde; hội &amp; Nh&acirc;n văn Số 10-12 Đinh Ti&ecirc;n Ho&agrave;ng, Phường Bến Ngh&eacute;, Quận 1, Tp. Hồ Ch&iacute; Minh Ng&ocirc;n ngữ: tiếng Anh, tiếng Việt.</p>
', CAST(N'2019-07-18T00:00:00.0000000' AS DateTime2), N'HCM', CAST(N'2019-04-27T11:11:07.713' AS DateTime), NULL, CAST(N'2019-07-03T05:25:51.357' AS DateTime), N'admin', 1, N'Chưa diễn ra', CAST(N'2019-07-27T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (4, N'Hội thảo lần 4', N'<p>Hội đồng Khoa học Quốc tế (tiếng Anh: International Science Council viết tắt l&agrave; ISC) l&agrave; tổ chức phi ch&iacute;nh phủ, phi lợi nhuận quốc tế cao nhất d&agrave;nh cho hợp t&aacute;c quốc tế v&igrave; sự tiến bộ của khoa học. C&aacute;c th&agrave;nh vi&ecirc;n của ISC l&agrave; c&aacute;c cơ quan khoa học quốc gia v&agrave; c&aacute;c li&ecirc;n hiệp khoa học quốc tế. Hội đồng Khoa học Quốc tế ISC từ th&aacute;ng 7/2018 l&agrave; hợp nhất của Hội đồng Quốc tế về Khoa học (ICSU, International Council for Science, dịch l&agrave; &quot;Hội đồng Khoa học Quốc tế&quot;) v&agrave; Hội đồng Khoa học X&atilde; hội Quốc tế (ISSC, International Social Science Council). Quyết định hợp nhất được đưa ra tại cuộc gặp của ICSU v&agrave; ISSC ở Đ&agrave;i Bắc, Đ&agrave;i Loan th&aacute;ng 10/2017 [1][2]. Hội đồng Khoa học Quốc tế trước đ&acirc;y c&oacute; t&ecirc;n tiếng Anh l&agrave; International Council for Science), được viết tắt l&agrave; ICSU theo t&ecirc;n cũ của n&oacute;ː Hội đồng Quốc tế c&aacute;c Li&ecirc;n hiệp Khoa học. T&iacute;nh đến năm 2017, ICSU bao gồm 122 th&agrave;nh vi&ecirc;n khoa học quốc gia đa ng&agrave;nh, li&ecirc;n kết, c&aacute;c quan s&aacute;t vi&ecirc;n, đại diện cho 142 quốc gia v&agrave; 31 Li&ecirc;n hiệp khoa học quốc tế [3] v&agrave; c&oacute; 22 tổ chức khoa học li&ecirc;n kết.[4] Trụ sở ISC đặt tại 5 rue Auguste-Vacquerie, 16e arrondissement, Paris, Ph&aacute;p. Chủ tịch ISC đầu ti&ecirc;n, nhiệm kỳ 2018-2022, l&agrave; Daya Reddy từ Nam Phi. Gi&aacute;m đốc điều h&agrave;nh từ 3/2015 l&agrave; Heide Hackmann [5]. C&aacute;c cựu chủ tịch gần đ&acirc;y c&oacute;:</p>
', CAST(N'2019-09-13T00:00:00.0000000' AS DateTime2), N'Thành phố HCM', CAST(N'2019-04-28T15:34:43.813' AS DateTime), NULL, CAST(N'2019-06-26T19:57:48.203' AS DateTime), N'admin', 0, N'Chưa diễn ra', CAST(N'2019-09-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (18, N'acascc', N'<p>acascc</p>
', CAST(N'2019-07-02T15:26:01.4756132' AS DateTime2), N'acascc', NULL, NULL, NULL, NULL, 0, N'Đã kết thúc', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (19, N'acascc', N'<p>acascc</p>
', CAST(N'2019-06-30T00:00:00.0000000' AS DateTime2), N'acascc', NULL, NULL, CAST(N'2019-07-02T15:40:37.450' AS DateTime), N'admin', 0, N'Đã kết thúc', CAST(N'2019-07-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (20, N'Hoi thao', N'<p>Hoi thao</p>
', CAST(N'2019-07-02T15:42:36.1910189' AS DateTime2), N'Hoi thao', NULL, NULL, NULL, NULL, 0, N'Đã kết thúc', CAST(N'2019-07-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TrangThaiToChuc], [NgayKetThuc]) VALUES (21, N'côcnut', N'<p>c&ocirc;cnut</p>
', CAST(N'2019-07-02T00:00:00.0000000' AS DateTime2), N'côcnut', CAST(N'2019-07-02T15:44:53.577' AS DateTime), N'admin', NULL, NULL, 0, N'Đã kết thúc', CAST(N'2019-07-03T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[HoiThao] OFF
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] ON 

INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (1, 1, 1)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (4, 1, 12)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10004, 3, 13)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10005, 3, 11)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10006, 3, 10)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10007, 1, 10)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10008, 4, 10)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10009, 3, 12)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10012, 2, 10)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker]) VALUES (10013, 4, 12)
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] OFF
SET IDENTITY_INSERT [dbo].[LoaiVe] ON 

INSERT [dbo].[LoaiVe] ([ID], [Name], [DonGia], [content], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status], [IDHoiThao]) VALUES (1, N'Nhà', 1000000, N'<p>1 day</p>

<p>2 day</p>

<p>3 day</p>
', NULL, CAST(N'2019-06-27T18:33:54.277' AS DateTime), N'admin', NULL, NULL, 1)
INSERT [dbo].[LoaiVe] ([ID], [Name], [DonGia], [content], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status], [IDHoiThao]) VALUES (2, N'Vip', 3000000, N'<p>Option 1</p>

<p>Option 2</p>

<p>Option 3</p>
', NULL, CAST(N'2019-06-27T21:05:35.897' AS DateTime), N'admin', NULL, NULL, 3)
INSERT [dbo].[LoaiVe] ([ID], [Name], [DonGia], [content], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status], [IDHoiThao]) VALUES (3, N'Luxy', 10000, N'<p>Option 1</p>

<p>Option 2</p>

<p>Option 3</p>

<p>&nbsp;</p>
', NULL, CAST(N'2019-06-27T21:07:57.183' AS DateTime), N'admin', NULL, NULL, 3)
INSERT [dbo].[LoaiVe] ([ID], [Name], [DonGia], [content], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status], [IDHoiThao]) VALUES (5, N'basic', 0, N'<p>Option</p>

<p>Option</p>

<p>Option</p>
', NULL, CAST(N'2019-06-27T21:23:59.803' AS DateTime), N'admin', CAST(N'2019-07-03T05:07:45.333' AS DateTime), NULL, 3)
SET IDENTITY_INSERT [dbo].[LoaiVe] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (1, N'Trang chủ', N'/Home', N'_blank', 1, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (2, N'Vé', N'/Ticket', N' _self', 1, 2, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (5, N'Blog', N'/Blog', N'_self', 1, 3, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [Targer], [Status], [DisplayOrder], [TypeID]) VALUES (6, N'Liên hệ', N'/Contact', N'_self', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chinh')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Tren')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (9, 3, CAST(N'2019-07-19T00:00:00.000' AS DateTime), N'Hội thảo Khoa học Quốc tế 19/Thg7/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (10, 3, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'Hội thảo Khoa học Quốc tế 18/Thg7/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (11, 1, CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'Không có hội thảo nào mới19/Thg6/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (12, 21, CAST(N'2019-07-02T00:00:00.000' AS DateTime), N'côcnut02/Thg7/2019')
INSERT [dbo].[Schedule] ([ID], [IDHoiThao], [NgayDienRa], [ChiTiet]) VALUES (13, 3, CAST(N'2019-07-20T00:00:00.000' AS DateTime), N'Hội thảo Khoa học Quốc tế 20/Thg7/2019')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[ScheduleDetail] ON 

INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (1, 1, N'Mo mang', N'Hiha', 2, NULL, CAST(N'05:00:00' AS Time), CAST(N'06:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (2, 1, N'Dien thuyet', N'haha', 2, NULL, CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (3, 2, N'Ket thuc', N'ket thuc', 2, NULL, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10005, 9, N'Mở màng', N'<p>C&agrave; ph&ecirc; c&aacute;c kiểu</p>
', 12, N'/Data/images/schedule_9.jpg', CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10006, 9, N'Thuyết giảng 1', N'<p>Gi&aacute;o sư ABC thuyết giảng về XYZ</p>
', 12, N'/Data/images/gallery_8.jpg', CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10007, 10, N'Bắt đầu ngày 2', N'<p>ads</p>
', 12, N'/Data/images/speaker_6.jpg', CAST(N'14:03:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10008, 10, N'Cà phê tiếp', N'<p>Cafe th&ocirc;i m&agrave;</p>
', 11, N'/Data/images/schedule_9.jpg', CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10010, 10, N'Bế mạc', N'<p>Bế mạc rồi người ơi</p>
', 13, N'/Data/images/blog_1.jpg', CAST(N'21:00:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10011, 9, N'Thuyết giảng 2', N'<p>Noi chuyện c&aacute;c kiểu</p>
', 12, N'/Data/images/gallery_8.jpg', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10012, 11, N'jack', N'<p>nope</p>
', 11, N'/Data/files/con-lai-1461-1561173373.jpg', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10013, 13, N'Hehe', N'<p>Thủ thỉ</p>
', 11, N'/Data/files/VNE-Blue-7117-1560596550.jpg', CAST(N'06:00:00' AS Time), CAST(N'07:00:00' AS Time))
INSERT [dbo].[ScheduleDetail] ([ID], [IDSchedule], [TieuDe], [Content], [IDSpeaker], [Image], [StartHour], [EndHour]) VALUES (10014, 11, N'Hehe', N'<p>abc</p>
', NULL, N'/Data/files/helio-castroneves-quote-ill-do-my-best-thats-all-i-can-promise.jpg', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ScheduleDetail] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (1, 1, N'/Data/files/cuoc-cach-mang-cong-nghiep-4-0-vao-cong-nghe-may-che-bien-go.jpg', CAST(N'2019-04-28T10:47:17.617' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (3, 3, N'/Data/images/bg1.jpg', CAST(N'2019-04-28T11:32:41.743' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (16, 3, N'/Data/images/about_intro_1.jpg', CAST(N'2019-05-03T19:19:34.657' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [IDHoiThao], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (17, 3, N'/Data/images/bgimage.jpg', CAST(N'2019-05-03T21:10:08.080' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[Speaker] ON 

INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (10, N'Cyber Jone', N'Dr. Analitic', N'test@gmai.com', N'0123456789', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (11, N'Bùi Đang Quy', N'Culi', N'fdg@gmail.com', N'0123456', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4)(1).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (12, N'jeu', N'Dr. Analitic', N'sua', N'144', CAST(N'2019-04-22T09:48:08.737' AS DateTime), N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (13, N'Tony Tèo', N'CEo', N'nguyen@gmail.com', N'0123456790', CAST(N'2019-04-27T11:14:31.330' AS DateTime), N'admin', CAST(N'2019-07-02T12:17:40.013' AS DateTime), NULL, 1, N'/Data/files/les.jpg')
SET IDENTITY_INSERT [dbo].[Speaker] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

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
SET IDENTITY_INSERT [dbo].[Ve] ON 

INSERT [dbo].[Ve] ([ID], [IDLoaiVe], [NgayMua], [IDAccount], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (1, 2, NULL, 2, NULL, CAST(N'2019-06-29T20:11:54.620' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Ve] ([ID], [IDLoaiVe], [NgayMua], [IDAccount], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (2, 3, CAST(N'2019-06-29T21:31:27.817' AS DateTime), 21, NULL, CAST(N'2019-06-29T21:31:27.813' AS DateTime), N'sang123', NULL, NULL)
INSERT [dbo].[Ve] ([ID], [IDLoaiVe], [NgayMua], [IDAccount], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (3, 3, CAST(N'2019-07-02T14:42:25.453' AS DateTime), 22, NULL, CAST(N'2019-07-02T14:42:25.450' AS DateTime), N'tester123', NULL, NULL)
INSERT [dbo].[Ve] ([ID], [IDLoaiVe], [NgayMua], [IDAccount], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (6, 3, CAST(N'2019-07-02T22:26:02.083' AS DateTime), 23, NULL, CAST(N'2019-07-02T22:26:02.083' AS DateTime), N'test1234', NULL, NULL)
INSERT [dbo].[Ve] ([ID], [IDLoaiVe], [NgayMua], [IDAccount], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (7, 1, CAST(N'2019-07-03T05:48:24.523' AS DateTime), 2, NULL, CAST(N'2019-07-03T05:48:24.523' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ve] OFF
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
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[BlogCategory] ADD  CONSTRAINT [DF_BlogCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BlogCategory] ADD  CONSTRAINT [DF_BlogCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoiThao] ADD  CONSTRAINT [DF_HoiThao_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoiThao] ADD  CONSTRAINT [DF_HoiThao_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[LoaiVe] ADD  CONSTRAINT [DF_LoaiVe_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LoaiVe] ADD  CONSTRAINT [DF_LoaiVe_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
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
ALTER TABLE [dbo].[TaiTro] ADD  CONSTRAINT [DF_TaiTro_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TaiTro] ADD  CONSTRAINT [DF_TaiTro_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
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
ALTER TABLE [dbo].[Ve] ADD  CONSTRAINT [DF_Ve_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Ve] ADD  CONSTRAINT [DF_Ve_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
USE [master]
GO
ALTER DATABASE [Conferences] SET  READ_WRITE 
GO
