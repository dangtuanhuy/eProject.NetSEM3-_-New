USE [master]
GO
/****** Object:  Database [KarnelTravel]    Script Date: 9/21/2018 10:48:44 AM ******/
CREATE DATABASE [KarnelTravel]
GO
ALTER DATABASE [KarnelTravel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KarnelTravel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KarnelTravel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KarnelTravel] SET ARITHABORT OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KarnelTravel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KarnelTravel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KarnelTravel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KarnelTravel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KarnelTravel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KarnelTravel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KarnelTravel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KarnelTravel] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [KarnelTravel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KarnelTravel] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KarnelTravel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KarnelTravel] SET  MULTI_USER 
GO
ALTER DATABASE [KarnelTravel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KarnelTravel] SET ENCRYPTION ON
GO
ALTER DATABASE [KarnelTravel] SET QUERY_STORE = ON
GO
ALTER DATABASE [KarnelTravel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [KarnelTravel]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 9/21/2018 10:48:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 9/21/2018 10:48:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[AboutName] [nvarchar](50) NULL,
	[AboutBirth] [date] NULL,
	[AboutGender] [bit] NULL,
	[AboutLike] [nvarchar](150) NULL,
	[AboutImg] [nvarchar](250) NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/21/2018 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/21/2018 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Id] [nvarchar](20) NOT NULL,
	[Customer_Password] [nvarchar](32) NULL,
	[Customer_LastName] [nvarchar](20) NULL,
	[Customer_FirstName] [nvarchar](20) NULL,
	[Customer_Bithday] [date] NULL,
	[Customer_Gender] [bit] NULL,
	[Customer_Phone] [nvarchar](20) NULL,
	[Customer_Address] [ntext] NULL,
	[Customer_Email] [nvarchar](50) NULL,
	[Customer_Possport] [nvarchar](20) NULL,
 CONSTRAINT [PK__Customer__8CB28699363DD3B5] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/21/2018 10:48:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[SenderName] [nvarchar](50) NULL,
	[SenderMail] [nvarchar](50) NULL,
	[FeedBackTitle] [nvarchar](40) NULL,
	[FeedBackContent] [nvarchar](150) NULL,
	[State] [bit] NOT NULL,
	[Create_on] [datetime] NOT NULL,
 CONSTRAINT [PK__Feedback__6A4BEDD6D723F049] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 9/21/2018 10:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[Food_Code] [nvarchar](20) NOT NULL,
	[Food_Name] [nvarchar](20) NULL,
	[Food_Price] [decimal](12, 2) NULL,
	[Food_Specific] [ntext] NULL,
	[Restaurant_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Food_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 9/21/2018 10:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Hotel_Id] [nvarchar](20) NOT NULL,
	[Hotel_Name] [nvarchar](120) NULL,
	[Hotel_Address] [nvarchar](255) NULL,
	[Hotel_Details] [nvarchar](max) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Hotels__AA4FC851081BE738] PRIMARY KEY CLUSTERED 
(
	[Hotel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgFoods]    Script Date: 9/21/2018 10:48:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgFoods](
	[Img_Foods_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Foods] [nvarchar](max) NULL,
	[Img_Foods_Sort] [tinyint] NOT NULL,
	[Food_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Foods_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgHotels]    Script Date: 9/21/2018 10:48:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgHotels](
	[Img_Hotels_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Hotels] [nvarchar](max) NULL,
	[Img_Hotels_Sort] [tinyint] NOT NULL,
	[Hotel_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Hotels_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgRestaurants]    Script Date: 9/21/2018 10:48:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgRestaurants](
	[Img_Restaurants_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Restaurants] [nvarchar](max) NULL,
	[Img_Restaurants_Sort] [tinyint] NOT NULL,
	[Restaurant_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Restaurants_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgRooms]    Script Date: 9/21/2018 10:48:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgRooms](
	[Img_Rooms_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Rooms] [nvarchar](max) NULL,
	[Img_Rooms_Sort] [tinyint] NOT NULL,
	[Room_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Rooms_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgTouristSpot]    Script Date: 9/21/2018 10:48:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgTouristSpot](
	[Img_TouristSpot_Id] [int] NOT NULL,
	[Img_TouristSpot] [nvarchar](max) NULL,
	[Img_TouristSpot_Sort] [tinyint] NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK_ImgTouristSpot] PRIMARY KEY CLUSTERED 
(
	[Img_TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/21/2018 10:48:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Location_Id] [nvarchar](20) NOT NULL,
	[Location_Name] [nvarchar](20) NULL,
	[Location_Location] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 9/21/2018 10:48:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Restaurant_Code] [nvarchar](20) NOT NULL,
	[Restaurant_Name] [nvarchar](20) NULL,
	[Restaurant_Address] [nvarchar](150) NULL,
	[Restaurant_Description] [ntext] NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Restaurant_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 9/21/2018 10:48:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Room_Id] [nvarchar](20) NOT NULL,
	[Room_Type] [nvarchar](55) NULL,
	[Room_Name] [nvarchar](50) NULL,
	[Room_Start] [time](7) NULL,
	[Room_Stop] [time](7) NULL,
	[Room_Cost] [money] NULL,
	[Hotel_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Rooms__19EE6A1397D0401A] PRIMARY KEY CLUSTERED 
(
	[Room_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 9/21/2018 10:48:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouristSpot]    Script Date: 9/21/2018 10:48:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouristSpot](
	[TouristSpot_Id] [nvarchar](20) NOT NULL,
	[TouristSpot_Name] [nvarchar](30) NULL,
	[TouristSpot_Limit] [int] NULL,
	[TouristSpot_Price] [decimal](12, 0) NULL,
	[TouristSpot_Specific] [nvarchar](20) NULL,
	[TouristSpot_Status] [bit] NULL,
	[Location_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__TouristS__87091DC549C789A0] PRIMARY KEY CLUSTERED 
(
	[TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportations]    Script Date: 9/21/2018 10:48:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportations](
	[Transportation_Id] [nvarchar](20) NOT NULL,
	[Transportation_Name] [nvarchar](100) NOT NULL,
	[Transportation_Details] [nvarchar](255) NULL,
	[Transportation_Img] [nvarchar](150) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Transpor__B821F19693C36C8D] PRIMARY KEY CLUSTERED 
(
	[Transportation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 9/21/2018 10:48:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[Trip_Id] [nvarchar](20) NOT NULL,
	[Trip_Name] [nvarchar](25) NOT NULL,
	[Trip_Details] [ntext] NULL,
	[Trip_Date] [datetime] NULL,
	[Trip_Address] [ntext] NULL,
	[Trip_Status] [bit] NULL,
	[Customer_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Trip__6852735EF9FB8961] PRIMARY KEY CLUSTERED 
(
	[Trip_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripDetails]    Script Date: 9/21/2018 10:48:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripDetails](
	[Trip_Id] [nvarchar](20) NOT NULL,
	[TouristSpot_Id] [nvarchar](20) NOT NULL,
	[Trip_Quantity] [int] NULL,
	[Trip_Payment] [bit] NULL,
	[PaymentOnline] [nvarchar](50) NULL,
 CONSTRAINT [PK_TripDetails] PRIMARY KEY CLUSTERED 
(
	[Trip_Id] ASC,
	[TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Vehicle_Id] [nvarchar](20) NOT NULL,
	[Vehicle_Name] [nvarchar](50) NULL,
	[Vehicle_Price] [decimal](12, 0) NULL,
	[Vehicle_Weight] [int] NULL,
	[Vehicle_Img] [nvarchar](50) NULL,
	[Transportation_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Custom__4BAC3F29]  DEFAULT ((1)) FOR [Customer_Gender]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__State__160F4887]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__Create__17036CC0]  DEFAULT (getdate()) FOR [Create_on]
GO
ALTER TABLE [dbo].[TouristSpot] ADD  CONSTRAINT [DF_TouristSpot_TouristSpot_Status]  DEFAULT ((0)) FOR [TouristSpot_Status]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Date]  DEFAULT (getdate()) FOR [Trip_Date]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Status]  DEFAULT ((0)) FOR [Trip_Status]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK__Hotels__TouristS__5EBF139D] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK__Hotels__TouristS__5EBF139D]
GO
ALTER TABLE [dbo].[ImgFoods]  WITH CHECK ADD FOREIGN KEY([Food_Code])
REFERENCES [dbo].[Foods] ([Food_Code])
GO
ALTER TABLE [dbo].[ImgHotels]  WITH CHECK ADD  CONSTRAINT [FK__ImgHotels__Hotel__60A75C0F] FOREIGN KEY([Hotel_Id])
REFERENCES [dbo].[Hotels] ([Hotel_Id])
GO
ALTER TABLE [dbo].[ImgHotels] CHECK CONSTRAINT [FK__ImgHotels__Hotel__60A75C0F]
GO
ALTER TABLE [dbo].[ImgRestaurants]  WITH CHECK ADD FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
GO
ALTER TABLE [dbo].[ImgRooms]  WITH CHECK ADD  CONSTRAINT [FK__ImgRooms__Room_I__656C112C] FOREIGN KEY([Room_Id])
REFERENCES [dbo].[Rooms] ([Room_Id])
GO
ALTER TABLE [dbo].[ImgRooms] CHECK CONSTRAINT [FK__ImgRooms__Room_I__656C112C]
GO
ALTER TABLE [dbo].[ImgTouristSpot]  WITH CHECK ADD  CONSTRAINT [FK_ImgTouristSpot_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImgTouristSpot] CHECK CONSTRAINT [FK_ImgTouristSpot_TouristSpot]
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD  CONSTRAINT [FK__Restauran__Touri__5535A963] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Restaurants] CHECK CONSTRAINT [FK__Restauran__Touri__5535A963]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK__Rooms__Hotel_Id__6383C8BA] FOREIGN KEY([Hotel_Id])
REFERENCES [dbo].[Hotels] ([Hotel_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK__Rooms__Hotel_Id__6383C8BA]
GO
ALTER TABLE [dbo].[TouristSpot]  WITH CHECK ADD  CONSTRAINT [FK__TouristSp__Locat__5070F446] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Location] ([Location_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TouristSpot] CHECK CONSTRAINT [FK__TouristSp__Locat__5070F446]
GO
ALTER TABLE [dbo].[Transportations]  WITH CHECK ADD  CONSTRAINT [FK__Transport__Touri__6EF57B66] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transportations] CHECK CONSTRAINT [FK__Transport__Touri__6EF57B66]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_Customer]
GO
ALTER TABLE [dbo].[TripDetails]  WITH CHECK ADD  CONSTRAINT [FK_TripDetails_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
GO
ALTER TABLE [dbo].[TripDetails] CHECK CONSTRAINT [FK_TripDetails_TouristSpot]
GO
ALTER TABLE [dbo].[TripDetails]  WITH CHECK ADD  CONSTRAINT [FK_TripDetails_Trip] FOREIGN KEY([Trip_Id])
REFERENCES [dbo].[Trip] ([Trip_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TripDetails] CHECK CONSTRAINT [FK_TripDetails_Trip]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Transportations] FOREIGN KEY([Transportation_Id])
REFERENCES [dbo].[Transportations] ([Transportation_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Transportations]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 9/21/2018 10:48:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [KarnelTravel] SET  READ_WRITE 
GO
