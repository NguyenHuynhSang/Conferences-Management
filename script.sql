USE [master]
GO
/****** Object:  Database [ConferencesManagement]    Script Date: 4/13/2019 10:31:52 PM ******/
CREATE DATABASE [ConferencesManagement]

GO
USE [ConferencesManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[IdAccount] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[TypeAccount] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Event(Schedule)]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event(Schedule)](
	[IdEvent] [int] IDENTITY(1,1) NOT NULL,
	[IdTopic] [int] NOT NULL,
	[ThoiGianBatDau] [datetime] NOT NULL,
	[ThoiGianKetThuc] [datetime] NOT NULL,
	[NgayDienRa] [date] NOT NULL,
 CONSTRAINT [PK_Event(Schedule)] PRIMARY KEY CLUSTERED 
(
	[IdEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoiThao]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiThao](
	[IdHoiThao] [int] IDENTITY(1,1) NOT NULL,
	[NgayDienRa] [datetime] NOT NULL,
	[NoiDienRa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiThao] PRIMARY KEY CLUSTERED 
(
	[IdHoiThao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[IDNews] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](50) NOT NULL,
	[Noidung] [nvarchar](50) NOT NULL,
	[IdHoiThao] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IDNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Speaker]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speaker](
	[IdSpeaker] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerName] [nvarchar](50) NOT NULL,
	[ChucVu(DanhTieng)] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[SDT] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Speaker] PRIMARY KEY CLUSTERED 
(
	[IdSpeaker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongTinUser]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTinUser](
	[IdThongTin] [int] IDENTITY(1,1) NOT NULL,
	[IdAccount] [int] NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[SDT] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[IDTicket] [int] IDENTITY(1,1) NOT NULL,
	[IDAccount] [int] NOT NULL,
	[IDHoiThao] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[IDTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[IdTopic] [int] IDENTITY(1,1) NOT NULL,
	[IdHoiThao] [int] NOT NULL,
	[ChuDe] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[IdSpeaker] [int] NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[IdTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeAccount]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeAccount](
	[IdTypeAccount] [int] NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TypeAccount] PRIMARY KEY CLUSTERED 
(
	[IdTypeAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_TypeAccount] FOREIGN KEY([TypeAccount])
REFERENCES [dbo].[TypeAccount] ([IdTypeAccount])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_TypeAccount]
GO
ALTER TABLE [dbo].[Event(Schedule)]  WITH CHECK ADD  CONSTRAINT [FK_Event(Schedule)_Topic] FOREIGN KEY([IdTopic])
REFERENCES [dbo].[Topic] ([IdTopic])
GO
ALTER TABLE [dbo].[Event(Schedule)] CHECK CONSTRAINT [FK_Event(Schedule)_Topic]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_HoiThao] FOREIGN KEY([IdHoiThao])
REFERENCES [dbo].[HoiThao] ([IdHoiThao])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_HoiThao]
GO
ALTER TABLE [dbo].[ThongTinUser]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinUser_Account] FOREIGN KEY([IdAccount])
REFERENCES [dbo].[Account] ([IdAccount])
GO
ALTER TABLE [dbo].[ThongTinUser] CHECK CONSTRAINT [FK_ThongTinUser_Account]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Account] FOREIGN KEY([IDAccount])
REFERENCES [dbo].[Account] ([IdAccount])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Account]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_HoiThao] FOREIGN KEY([IDHoiThao])
REFERENCES [dbo].[HoiThao] ([IdHoiThao])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_HoiThao]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_HoiThao] FOREIGN KEY([IdHoiThao])
REFERENCES [dbo].[HoiThao] ([IdHoiThao])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_HoiThao]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Speaker] FOREIGN KEY([IdSpeaker])
REFERENCES [dbo].[Speaker] ([IdSpeaker])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Speaker]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 4/13/2019 10:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Account_Login]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@PassWord varchar(50)
AS
BEGIN
	declare @count int
	declare @typeAccount int
	declare @res bit
	select @count=COUNT(*) from Account where Username=@UserName and PassWord=@PassWord
	select @typeAccount =TypeAccount from Account where Username = @UserName 
	if @count>0 and @typeAccount=1
	set @res=1
	else
	set @res=0

	select @res
END

GO


USE [ConferencesManagement]
GO

INSERT INTO [dbo].[TypeAccount]
           ([IdTypeAccount]
           ,[TypeName])
     VALUES
           (1
           ,'admin')
GO

USE [ConferencesManagement]
GO

INSERT INTO [dbo].[Account]
           ([Username]
           ,[Password]
           ,[TypeAccount])
     VALUES
           ('admin',
           'admin',
           1)
GO





GO
USE [master]
GO
ALTER DATABASE [ConferencesManagement] SET  READ_WRITE 
GO
