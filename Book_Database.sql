USE [master]
GO
/****** Object:  Database [Book Database]    Script Date: 13-03-2019 12:14:32 ******/
CREATE DATABASE [Book Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Book Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Book Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Book Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Book Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Book Database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Book Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Book Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Book Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Book Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Book Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Book Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Book Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Book Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Book Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Book Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Book Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Book Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Book Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Book Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Book Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Book Database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Book Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Book Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Book Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Book Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Book Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Book Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Book Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Book Database] SET RECOVERY FULL 
GO
ALTER DATABASE [Book Database] SET  MULTI_USER 
GO
ALTER DATABASE [Book Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Book Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Book Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Book Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Book Database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Book Database', N'ON'
GO
ALTER DATABASE [Book Database] SET QUERY_STORE = OFF
GO
USE [Book Database]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 13-03-2019 12:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Author_ID] [int] NOT NULL,
	[Author_Name] [varchar](20) NOT NULL,
	[Contact_Number] [numeric](10, 0) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 13-03-2019 12:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_ID] [int] IDENTITY(111,1) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Publisher_ID] [int] NOT NULL,
	[Published_Year] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Authors]    Script Date: 13-03-2019 12:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Authors](
	[Book_ID] [int] NOT NULL,
	[Author_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Copies]    Script Date: 13-03-2019 12:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Copies](
	[Book_ID] [int] NOT NULL,
	[No_of_Copies] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 13-03-2019 12:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Publisher_ID] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Contact_Number] [numeric](10, 0) NOT NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Publisher_1] PRIMARY KEY CLUSTERED 
(
	[Publisher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([Publisher_ID])
REFERENCES [dbo].[Publisher] ([Publisher_ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Book_Authors]  WITH CHECK ADD  CONSTRAINT [FK_Book_Authors_Authors] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Authors] ([Author_ID])
GO
ALTER TABLE [dbo].[Book_Authors] CHECK CONSTRAINT [FK_Book_Authors_Authors]
GO
ALTER TABLE [dbo].[Book_Authors]  WITH CHECK ADD  CONSTRAINT [FK_Book_Authors_Book] FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Book_Authors] CHECK CONSTRAINT [FK_Book_Authors_Book]
GO
ALTER TABLE [dbo].[Book_Copies]  WITH CHECK ADD  CONSTRAINT [FK_Book_Copies_Book] FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Book_Copies] CHECK CONSTRAINT [FK_Book_Copies_Book]
GO
USE [master]
GO
ALTER DATABASE [Book Database] SET  READ_WRITE 
GO
