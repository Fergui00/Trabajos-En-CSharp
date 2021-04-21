USE [master]
GO
/****** Object:  Database [cliente]    Script Date: 25/10/2020 22:44:44 ******/
CREATE DATABASE [cliente]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cliente', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cliente.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cliente_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cliente_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cliente] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cliente].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cliente] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cliente] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cliente] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cliente] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cliente] SET ARITHABORT OFF 
GO
ALTER DATABASE [cliente] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cliente] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cliente] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cliente] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cliente] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cliente] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cliente] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cliente] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cliente] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cliente] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cliente] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cliente] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cliente] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cliente] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cliente] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cliente] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cliente] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cliente] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cliente] SET  MULTI_USER 
GO
ALTER DATABASE [cliente] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cliente] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cliente] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cliente] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cliente] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cliente] SET QUERY_STORE = OFF
GO
USE [cliente]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](80) NOT NULL,
	[sexo] [varchar](1) NULL,
	[fecha_nacimiento] [date] NULL,
	[tipo_documento] [varchar](12) NULL,
	[documento] [varchar](11) NULL,
	[direccion] [varchar](250) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_apellidos]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_cliente_apellidos]
@textobuscar varchar(100)
as
select * from cliente
where apellidos like '%'+@textobuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_nombre]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_cliente_nombre]
@textobuscar varchar(100)
as
select * from cliente
where nombre like '%'+@textobuscar+'%'
GO
/****** Object:  StoredProcedure [dbo].[speditar_cliente]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_cliente]
@idcliente int,
@nombre varchar(50),
@apellido varchar(80),
@sexo varchar(1),
@fecha_nacimiento date,
@tipodocumento varchar(12),
@documento varchar(11),
@direccion varchar(250)
as
update cliente set nombre=@nombre,apellidos=@apellido,sexo=@sexo,fecha_nacimiento=@fecha_nacimiento,
tipo_documento=@tipodocumento,documento=@documento,direccion=@direccion
where idcliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[speliminar_cliente]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_cliente]
@idcliente int
as
delete cliente where idcliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_cliente]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spinsertar_cliente]
@idcliente int output,
@nombre varchar(50),
@apellido varchar(80),
@sexo varchar(1),
@fecha_nacimiento date,
@tipodocumento varchar(12),
@documento varchar(11),
@direccion varchar(250)
as
insert into cliente (nombre,apellidos,sexo,fecha_nacimiento,tipo_documento,documento,direccion)
values(@nombre,@apellido,@sexo,@fecha_nacimiento,@tipodocumento,@documento,@direccion)
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_cliente]    Script Date: 25/10/2020 22:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spmostrar_cliente]
as
select top 200 * from cliente
order by idcliente asc
GO
USE [master]
GO
ALTER DATABASE [cliente] SET  READ_WRITE 
GO
