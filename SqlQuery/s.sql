USE [master]
GO
/****** Object:  Database [UrunDb]    Script Date: 11.09.2021 14:44:26 ******/
CREATE DATABASE [UrunDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UrunDb', FILENAME = N'C:\Users\azder\UrunDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UrunDb_log', FILENAME = N'C:\Users\azder\UrunDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UrunDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UrunDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UrunDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UrunDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UrunDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UrunDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UrunDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UrunDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UrunDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UrunDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UrunDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UrunDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UrunDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UrunDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UrunDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UrunDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UrunDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UrunDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UrunDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UrunDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UrunDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UrunDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UrunDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UrunDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UrunDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UrunDb] SET  MULTI_USER 
GO
ALTER DATABASE [UrunDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UrunDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UrunDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UrunDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UrunDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UrunDb] SET QUERY_STORE = OFF
GO
USE [UrunDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [UrunDb]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 11.09.2021 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[kategoriId] [int] IDENTITY(1,1) NOT NULL,
	[kategoriAd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[kategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 11.09.2021 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[musteriId] [int] IDENTITY(1,1) NOT NULL,
	[musteriAd] [nvarchar](50) NULL,
	[musteriSoyad] [nvarchar](50) NULL,
	[musteriSehir] [nvarchar](20) NULL,
	[musteriIlce] [nvarchar](20) NULL,
	[musteriAdres] [nvarchar](200) NULL,
	[musteriDurum] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[musteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satıs]    Script Date: 11.09.2021 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satıs](
	[satısId] [int] IDENTITY(1,1) NOT NULL,
	[s_urunId] [int] NULL,
	[s_musteriId] [int] NULL,
	[satısFiyat] [decimal](18, 2) NULL,
	[satısTarih] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[satısId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 11.09.2021 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[urunId] [int] IDENTITY(1,1) NOT NULL,
	[urunAd] [nvarchar](100) NULL,
	[urunMarka] [nvarchar](30) NULL,
	[urunStok] [smallint] NULL,
	[urunFiyat] [decimal](18, 2) NULL,
	[urunDurum] [bit] NULL,
	[u_kategoriID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[urunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (1, N'Bilgisayar')
INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (2, N'Telefon')
INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (3, N'Aksesuar')
INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (4, N'Beyaz Esya')
INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (5, N'Kitap')
INSERT [dbo].[Kategori] ([kategoriId], [kategoriAd]) VALUES (6, N'Tablet')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteri] ON 

INSERT [dbo].[Musteri] ([musteriId], [musteriAd], [musteriSoyad], [musteriSehir], [musteriIlce], [musteriAdres], [musteriDurum]) VALUES (1, N'Barbara', N'Palvin', N'Mardin', N'Kiziltepe', N'Cumhuriyet Mahallesi 726. sokak no:12 daire:2', 1)
INSERT [dbo].[Musteri] ([musteriId], [musteriAd], [musteriSoyad], [musteriSehir], [musteriIlce], [musteriAdres], [musteriDurum]) VALUES (2, N'Jessica', N'Alba', N'Istanbul', N'Sefakör', N'Senses Mahallesi 726. sokak no:12 daire:2', 0)
INSERT [dbo].[Musteri] ([musteriId], [musteriAd], [musteriSoyad], [musteriSehir], [musteriIlce], [musteriAdres], [musteriDurum]) VALUES (3, N'Jennifer', N'Aniston', N'Ankara', N'Güngören', N'Delibal Mahallesi 726. sokak no:12 daire:2', 0)
INSERT [dbo].[Musteri] ([musteriId], [musteriAd], [musteriSoyad], [musteriSehir], [musteriIlce], [musteriAdres], [musteriDurum]) VALUES (4, N'Jason', N'Mamoa', N'Elazığ', N'Merkez', N'Çaydaçıra Mahallesi 2.etap no18 d:', 1)
SET IDENTITY_INSERT [dbo].[Musteri] OFF
GO
SET IDENTITY_INSERT [dbo].[Satıs] ON 

INSERT [dbo].[Satıs] ([satısId], [s_urunId], [s_musteriId], [satısFiyat], [satısTarih]) VALUES (1, 1, 1, CAST(2300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Satıs] ([satısId], [s_urunId], [s_musteriId], [satısFiyat], [satısTarih]) VALUES (2, 2, 2, CAST(3250.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Satıs] ([satısId], [s_urunId], [s_musteriId], [satısFiyat], [satısTarih]) VALUES (3, 4, 2, CAST(1200.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Satıs] OFF
GO
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (1, N'Buzdolabi', N'Arçelik', 100, CAST(4700.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (2, N'Iphone X', N'Apple', 50, CAST(12500.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (3, N'Kol Saati', N'FOSSIL', 20, CAST(1500.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (4, N'Küçük Prens', N'Yapi Kredi Yayinlari', 200, CAST(20.00 AS Decimal(18, 2)), 1, 5)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (5, N'Ideaped 520', N'Lenovo', 300, CAST(6200.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (6, N'Süpürge Makinası', N'Faakir', 50, CAST(2500.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (7, N'Buzdolabı', N'Arçelik', 25, CAST(3250.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Urun] ([urunId], [urunAd], [urunMarka], [urunStok], [urunFiyat], [urunDurum], [u_kategoriID]) VALUES (8, N'Kahve Makinası', N'Arçelik', 10, CAST(4444.00 AS Decimal(18, 2)), 1, 4)
SET IDENTITY_INSERT [dbo].[Urun] OFF
GO
ALTER TABLE [dbo].[Satıs]  WITH CHECK ADD FOREIGN KEY([s_musteriId])
REFERENCES [dbo].[Musteri] ([musteriId])
GO
ALTER TABLE [dbo].[Satıs]  WITH CHECK ADD FOREIGN KEY([s_urunId])
REFERENCES [dbo].[Urun] ([urunId])
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD FOREIGN KEY([u_kategoriID])
REFERENCES [dbo].[Kategori] ([kategoriId])
GO
/****** Object:  StoredProcedure [dbo].[MarkaGetir]    Script Date: 11.09.2021 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MarkaGetir]
AS
	select top 1 urunMarka from Urun Group by urunMarka order by COUNT(*) desc
GO
USE [master]
GO
ALTER DATABASE [UrunDb] SET  READ_WRITE 
GO
