/****** Object:  Database [dbcartrust]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'dbcartrust')
DROP DATABASE [dbcartrust]
GO

/****** Object:  Table [dbo].[visit_service]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[visit_service]') AND type in (N'U'))
DROP TABLE [dbo].[visit_service]
GO
/****** Object:  Table [dbo].[users]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[user_visit]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user_visit]') AND type in (N'U'))
DROP TABLE [dbo].[user_visit]
GO
/****** Object:  Table [dbo].[user_stat]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user_stat]') AND type in (N'U'))
DROP TABLE [dbo].[user_stat]
GO
/****** Object:  Table [dbo].[service_image]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service_image]') AND type in (N'U'))
DROP TABLE [dbo].[service_image]
GO
/****** Object:  Table [dbo].[service_category]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service_category]') AND type in (N'U'))
DROP TABLE [dbo].[service_category]
GO
/****** Object:  Table [dbo].[service]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service]') AND type in (N'U'))
DROP TABLE [dbo].[service]
GO
/****** Object:  Table [dbo].[scheduled_visit]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduled_visit]') AND type in (N'U'))
DROP TABLE [dbo].[scheduled_visit]
GO
/****** Object:  Table [dbo].[promo]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[promo]') AND type in (N'U'))
DROP TABLE [dbo].[promo]
GO
USE [master]
GO
/****** Object:  Database [dbcartrust]    Script Date: 17/11/2019 3:32:02 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'dbcartrust')
DROP DATABASE [dbcartrust]
GO
/****** Object:  Database [dbcartrust]    Script Date: 17/11/2019 3:32:02 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'dbcartrust')
BEGIN
CREATE DATABASE [dbcartrust]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCartrust', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbCartrust3.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbCartrust_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbCartrust_log3.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [dbcartrust] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbcartrust].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbcartrust] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbcartrust] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbcartrust] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbcartrust] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbcartrust] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbcartrust] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbcartrust] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbcartrust] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbcartrust] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbcartrust] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbcartrust] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbcartrust] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbcartrust] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbcartrust] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbcartrust] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbcartrust] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbcartrust] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbcartrust] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbcartrust] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbcartrust] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbcartrust] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbcartrust] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbcartrust] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbcartrust] SET RECOVERY FULL 
GO
ALTER DATABASE [dbcartrust] SET  MULTI_USER 
GO
ALTER DATABASE [dbcartrust] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbcartrust] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbcartrust] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbcartrust] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbcartrust', N'ON'
GO
USE [dbcartrust]
GO
/****** Object:  Table [dbo].[promo]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[promo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[promo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promo_name] [varchar](150) NULL,
	[file_name] [varchar](50) NULL,
 CONSTRAINT [PK_promo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[scheduled_visit]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[scheduled_visit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[scheduled_visit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visit_time] [varchar](50) NULL,
	[visitor_name] [varchar](50) NULL,
	[visitor_email] [varchar](50) NULL,
	[visitor_car_model] [varchar](50) NULL,
	[visitor_car_released] [int] NULL,
 CONSTRAINT [PK_scheduled_visit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [varchar](100) NULL,
	[service_cost] [decimal](18, 0) NULL,
	[service_category] [int] NULL,
	[service_description] [varchar](2000) NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service_category]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service_category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[service_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_service_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service_image]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[service_image]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[service_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NULL,
	[image_path] [varchar](250) NULL,
 CONSTRAINT [PK_service_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_stat]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user_stat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[user_stat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[login_date] [date] NULL,
 CONSTRAINT [PK_user_stat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[user_visit]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user_visit]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[user_visit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[visit_time] [datetime] NULL,
 CONSTRAINT [PK_user_visit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[users]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](512) NOT NULL,
	[usession] [varchar](512) NOT NULL,
	[active] [tinyint] NOT NULL CONSTRAINT [DF_users_active]  DEFAULT ((1)),
	[isAdmin] [tinyint] NOT NULL CONSTRAINT [DF_is_admin]  DEFAULT ((0)),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visit_service]    Script Date: 17/11/2019 3:32:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[visit_service]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[visit_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NULL,
	[visit_id] [int] NULL,
 CONSTRAINT [PK_visit_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [master]
GO
ALTER DATABASE [dbcartrust] SET  READ_WRITE 
GO
