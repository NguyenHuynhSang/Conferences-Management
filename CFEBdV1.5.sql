USE [Conferences]
GO
/****** Object:  Table [dbo].[About]    Script Date: 22/04/2019 11:47:54 SA ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[HoiThao]    Script Date: 22/04/2019 11:47:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHoiThao] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiThaoDetail]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 22/04/2019 11:47:55 SA ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 22/04/2019 11:47:56 SA ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 22/04/2019 11:47:56 SA ******/
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
/****** Object:  Table [dbo].[Speaker]    Script Date: 22/04/2019 11:47:56 SA ******/
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
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 22/04/2019 11:47:56 SA ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 22/04/2019 11:47:56 SA ******/
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
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 22/04/2019 11:47:56 SA ******/
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
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (9, N'tester', N'tester', N'0123', N'Nguyễn ', N'HCM', N'adsa@gmail.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([IdAccount], [UserName], [PassWord], [SDT], [HoTen], [DiaChi], [Email], [TypeAccount], [IsDelete], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDescriptions], [Status]) VALUES (10, N'kiki', N'kiki', N'455', N'sda as', N'adsasd ', N'asdads@gmail.com', 2, NULL, NULL, CAST(N'2019-04-22T09:54:19.847' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
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

INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Không có hội thảo nào mới', N'Chưa có mô tả nảo hết ấy', CAST(N'2019-03-06T00:00:00.000' AS DateTime), N'Vô cùng', CAST(N'2019-04-18T06:00:04.923' AS DateTime), NULL, CAST(N'2019-04-18T06:00:04.923' AS DateTime), NULL, 1)
INSERT [dbo].[HoiThao] ([ID], [TenHoiThao], [Content], [NgayDienRa], [NoiDienRa], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Hội Đồng đan', NULL, CAST(N'2019-06-06T00:00:00.000' AS DateTime), N'HCM', CAST(N'2019-04-18T06:00:55.620' AS DateTime), NULL, CAST(N'2019-04-18T06:00:55.620' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[HoiThao] OFF
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] ON 

INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker], [IDAccount]) VALUES (1, 1, 1, 1)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker], [IDAccount]) VALUES (2, 1, 10, 1)
INSERT [dbo].[HoiThaoDetail] ([ID], [IDHoiThao], [IDSpeaker], [IDAccount]) VALUES (3, 1, 11, 1)
SET IDENTITY_INSERT [dbo].[HoiThaoDetail] OFF
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
SET IDENTITY_INSERT [dbo].[Speaker] ON 

INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (1, N'perter', N'dr', N'ajhkjh@gmail.com', N'09876431564', CAST(N'2019-06-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (2, N'Nguyen Huynh Sang', N'asdsa', N'cxzcxzg@gmail.com', N'012354896', NULL, N'admin', NULL, NULL, 1, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (10, N'Cyber Jone', N'Dr. Analitic', N'test@gmai.com', N'0123456789', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (11, N'Bùi Đang Quy', N'Culi', N'fdg@gmail.com', N'0123456', NULL, N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4)(1).png')
INSERT [dbo].[Speaker] ([ID], [Name], [ChucVu], [Email], [SDT], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Image]) VALUES (12, N'jeu', N'Dr. Analitic', N'sua', N'144', CAST(N'2019-04-22T09:48:08.737' AS DateTime), N'admin', NULL, NULL, 1, N'/Data/files/Screenshot%20(4).png')
SET IDENTITY_INSERT [dbo].[Speaker] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, 1, N'Menu 2 ', N'hihi', N'nói rồi mà không tin', CAST(N'2019-04-18T22:54:20.493' AS DateTime), NULL, CAST(N'2019-04-18T22:54:20.493' AS DateTime), NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, NULL, 1, N'topic_edited', NULL, NULL, NULL, NULL, CAST(N'2019-04-21T10:12:31.170' AS DateTime), NULL, 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, NULL, 1, N'topic_updated', N'buổi sáng 9 03 am rooif', NULL, CAST(N'2019-06-12T00:00:00.000' AS DateTime), N'admin', CAST(N'2019-04-21T10:10:10.483' AS DateTime), N'admin', NULL)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, NULL, 1, N'Menu233123', N'buổi sáng 9 03 am', NULL, CAST(N'2019-06-12T00:00:00.000' AS DateTime), N'admin', NULL, N'admin', 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, NULL, 2, N'Menu233123', N'buổi sáng 9 03 am', NULL, CAST(N'2019-06-12T00:00:00.000' AS DateTime), N'admin', NULL, N'admin', 1)
INSERT [dbo].[Topic] ([ID], [Image], [IDTopic], [TopicMenu], [ChuDe], [Content], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, NULL, 2, N'topic_created', N'mới tạo', NULL, NULL, NULL, NULL, N'admin', 1)
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
