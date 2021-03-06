USE [master]
GO
/****** Object:  Database [cmsbak]    Script Date: 2015-05-12 11:03:08 AM ******/
CREATE DATABASE [cmsbak]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cmsbak', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\cmsbak.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cmsbak_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\cmsbak_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cmsbak] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cmsbak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cmsbak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cmsbak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cmsbak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cmsbak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cmsbak] SET ARITHABORT OFF 
GO
ALTER DATABASE [cmsbak] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [cmsbak] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [cmsbak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cmsbak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cmsbak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cmsbak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cmsbak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cmsbak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cmsbak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cmsbak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cmsbak] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cmsbak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cmsbak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cmsbak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cmsbak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cmsbak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cmsbak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cmsbak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cmsbak] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cmsbak] SET  MULTI_USER 
GO
ALTER DATABASE [cmsbak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cmsbak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cmsbak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cmsbak] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [cmsbak]
GO
/****** Object:  Table [dbo].[AddressMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressMaster](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Zip] [varchar](15) NOT NULL,
	[City] [varchar](150) NOT NULL,
	[State] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BulkMailToUser]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BulkMailToUser](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](500) NULL,
	[FileName] [varchar](150) NULL,
	[URL] [varchar](500) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[FileTitle] [varchar](5000) NULL,
	[Creationdate] [datetime] NOT NULL,
	[CreatedBy] [varchar](150) NOT NULL,
 CONSTRAINT [PK_BulkMailToUser] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactPerson]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactPerson](
	[ContactPersonID] [int] IDENTITY(1,1) NOT NULL,
	[ContactPersonName] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[SponsorID] [int] NOT NULL,
 CONSTRAINT [PK_ContactPerson] PRIMARY KEY CLUSTERED 
(
	[ContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentMaster](
	[ContentMasterID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTitle] [varchar](100) NOT NULL,
	[ContentDetails] [nvarchar](max) NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_ContentMaster] PRIMARY KEY CLUSTERED 
(
	[ContentMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] NOT NULL,
	[CountryCodeA2] [char](2) NOT NULL,
	[CountryCodeA3] [char](3) NOT NULL,
	[CountryCodeN3] [int] NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[RegionID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventMaster](
	[EventMasterID] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeID] [int] NULL,
	[EventTitle] [varchar](100) NULL,
	[EventStartDate] [datetime] NULL,
	[EventEndDate] [datetime] NULL,
	[EventLocationAddressID] [int] NULL,
	[EventDetails] [nvarchar](max) NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_EventMaster] PRIMARY KEY CLUSTERED 
(
	[EventMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventSponsorMapping]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSponsorMapping](
	[EventSponsorMapID] [int] IDENTITY(1,1) NOT NULL,
	[EventMasterID] [int] NULL,
	[SponsorID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_EventSponsorMapping] PRIMARY KEY CLUSTERED 
(
	[EventSponsorMapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventTabDetail]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventTabDetail](
	[EventTabDetailID] [int] IDENTITY(1,1) NOT NULL,
	[EventTabTitle] [varchar](100) NULL,
	[EvenTabDescription] [nvarchar](max) NULL,
	[EventMasterID] [int] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_EventTabDetail] PRIMARY KEY CLUSTERED 
(
	[EventTabDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventTypeMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventTypeMaster](
	[EventTypeID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [varchar](100) NULL,
 CONSTRAINT [PK_EventTypeMaster] PRIMARY KEY CLUSTERED 
(
	[EventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileManangementMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileManangementMaster](
	[FileManagementID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](200) NOT NULL,
	[UploadedBy] [varchar](50) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Flag] [bit] NOT NULL,
	[FileTitle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FileManangementMaster] PRIMARY KEY CLUSTERED 
(
	[FileManagementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileTypeMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileTypeMaster](
	[FileTypeMasterID] [int] NOT NULL,
	[FileType] [varchar](50) NOT NULL,
	[FileDescription] [varchar](500) NULL,
 CONSTRAINT [PK_FileTypeMaster] PRIMARY KEY CLUSTERED 
(
	[FileTypeMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GalleryMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GalleryMaster](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[GalleryTitle] [varchar](150) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_GalleryMaster] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImageGalleryMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImageGalleryMaster](
	[ImageGalleryMasterID] [int] IDENTITY(1,1) NOT NULL,
	[GalleryMasterID] [int] NOT NULL,
	[ImageDescription] [varchar](500) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [varchar](150) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Url] [varchar](300) NOT NULL,
	[Flag] [bit] NOT NULL,
 CONSTRAINT [PK_ImageGalleryMaster] PRIMARY KEY CLUSTERED 
(
	[ImageGalleryMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuBarMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuBarMaster](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[URL] [varchar](500) NOT NULL,
	[Position] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_MenuBarMaster] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsLetterAuditInformation]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsLetterAuditInformation](
	[NewsLetterAuditID] [int] IDENTITY(1,1) NOT NULL,
	[EmailID] [varchar](150) NOT NULL,
	[ReferenceType] [int] NOT NULL,
	[ReferneceID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[NoofTrys] [int] NOT NULL,
	[ActionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsLetterAuditInformation] PRIMARY KEY CLUSTERED 
(
	[NewsLetterAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsLetterSubscription]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsLetterSubscription](
	[NewsLetterID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Name] [varchar](150) NULL,
	[Profession] [int] NULL,
	[Status] [bit] NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[VerificationCode] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsLetterSubscription_1] PRIMARY KEY CLUSTERED 
(
	[NewsLetterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsMaster](
	[NewsMasterID] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [varchar](100) NULL,
	[ReleaseDate] [datetime] NULL,
	[AvailableTill] [datetime] NULL,
	[ShortDesc] [varchar](500) NULL,
	[NewsDescription] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_NewsMaster] PRIMARY KEY CLUSTERED 
(
	[NewsMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfessionMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfessionMaster](
	[PID] [int] NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_ProfessionMaster] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReferenceTypeMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferenceTypeMaster](
	[ReferenceTypeID] [int] NOT NULL,
	[ReferenceType] [varchar](150) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sponsors]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sponsors](
	[SponsorID] [int] IDENTITY(1,1) NOT NULL,
	[SponsorName] [varchar](100) NULL,
	[SponsorImage] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[SponsorPriority] [int] NOT NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[SponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[States]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[StateID] [int] NOT NULL,
	[StateCode] [varchar](10) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusMaster](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_StatusMaster] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 2015-05-12 11:03:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [varchar](150) NOT NULL,
	[FullName] [varchar](150) NOT NULL,
	[EmailID] [varchar](150) NOT NULL,
	[UserName] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Gender] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsForcePasswordChange] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AddressMaster] ON 

INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (12, N'fghfhfhgf', N'4654757', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (18, N'dfgdgdg', N'4564564', N'New Delhi', 99, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (19, N'asdasdasd', N'54645', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (20, N'asdasdasd', N'54645', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (21, N'dffgdgff', N'546567', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (22, N'dfggfdfg', N'346456754', N'New Delhi', 97, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (23, N'fdgdgdg', N'565464', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (24, N'dfgdfhf', N'45654654', N'New Delhi', 103, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (25, N'dfgdgdgdfg', N'45654675467', N'New Delhi', 103, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (26, N'jghjgjh', N'6876786', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (27, N'jhhkk', N'6757868', N'New Delhi', 95, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (28, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (29, N'dfgdgfg', N'67575756', N'New Delhi', 99, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (30, N'dfgdgdg', N'ry567567', N'New Delhi', 103, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (31, N'asdasdasd', N'54645', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (32, N'jhhkk', N'6757868', N'New Delhi', 95, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (33, N'jhhkk', N'6757868', N'New Delhi', 95, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (34, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (35, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (36, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (37, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (38, N'dffgdgff', N'546567', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (39, N'dffgdgff', N'546567', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (40, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (41, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (42, N'gfhfh', N'5467567', N'New Delhi', 104, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (43, N'dfgdgdg', N'4564564', N'New Delhi', 99, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (44, N'dfgdgdg', N'4564564', N'New Delhi', 99, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (45, N'dffgdgff', N'546567', N'New Delhi', 100, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (46, N'e-9/2', N'110051', N'delhi', 96, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (47, N'dewdew', N'123', N'delhi', 96, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (48, N'Barakhamba Road', N'110063', N'Delhi', 96, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (49, N'Noida', N'402658', N'Uttar Pradesh', 122, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (50, N'Delhi Secretariat', N'110006', N'Delhi', 96, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (51, N'Hard Rock Cafe: Gurgaon', N'789562', N'Gurgaon', 99, 424, 1)
INSERT [dbo].[AddressMaster] ([AddressID], [Address], [Zip], [City], [State], [Country], [flag]) VALUES (52, N'Sohna Road,Gurgaon', N'889547', N'Gurgaon', 99, 424, 1)
SET IDENTITY_INSERT [dbo].[AddressMaster] OFF
SET IDENTITY_INSERT [dbo].[BulkMailToUser] ON 

INSERT [dbo].[BulkMailToUser] ([MessageID], [Subject], [FileName], [URL], [MessageBody], [FileTitle], [Creationdate], [CreatedBy]) VALUES (8, N'AIMA', N'', NULL, N'&nbsp;hiii this is news letter testing', N'', CAST(0x0000A2F50130DC88 AS DateTime), N'admin@aima.in')
INSERT [dbo].[BulkMailToUser] ([MessageID], [Subject], [FileName], [URL], [MessageBody], [FileTitle], [Creationdate], [CreatedBy]) VALUES (9, N'AIMA', N'', NULL, N'&nbsp;hiii this is news letter testing', N'', CAST(0x0000A2F501310334 AS DateTime), N'admin@aima.in')
SET IDENTITY_INSERT [dbo].[BulkMailToUser] OFF
SET IDENTITY_INSERT [dbo].[ContentMaster] ON 

INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (14, N'Contact Us', N'&lt;p&gt;
&lt;link href="/demo/ContentUser/themes/CSS/ContactUs.css" rel="stylesheet" type="text/css"&gt;&lt;/p&gt;

&lt;div class="MainOuterDiv"&gt;
&lt;div class="topdiv"&gt;
&lt;div class="tabtitle"&gt;&lt;a style="color:white; text-decoration: none;" href="/demo/usersite/index" _fcksavedurl="/demo/usersite/index"&gt; Home &lt;/a&gt;&amp;gt; Contact us&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterContentDiv"&gt;
&lt;div class="CenterLeft"&gt;
&lt;div class="CenterLeft1"&gt;
&lt;div class="CenterLeft11"&gt;
&lt;div class="CenterLeft111"&gt;
&lt;div class="NameFonts"&gt;Mr. Shubham Basu&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="DesignationFonts"&gt;(Dy. Director)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="mailIcon"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="EmailFonts"&gt;sbasu@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft12"&gt;&lt;img src="/demo/ContentUser/themes/Images/noUserimage.gif" _fcksavedurl="/demo/ContentUser/themes/Images/noUserimage.gif" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft1"&gt;
&lt;div class="CenterLeft11"&gt;
&lt;div class="CenterLeft111"&gt;
&lt;div class="NameFonts"&gt;Mr. S C Tyagi&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="DesignationFonts"&gt;(Asst. Director)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="mailIcon"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="EmailFonts"&gt;sctyagi@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft12"&gt;&lt;img src="/demo/ContentUser/themes/Images/noUserimage.gif" _fcksavedurl="/demo/ContentUser/themes/Images/noUserimage.gif" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft1"&gt;
&lt;div class="CenterLeft11"&gt;
&lt;div class="CenterLeft111"&gt;
&lt;div class="NameFonts"&gt;Mr. D K Gupta&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="DesignationFonts"&gt;(Asst. Director)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="mailIcon"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="EmailFonts"&gt;dkgupta@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft12"&gt;&lt;img src="/demo/ContentUser/themes/Images/noUserimage.gif" _fcksavedurl="/demo/ContentUser/themes/Images/noUserimage.gif" width="92" height="92" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft1"&gt;
&lt;div class="CenterLeft11"&gt;
&lt;div class="CenterLeft111"&gt;
&lt;div class="NameFonts"&gt;Mr.Vijay Singh&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="DesignationFonts"&gt;(Manager)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="mailIcon"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="EmailFonts"&gt;vsingh@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft12"&gt;&lt;img src="/demo/ContentUser/themes/Images/noUserimage.gif" _fcksavedurl="/demo/ContentUser/themes/Images/noUserimage.gif" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft1"&gt;
&lt;div class="CenterLeft11"&gt;
&lt;div class="CenterLeft111"&gt;
&lt;div class="NameFonts"&gt;Ms. Mini Khurana&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="DesignationFonts"&gt;(Jr. Manager)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft112"&gt;
&lt;div class="mailIcon"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="EmailFonts"&gt;mkhurana@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterLeft12"&gt;&lt;img src="/demo/ContentUser/themes/Images/noUserimage.gif" _fcksavedurl="/demo/ContentUser/themes/Images/noUserimage.gif" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterRight"&gt;
&lt;div class="AIMATitle"&gt;All India Management Association&lt;/div&gt;
&lt;div class="divline"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="Address"&gt;14, Institutional Area,&lt;/div&gt;
&lt;div class="Address"&gt;Lodhi Road, New Delhi-110003&lt;/div&gt;
&lt;div class="Contacts"&gt;
&lt;div class="telephone"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="TE"&gt;Tel :&lt;/div&gt;
&lt;div class="telno"&gt;011-24608513&lt;/div&gt;
&lt;/div&gt;
&lt;div class="telno2"&gt;011-24608513&lt;/div&gt;
&lt;div class="Contacts"&gt;
&lt;div class="telephone"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="TE"&gt;Ext :&lt;/div&gt;
&lt;div class="telno"&gt;310,332,353,630&lt;/div&gt;
&lt;/div&gt;
&lt;div class="Contacts"&gt;
&lt;div class="faxmachine"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="TE"&gt;Fax :&lt;/div&gt;
&lt;div class="telno"&gt;011-24426689&lt;/div&gt;
&lt;/div&gt;
&lt;div class="Contacts1"&gt;
&lt;div class="mailID"&gt;&amp;nbsp;&lt;/div&gt;
&lt;div class="TE"&gt;Email :&lt;/div&gt;
&lt;div class="emailfont"&gt;managementgames@aima.in&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, CAST(0x0000A31100CCAA88 AS DateTime), N'Admin', 1)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (15, N'About Us', N'&lt;p&gt;
&lt;link href="/demo/ContentUser/themes/CSS/UserAboutUs.css" rel="stylesheet" type="text/css"&gt;&lt;/p&gt;
&lt;div id="divAboutUs"&gt;
&lt;div id="divAboutUsDetailHead"&gt;
&lt;div style=" font-size: 17px; font-family: Segoe UI; padding-top:4px;"&gt;&lt;a href="/demo/userSite/index" _fcksavedurl="/demo/userSite/index" style=" text-decoration: none; color: #FFFFFF;"&gt;Home&lt;/a&gt; &amp;gt; About Us&lt;/div&gt;
&lt;/div&gt;
&lt;div id="AboutUsHead"&gt;Computer Simulated Management Games : A Business Challenge&lt;/div&gt;
&lt;div&gt;
&lt;div style="float: left;" class="textBlue" id="divtextL"&gt;Management Games are simulations where participants are confronted with business                 issues. They are asked to take management decisions and see the business effect                 of such decisions, soon thereafter. Participants play to win, and in seeking to                 win, they imbibe new forms of competitive behavior that are ideal for today''s highly                 chaotic business conditions. The competition urges participants to learn willingly,                 and the in- built interactivity enhances the pace of learning.&lt;/div&gt;
&lt;div style="float: left;" id="divtextR"&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="textBlue"&gt;The frustration and excitement of managing a company from top downwards ensures             that the learning elements are retained with the participants longer.&lt;/div&gt;
&lt;div id="divText1" class="textBlack"&gt;23rd National Competition for Business Management Simulations NMG-2014&lt;/div&gt;
&lt;div id="manualbtn" class="stylebtn"&gt;&lt;a href="http://chanakya.aima.in/demo/Content/File/FilePath/635303088620248750.pdf" _fcksavedurl="http://chanakya.aima.in/demo/Content/File/FilePath/635303088620248750.pdf" style=" text-decoration: none; color: #FFFFFF;"&gt;Participant Manual&lt;/a&gt;&lt;/div&gt;
&lt;div id="divText2"&gt;
&lt;div id="divText21" style="float: left;"&gt;
&lt;div style="float: left;"&gt;
&lt;div id="quesHead"&gt;What Is Business Simulation ?&lt;/div&gt;
&lt;div id="divans" class="textBlue"&gt;Business simulation is a technique for developing, testing, and evaluating business                         strategies in a virtual environment before committing real money and effort in the                         marketplace. With the latest computer technology, state- of-the-art business simulations                         can manage hundreds of variables simulta- neously and provide tremendous realism.                         AIMA creates business simulations using its unique and powerful software model,                         Chanakya®.&lt;/div&gt;
&lt;/div&gt;
&lt;div style="float: left;"&gt;
&lt;div id="quesHead1"&gt;What Is Business Simulation ?&lt;/div&gt;
&lt;div id="divans1" class="textBlue"&gt;Business simulation is a technique for developing, testing, and evaluating business                         strategies in a virtual environment before committing real money and effort in the                         marketplace. With the latest computer technology, state- of-the-art business simulations                         can manage hundreds of variables simulta- neously and provide tremendous realism.                         AIMA creates business simulations using its unique and powerful software model,                         Chanakya®.&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div id="divText22" style="float: left;"&gt;
&lt;div id="quesHead2"&gt;What Will Be The Learnings?&lt;/div&gt;
&lt;div id="divans2" class="textBlue"&gt;You will have a realistic and enjoyable learning experience, where you actually                     manage a muti-million company and benefit with :
&lt;div id="divBulletItem"&gt;
&lt;ul&gt;
    &lt;li&gt;Understanding the cross-functional relationships among various management functions.&lt;/li&gt;
    &lt;li&gt;Exposure of running a company in a simulated environment without causing damage                                 to a live company.&lt;/li&gt;
    &lt;li&gt;Honing operative and strategic decision making skills under                                     constraints of time, finances and information.&lt;/li&gt;
    &lt;li&gt;Understanding the financial implications of the decisions taken. Helping in finding                                 and employing the available information for the data analysis of their own and competitor''s                                 business.&lt;/li&gt;
    &lt;li&gt;Understanding the importance of team work under trying business situations                                     and above all Gets a synoptic view of a company''s operations and experience the                                     thrill of running a company in a competitive environment.&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div style="float: right;" id="bottonbtn"&gt;
&lt;div style="float: left;" class="stylebtn"&gt;&lt;a href="/demo/userSite/DynamicPages?ContentMasterID=17" _fcksavedurl="/demo/userSite/DynamicPages?ContentMasterID=17" style=" text-decoration: none; color: #FFFFFF;"&gt;Track Record&lt;/a&gt;&lt;/div&gt;
&lt;div style="float: left;" class="stylebtn"&gt;&lt;a href="" _fcksavedurl="" style=" text-decoration: none; color: #FFFFFF;"&gt;Newsletter&lt;/a&gt;&lt;/div&gt;
&lt;div style="float: left;" class="stylebtn"&gt;&lt;a href="/demo/userSite/DynamicPages?ContentMasterID=14" _fcksavedurl="/demo/userSite/DynamicPages?ContentMasterID=14" style=" text-decoration: none; color: #FFFFFF;"&gt;Contact Us&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div id="gameType" style="clear: both;"&gt;Types Of Games&lt;/div&gt;
&lt;div id="divLowText"&gt;The Computer Simulated Management Games are available in two forms :&lt;/div&gt;
&lt;div id="gamegrid"&gt;
&lt;div id="gridHead"&gt;
&lt;div style="width: 478px; float: left;" class="gamegridHead"&gt;National Competition&lt;/div&gt;
&lt;div style="width: 493px; float: left;" class="gamegridHead"&gt;In-house/onsite Training&lt;/div&gt;
&lt;/div&gt;
&lt;div id="gamesLink"&gt;
&lt;div style="width: 478px; float: left;" class="gamegridLink"&gt;
&lt;div style="float: left;"&gt;&lt;a href="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=18" _fcksavedurl="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=18"&gt;National Management Games (NMG)&lt;/a&gt;&lt;/div&gt;
&lt;div&gt;&lt;a href="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=19" _fcksavedurl="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=19"&gt;Student Management Games (SMG)&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div style="width: 493px; float: left;" class="gamegridLink"&gt;
&lt;div style="float: left;"&gt;&lt;a href="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=16#a2" _fcksavedurl="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=16#a2"&gt;Corporate Management Games (CMG)&lt;/a&gt;&lt;/div&gt;
&lt;div&gt;&lt;a href="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=16#a1" _fcksavedurl="http://chanakya.aima.in/demo/usersite/DynamicPages?ContentMasterID=16#a1"&gt;Management Institute Games (MIG)&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div&gt;&lt;a href="" _fcksavedurl="" onclick_fckprotectedatt="%20onclick%3D''Slider.showSlider(6)%3Breturn%20false%3B''"&gt;2005&lt;/a&gt;&lt;/div&gt;
&lt;p&gt;&amp;nbsp;&lt;/p&gt;
&lt;p&gt;&lt;a href="" _fcksavedurl="" onclick_fckprotectedatt="%20onclick%3D''Slider.showSlider(6)%3Breturn%20false%3B''"&gt;2005&lt;/a&gt;&lt;/p&gt;', 1, CAST(0x0000A31100C868B0 AS DateTime), N'Admin', 1)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (16, N'Training and Competetion', N'&lt;p&gt;
&lt;link href="/demo/ContentUser/themes/CSS/Game.css" rel="stylesheet" type="text/css"&gt;&lt;/p&gt;
&lt;div class="MainOuterDiv"&gt;
&lt;div class="TopHeading1"&gt;
&lt;div class="tabtitle"&gt;&lt;a style="color:white; text-decoration: none;" href="/demo/usersite/index" _fcksavedurl="/demo/usersite/index"&gt; Home &lt;/a&gt; &amp;gt; Games&lt;/div&gt;
&lt;/div&gt;
&lt;div class="TopHeading2"&gt;
&lt;div class="TopHead2Font"&gt;In House Traning / Competition&lt;/div&gt;
&lt;div class="DivLine"&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="DivText"&gt;Smaller competitions are also conducted on specific request of the Corporates or Management Institutes or Local Management Associations. The Business Simulation Exercise is conducted as In-House Training Program for both Corporate Managers/Executives &amp;amp; B-School Students. As a business challenge, management games are conducted within organisations or institutes as a learning tool. Normally this exercise is conducted over two days of 7-8 hours hours each, including a briefing session of 2 hours.&lt;/div&gt;
&lt;div class="TopHeading2"&gt;&lt;a name="a1"&gt;&lt;/a&gt;
&lt;div class="TopHead2Font"&gt;Corporate Management Games(CMG) / In-house Corporate Games&lt;/div&gt;
&lt;div class="DivLine"&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="DivText2"&gt;In-House Training Program for Corporate: This is meant for the benefit of corporate managers/executives to enhance their business acumen and decision  making skills under pressure situations. AIMA has conducted the Games for over 15,000 participants in 300 corporates across the country during the last ten years. Some of the most recent beneficiaries of the Games are :&lt;/div&gt;
&lt;div class="CenterContent"&gt;
&lt;div class="CenterContent1"&gt;
&lt;div class="CenterCell"&gt;&lt;img class="indianoil" src="/demo/ContentUser/themes/Images/indianoil.png" _fcksavedurl="/demo/ContentUser/themes/Images/indianoil.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="abg" src="/demo/ContentUser/themes/Images/abg.png" _fcksavedurl="/demo/ContentUser/themes/Images/abg.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="abg" src="/demo/ContentUser/themes/Images/jsw.png" _fcksavedurl="/demo/ContentUser/themes/Images/jsw.png" alt=""&gt;
&lt;div class="jswtext"&gt;JSW Steel&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="ntpc" src="/demo/ContentUser/themes/Images/ntpc.png" _fcksavedurl="/demo/ContentUser/themes/Images/ntpc.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="nhpc" src="/demo/ContentUser/themes/Images/nhpc.png" _fcksavedurl="/demo/ContentUser/themes/Images/nhpc.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="nhpc" src="/demo/ContentUser/themes/Images/tatasteel.png" _fcksavedurl="/demo/ContentUser/themes/Images/tatasteel.png" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterContent1"&gt;
&lt;div class="CenterCell"&gt;&lt;img class="bp" src="/demo/ContentUser/themes/Images/bp.png" _fcksavedurl="/demo/ContentUser/themes/Images/bp.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="hh" src="/demo/ContentUser/themes/Images/herohonda.png" _fcksavedurl="/demo/ContentUser/themes/Images/herohonda.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="ap" src="/demo/ContentUser/themes/Images/asianpaints.png" _fcksavedurl="/demo/ContentUser/themes/Images/asianpaints.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="ntpc" src="/demo/ContentUser/themes/Images/larsen.png" _fcksavedurl="/demo/ContentUser/themes/Images/larsen.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="jk" src="/demo/ContentUser/themes/Images/jkindustries.png" _fcksavedurl="/demo/ContentUser/themes/Images/jkindustries.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="cromp" src="/demo/ContentUser/themes/Images/crompton.png" _fcksavedurl="/demo/ContentUser/themes/Images/crompton.png" alt=""&gt;
&lt;div class="crompton"&gt;Crompton Greaves Ltd.&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterContent1"&gt;
&lt;div class="CenterCell"&gt;&lt;img class="maruti" src="/demo/ContentUser/themes/Images/maruti.png" _fcksavedurl="/demo/ContentUser/themes/Images/maruti.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="mmtc" src="/demo/ContentUser/themes/Images/mmtc.png" _fcksavedurl="/demo/ContentUser/themes/Images/mmtc.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="hfcl" src="/demo/ContentUser/themes/Images/hfcl.png" _fcksavedurl="/demo/ContentUser/themes/Images/hfcl.png" alt=""&gt;
&lt;div class="hfclgroup"&gt;HFCL&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="tatapower" src="/demo/ContentUser/themes/Images/tatapower.png" _fcksavedurl="/demo/ContentUser/themes/Images/tatapower.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="tcs" src="/demo/ContentUser/themes/Images/tcs.png" _fcksavedurl="/demo/ContentUser/themes/Images/tcs.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="reliance" src="/demo/ContentUser/themes/Images/reliance.png" _fcksavedurl="/demo/ContentUser/themes/Images/reliance.png" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="CenterContent1"&gt;
&lt;div class="CenterCell"&gt;&lt;img class="sail" src="/demo/ContentUser/themes/Images/sail.png" _fcksavedurl="/demo/ContentUser/themes/Images/sail.png" alt=""&gt;&lt;/div&gt;
&lt;div class="CenterCell"&gt;&lt;img class="cesc" src="/demo/ContentUser/themes/Images/cesc.png" _fcksavedurl="/demo/ContentUser/themes/Images/cesc.png" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="TopHeading2"&gt;&lt;a name="a2"&gt;&lt;/a&gt;
&lt;div class="TopHead2Font"&gt;Management Institute Games / In-house Bschool Games&lt;/div&gt;
&lt;div class="DivLine"&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class="DivText2"&gt;In-House Training Programs or Management Institute Games (MIG) are for the benefit of students of management institutes. This exercise gives them the  chance to implement the Management concepts learnt in their class rooms. In short, it can be defined as complete 2 year MBA programme compressed in 2 days. Some of the most recent beneficiaries are :&lt;/div&gt;
&lt;div class="LowerContent"&gt;
&lt;div class="LowerContent1"&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;IIM -Lucknow&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Xavier(XISS)&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Xavier, Ranchi&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;IIT, Kanpur&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;SCMHRD&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;IFMR, Chennai&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerContent1"&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;FMS,Delhi&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Vignana Jyoti&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;SIIB, Pune&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Sym. Inst. of Bus Mgmt.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;XLRI&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;ICFAI, Hydrabad&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerContent1"&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Birla Inst. of Mgmt. &amp;amp;Tech&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;SCIT,Pune&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;SIBAR, Pune&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;XLRI, Jamshedpur&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;IFMR&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;IFMR&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerContent1"&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;PSGIM, Coimbatore&lt;/div&gt;
&lt;/div&gt;
&lt;div class="LowerCell"&gt;
&lt;div class="LowerCellText"&gt;Jodhpur Inst. of Mgmt.&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="TopHeading2"&gt;
&lt;div class="BottomText"&gt;The feedback from the participants has indeed been very encouraging.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="BottomButton"&gt;
&lt;div class="btn2"&gt;&lt;button id="Brouchure" class="btnSubscribedb"&gt;&lt;a href="http://chanakya.aima.in/demo/Content/File/FilePath/635303087420092500.pdf" _fcksavedurl="http://chanakya.aima.in/demo/Content/File/FilePath/635303087420092500.pdf" style="text-decoration:none; color:white"&gt;Brouchure&lt;/a&gt;&lt;/button&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, CAST(0x0000A2ED00CAB174 AS DateTime), N'Admin', 1)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (17, N'Track Record', N'&lt;link href="/demo/ContentUser/themes/CSS/Tracks.css" rel="stylesheet" type="text/css"&gt;

&lt;div class="MainOuter"&gt;
        &lt;div class="MenuPointer"&gt;
            &lt;div class="TxtMenu"&gt;&lt;a href="/demo/usersite/index" _fcksavedurl="/demo/usersite/index" style="text-decoration:none; color:white"&gt; Home&lt;/a&gt; &amp;gt; Games&lt;/div&gt;

        &lt;/div&gt;
        &lt;div class="TitleDv"&gt;
            Track Record
        &lt;/div&gt;
        &lt;hr class="line"&gt;
        &lt;p class="titletxt"&gt;The simulation Game is recognized to be the fastest and most cost-effective technique to train and test large number of learners, simultaneously. AIMA has 
now conducted the Game for over 20,000 participants in 500 corporates and 200 Business Schools across the country. AIMA is conducting Management 
Games since 1992 for the corporates, B-School edition of Management Games were started in the year 1997. Since then AIMA is conducting these 
Management Games Successfully with the great feedback from the participants.
&lt;/p&gt;
        &lt;div class="IncTag"&gt;Some of the recent beneficiary from Indian Inc.

        &lt;/div&gt;
        &lt;hr class="line"&gt;
        &lt;div class="logo1div"&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/indianoil.png" _fcksavedurl="/demo/ContentUser/themes/Images/indianoil.png" style="width:75px;height:75px;margin-left:20px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Indian Oil Limited&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/mico.png" _fcksavedurl="/demo/ContentUser/themes/Images/mico.png" style="width:120px;height:40px;margin-left:1px;margin-top:20px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;MICO&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/sail.png" _fcksavedurl="/demo/ContentUser/themes/Images/sail.png" style="width:75px;height:75px;margin-left:22px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;SAIL&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/reliance.png" _fcksavedurl="/demo/ContentUser/themes/Images/reliance.png" style="width:100px;height:75px;margin-left:10px;margin-top:2px;"&gt; 
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Reliance Industries&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/herohonda.png" _fcksavedurl="/demo/ContentUser/themes/Images/herohonda.png" style="width:115px;height:30px;margin-left:2px;margin-top:20px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Hero Honda&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/larsen.png" _fcksavedurl="/demo/ContentUser/themes/Images/larsen.png" style="width:110px;height:40px;margin-left:5px;margin-top:20px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;L &amp;amp; T&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/tatasteel.png" _fcksavedurl="/demo/ContentUser/themes/Images/tatasteel.png" style="width:110px;height:60px;margin-left:5px;margin-top:10px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Tata Steel&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                      &lt;img src="/demo/ContentUser/themes/Images/abg.png" _fcksavedurl="/demo/ContentUser/themes/Images/abg.png" style="width:115px;height:70px;margin-left:2px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Aditya Birla Group&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                      &lt;img src="/demo/ContentUser/themes/Images/ntpc.png" _fcksavedurl="/demo/ContentUser/themes/Images/ntpc.png" style="width:100px;height:60px;margin-left:10px;margin-top:10px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;NTPC&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/maruti.png" _fcksavedurl="/demo/ContentUser/themes/Images/maruti.png" style="width:100px;height:70px;margin-left:10px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Maruti Udyog&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/bhel.png" _fcksavedurl="/demo/ContentUser/themes/Images/bhel.png" style="width:110px;height:70px;margin-left:5px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;BHEL&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/Siemens.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/Siemens.jpg" style="width:110px;height:30px;margin-left:5px;margin-top:25px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Siemens&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                         &lt;img src="/demo/ContentUser/themes/Images/tatapower.png" _fcksavedurl="/demo/ContentUser/themes/Images/tatapower.png" style="width:110px;height:70px;margin-left:5px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;TATA Power&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/ongc.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/ongc.jpg" style="width:100px;height:70px;margin-left:10px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;ONGC&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                         &lt;img src="/demo/ContentUser/themes/Images/asianpaints.png" _fcksavedurl="/demo/ContentUser/themes/Images/asianpaints.png" style="width:115px;height:20px;margin-left:2px;margin-top:30px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Asian Paints&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/philips2.png" _fcksavedurl="/demo/ContentUser/themes/Images/philips2.png" style="width:80px;height:70px;margin-left:20px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Philips&lt;/div&gt;
            &lt;/div&gt;
            
         
        &lt;/div&gt;
          &lt;div class="IncTag1"&gt;Some of the recent beneficiary from Management Institutes Include:
        &lt;/div&gt;
        &lt;hr class="line"&gt;
        &lt;div class="logo2div"&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/iitkanpur.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/iitkanpur.jpg" style="width:100px;height:77px;margin-left:14px;margin-top:1px;"&gt; 
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;IIT -Kanpur&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/bimt.jpeg" _fcksavedurl="/demo/ContentUser/themes/Images/bimt.jpeg" style="width:120px;height:50px;margin-left:3px;margin-top:10px;"&gt; 
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Birla Inst. Of MgmT. Tech.&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/vjiet.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/vjiet.jpg" style="width:120px;height:75px;margin-left:5px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Xavier Vignana Jyoti- Hyd.&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/xlrijamshedpur.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/xlrijamshedpur.jpg" style="width:120px;height:60px;margin-left:3px;margin-top:10px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;XLRI- Jamshedpur&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/iimluknow.png" _fcksavedurl="/demo/ContentUser/themes/Images/iimluknow.png" style="width:120px;height:75px;margin-left:3px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;IIM- Lucknow&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/skc.gif" _fcksavedurl="/demo/ContentUser/themes/Images/skc.gif" style="width:110px;height:70px;margin-left:10px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Shri Krishna Colg- Coimbt.&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/icfai.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/icfai.jpg" style="width:120px;height:50px;margin-left:5px;margin-top:15px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;ICFAI&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                    &lt;img src="/demo/ContentUser/themes/Images/fms.png" _fcksavedurl="/demo/ContentUser/themes/Images/fms.png" style="width:120px;height:70px;margin-left:5px;margin-top:5px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;FMS-Delhi&lt;/div&gt;
            &lt;/div&gt;
         &lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                     &lt;img src="/demo/ContentUser/themes/Images/nmims.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/nmims.jpg" style="width:120px;height:75px;margin-left:5px;margin-top:2px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;NMIMS Bombay&lt;/div&gt;
            &lt;/div&gt;&lt;div class="logodiv"&gt;
                &lt;div class="lgo1"&gt;
                   &lt;img src="/demo/ContentUser/themes/Images/simspune.jpg" _fcksavedurl="/demo/ContentUser/themes/Images/simspune.jpg" style="width:120px;height:50px;margin-left:3px;margin-top:15px;"&gt;
                &lt;/div&gt;
                 &lt;div class="logotxt"&gt;Symbosis-Pune&lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 1, CAST(0x0000A2EB00B38440 AS DateTime), N'Admin', 1)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (18, N'gallery', N'&lt;link href="/demo/ContentUser/themes/CSS/NationalManagement.css" rel="stylesheet" type="text/css"&gt;

&lt;div class="design123"&gt;&lt;/div&gt;
   &lt;div class="design123"&gt;&lt;/div&gt;
    &lt;div class="design123"&gt;&lt;/div&gt;
    &lt;div class="design123"&gt;&lt;/div&gt;
    &lt;div class="design123"&gt;&lt;/div&gt;
    &lt;div class="design123"&gt;&lt;/div&gt;
        &lt;div class="design123"&gt;&lt;/div&gt;
        &lt;div class="design123"&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 1, CAST(0x0000A49300A68D80 AS DateTime), N'Admin', 1)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (19, N'Student Management Games', N'&lt;p&gt;
&lt;link href="/demo/ContentUser/themes/CSS/StudentManagementSyst.css" rel="stylesheet" type="text/css"&gt;&lt;/p&gt;
&lt;div class="MainOuter"&gt;
&lt;div class="MenuPointer"&gt;
&lt;div class="TxtMenu"&gt;Home &amp;gt;Student Management Games&lt;/div&gt;
&lt;/div&gt;
&lt;div class="TitleDv"&gt;Student Management Games&lt;/div&gt;
&lt;hr class="line"&gt;
&lt;p class="titletxt"&gt;These are organised primarily for students of business schools to help them hone their decision-making skills in a realistic simulated business environment. SMG is meant for students of Business Schools as National Championship. These Games are computer-based simulations that imitate market and economic  reality. Students get the opportunity to augment the management methodologies, tools and techniques learnt at their B-School. SMG is held during August  - September - October of every calendar year. Since launch of SMG in 1997, over 12,000 students from 250 B-Schools have benefited from this unique learning experience in a competitive environment.&lt;/p&gt;
&lt;div class="IncTag"&gt;The Winners&lt;/div&gt;
&lt;hr class="line"&gt;
&lt;div class="centerdiv"&gt;
&lt;div class="OuterCenter"&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2011 : 265 Teams - 98 B-Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winner – ICAI, Kolkata&lt;br&gt;
Runners Up -  Institute of Mgmt, Nirma&lt;br&gt;
University, Ahmedabad&lt;br&gt;
Runners Up II – Calcutta Business School.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2010 :  279 Teams - 110  B-Schools          &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners: MSM, Meerut&lt;br&gt;
Runners UP: BBCIT, Hyderabad&lt;br&gt;
Runner UP II: SKIM, Coimbatore&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2008 : 275 Teams - 102 B-Schools          &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners - ICFAI Business School, Mumbai&lt;br&gt;
2nd - ICFAI Business School, Mumbai&lt;br&gt;
3rd - BBCIT, Hyderabad.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2006 : 231 Teams – 90 B Schools          &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners – ICFAI Business School, Mumbai&lt;br&gt;
2nd - MSM, Meerut&lt;br&gt;
3rd - Xavier Vignana Jyoti, Hyderabad&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2004 : 166 Teams – 78 B Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners – IIFM, Bhopal&lt;br&gt;
2nd &amp;amp; 3rd - Institute of Finance &amp;amp; International&lt;br&gt;
Management, Bangalore.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2003 : 166 Teams – 80 B Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winner - SIIB, Pune &lt;br&gt;
2nd - MSRIM, Bangalore&lt;br&gt;
3rd - ICFAI Business School, Mumbai.&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2009 : 278 Teams - 104  B-Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners : NILM, New Delhi&lt;br&gt;
RunnersUp : MSM, Meerut &lt;br&gt;
Runners Up-II  MSM, Meerut&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2005 : 211 Teams – 87 B Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winners - PSG Tech, Coimbatore&lt;br&gt;
2nd - BIM, Trichy&lt;br&gt;
3rd - ICFAI Business School, Mumbai&lt;/div&gt;
&lt;/div&gt;
&lt;div class="InnerCenter"&gt;&lt;span class="WT"&gt;         SMG 2002: 147 Teams - 76 B Schools         &lt;/span&gt;
&lt;div class="txtxt"&gt;Winner – FMS, Delhi&lt;br&gt;
2nd &amp;amp; 3rd - GRD Institute of Management,&lt;br&gt;
Coimbatore.&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="galldiv"&gt;
&lt;div class="headergall"&gt;&lt;img src="/demo/ContentUser/themes/Images/pg.png" _fcksavedurl="/demo/ContentUser/themes/Images/pg.png" style="margin-top:5px; margin-left:7px; float:left" alt=""&gt;
&lt;div class="TxtMenu"&gt;Photo Gallery&lt;/div&gt;
&lt;div class="innerfolder"&gt;
&lt;div class="photogallery"&gt;&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; 16th Student Mgmt. (SMG 2012)&lt;br&gt;
&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; Photo Gallery (NSMG 2011)&lt;br&gt;
&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; Photo Gallery (NSMG 2010)&lt;br&gt;
&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; Photo Gallery (NSMG 2009)&lt;br&gt;
&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; Photo Gallery (NSMG 2008)&lt;br&gt;
&lt;img src="/demo/ContentUser/themes/Images/gall2.png" _fcksavedurl="/demo/ContentUser/themes/Images/gall2.png" alt=""&gt; Photo Gallery (NSMG 2007)&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;div class="btnouter"&gt;
&lt;div class="btntxtxt"&gt;&lt;a href="http://chanakya.aima.in/demo/Content/File/FilePath/635303088620248750.pdf" _fcksavedurl="http://chanakya.aima.in/demo/Content/File/FilePath/635303088620248750.pdf" style="text-decoration:none; color:white;"&gt;Download Participant Manual&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, CAST(0x0000A4910174678C AS DateTime), N'Admin', 0)
INSERT [dbo].[ContentMaster] ([ContentMasterID], [ContentTitle], [ContentDetails], [StatusID], [CreationDate], [CreatedBy], [Flag]) VALUES (20, N'abc', N'&amp;nbsp;Near miss by Etihad, Emirates flights over Mumbai airspace
While Emirates confirmed the incident in a statement from Dubai, Etihad when contacted said it will respond soon.
RELATED
AI''s 26-yr-old plane flies back to Delhi after wheel snagEmirates fined for forcing passenger to fly sans seat beltDelhi airport had most number of bird hits in 2014
MUMBAI: An Emirates and an Etihad aircraft, flying in opposite directions came in proximity of each other over the Indian Ocean, leading to a collision alert warning in the two cockpits on Sunday night. The Indian aviation regulator - the Directorate General of Civil Aviation (DGCA) - has initiated an inquiry into the near-miss incident.

The Emirates flight EK-706 was flying to its base in Dubai from Seychelles, while Etihad flight EY-622 was enroute to Seychelles from Abu Dhabi.

"Emirates can confirm that flight EK 706 on March 29 from Seychelles to Dubai was involved in an air traffic control incident in Mumbai airspace. At no point was the aircraft, passengers or crew at risk,'''' said the airline in a statement issued on Tuesday.', 1, CAST(0x0000A46C0170B5D8 AS DateTime), N'Admin', 0)
SET IDENTITY_INSERT [dbo].[ContentMaster] OFF
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (326, N'AF', N'AFG', 4, N'Afghanistan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (327, N'AL', N'ALB', 8, N'Albania', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (328, N'DZ', N'DZA', 12, N'Algeria', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (329, N'AS', N'ASM', 16, N'American Samoa', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (330, N'AD', N'AND', 20, N'Andorra', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (331, N'AO', N'AGO', 24, N'Angola', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (332, N'AI', N'AIA', 660, N'Anguilla', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (333, N'AQ', N'ANT', 10, N'Antarctica', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (334, N'AG', N'ATG', 28, N'Antigua and Barbuda', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (335, N'AR', N'ARG', 32, N'Argentina', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (336, N'AM', N'ARM', 51, N'Armenia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (337, N'AW', N'ABW', 533, N'Aruba', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (338, N'AU', N'AUS', 36, N'Australia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (339, N'AT', N'AUT', 40, N'Austria', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (340, N'AZ', N'AZE', 31, N'Azerbaijan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (341, N'BS', N'BHS', 44, N'Bahamas', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (342, N'BH', N'BHR', 48, N'Bahrain', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (343, N'BD', N'BGD', 50, N'Bangladesh', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (344, N'BB', N'BRB', 52, N'Barbados', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (345, N'BY', N'BLR', 112, N'Belarus', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (346, N'BE', N'BEL', 56, N'Belgium', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (347, N'BZ', N'BLZ', 84, N'Belize', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (348, N'BJ', N'BEN', 204, N'Benin', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (349, N'BM', N'BMU', 60, N'Bermuda', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (350, N'BT', N'BTN', 64, N'Bhutan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (351, N'BO', N'BOL', 68, N'Bolivia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (352, N'BA', N'BIH', 70, N'Bosnia and Herzegovina', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (353, N'BW', N'BWA', 72, N'Botswana', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (354, N'BV', N'   ', 74, N'Bouvet Island', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (355, N'BR', N'BRA', 76, N'Brazil', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (356, N'IO', N'   ', 86, N'British Indian Ocean Territory', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (357, N'BN', N'BRN', 96, N'Brunei Darussalam', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (358, N'BG', N'BGR', 100, N'Bulgaria', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (359, N'BF', N'BFA', 854, N'Burkina Faso', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (360, N'BI', N'BDI', 108, N'Burundi', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (361, N'KH', N'KHM', 116, N'Cambodia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (362, N'CM', N'CMR', 120, N'Cameroon', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (363, N'CA', N'CAN', 124, N'Canada', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (364, N'CV', N'CPV', 132, N'Cape Verde', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (365, N'KY', N'CYM', 136, N'Cayman Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (366, N'CF', N'CAF', 140, N'Central African Republic', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (367, N'TD', N'TCD', 148, N'Chad', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (368, N'CL', N'CHL', 152, N'Chile', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (369, N'CN', N'CHN', 156, N'China', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (370, N'CX', N'   ', 162, N'Christmas Island', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (371, N'CC', N'   ', 166, N'Cocos (Keeling) Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (372, N'CO', N'COL', 170, N'Colombia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (373, N'KM', N'COM', 174, N'Comoros', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (374, N'CG', N'COG', 178, N'Congo', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (375, N'CD', N'COD', 180, N'Congo, the Democratic Republic of the', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (376, N'CK', N'COK', 184, N'Cook Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (377, N'CR', N'CRI', 188, N'Costa Rica', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (378, N'CI', N'CIV', 384, N'Cote D''Ivoire', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (379, N'HR', N'HRV', 191, N'Croatia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (380, N'CU', N'CUB', 192, N'Cuba', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (381, N'CY', N'CYP', 196, N'Cyprus', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (382, N'CZ', N'CZE', 203, N'Czech Republic', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (383, N'DK', N'DNK', 208, N'Denmark', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (384, N'DJ', N'DJI', 262, N'Djibouti', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (385, N'DM', N'DMA', 212, N'Dominica', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (386, N'DO', N'DOM', 214, N'Dominican Republic', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (387, N'EC', N'ECU', 218, N'Ecuador', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (388, N'EG', N'EGY', 818, N'Egypt', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (389, N'SV', N'SLV', 222, N'El Salvador', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (390, N'GQ', N'GNQ', 226, N'Equatorial Guinea', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (391, N'ER', N'ERI', 232, N'Eritrea', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (392, N'EE', N'EST', 233, N'Estonia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (393, N'ET', N'ETH', 231, N'Ethiopia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (394, N'FK', N'FLK', 238, N'Falkland Islands (Malvinas)', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (395, N'FO', N'FRO', 234, N'Faroe Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (396, N'FJ', N'FJI', 242, N'Fiji', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (397, N'FI', N'FIN', 246, N'Finland', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (398, N'FR', N'FRA', 250, N'France', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (399, N'GF', N'GUF', 254, N'French Guiana', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (400, N'PF', N'PYF', 258, N'French Polynesia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (401, N'TF', N'   ', 260, N'French Southern Territories', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (402, N'GA', N'GAB', 266, N'Gabon', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (403, N'GM', N'GMB', 270, N'Gambia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (404, N'GE', N'GEO', 268, N'Georgia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (405, N'DE', N'DEU', 276, N'Germany', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (406, N'GH', N'GHA', 288, N'Ghana', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (407, N'GI', N'GIB', 292, N'Gibraltar', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (408, N'GR', N'GRC', 300, N'Greece', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (409, N'GL', N'GRL', 304, N'Greenland', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (410, N'GD', N'GRD', 308, N'Grenada', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (411, N'GP', N'GLP', 312, N'Guadeloupe', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (412, N'GU', N'GUM', 316, N'Guam', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (413, N'GT', N'GTM', 320, N'Guatemala', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (414, N'GN', N'GIN', 324, N'Guinea', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (415, N'GW', N'GNB', 624, N'Guinea-Bissau', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (416, N'GY', N'GUY', 328, N'Guyana', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (417, N'HT', N'HTI', 332, N'Haiti', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (418, N'HM', N'   ', 334, N'Heard Island and Mcdonald Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (419, N'VA', N'VAT', 336, N'Holy See (Vatican City State)', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (420, N'HN', N'HND', 340, N'Honduras', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (421, N'HK', N'HKG', 344, N'Hong Kong', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (422, N'HU', N'HUN', 348, N'Hungary', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (423, N'IS', N'ISL', 352, N'Iceland', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (424, N'IN', N'IND', 356, N'India', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (425, N'ID', N'IDN', 360, N'Indonesia', 10, 0)
GO
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (426, N'IR', N'IRN', 364, N'Iran, Islamic Republic of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (427, N'IQ', N'IRQ', 368, N'Iraq', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (428, N'IE', N'IRL', 372, N'Ireland', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (429, N'IL', N'ISR', 376, N'Israel', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (430, N'IT', N'ITA', 380, N'Italy', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (431, N'JM', N'JAM', 388, N'Jamaica', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (432, N'JP', N'JPN', 392, N'Japan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (433, N'JO', N'JOR', 400, N'Jordan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (434, N'KZ', N'KAZ', 398, N'Kazakhstan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (435, N'KE', N'KEN', 404, N'Kenya', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (436, N'KI', N'KIR', 296, N'Kiribati', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (437, N'KP', N'PRK', 408, N'Korea, Democratic People''s Republic of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (438, N'KR', N'KOR', 410, N'Korea, Republic of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (439, N'KW', N'KWT', 414, N'Kuwait', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (440, N'KG', N'KGZ', 417, N'Kyrgyzstan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (441, N'LA', N'LAO', 418, N'Lao People''s Democratic Republic', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (442, N'LV', N'LVA', 428, N'Latvia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (443, N'LB', N'LBN', 422, N'Lebanon', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (444, N'LS', N'LSO', 426, N'Lesotho', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (445, N'LR', N'LBR', 430, N'Liberia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (446, N'LY', N'LBY', 434, N'Libyan Arab Jamahiriya', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (447, N'LI', N'LIE', 438, N'Liechtenstein', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (448, N'LT', N'LTU', 440, N'Lithuania', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (449, N'LU', N'LTU', 442, N'Luxembourg', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (450, N'MO', N'MAC', 446, N'Macao', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (451, N'MK', N'MKD', 807, N'Macedonia, the Former Yugoslav Republic of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (452, N'MG', N'MDG', 450, N'Madagascar', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (453, N'MW', N'MWI', 454, N'Malawi', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (454, N'MY', N'MYS', 458, N'Malaysia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (455, N'MV', N'MDV', 462, N'Maldives', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (456, N'ML', N'MLI', 466, N'Mali', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (457, N'MT', N'MLT', 470, N'Malta', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (458, N'MH', N'MHL', 584, N'Marshall Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (459, N'MQ', N'MTQ', 474, N'Martinique', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (460, N'MR', N'MRT', 478, N'Mauritania', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (461, N'MU', N'MUS', 480, N'Mauritius', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (462, N'YT', N'   ', 175, N'Mayotte', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (463, N'MX', N'MEX', 484, N'Mexico', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (464, N'FM', N'FSM', 583, N'Micronesia, Federated States of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (465, N'MD', N'MDA', 498, N'Moldova, Republic of', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (466, N'MC', N'MCO', 492, N'Monaco', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (467, N'MN', N'MNG', 496, N'Mongolia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (468, N'MS', N'MSR', 500, N'Montserrat', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (469, N'MA', N'MAR', 504, N'Morocco', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (470, N'MZ', N'MOZ', 508, N'Mozambique', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (471, N'MM', N'MMR', 104, N'Myanmar', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (472, N'NA', N'NAM', 516, N'Namibia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (473, N'NR', N'NRU', 520, N'Nauru', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (474, N'NP', N'NPL', 524, N'Nepal', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (475, N'NL', N'NLD', 528, N'Netherlands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (476, N'AN', N'ANT', 530, N'Netherlands Antilles', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (477, N'NC', N'NCL', 540, N'New Caledonia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (478, N'NZ', N'NZL', 554, N'New Zealand', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (479, N'NI', N'NIC', 558, N'Nicaragua', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (480, N'NE', N'NER', 562, N'Niger', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (481, N'NG', N'NGA', 566, N'Nigeria', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (482, N'NU', N'NIU', 570, N'Niue', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (483, N'NF', N'NFK', 574, N'Norfolk Island', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (484, N'MP', N'MNP', 580, N'Northern Mariana Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (485, N'NO', N'NOR', 578, N'Norway', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (486, N'OM', N'OMN', 512, N'Oman', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (487, N'PK', N'PAK', 586, N'Pakistan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (488, N'PW', N'PLW', 585, N'Palau', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (489, N'PA', N'PAN', 591, N'Panama', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (490, N'PG', N'PNG', 598, N'Papua New Guinea', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (491, N'PY', N'PRY', 600, N'Paraguay', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (492, N'PE', N'PER', 604, N'Peru', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (493, N'PH', N'PHL', 608, N'Philippines', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (494, N'PN', N'PCN', 612, N'Pitcairn', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (495, N'PL', N'POL', 616, N'Poland', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (496, N'PT', N'PRT', 620, N'Portugal', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (497, N'PR', N'PRI', 630, N'Puerto Rico', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (498, N'QA', N'QAT', 634, N'Qatar', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (499, N'RE', N'REU', 638, N'Reunion', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (500, N'RO', N'ROM', 642, N'Romania', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (501, N'RU', N'RUS', 643, N'Russian Federation', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (502, N'RW', N'RWA', 646, N'Rwanda', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (503, N'SH', N'SHN', 654, N'Saint Helena', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (504, N'KN', N'KNA', 659, N'Saint Kitts and Nevis', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (505, N'LC', N'LCA', 662, N'Saint Lucia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (506, N'PM', N'SPM', 666, N'Saint Pierre and Miquelon', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (507, N'VC', N'VCT', 670, N'Saint Vincent and the Grenadines', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (508, N'WS', N'WSM', 882, N'Samoa', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (509, N'SM', N'SMR', 674, N'San Marino', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (510, N'ST', N'STP', 678, N'Sao Tome and Principe', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (511, N'SA', N'SAU', 682, N'Saudi Arabia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (512, N'SN', N'SEN', 686, N'Senegal', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (514, N'SC', N'SYC', 690, N'Seychelles', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (515, N'SL', N'SLE', 694, N'Sierra Leone', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (516, N'SG', N'SGP', 702, N'Singapore', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (517, N'SK', N'SVK', 703, N'Slovakia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (518, N'SI', N'SVN', 705, N'Slovenia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (519, N'SB', N'SLB', 90, N'Solomon Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (520, N'SO', N'SOM', 706, N'Somalia', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (521, N'ZA', N'ZAF', 710, N'South Africa', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (522, N'GS', N'GSA', 1, N'South Georgia and the South Sandwich Islands', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (523, N'ES', N'ESP', 724, N'Spain', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (524, N'LK', N'LKA', 144, N'Sri Lanka', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (525, N'SD', N'SDN', 736, N'Sudan', 10, 0)
INSERT [dbo].[Country] ([CountryID], [CountryCodeA2], [CountryCodeA3], [CountryCodeN3], [CountryName], [RegionID], [StatusID]) VALUES (526, N'SR', N'SUR', 740, N'Suriname', 10, 0)
GO
SET IDENTITY_INSERT [dbo].[EventMaster] ON 

INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (1, 1, N'3rd HR Leadership Retreat', CAST(0x0000A2AD00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 12, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (7, 2, N'Workshop on Trainning', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 18, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (8, 1, N'Pragati celebrating Achievments of Women', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 19, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (9, 1, N'Mar 198th national Research Confrence', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 31, N'&amp;nbsp;ewhrwherhwe', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (10, 1, N'3rd HR Leadership Retreat', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 45, N' &lt;p style="text-align: justify;"&gt;&lt;span style="font-family: Verdana;"&gt;&lt;span style="font-size: smaller;"&gt;All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.&lt;/span&gt;&lt;/span&gt;&lt;span style="font-family: ''Times New Roman'';"&gt;&lt;/span&gt;&lt;span style="font-size: smaller;"&gt;&lt;/span&gt;&lt;span style="font-size: small;"&gt;&lt;/span&gt;&lt;span style="font-size: xx-small;"&gt;&lt;/span&gt;&lt;span style="font-size: x-small;"&gt;&lt;/span&gt;&lt;span style="font-size: smaller;"&gt;&lt;/span&gt;&lt;span style="font-size: larger;"&gt;&lt;/span&gt;&lt;/p&gt; ', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (11, 2, N'Workshop on Trainning', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 22, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (12, 1, N'Pragati celebrating Achievments of Women', CAST(0x0000A2AB00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 23, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (13, 2, N'Mar 198th national Research Confrence', CAST(0x0000A2AC00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 24, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (14, 1, N'Workshop on Trainning the Trainers', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 25, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (15, 1, N'3rd HR Leadership Retreat', CAST(0x0000A2AB00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 26, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (16, 1, N'Workshop on Trainning', CAST(0x0000A2AB00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 33, N'&amp;nbsp;dadasdasdasd', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (17, 1, N'Pragati celebrating Achievments of Women', CAST(0x0000A2EE00000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 42, N'&amp;nbsp;', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (18, 2, N'Mar 198th national Research Confrence', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 29, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (19, 2, N'Workshop on Trainning the Trainers', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 30, N' <div style=''float: left;margin-right: 9px;font-family: Segoe UI;font-size: 14px;''>All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.<br/><br/></div><div><div style=''float:left;width:470px;margin-right:16px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div><div style=''float:left;width:470px;''><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span><br/><span style=''color:#5b77a5;font-family: Segoe UI;font-size: 14px;''>Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.</span></div></div> ', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (20, 2, N'Workshop on Trainning', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 43, N'&lt;P style="TEXT-ALIGN: center"&gt;&lt;SPAN style="COLOR: #993366"&gt;&lt;SPAN style="FONT-FAMILY: Comic Sans MS"&gt;&lt;EM&gt;&amp;nbsp;All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.&lt;/EM&gt;&lt;/SPAN&gt;&lt;/SPAN&gt;&lt;SPAN style="FONT-FAMILY: Comic Sans MS"&gt;&lt;/SPAN&gt;&lt;/P&gt;
&lt;P&gt;&lt;/P&gt;', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (21, 2, N'Workshop on Trainning', CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A34B00000000 AS DateTime), 44, N'&lt;EM&gt;&amp;nbsp;All India Management Association (AIMA) - the national apex body for Management profession in the country, celebrates its Foundation Day on 21st Feb. every year. The day also coincides with the National Management Day which is celebrated by the AIMA network of 64 Local Management Associations (LMAs) all over the country. The Foundation Day will be attended by over 400 delegates comprising of leading corporate leaders from private and public sector, senior bureaucrats, government officials, leading management professionals, academia, and the media. On this occasion, we also present AIMA Awards of Excellence to distinguished professionals. In keeping with high tradition of recognizing excellence, the following awards will be presented on the Foundation Day this year: AIMA - JRD Tata Corporate Leadership Award : Mr Dilip Shanghvi, Founder and Managing Director, Sun Pharmaceutical Industries Ltd. AIMA Public Service Excellence Award : Mr Nandan Nilekani, Chairman, Identification Authority of India.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.Today amid all the transitions, there is one Indian body that’s helpingthe Indianmanagers to make the most of the new opportunities. One body that’s assimilating the changed global perspective and equipping the Indian managers for it.One body that’s ready for tomorrow isThe All India Management Association(AIMA) was created as an apex body of professi- onal management with active support of the Government of India and Industry in 1957. AIMA is a group- a body to poolmanagement thoughts in the country, a forum to develop a national managerial ethos, an organi- sation to facilitate the furtherance of the management profession in the country.&lt;/EM&gt;
&lt;P&gt;&lt;/P&gt;', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (22, 4, N'arpan', CAST(0x0000A43100000000 AS DateTime), CAST(0x0000A50100000000 AS DateTime), 46, N'dsfsf&lt;p&gt;&lt;/p&gt;', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (23, 3, N'dwsd', CAST(0x0000902400000000 AS DateTime), CAST(0x0000902800000000 AS DateTime), 47, N'dwfwef&lt;p&gt;&lt;/p&gt;', 2)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (24, 1, N'Mystery Rooms', CAST(0x0000A48F00000000 AS DateTime), CAST(0x0000A4A900000000 AS DateTime), 48, N'&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mystery Rooms - A Real Life Escape Experience is a survival challenge staged in a real-life venue where a team of 2 to 8 people compete against the clock to conclude a mission. It offers a unique live-escape experience, which is a combination of brainstorming and adventure. Imagine being locked in a thrill space with your team and you have exactly 60 minutes to use logic, unearth clues, interpret hints and prove the power of team work to get out.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;There are two missions:&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;1) The Hurt Locker - A Bomb Defuse Challenge&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Terrorists have besieged a cinema hall with a bomb. As an elite member of the bomb squad, you must race against the clock to find and defuse the bomb and save lives. Be quick and careful, as each passing second brings you closer to the blast!&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Difficulty Level: Intermediate&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Recommended Team Size: 2-6 Players&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;2) Lockout - A Prison Break Challenge&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Wrongly convicted of a crime, you are held in a brutal, regimented prison environment. But now it''s time for you to break free! The Jailer and his mates are out for an hour to attend National Day Celebrations and this is the only opportunity to execute your escape plan!&amp;nbsp;&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Difficulty Level: Hard&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Recommended Team Size: 2-8 Players&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Pricing:&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Prices vary depending on team size and peak-time as follows:&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Weekends (Saturday and Sunday)&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 2: INR 1000 per person = INR 2000&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 3: INR 900 per person = INR 2700&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 4: INR 800 per person = INR 3200&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 5: INR 700 per person = INR 3500&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 6: INR 700 per person = INR 4200&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 7: INR 700 per person = INR 4900&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Mission for 8: INR 700 per person = INR 5600&lt;/span&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;&lt;br&gt;&lt;br&gt;Read more:&amp;nbsp;&lt;a href="http://in.bookmyshow.com/events/mystery-rooms-delhis-first-live-escape-game/ET00024844#ixzz3ZNmrBLFQ" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(0, 51, 153); text-decoration: none; background: 0px 0px;"&gt;http://in.bookmyshow.com/events/mystery-rooms-delhis-first-live-escape-game/ET00024844#ixzz3ZNmrBLFQ&lt;/a&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (25, 2, N'Ctrl Shift Esc', CAST(0x0000A49200000000 AS DateTime), CAST(0x0000A49C00000000 AS DateTime), 49, N'&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Ctrl.Shift.Esc - Delhi''s First Real Life Escape Game&lt;/strong&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;CSE is a fun, interactive and challenging real life escape game! 2 to 8 players will be trapped in a room with many hidden clues, objects and puzzles. You will need to channel your inner detective to crack these codes, solve the puzzles and find the key that will help you escape the locked room. But hurry, you will only have 60 minutes!&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Real life escape games get you thinking out of the box as there is no googling the answer! The game is for people who are up for a challenge, teamwork and cooperation.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;You will be playing ''''&lt;/span&gt;&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;The Safehouse&lt;/strong&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;'''':&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Our SIS agent had been working undercover to catch a spy that had infiltrated into the top-level of the intelligence bureau. No one has heard from our agent in over a year and he has now been presumed missing.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Your only way out of the room is to track the agent''s whereabouts and figure out who the spy is. Hurry, you will only have sixty minutes or you might be destined to the same fate as him...&lt;/span&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;&lt;br&gt;&lt;br&gt;Read more:&amp;nbsp;&lt;a href="http://in.bookmyshow.com/events/ctrlshiftesc-real-life-escape-games/ET00026034#ixzz3ZNnbU4pN" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(0, 51, 153); text-decoration: none; background: 0px 0px;"&gt;http://in.bookmyshow.com/events/ctrlshiftesc-real-life-escape-games/ET00026034#ixzz3ZNnbU4pN&lt;img src="http://localhost:5070/Demo/fckeditor/editor/images/smiley/msn/regular_smile.gif" _fcksavedurl="http://localhost:5070/Demo/fckeditor/editor/images/smiley/msn/regular_smile.gif"&gt;&lt;/a&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (26, 3, N'Segway Tour', CAST(0x0000A4AA00000000 AS DateTime), CAST(0x0000A4B800000000 AS DateTime), 50, N'&lt;div class="etdet" style="margin: 0px; padding: 0px 0px 10px; border: 0px; outline: 0px; font-size: 14px; display: inline-block; width: 1919px; overflow: hidden; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;&lt;span style="margin: 0px 38.375px 0px 0px; padding: 0px; border: 0px; outline: 0px; width: 70px; float: left; font-weight: 700; background: 0px 0px;"&gt;Artists:&lt;/span&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; width: 1496.8125px; float: left; background: 0px 0px;"&gt;Gaurav Sharma, Karan Shahaney&lt;/span&gt;&lt;/div&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;/span&gt;&lt;div class="etdet" style="margin: 0px; padding: 0px 0px 10px; border: 0px; outline: 0px; font-size: 14px; display: inline-block; width: 1919px; overflow: hidden; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;Introducing ''''SEGWAY TOUR of Rajpath'''' Segway tour through the Nation''s Capital gliding and experience all of the great sights the city has to offer. There will be an abundance of photo opportunities of historic buildings, monuments and memorials, including:&lt;br&gt;. Secretariats&lt;br&gt;. Rashtrapati Bhavan&lt;br&gt;. Parliament&lt;br&gt;. Various scenic beauty surrounding the Ministry buildings on Rajpath&lt;br&gt;. Amar Jawan Jyoti&lt;br&gt;. India Gate&lt;br&gt;Check out our videos tab to get a sneak-peek.&lt;/div&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;&lt;br&gt;&lt;br&gt;Read more:&amp;nbsp;&lt;a href="http://in.bookmyshow.com/events/segway-tour-rajpath/ET00016720#ixzz3ZNoKG4xM" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(0, 51, 153); text-decoration: none; background: 0px 0px;"&gt;http://in.bookmyshow.com/events/segway-tour-rajpath/ET00016720#ixzz3ZNoKG4xM&lt;/a&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (27, 1, N'Astitva Live Music', CAST(0x0000A49900000000 AS DateTime), CAST(0x0000A49900000000 AS DateTime), 51, N'&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Astitva is a multi genre Hindi band few years into the world of music. And hundred of smiles, tears, memories, losses &amp;amp; successes later, we feel that our journey has just begun. For us, music is not about striking the right musical notes, but about touching the righ emotional chords &amp;amp; we have been doing just that by beating out songs with magical blend of rock, Jazz &amp;amp; hindustani classical to enhance our soulful lyrics written in hindi &amp;amp; Urdu.&lt;/span&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: 0px 0px;"&gt;&lt;br&gt;&lt;br&gt;Read more:&amp;nbsp;&lt;a href="http://in.bookmyshow.com/events/astitva-live-music/ET00030388#ixzz3ZNowJgqP" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(0, 51, 153); text-decoration: none; background: 0px 0px;"&gt;http://in.bookmyshow.com/events/astitva-live-music/ET00030388#ixzz3ZNowJgqP&lt;/a&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[EventMaster] ([EventMasterID], [EventTypeID], [EventTitle], [EventStartDate], [EventEndDate], [EventLocationAddressID], [EventDetails], [StatusID]) VALUES (28, 3, N'Air Safari', CAST(0x0000A4C800000000 AS DateTime), CAST(0x0000A4F900000000 AS DateTime), 52, N'&lt;strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: transparent;"&gt;Since this is a weather-based sport, please call 9871510510 to check before the event.&lt;/strong&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;If you think you have seen it all and done it all, well it''s time to try something new, it''s time to take the flight of a lifetime through Air Safari.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Explore nature all over again by taking your first paramotor flight. Our pilots are all geared to show you a very unique and thrilling way to enjoy the spectacular sights. We guarantee these flights are going to blow your mind away! So why don''t you experience one of the world''s simplest and easiest airborne craft and take your first step to being adventurous with Flyboy Air Safari!&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;There are 3 types of flights to choose from:&amp;nbsp;&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;1) Kitty Hawk -&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Approximate Distance covered: 6 - 8 km.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;2) Fly Yourself -&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Approximate Distance covered: 12 - 15 km.&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;3) Explorer -&lt;/span&gt;&lt;br style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;&lt;span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px;"&gt;Approximate Distance covered: 20 - 24 km.&lt;/span&gt;&lt;span style="margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 17px; background: transparent;"&gt;&lt;br&gt;&lt;br&gt;Read more:&amp;nbsp;&lt;a href="http://in.bookmyshow.com/events/air-safari/ET00021250#ixzz3ZNpTFYkx" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; color: rgb(0, 51, 153); text-decoration: none; background: transparent;"&gt;http://in.bookmyshow.com/events/air-safari/ET00021250#ixzz3ZNpTFYkx&lt;/a&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
SET IDENTITY_INSERT [dbo].[EventMaster] OFF
SET IDENTITY_INSERT [dbo].[EventSponsorMapping] ON 

INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (5, 17, 8, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (6, 17, 7, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (7, 17, 6, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (16, 10, 12, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (17, 10, 10, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (18, 10, 9, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (19, 10, 3, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (20, 10, 2, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (21, 10, 1, 1)
INSERT [dbo].[EventSponsorMapping] ([EventSponsorMapID], [EventMasterID], [SponsorID], [StatusID]) VALUES (22, 19, 15, 1)
SET IDENTITY_INSERT [dbo].[EventSponsorMapping] OFF
SET IDENTITY_INSERT [dbo].[EventTabDetail] ON 

INSERT [dbo].[EventTabDetail] ([EventTabDetailID], [EventTabTitle], [EvenTabDescription], [EventMasterID], [StatusID]) VALUES (1, N'Event Desciption', N'&amp;nbsp;&lt;div&gt;&lt;div id="header" class="header" style="font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; background-color: rgb(62, 0, 0);"&gt;&lt;div id="header_turnbg" class="head_div head_dim" style="position: relative; width: 956px; height: 110px; margin: 0px auto;"&gt;&lt;div class="head_dim head_filter" style="width: 956px; height: 110px; margin: 0px auto;"&gt;&lt;div id="union_main_menu" class="main_menu" style="position: absolute; width: 956px; height: 40px; top: 71px; left: 0px; border-top-width: 3px; border-top-style: solid; border-top-color: rgb(255, 161, 45);"&gt;&lt;ul style="margin: 10px 0px 0px -5px; padding: 0px; list-style: none outside none; height: 40px;"&gt;&lt;li id="menu_index" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="home" href="http://192.168.1.1/html/home.html" class="active" style="text-decoration: none; color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center; background-image: url(http://192.168.1.1/res/Tab_button_off.gif); background-position: 100% 0%; background-repeat: no-repeat no-repeat;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px; background-image: url(http://192.168.1.1/res/Tab_button_off.gif); background-position: 0% 0%; background-repeat: no-repeat no-repeat;"&gt;Home&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;li id="menu_statistic" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="statistic" href="http://192.168.1.1/html/statistic.html" style="text-decoration: none; color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px;"&gt;WIFI IP&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;li id="menu_update" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="update" href="http://192.168.1.1/html/update.html" style="text-decoration: none; color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px;"&gt;Updates&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;li id="menu_ota" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="ota" href="http://192.168.1.1/html/ota.html" style="text-decoration: none; color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px;"&gt;OTA&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;li id="menu_settings" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="settings" href="http://192.168.1.1/html/quicksetup.html" style="text-decoration: none; color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px;"&gt;Settings&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;li id="menu_photon" style="margin: 0px; padding: 0px 6px; list-style: none outside none; float: left; font-weight: bold; font-size: 16px; line-height: 40px; font-family: Lexia, Arial; text-shadow: rgb(65, 65, 65) 0px 1px 1px; background-image: url(http://192.168.1.1/res/split_line.gif); background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;a id="photon" style="color: rgb(255, 255, 255); display: block; float: left; padding-right: 5px; text-align: center;"&gt;&lt;span style="cursor: pointer; float: left; padding: 0px 5px 0px 10px;"&gt;Photon Self Care&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class="help" style="position: absolute; height: 30px; top: 0px; right: 24px;"&gt;&lt;span style="line-height: 24px; font-family: Lexia, Arial; color: rgb(255, 255, 255);"&gt;&lt;select id="lang" style="font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; cursor: pointer; border-color: rgb(161, 161, 161); display: none;"&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;/select&gt;&lt;/span&gt;&lt;span style="line-height: 24px; font-family: Lexia, Arial; color: rgb(255, 255, 255);"&gt;&lt;a id="help_url" href="http://192.168.1.1/usermanual/en-us/usermanual/web_content_concept_00001.html" target="_blank" style="text-decoration: none; color: rgb(255, 255, 255);"&gt;&lt;span id="help_span" style="padding: 0px 1px 0px 4px;"&gt;Help&lt;/span&gt;&amp;nbsp;&lt;/a&gt;&lt;/span&gt;&lt;span style="line-height: 24px; font-family: Lexia, Arial; color: rgb(255, 255, 255);"&gt;&lt;span class="username" style="padding: 0px 1px 0px 4px;"&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style="line-height: 24px; font-family: Lexia, Arial; color: rgb(255, 255, 255);"&gt;&lt;span class="logout" style="padding: 0px 1px 0px 4px; background-image: url(http://192.168.1.1/res/split_line.gif); cursor: pointer; background-position: 0% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;span id="logout_span" style="padding: 0px 1px 0px 4px;"&gt;Log In&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class="tools" style="position: absolute; height: 28px; top: 30px; right: 20px;"&gt;&lt;ul style="margin: 0px; padding: 0px; list-style: none outside none;"&gt;&lt;li id="sim_signal_gif" class="nav03" style="margin: 0px; padding: 0px; list-style: none outside none; float: left; height: 30px; width: 36px; background-image: url(http://192.168.1.1/res/signal_4.gif); background-position: 0px 0px; background-repeat: no-repeat no-repeat;"&gt;&lt;span id="tooltip_sim" style="height: 28px; display: block; width: 36px;"&gt;&lt;/span&gt;&lt;/li&gt;&lt;li id="wan_gif" class="nav05" style="margin: 0px; padding: 0px; list-style: none outside none; float: left; height: 30px; width: 36px; background-image: url(http://192.168.1.1/res/wan_901.gif); background-position: 0px 0px; background-repeat: no-repeat no-repeat;"&gt;&lt;span id="tooltip_wan" style="height: 28px; display: block; width: 36px;"&gt;&lt;/span&gt;&lt;/li&gt;&lt;li id="wifi_gif" class="nav06" style="margin: 0px; padding: 0px; list-style: none outside none; float: left; height: 30px; width: 40px; background-image: url(http://192.168.1.1/res/wifi_1.gif); background-position: 0px 0px; background-repeat: no-repeat no-repeat;"&gt;&lt;span id="tooltip_wifi" style="height: 28px; display: block; width: 40px;"&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="center_box" style="width: 956px; margin: 0px auto; min-height: 230px; overflow: hidden; background-image: url(http://192.168.1.1/res/main_bg.gif); background-color: rgb(62, 0, 0); font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; height: auto !important; background-position: 50% 0%; background-repeat: no-repeat no-repeat;"&gt;&lt;div class="center_box_main" style="float: left; display: inline; width: 750px; margin-top: 35px; margin-left: 140px; min-height: 200px; height: auto !important;"&gt;&lt;div id="status_img" class="signal" style="float: left; width: 134px; padding-top: 70px; background-image: url(http://192.168.1.1/res/icon_signal_04.gif); background-position: 0px 0px; background-repeat: no-repeat no-repeat;"&gt;&lt;p style="margin: 0px; padding: 0px; width: 124px; color: rgb(255, 255, 255); text-align: center; font-size: 22px; line-height: 30px; font-family: Lexia, Arial;"&gt;Tata Docomo Photon Max&lt;/p&gt;&lt;/div&gt;&lt;div id="status_info" class="title_info" style="float: left; margin: 4px 40px 0px; display: inline;"&gt;&lt;div id="status_discript"&gt;&lt;div class="top_status_discript"&gt;&lt;h1 id="index_plmn_name" style="margin: 0px; padding: 0px; font-size: 34px; width: 330px; color: rgb(255, 255, 255); line-height: 36px; word-wrap: break-word; text-shadow: rgb(255, 255, 255) 1px 1px 0px; min-height: 70px; height: auto !important;"&gt;&lt;/h1&gt;&lt;div id="index_connection_status" style="height: auto; width: 350px; font-size: 16px; padding-bottom: 10px; overflow: hidden; color: rgb(255, 255, 255); text-align: center; font-weight: bold;"&gt;Connected&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="center_box_right" style="float: left; width: 160px; margin-top: 4px; margin-left: 0px;"&gt;&lt;div id="index_connection_statuss" class="connectionStatuss" style="width: 140px; height: 172px; background-image: url(http://192.168.1.1/res/connect_setting.gif); background-attachment: scroll; background-position: 50% 50%; background-repeat: no-repeat no-repeat;"&gt;&lt;div id="connectionStatuss"&gt;&lt;a id="mobileConnect" href="http://192.168.1.1/html/mobileconnection.html" style="text-decoration: none; color: rgb(255, 255, 255); width: 140px; height: 172px; display: inline-block;"&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="profileselect" style="width: 160px;"&gt;&lt;select id="profilelist" style="width: 160px;"&gt;&lt;option value="1"&gt;tata&amp;nbsp;photon&amp;nbsp;max(default)&lt;/option&gt;&lt;/select&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="notification" style="width: 956px; height: 43px; margin: 0px auto; font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; background-color: rgb(62, 0, 0);"&gt;&lt;div class="install" style="position: relative; float: right; margin: 8px 28px 0px 0px;"&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="login_box_info" style="width: 956px; margin: 0px auto; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(255, 161, 45); min-height: 163px; overflow: hidden; font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; background-color: rgb(62, 0, 0); height: auto !important;"&gt;&lt;div class="login_info"&gt;&lt;div class="connection" style="height: 128px; float: left; padding: 35px 0px 0px; width: 478px;"&gt;&lt;h2 style="margin: 0px; padding: 0px; font-size: 15px; float: right; width: 434.96875px; color: rgb(250, 165, 36); line-height: 26px; font-family: Lexia, Arial;"&gt;Current connection&lt;/h2&gt;&lt;table width="91%" border="0" cellpadding="0" cellspacing="0" id="mobile_connection" style="border-collapse: collapse; border-spacing: 0px; float: right; line-height: 24px; color: rgb(255, 255, 255); font-weight: bold;"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class="revicedsent" width="40%" style="margin: 0px; padding: 0px;"&gt;Received/Sent:&lt;/td&gt;&lt;td id="revicedsent_date" style="margin: 0px; padding: 0px;"&gt;&lt;label class="list_right" id="TotalDownload" style="font-weight: normal;"&gt;44.13 MB&lt;/label&gt;&amp;nbsp;&lt;label&gt;/&amp;nbsp;&lt;/label&gt;&lt;label class="list_right" id="TotalUpload" style="font-weight: normal;"&gt;10.94 MB&lt;/label&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;Duration:&lt;/td&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;&lt;label class="list_right" id="TotalConnectTime" style="font-weight: normal;"&gt;00:29:12&lt;/label&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/div&gt;&lt;div class="wlan_status" style="height: 128px; float: left; padding: 35px 0px 0px; background-image: none; width: 478px; background-position: initial initial; background-repeat: initial initial;"&gt;&lt;h2 style="margin: 0px; padding: 0px; font-size: 15px; float: right; width: 434.96875px; color: rgb(250, 165, 36); line-height: 26px; font-family: Lexia, Arial;"&gt;WLAN status&lt;/h2&gt;&lt;table id="wlan_status_single_or_multi" width="91%" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-spacing: 0px; float: right; line-height: 24px; color: rgb(255, 255, 255); font-weight: bold;"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width="60%" style="margin: 0px; padding: 0px;"&gt;WLAN status:&lt;/td&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;&lt;label class="list_right" id="CurrentWifiStatus" style="font-weight: normal;"&gt;On&lt;/label&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;Current WiFi user:&lt;/td&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;&lt;label class="list_right" id="CurrentWifiUser" style="font-weight: normal;"&gt;5/5&lt;/label&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr id="system_label_wanip"&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;Internet IP Address:&lt;/td&gt;&lt;td class="list_right" id="wanip" style="margin: 0px; padding: 0px; font-weight: normal;"&gt;14.98.66.251&lt;/td&gt;&lt;/tr&gt;&lt;tr id="system_label_ssid"&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;WLAN Name(SSID):&lt;/td&gt;&lt;td class="list_right" id="ssidname" style="margin: 0px; padding: 0px; font-weight: normal;"&gt;zven-4&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class="hot_links" style="width: 956px; height: 80px; margin: 0px auto; border-top-width: 0px; font-family: Lexia, Arial, Helvetica, sans-serif, 宋体; background-color: rgb(62, 0, 0);"&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 10, 2)
SET IDENTITY_INSERT [dbo].[EventTabDetail] OFF
SET IDENTITY_INSERT [dbo].[EventTypeMaster] ON 

INSERT [dbo].[EventTypeMaster] ([EventTypeID], [EventType]) VALUES (1, N'Media')
INSERT [dbo].[EventTypeMaster] ([EventTypeID], [EventType]) VALUES (2, N'Educational')
INSERT [dbo].[EventTypeMaster] ([EventTypeID], [EventType]) VALUES (3, N'Sports')
INSERT [dbo].[EventTypeMaster] ([EventTypeID], [EventType]) VALUES (4, N'Plays')
SET IDENTITY_INSERT [dbo].[EventTypeMaster] OFF
SET IDENTITY_INSERT [dbo].[FileManangementMaster] ON 

INSERT [dbo].[FileManangementMaster] ([FileManagementID], [FileName], [UploadedBy], [UploadDate], [StatusID], [Flag], [FileTitle]) VALUES (58, N'/demo/Content/File/FilePath/635303087420092500.pdf', N'Admin', CAST(0x0000A2ED00C57D08 AS DateTime), 1, 1, N'Brochure')
INSERT [dbo].[FileManangementMaster] ([FileManagementID], [FileName], [UploadedBy], [UploadDate], [StatusID], [Flag], [FileTitle]) VALUES (59, N'/demo/Content/File/FilePath/635303088620248750.pdf', N'Admin', CAST(0x0000A2ED00C609A8 AS DateTime), 1, 1, N'ParticipantManual')
INSERT [dbo].[FileManangementMaster] ([FileManagementID], [FileName], [UploadedBy], [UploadDate], [StatusID], [Flag], [FileTitle]) VALUES (60, N'/demo/Content/File/FilePath/635661940760565992.pdf', N'Admin', CAST(0x0000A48C014BC4D0 AS DateTime), 1, 1, N'Metro')
INSERT [dbo].[FileManangementMaster] ([FileManagementID], [FileName], [UploadedBy], [UploadDate], [StatusID], [Flag], [FileTitle]) VALUES (61, N'/demo/Content/File/FilePath/635665498466011120.pdf', N'Admin', CAST(0x0000A490017A52C8 AS DateTime), 1, 1, N'Delhi Brochure1')
SET IDENTITY_INSERT [dbo].[FileManangementMaster] OFF
SET IDENTITY_INSERT [dbo].[GalleryMaster] ON 

INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (6, N'2013', 1, CAST(0x6F380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (7, N'2006', 1, CAST(0x6C380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (8, N'234', 1, CAST(0x71380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (9, N'234', 1, CAST(0x71380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (10, N'123', 1, CAST(0x71380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (11, N'123', 1, CAST(0x71380B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (12, N'Monuments', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (13, N'Malls', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (14, N'Malls', 1, CAST(0xEA390B00 AS Date), N'admin', 0)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (15, N'Forts', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (16, N'Gardens', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (17, N'Metro', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (18, N'Markets', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (19, N'Restaurants', 1, CAST(0xEA390B00 AS Date), N'admin', 1)
INSERT [dbo].[GalleryMaster] ([GalleryID], [GalleryTitle], [Status], [CreatedOn], [CreatedBy], [Flag]) VALUES (20, N'Temples', 1, CAST(0xEB390B00 AS Date), N'admin', 1)
SET IDENTITY_INSERT [dbo].[GalleryMaster] OFF
SET IDENTITY_INSERT [dbo].[ImageGalleryMaster] ON 

INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (12, 6, N'Floewer', 1, N'admin', CAST(0x6B380B00 AS Date), N'/demo/Content/Gallery/6/635333490216549177.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (13, 6, N'Koala', 1, N'admin', CAST(0x6B380B00 AS Date), N'/demo/Content/Gallery/6/635333508588980020.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (14, 6, N'Scenery', 1, N'admin', CAST(0x6B380B00 AS Date), N'/demo/Content/Gallery/6/635333509395396145.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (15, 6, N'Desert', 1, N'admin', CAST(0x6B380B00 AS Date), N'/demo/Content/Gallery/6/635333510185711348.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (16, 7, N'Vijay', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/7/635334211302628213.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (17, 7, N'Shubham', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/7/635334211862780252.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (18, 7, N'Mini', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/7/635334218897862635.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (19, 7, N'Dk Gupta', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/7/635334219133776129.png', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (20, 7, N'Sc Tyagi', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/7/635334219350928549.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (21, 6, N'A lighthouse is a tower, building, or other type of structure designed to emit light from a system of lamps and lenses and used as a navigational aid for maritime pilots at sea or on inland waterways.', 1, N'admin', CAST(0x6C380B00 AS Date), N'/demo/Content/Gallery/6/635334331647960508.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (22, 6, N'hh', 1, N'admin', CAST(0xC7390B00 AS Date), N'/demo/Content/Gallery/6/635634361122834855.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (23, 11, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/11/635664530048555192.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (24, 12, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/12/635664655342144399.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (25, 12, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/12/635664655533405338.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (26, 12, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/12/635664655596598953.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (27, 12, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/12/635664655647481863.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (28, 13, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/13/635664656230153201.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (29, 13, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/13/635664656341019542.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (30, 13, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/13/635664656415573806.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (31, 13, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/13/635664656475967261.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (32, 15, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/15/635664656752765075.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (33, 15, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/15/635664656822319054.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (34, 15, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/15/635664656873181963.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (35, 16, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/16/635664657579994373.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (36, 16, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/16/635664657650608412.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (37, 16, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/16/635664657701851343.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (38, 16, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/16/635664657752554243.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (39, 16, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/16/635664657835388981.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (40, 17, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/17/635664658385642436.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (41, 17, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/17/635664658457836565.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (42, 17, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/17/635664658530100699.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (43, 17, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/17/635664658572063099.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (44, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664658880038688.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (45, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664658960883312.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (46, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664659043888060.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (47, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664659141903666.JPG', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (48, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664659191106480.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (49, 18, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664659267940875.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (50, 18, N'', 2, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/18/635664659845345883.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (51, 19, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/19/635664660506375674.JPG', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (52, 19, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/19/635664660575209612.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (53, 19, N'', 2, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/19/635664660622702328.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (54, 19, N'', 1, N'admin', CAST(0xEA390B00 AS Date), N'/demo/Content/Gallery/19/635664660697786623.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (55, 20, N'', 1, N'admin', CAST(0xEB390B00 AS Date), N'/demo/Content/Gallery/20/635665390269545570.jpeg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (56, 20, N'', 1, N'admin', CAST(0xEB390B00 AS Date), N'/demo/Content/Gallery/20/635665390356290532.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (57, 20, N'', 1, N'admin', CAST(0xEB390B00 AS Date), N'/demo/Content/Gallery/20/635665390411233674.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (58, 20, N'', 1, N'admin', CAST(0xEB390B00 AS Date), N'/demo/Content/Gallery/20/635665390462836626.jpeg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (59, 16, N'', 0, N'admin', CAST(0xEC390B00 AS Date), N'/demo/Content/Gallery/16/635666031922694389.jpg', 1)
INSERT [dbo].[ImageGalleryMaster] ([ImageGalleryMasterID], [GalleryMasterID], [ImageDescription], [Status], [CreatedBy], [CreatedOn], [Url], [Flag]) VALUES (60, 16, N'', 1, N'admin', CAST(0xEC390B00 AS Date), N'/demo/Content/Gallery/16/635666032474159355.jpg', 1)
SET IDENTITY_INSERT [dbo].[ImageGalleryMaster] OFF
SET IDENTITY_INSERT [dbo].[MenuBarMaster] ON 

INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (9, N'Simulations', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=15', 1, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (10, N'National Competition Corporate', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=18', 2, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (11, N'National Competition Students', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=19', 3, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (12, N'For Academic Institutes', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=16#a1', 4, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (13, N'For Corporate Managers', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=16#a2', 5, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (14, N'Simulations', N'http://localhost:60098/demo/usersite/DynamicPages?ContentMasterID=15', 1, 2)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (15, N'HOME', N'http://localhost:5070/demo/usersite/DynamicPages?ContentMasterID=15', 1, 1)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (16, N'ABOUT', N'http://localhost:5070/demo/usersite/DynamicPages?ContentMasterID=18', 2, 1)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (17, N'PORTFOLIOS', N'http://localhost:5070/demo/usersite/DynamicPages?ContentMasterID=19', 3, 1)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (18, N'TEAM', N'http://localhost:5070/demo/usersite/DynamicPages?ContentMasterID=16#a1', 4, 1)
INSERT [dbo].[MenuBarMaster] ([MenuID], [MenuName], [URL], [Position], [Status]) VALUES (19, N'BLOG', N'http://localhost:5070/demo/usersite/DynamicPages?ContentMasterID=16#a2', 5, 1)
SET IDENTITY_INSERT [dbo].[MenuBarMaster] OFF
SET IDENTITY_INSERT [dbo].[NewsLetterAuditInformation] ON 

INSERT [dbo].[NewsLetterAuditInformation] ([NewsLetterAuditID], [EmailID], [ReferenceType], [ReferneceID], [Status], [NoofTrys], [ActionDate]) VALUES (8, N'saurav.thakur@zventech.com', 1, 8, 1, 1, CAST(0x0000A2F50130ECF0 AS DateTime))
INSERT [dbo].[NewsLetterAuditInformation] ([NewsLetterAuditID], [EmailID], [ReferenceType], [ReferneceID], [Status], [NoofTrys], [ActionDate]) VALUES (9, N'snehil.jain@zventech.com', 1, 8, 1, 1, CAST(0x0000A2F50130ECF0 AS DateTime))
INSERT [dbo].[NewsLetterAuditInformation] ([NewsLetterAuditID], [EmailID], [ReferenceType], [ReferneceID], [Status], [NoofTrys], [ActionDate]) VALUES (10, N'saurav.thakur@zventech.com', 1, 9, 1, 1, CAST(0x0000A2F501311018 AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsLetterAuditInformation] OFF
SET IDENTITY_INSERT [dbo].[NewsLetterSubscription] ON 

INSERT [dbo].[NewsLetterSubscription] ([NewsLetterID], [Email], [Name], [Profession], [Status], [IsVerified], [VerificationCode], [CreationDate]) VALUES (1, N'saurav.thakur@zventech.com', N'Saurav Thakur', 1, 1, 1, 70354, CAST(0x0000A1D2012C684C AS DateTime))
INSERT [dbo].[NewsLetterSubscription] ([NewsLetterID], [Email], [Name], [Profession], [Status], [IsVerified], [VerificationCode], [CreationDate]) VALUES (2, N'snehil.jain@zventech.com', N'Snehil', 2, 1, 1, 38968, CAST(0x0000A2F5012E9298 AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsLetterSubscription] OFF
SET IDENTITY_INSERT [dbo].[NewsMaster] ON 

INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (10, N'Sensex@21919: Five reasons why market''s making new highs', CAST(0x0000A2D200000000 AS DateTime), CAST(0x0000A2EE00000000 AS DateTime), N'READ MORE ON » stock market | Shares | settlement option | Sensex. Nufty | risk | Reliance Industries | product. Sensex hit an all-time intraday high of 21,960.89 and then went on to make life closing high of 21,919.79.', N'&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;Indian stock market''s&amp;nbsp;&lt;/span&gt;&lt;a href="http://economictimes.indiatimes.com/topic/benchmark" pg="asTopicL1" target="_blank" style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(2, 77, 153); text-decoration: none; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;benchmark&lt;/a&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;&amp;nbsp;index, that is Sensex, today made two records. It hit an all-time intraday high of 21,960.89 and then went on to make life closing high of 21,919.79.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;The 30-stock Sensex closed the day at 21,919.79; up 405.92 points, or 1.89%. The broader 50-share Nifty ended at 6,525.60, up 124.45 points, or 1.94%.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;BSE IT index was a loser. The index fell 1.97% at 9,520.00.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;Small and mid cap indexes also took a beating.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;Midcap index closed at 6,693.44; down 14.56 points, or 0.22%; while small cap index ended the day at 6,612.45; down 14.01 points, or 0.21%.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;a target="_blank" href="http://economictimes.indiatimes.com/definition/Shares" style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(2, 77, 153); text-decoration: none; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;Shares&lt;/a&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;&amp;nbsp;of&amp;nbsp;&lt;/span&gt;&lt;a pg="asTopicL1" target="_blank" href="http://economictimes.indiatimes.com/reliance-industries-ltd/stocks/companyid-13215.cms" style="font-size: 16px; margin: 0px 5px 0px 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(2, 77, 153); text-decoration: none; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;Reliance Industries&lt;/a&gt;&lt;a class="hover_13215  pos" href="http://economictimes.indiatimes.com/reliance-industries-ltd/stocks/companyid-13215.cms" target="_blank" style="background-color: rgb(234, 250, 234); font-size: 11px; margin: 0px; outline: 0px; padding: 0px 3px; vertical-align: baseline; border: 1px solid rgb(12, 143, 43); border-top-left-radius: 2px; border-top-right-radius: 2px; border-bottom-right-radius: 2px; border-bottom-left-radius: 2px; display: inline-block; line-height: 16px; height: 16px; font-family: Arial, Helvetica, sans-serif; opacity: 1; color: rgb(12, 143, 43) !important; text-decoration: none !important;"&gt;BSE 5.72 %&lt;/a&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;rallied abour 6 per cent in trade on Friday. The stock was the top contributor to the current rally in markets.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;The stock closed the day at Rs 869.00, up 47.00 points, or 5.72%, on the BSE.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;Experts are betting big on the index, saying the rally is likely to continue. They say that it''s not just the pre-market rally that one can bet on, but there are high chances of an upmove post election results thanks to improving economic data.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;It''s not just the economics and elections that is driving the&amp;nbsp;&lt;/span&gt;&lt;a target="_blank" href="http://economictimes.indiatimes.com/definition/markets" style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: rgb(2, 77, 153); text-decoration: none; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;markets&lt;/a&gt;&lt;span style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 24px;"&gt;&amp;nbsp;to new highs.&lt;/span&gt;&lt;br style="font-size: 16px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: Arial, Helvetica, sans-serif; line-height: 24px;"&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (11, N'US judge rejects Apple bid to ban Samsung devices', CAST(0x0000A2E500000000 AS DateTime), CAST(0x0000A2F400000000 AS DateTime), N'A federal judge Thursday rejected Apple''s request to ban an array of Samsung smartphones and tablets found to have infringed on patents held by the US tech giant.', N'&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;&lt;span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.6;"&gt;A federal judge Thursday rejected Apple''s request to ban an array of Samsung smartphones and tablets found to have infringed on patents held by the US tech giant.&lt;/span&gt;&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;US District Judge Lucy Koh, who oversaw the blockbuster patent trial, finalized the damage award to be paid by the South Korean electronics giant at $929 million.&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;But in a separate order, the judge denied Apple''s request to ban 23 Samsung devices, saying there was no evidence that consumer demand was driven by the infringing elements.&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;"To persuade the court to grant Apple such an extraordinary injunction&amp;nbsp;–&amp;nbsp;to bar such complex devices for incorporating three touchscreen software features&amp;nbsp;–&amp;nbsp;Apple bears the burden to prove that these three touchscreen software features drive consumer demand for Samsung''s products," the judge wrote. "Apple has not met this burden."&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;A jury last year awarded more than $1 billion to Apple for patent infringement, but the judge threw out some of that award and ordered a partial retrial. The final amount awarded was $929 million.&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;Samsung said in a statement it was "pleased with the court''s ruling against an injunction" and agreed "that a few software features alone don''t drive consumer demand for Samsung products".&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;But Samsung said it would appeal the damage award, saying it was "based on erroneous calculation methods".&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;Apple declined to comment on Thursday. But in November, after the latest jury award, the company said "this case has always been about more than patents and money," and that it was "about innovation and the hard work that goes into inventing products that people love".&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;Both sides have been appealing various aspects of the case, which is likely to be tied up in courts for some time barring an agreement between the two companies.&amp;nbsp;&lt;span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.6;"&gt;But because of the fast-moving nature of the business, the devices at issue in the case are no longer being sold.&lt;/span&gt;&lt;/p&gt;&lt;p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: ''Open Sans'', helvetica, arial; padding: 0px; line-height: 24.5px; font-size: 14px;"&gt;Judge Koh noted that "the only new fact is that Samsung represents that no infringing units are currently in the marketplace".&amp;nbsp;&lt;span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.6;"&gt;She added that "Apple presents no evidence that any current Samsung devices incorporate the patented features. As such, it appears that the public interest slightly favors Samsung".&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (12, N'Google commits $1mn to bring more women in tech', CAST(0x0000A2E100000000 AS DateTime), CAST(0x0000A2FC00000000 AS DateTime), N'The efforts, a part of ''#40 Forward'' programme under Google for Entrepreneurs'', are aimed at finding new ways to advance female entrepreneurs, the Internet giant said ahead of International Women''s Day.The efforts, a part of ''#40 Forward'' programme under Google for Entrepreneurs'', are aimed at finding new ways to advance female entrepreneurs, the Internet giant said ahead of International Women''s Day.', N'&lt;div id="box" style="margin: 0px 0px 10px; padding: 0px; background-color: rgb(211, 209, 209); color: rgb(59, 59, 59); font-weight: bold; line-height: 14px; font-family: arial; overflow: hidden; text-align: center; width: 448px;"&gt;&lt;img src="http://media2.intoday.in/btmt/images/stories/google13_505_030714035143.jpg" alt="Google commits $1mn to bring more women in tech" title="Google commits $1mn to bring more women in tech" width="448" style="width: 448px; border: none;"&gt;&lt;/div&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;Search engine giant&amp;nbsp;&lt;a href="http://businesstoday.intoday.in/story/google-launches-indoor-maps-for-malls-museums-in-india/1/203981.html" mce_href="http://businesstoday.intoday.in/story/google-launches-indoor-maps-for-malls-museums-in-india/1/203981.html" style="outline: none; color: rgb(0, 73, 144); text-decoration: none; font-weight: bold;"&gt;Google has committed $1 million&lt;/a&gt;&amp;nbsp;(over Rs 6 crore) to 40 startup-focused organisations, including Nasscom 10,000 Startups and Jagriti Yatra from India, to promote participation of&amp;nbsp;&lt;a href="http://businesstoday.intoday.in/story/google-smartphone-parts-ara-developers-conference/1/203826.html" target="_blank" mce_href="http://businesstoday.intoday.in/story/google-smartphone-parts-ara-developers-conference/1/203826.html" style="outline: none; color: rgb(0, 73, 144); text-decoration: none; font-weight: bold;"&gt;women in the technology space&lt;/a&gt;.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;The efforts, a part of ''#40 Forward'' programme under Google for Entrepreneurs'', are aimed at finding new ways to advance female entrepreneurs, the Internet giant said ahead of International Women''s Day.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;Google is committing $1 million in aggregate to 40 startup-focused organisations, challenging them to increase the representation of women in their respective tech communities, it added.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;"From simply changing the times of events to accommodate busy moms to teaching young girls to see themselves as entrepreneurs, 40 of our partner communities will soon launch new programmes and outreach initiatives to encourage women founders," it said.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;Some of the selected organisations include 1871, American Underground and Galvanise (US), Campus for Moms (Israel), Club Kidrepreneur (Australia), Cc Hub (Nigeria), Jagriti Yatra and Nasscom 10,000 Startups (India) and Outbox (Uganda), among others.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;"Along with our 40 partners, we hope to create more inclusive networks and to move the needle for entrepreneurs like my mom and young women like me who aspire to be like her," Google Global Entrepreneurship Manager Bridgette Sexton Beam said in a Google Blogpost.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;According to the National Association of Women Business Owners, women make up 30 per cent of US business owners and employ nearly 7.8 million workers.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;Even though women-owned enterprises operate with far less capital, in the venture-backed tech industry, they produce 12 per cent higher returns.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;"That means that not only is supporting women in business the right thing to do, it''s also the smart thing to do," Beam said.&lt;/p&gt;&lt;p style="margin: 0px; padding: 5px 0px; color: rgb(61, 66, 57); font-family: arial; font-size: 15px; line-height: 21px;"&gt;&lt;/p&gt;&lt;p class="more-news" style="margin: 20px 0px 0px; padding: 5px 0px; background-color: rgb(235, 235, 235); font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 21px;"&gt;For more news from Business Today, follow us on Twitter&amp;nbsp;&lt;a href="https://twitter.com/bt_india" mce_href="https://twitter.com/bt_india" target="_blank" rel="nofollow" style="outline: none; color: rgb(0, 73, 144); text-decoration: none;"&gt;@bt_india&lt;/a&gt;&amp;nbsp;and on Facebook at&lt;a href="https://www.facebook.com/BusinessToday" mce_href="https://www.facebook.com/BusinessToday" target="_blank" rel="nofollow" style="outline: none; color: rgb(0, 73, 144); text-decoration: none;"&gt;facebook.com/BusinessToday&lt;/a&gt;&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (13, N'Winning solves everything, says Roger Federer after title romp', CAST(0x0000A2E700000000 AS DateTime), CAST(0x0000A2FE00000000 AS DateTime), N'By the end of last season, it seemed as though Roger Federer was done with being a contender at major tournaments. However, the legendary ...', N'&lt;div class="thumbnail" style="margin: 0px; padding: 0px; font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14px; width: 600px;"&gt;&lt;div class="holder" style="margin: 0px; padding: 0px;"&gt;&lt;table cellspacing="0" style="border-collapse: collapse; border-spacing: 0px; width: 1px;"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style="margin: 0px; padding: 0px;"&gt;&lt;img src="http://www.trbimg.com/img-531222c6/turbine/la-sp-sn-roger-federer-dubai-championships-201-001/600" alt="Roger Federer" border="0" width="600" height="395" title="Roger Federer" style="border: 0px; display: block;"&gt;&lt;p class="small" style="margin: 6px 0px 0px; padding: 0px; font-size: 11px;"&gt;Roger Federer hits his patented backhand against Tomas Berdych in the Dubai Championships final on Sunday.&amp;nbsp;&lt;span class="credit"&gt;(&lt;span class="photographer"&gt;Marwan Naamani / AFP/ Getty Images&lt;/span&gt;&amp;nbsp;/&amp;nbsp;&lt;span class="dateMonth"&gt;March&amp;nbsp;&lt;/span&gt;&lt;span class="dateDay"&gt;1&lt;/span&gt;&lt;span class="dateYear"&gt;, 2014&lt;/span&gt;)&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/div&gt;&lt;/div&gt;&lt;span class="toolSet" style="font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14px; width: 335px;"&gt;&lt;div class="byline" style="margin: 0px; padding: 0px;"&gt;&lt;span itemprop="author" class="byline"&gt;Associated Press&lt;/span&gt;&lt;p class="date" style="margin: 0px; padding: 0px; color: rgb(147, 0, 0); font-size: 11px; font-style: italic;"&gt;&lt;span class="dateString"&gt;March 1, 2014&lt;/span&gt;&lt;span class="dateTimeSeparator"&gt;,&amp;nbsp;&lt;/span&gt;&lt;span class="timeString"&gt;10:10 a.m.&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;div class="clear" style="margin: 0px; padding: 0px; clear: both;"&gt;&lt;/div&gt;&lt;/span&gt;&lt;span style="font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14px;"&gt;&lt;/span&gt;&lt;div id="story-body-text" style="margin: 0px; padding: 0px; line-height: 1.43; position: relative; font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14px;"&gt;&lt;p style="margin: 0px; padding: 0px;"&gt;DUBAI, United Arab Emirates --&amp;nbsp;&lt;a class="taxInlineTagLink" id="PECLB001652" title="Roger Federer" href="http://www.latimes.com/topic/sports/tennis/roger-federer-PECLB001652.topic" style="color: rgb(34, 98, 204); text-decoration: none;"&gt;Roger Federer&lt;/a&gt;&amp;nbsp;won a record sixth Dubai Championships -- and 78th career title -- by beating&amp;nbsp;&lt;a class="taxInlineTagLink" id="PESPT000009085" title="Tomas Berdych" href="http://www.latimes.com/topic/sports/tennis/tomas-berdych-PESPT000009085.topic" style="color: rgb(34, 98, 204); text-decoration: none;"&gt;Tomas Berdych&lt;/a&gt;, 3-6, 6-4, 6-3, in the final on Saturday.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federer, who maintains a home in Dubai, delighted a packed stadium of fans who seemed biased for the Swiss in back-to-back wins over&amp;nbsp;&lt;a class="taxInlineTagLink" id="PESPT000009062" title="Novak Djokovic" href="http://www.latimes.com/topic/sports/tennis/novak-djokovic-PESPT000009062.topic" style="color: rgb(34, 98, 204); text-decoration: none;"&gt;Novak Djokovic&lt;/a&gt;&amp;nbsp;in the semifinals and Berdych.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federer''s win, his sixth here in the last 12 years, extends his record of winning at least one title a year to 14 consecutive years.&amp;nbsp;&lt;br&gt;&lt;br&gt;This is Federer''s first tournament victory since winning in Halle, his only title of 2013, last spring.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federer improved his record over Berdych to 12-6 with the win. The last time they played, however, Berdych beat Federer in the Dubai semifinals last year.&amp;nbsp;&lt;br&gt;&lt;br&gt;The loss ended Berdych''s longest winning streak of his career at 11 matches.&amp;nbsp;&lt;br&gt;&lt;br&gt;In the first set, the fourth-seeded Federer''s forehand looked shaky and he appeared a step slow.&amp;nbsp;&lt;br&gt;&lt;br&gt;After exchanging early service breaks, the third-seeded Berdych snared the go-ahead break in the sixth game. On a second break point at 30-40, Federer netted a backhand to lose serve.&amp;nbsp;&lt;br&gt;&lt;br&gt;In the second set, there was another early exchange of breaks. From 4-4, Federer won the final eight points of the set to even the set score.&amp;nbsp;&lt;br&gt;&lt;br&gt;Both players had break opportunities in the first two games of the third set - Berdych three and Federer one - but both held.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federer secured his victory when he broke Berdych on a second break point in the fourth game.&amp;nbsp;&lt;br&gt;&lt;br&gt;Federer faced two break points on his serve in the seventh game but held on to the game for 5-2.&amp;nbsp;&lt;br&gt;&lt;br&gt;Berdych was able to save two Federer match points on his own serve in the eighth game. But the Czech couldn''t stop Federer from serving out. On Federer''s third match point at 40-15 in the ninth game, Berdych netted a backhand return.&lt;/p&gt;&lt;/div&gt;&lt;span style="font-family: Georgia, ''Times New Roman'', Times, serif; font-size: 14px;"&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (14, N'Key indices hit new highs for 2nd day, Sensex just shy of 22,000', CAST(0x0000A17800000000 AS DateTime), CAST(0x0000A2FE00000000 AS DateTime), N'Mumbai: Indian markets were on fire Friday with the Sensex surging to a new closing high of 21,919.79 and the Nifty soaring to yet another record close of 6,526.65 as foreign investors continued to support the pre-election rally.
', N'&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (15, N'Key indices hit new highs for 2nd day, Sensex just shy of 22,000', CAST(0x0000A17800000000 AS DateTime), CAST(0x0000A2FE00000000 AS DateTime), N'Mumbai: Indian markets were on fire Friday with the Sensex surging to a new closing high of 21,919.79 and the Nifty soaring to yet another record close of 6,526.65 as foreign investors continued to support the pre-election rally.
', N'&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 2)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (16, N'Key indices hit new highs for 2nd day, Sensex just shy of 22,000', CAST(0x0000A17800000000 AS DateTime), CAST(0x0000A2FE00000000 AS DateTime), N'Mumbai: Indian markets were on fire Friday with the Sensex surging to a new closing high of 21,919.79 and the Nifty soaring to yet another record close of 6,526.65 as foreign investors continued to support the pre-election rally.
', N'&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (17, N'Key indices hit new highs for 2nd day, Sensex just shy of 22,000', CAST(0x0000A17800000000 AS DateTime), CAST(0x0000A2FE00000000 AS DateTime), N'Mumbai: Indian markets were on fire Friday with the Sensex surging to a new closing high of 21,919.79 and the Nifty soaring to yet another record close of 6,526.65 as foreign investors continued to support the pre-election rally.
', NULL, NULL)
INSERT [dbo].[NewsMaster] ([NewsMasterID], [NewsTitle], [ReleaseDate], [AvailableTill], [ShortDesc], [NewsDescription], [Status]) VALUES (18, N'fgd', CAST(0x0000901B00000000 AS DateTime), CAST(0x0000901B00000000 AS DateTime), N'fgdg', N'&lt;strong&gt;gdfgdfg&lt;/strong&gt;&lt;p&gt;&lt;/p&gt;', 2)
SET IDENTITY_INSERT [dbo].[NewsMaster] OFF
INSERT [dbo].[ProfessionMaster] ([PID], [Category], [Description]) VALUES (1, N'Professional', N'Professional')
INSERT [dbo].[ProfessionMaster] ([PID], [Category], [Description]) VALUES (2, N'Faculty', N'Faculty')
INSERT [dbo].[ProfessionMaster] ([PID], [Category], [Description]) VALUES (3, N'Student', N'Student')
INSERT [dbo].[ReferenceTypeMaster] ([ReferenceTypeID], [ReferenceType]) VALUES (1, N'News Letter')
SET IDENTITY_INSERT [dbo].[Sponsors] ON 

INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (1, N'Audi', N'/demo/Content/SponsorImages/audi-cars-logo-emblem.jpg', N'Audi cars', N'admin', CAST(0x0000A2E701210254 AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (2, N'Maruti Suzuki', N'/demo/Content/SponsorImages/635298110564197749.gif', N'Maruti Suzuki India Ltd.', N'admin', CAST(0x0000A2E701248C30 AS DateTime), 3, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (3, N'Zven Technologies', N'/demo/Content/SponsorImages/635298115290258064.png', N'Zven Technologies Pvt. Ltd.', N'admin', CAST(0x0000A2E70126A3BC AS DateTime), 1, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (4, N'GiftaTeddy.in', N'/demo/Content/SponsorImages/635298118624218756.png', N'GiftaTeddy.in', N'admin', CAST(0x0000A2E7012805A4 AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (5, N'Bharat Petrolium', N'/demo/Content/SponsorImages/635298123165228487.jpg', N'Bharat Petrolium', N'admin', CAST(0x0000A2E7012A3BA8 AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (6, N'Indian Oil', N'/demo/Content/SponsorImages/635298124329125058.gif', N'Indian OIl', N'admin', CAST(0x0000A2E7012A9E18 AS DateTime), 3, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (7, N'State Bank Of India', N'/demo/Content/SponsorImages/635298125199994869.jpg', N'State Bank Of India', N'admin', CAST(0x0000A2E7012B040C AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (8, N'ABG', N'/demo/Content/SponsorImages/635308256521845703.png', N'Sponsor', N'admin', CAST(0x0000A2F300BEAE74 AS DateTime), 1, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (9, N'NTPC', N'/demo/Content/SponsorImages/635309981840400390.png', N'NTPC', N'admin', CAST(0x0000A2F500BD7B6C AS DateTime), 1, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (10, N'SAIL', N'/demo/Content/SponsorImages/635309982065742187.png', N'SAIL', N'admin', CAST(0x0000A2F500BD9408 AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (11, N'Hero Honda', N'/demo/Content/SponsorImages/635309982224658203.png', N'Hero Honda', N'admin', CAST(0x0000A2F500BDAEFC AS DateTime), 3, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (12, N'NHPC', N'/demo/Content/SponsorImages/635309982486386718.png', N'NHPC', N'admin', CAST(0x0000A2F500BDC66C AS DateTime), 2, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (13, N'xcv', N'/demo/Content/SponsorImages/635333273231053231.jpg', N'vcx', N'admin', CAST(0x0000A31000AD16F0 AS DateTime), 1, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (14, N'bv', N'/demo/Content/SponsorImages/635333308234185296.jpg', N'bv', N'admin', CAST(0x0000A31000BD17D0 AS DateTime), 0, 0)
INSERT [dbo].[Sponsors] ([SponsorID], [SponsorName], [SponsorImage], [Description], [CreatedBy], [CreatedOn], [SponsorPriority], [Flag]) VALUES (15, N'Jaypee', N'/demo/Content/SponsorImages/635667628629674754.jpg', N'Jaypee Cement', N'admin', CAST(0x0000A49300A6F4A0 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Sponsors] OFF
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (87, N'IN01', N'Andaman and Nicobar islands', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (88, N'IN02', N'Andhra Pradesh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (89, N'IN30', N'Arunachal Pradesh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (90, N'IN03', N'Assam', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (91, N'IN34', N'Bihar', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (92, N'IN05', N'Chandigarh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (93, N'IN37', N'Chattisgarh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (94, N'IN06', N'Dadar and Nagar Haveli', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (95, N'IN32', N'Daman and Diu', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (96, N'IN07', N'Delhi', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (97, N'IN33', N'Goa', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (98, N'IN09', N'Gujarat', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (99, N'IN10', N'Haryana', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (100, N'IN11', N'Himachal Pradesh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (103, N'IN12', N'Jammu and kashmir', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (104, N'IN38', N'Jharkhand', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (105, N'IN19', N'Karnataka', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (106, N'IN13', N'Kerala', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (107, N'IN14', N'Lakshadweep', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (108, N'IN35', N'Madhya Pradesh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (109, N'IN16', N'Maharashtra', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (110, N'IN17', N'Manipur', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (111, N'IN18', N'Meghalaya`', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (112, N'IN31', N'Mizoram', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (113, N'IN20', N'Nagaland', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (114, N'IN21', N'Orissa', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (115, N'IN22', N'Puducherry', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (116, N'IN23', N'Punjab', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (117, N'IN24', N'Rajasthan', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (118, N'IN29', N'Sikkim', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (119, N'IN25', N'Tamil Nadu', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (120, N'IN26', N'Tripura', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (121, N'IN39', N'Uttarakhand', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (122, N'IN36', N'Uttar Pradesh', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (123, N'IN28', N'West Bengal', 424, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (124, N'AF01', N'Badakhshan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (125, N'AF02', N'Badghis', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (126, N'AF03', N'Baghlan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (127, N'AF30', N'Balkh', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (128, N'AF05', N'Bamian', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (129, N'AF41', N'Daikondi', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (130, N'AF06', N'Farah', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (131, N'AF07', N'Faryab', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (132, N'AF08', N'Ghazni', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (133, N'AF09', N'Ghowr', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (134, N'AF10', N'Helmand', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (135, N'AF11', N'Herat', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (136, N'AF31', N'Jowzjan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (137, N'AF13', N'Kabul', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (138, N'AF23', N'Kandahar', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (139, N'AF14', N'Kapisa', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (140, N'AF37', N'Khowst', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (141, N'AF34', N'Konar', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (142, N'AF24', N'Kondoz', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (143, N'AF35', N'Laghman', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (144, N'AF17', N'Lowgar', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (145, N'AF18', N'Nangarhar', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (146, N'AF19', N'Nimruz', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (147, N'AF38', N'Nurestan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (148, N'AF39', N'Oruzgan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (149, N'AF36', N'Paktia', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (150, N'AF29', N'Paktika', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (151, N'AF42', N'Panjshir', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (152, N'AF40', N'Parvan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (153, N'AF32', N'Samangan', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (154, N'AF33', N'Sar-e Pol', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (155, N'AF26', N'Takhar', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (156, N'AF27', N'Vardak', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (157, N'AF28', N'Zabol', 326, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (158, N'AL40', N'Berat', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (159, N'AL41', N'Dib?r', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (160, N'AL42', N'Durr?s', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (161, N'AL43', N'Elbasan', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (162, N'AL44', N'Fier', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (163, N'AL45', N'Gjirokast?r', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (164, N'AL46', N'Kor??', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (165, N'AL47', N'Kuk?s', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (166, N'AL48', N'Lezh?', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (167, N'AL49', N'Shkod?r', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (168, N'AL50', N'Tiran?', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (169, N'AL51', N'Vlor?', 327, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (170, N'AG34', N'Adrar', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (171, N'AG35', N'A?n Defla', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (172, N'AG36', N'A?n T?mouchent', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (173, N'AG01', N'Alger', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (174, N'AG37', N'Annaba', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (175, N'AG03', N'Batna', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (176, N'AG38', N'B?char', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (177, N'AG18', N'B?ja?a', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (178, N'AG19', N'Biskra', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (179, N'AG20', N'Blida', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (180, N'AG39', N'Bordj Bou Arr?ridj', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (181, N'AG21', N'Bouira', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (182, N'AG40', N'Boumerd?s', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (183, N'AG41', N'Chlef', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (184, N'AG04', N'Constantine', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (185, N'AG22', N'Djelfa', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (186, N'AG42', N'El Bayadh', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (187, N'AG43', N'El Oued', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (188, N'AG44', N'El Tarf', 328, 0)
GO
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (189, N'AG45', N'Gharda?a', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (190, N'AG23', N'Guelma', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (191, N'AG46', N'Illizi', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (192, N'AG24', N'Jijel', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (193, N'AG47', N'Khenchela', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (194, N'AG25', N'Laghouat', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (195, N'AG26', N'Mascara', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (196, N'AG06', N'M?d?a', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (197, N'AG48', N'Mila', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (198, N'AG07', N'Mostaganem', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (199, N'AG27', N'Msila', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (200, N'AG49', N'Naama', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (201, N'AG09', N'Oran', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (202, N'AG50', N'Ouargla', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (203, N'AG29', N'Oum el Bouaghi', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (204, N'AG51', N'Relizane', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (205, N'AG10', N'Sa?da', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (206, N'AG12', N'S?tif', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (207, N'AG30', N'Sidi Bel Abb?s', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (208, N'AG31', N'Skikda', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (209, N'AG52', N'Souk Ahras', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (210, N'AG53', N'Tamanghasset', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (211, N'AG33', N'T?bessa', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (212, N'AG13', N'Tiaret', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (213, N'AG54', N'Tindouf', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (214, N'AG55', N'Tipaza', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (215, N'AG56', N'Tissemsilt', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (216, N'AG14', N'Tizi Ouzou', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (217, N'AG15', N'Tlemcen', 328, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (218, N'010', N'Eastern', 329, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (219, N'020', N'Manu''a', 329, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (220, N'050', N'Western', 329, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (221, N'*', N'Unorganized', 329, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (222, N'AN07', N'Andorra la Vella', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (223, N'AN02', N'Canillo', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (224, N'AN03', N'Encamp', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (225, N'AN08', N'Escaldes-Engordany', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (226, N'AN04', N'La Massana', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (227, N'AN05', N'Ordino', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (228, N'AN06', N'Sant Juli? de L?ria', 330, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (229, N'AO19', N'Bengo', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (230, N'AO01', N'Benguela', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (231, N'AO02', N'Bi?', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (232, N'AO03', N'Cabinda', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (233, N'AO04', N'Cuando ', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (234, N'AO05', N'Cuanza Norte', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (235, N'AO06', N'Cuanza Sul', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (236, N'AO07', N'Cunene', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (237, N'AO08', N'Huambo', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (238, N'AO09', N'Hu?la', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (239, N'AO20', N'Luanda', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (240, N'AO18', N'Lunda Sul', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (241, N'AO12', N'Malanje', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (242, N'AO14', N'Moxico', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (243, N'AO13', N'Namibe', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (244, N'AO15', N'U?ge', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (245, N'AO16', N'Zaire', 331, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (249, N'AI.BP', N'Blowing Point', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (250, N'AI.EE', N'East End', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (251, N'AI.GH', N'George Hill', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (252, N'AI.IH', N'Island Harbour', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (253, N'AI.NH', N'North Hill', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (254, N'AI.NS', N'North Side', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (255, N'AI.SG', N'Sandy Ground', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (256, N'AI.SH', N'Sandy Hill', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (257, N'AI.SO', N'South Hill', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (259, N'AI.ST', N'Stoney Ground', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (260, N'AI.TF', N'The Farrington', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (261, N'AI.TQ', N'The Quarter (including Rey Hill)', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (262, N'AI.TV', N'The Valley (including Upper & South Valley)', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (263, N'AI.WE', N'West End (including Long Bay)', 332, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (264, N'AQ.NT', N'Unclaimed', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (265, N'AQ.CL', N'Chile Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (266, N'AQ.CU', N'Chile/UK Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (267, N'AQ.CA', N'Chile/UK/Argentina Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (268, N'AQ.AK', N'Argentina/UK Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (269, N'AQ.UK', N'United Kingdom Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (270, N'AQ.NO', N'Norway Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (271, N'AQ.AU', N'Australia Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (272, N'AQ.FR', N'France Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (273, N'AQ.NZ', N'New Zealand Claim', 333, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (274, N'AC01', N'Barbuda', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (275, N'AC09', N'Redonda', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (276, N'AC03', N'Saint George', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (277, N'AC04', N'Saint John', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (278, N'AC05', N'Saint Mary', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (279, N'AC06', N'Saint Paul', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (280, N'AC07', N'Saint Peter', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (281, N'AC08', N'Saint Philip', 334, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (282, N'AR01', N'Buenos Aires', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (283, N'AR02', N'Catamarca', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (284, N'AR03', N'Chaco', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (285, N'AR04', N'Chubut', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (286, N'AR07', N'Ciudad de Buenos Aires', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (287, N'AR05', N'C?rdoba', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (288, N'AR06', N'Corrientes', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (289, N'AR08', N'Entre R?os', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (290, N'AR09', N'Formosa', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (291, N'AR10', N'Jujuy', 335, 0)
INSERT [dbo].[States] ([StateID], [StateCode], [StateName], [CountryID], [StatusID]) VALUES (292, N'AR11', N'La Pampa', 335, 0)
GO
SET IDENTITY_INSERT [dbo].[StatusMaster] ON 

INSERT [dbo].[StatusMaster] ([StatusID], [Status]) VALUES (1, N'Active')
INSERT [dbo].[StatusMaster] ([StatusID], [Status]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[StatusMaster] OFF
INSERT [dbo].[UserMaster] ([UserID], [FullName], [EmailID], [UserName], [Password], [DOB], [Gender], [Role], [Status], [IsForcePasswordChange], [IsActive], [RegistrationDate]) VALUES (N'432412332313', N'Admin', N'admin@gmail.com', N'admin@gmail.com', N'f37427482b0311a8f3ea336ba0b60df1', CAST(0x00009E0B00000000 AS DateTime), 1, 1, 1, 1, 1, CAST(0x00009E0B00000000 AS DateTime))
ALTER TABLE [dbo].[ContactPerson]  WITH CHECK ADD  CONSTRAINT [FK_ContactPerson_Sponsors] FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([SponsorID])
GO
ALTER TABLE [dbo].[ContactPerson] CHECK CONSTRAINT [FK_ContactPerson_Sponsors]
GO
ALTER TABLE [dbo].[EventMaster]  WITH CHECK ADD  CONSTRAINT [FK_EventMaster_AddressMaster] FOREIGN KEY([EventLocationAddressID])
REFERENCES [dbo].[AddressMaster] ([AddressID])
GO
ALTER TABLE [dbo].[EventMaster] CHECK CONSTRAINT [FK_EventMaster_AddressMaster]
GO
ALTER TABLE [dbo].[EventMaster]  WITH CHECK ADD  CONSTRAINT [FK_EventMaster_EventTypeMaster] FOREIGN KEY([EventTypeID])
REFERENCES [dbo].[EventTypeMaster] ([EventTypeID])
GO
ALTER TABLE [dbo].[EventMaster] CHECK CONSTRAINT [FK_EventMaster_EventTypeMaster]
GO
ALTER TABLE [dbo].[EventMaster]  WITH CHECK ADD  CONSTRAINT [FK_EventMaster_StatusMaster] FOREIGN KEY([StatusID])
REFERENCES [dbo].[StatusMaster] ([StatusID])
GO
ALTER TABLE [dbo].[EventMaster] CHECK CONSTRAINT [FK_EventMaster_StatusMaster]
GO
ALTER TABLE [dbo].[EventSponsorMapping]  WITH CHECK ADD  CONSTRAINT [FK_EventSponsorMapping_EventMaster] FOREIGN KEY([EventMasterID])
REFERENCES [dbo].[EventMaster] ([EventMasterID])
GO
ALTER TABLE [dbo].[EventSponsorMapping] CHECK CONSTRAINT [FK_EventSponsorMapping_EventMaster]
GO
ALTER TABLE [dbo].[EventSponsorMapping]  WITH CHECK ADD  CONSTRAINT [FK_EventSponsorMapping_Sponsors] FOREIGN KEY([SponsorID])
REFERENCES [dbo].[Sponsors] ([SponsorID])
GO
ALTER TABLE [dbo].[EventSponsorMapping] CHECK CONSTRAINT [FK_EventSponsorMapping_Sponsors]
GO
ALTER TABLE [dbo].[EventTabDetail]  WITH CHECK ADD  CONSTRAINT [FK_EventTabDetail_EventMaster] FOREIGN KEY([EventMasterID])
REFERENCES [dbo].[EventMaster] ([EventMasterID])
GO
ALTER TABLE [dbo].[EventTabDetail] CHECK CONSTRAINT [FK_EventTabDetail_EventMaster]
GO
ALTER TABLE [dbo].[NewsMaster]  WITH CHECK ADD  CONSTRAINT [FK_NewsMaster_NewsMaster] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusMaster] ([StatusID])
GO
ALTER TABLE [dbo].[NewsMaster] CHECK CONSTRAINT [FK_NewsMaster_NewsMaster]
GO
USE [master]
GO
ALTER DATABASE [cmsbak] SET  READ_WRITE 
GO
