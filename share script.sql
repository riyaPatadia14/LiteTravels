USE [LiteTravels]
GO
/****** Object:  Schema [Cust]    Script Date: 09-11-2022 11.15.13 AM ******/
CREATE SCHEMA [Cust]
GO
/****** Object:  UserDefinedFunction [dbo].[udfNetSale]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfNetSale](
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

GO
/****** Object:  Table [dbo].[Buses]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[Id] [int] IDENTITY(5001,1) NOT NULL,
	[DateIn] [date] NULL,
	[TimeIn] [time](7) NULL,
	[DateOut] [date] NULL,
	[TimeOut] [time](7) NULL,
	[BusesName] [varchar](30) NULL,
	[Class] [varchar](20) NULL,
	[Price] [money] NULL,
	[Adult] [int] NULL,
	[Child] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BusesNames]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BusesNames] AS
SELECT Price, PersonId, BusesName, Class
FROM Buses
WHERE Price > ( SELECT AVG(Price) FROM Buses) 
GO
/****** Object:  View [dbo].[BusesNames above average price]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BusesNames above average price] AS
SELECT Price, PersonId, BusesName, Class
FROM Buses
WHERE Price > ( SELECT AVG(Price) FROM Buses) 
GO
/****** Object:  Table [dbo].[UserDashboards]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDashboards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingDetails] [varchar](20) NULL,
	[PaymentType] [varchar](20) NULL,
	[PersonId] [int] NULL,
	[Gender] [varchar](20) NULL,
	[Wallet] [money] NULL,
	[VisitedPlaces] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[offline BookinDetails]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[offline BookinDetails] AS 
SELECT Gender, Wallet
FROM UserDashboards
WHERE PaymentType = 'offline';
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(10,1) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[CustomerNumber] [bigint] NOT NULL,
	[OrderDetails] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DiscountPrice] [numeric](10, 3) NOT NULL,
	[SalesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deals]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deals](
	[deal_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NOT NULL,
	[deal_note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[deal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(501,1) NOT NULL,
	[EmployeeName] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
	[EmployeeLocation] [nvarchar](max) NOT NULL,
	[StartDate] [date] NOT NULL,
	[DOB] [date] NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Commission] [numeric](12, 5) NOT NULL,
	[SalesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[Id] [int] IDENTITY(501,1) NOT NULL,
	[DateIn] [date] NULL,
	[TimeIn] [time](7) NULL,
	[DateOut] [date] NULL,
	[TimeOut] [time](7) NULL,
	[FlightName] [varchar](30) NULL,
	[Class] [varchar](20) NULL,
	[Price] [money] NULL,
	[Adult] [int] NULL,
	[Child] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guides]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GuideName] [varchar](20) NULL,
	[GuideCar] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[CreatedBY] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [nvarchar](max) NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[PriceWithFood] [money] NULL,
	[PriceWithoutFood] [money] NULL,
	[Rooms] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[PersonId] [int] NULL,
	[VehicleLocation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceName] [varchar](30) NULL,
	[Placelocation] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentVehicles]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentVehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [varchar](30) NULL,
	[VehicleModel] [nvarchar](max) NULL,
	[VehicleNumber] [nvarchar](max) NULL,
	[PersonNumber] [int] NULL,
	[PeriodTimeIn] [time](7) NULL,
	[PeriodTimeOut] [time](7) NULL,
	[Price] [money] NULL,
	[Date] [date] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[VehicleLocation] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1001,1) NOT NULL,
	[DepartmentHead] [varchar](30) NOT NULL,
	[DepartmentType] [nvarchar](max) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[Production] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t1]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t1](
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trains]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trains](
	[Id] [int] IDENTITY(1001,1) NOT NULL,
	[DateIn] [date] NULL,
	[DateOut] [date] NULL,
	[TimeIn] [time](7) NULL,
	[TimeOut] [time](7) NULL,
	[TrainName] [varchar](30) NULL,
	[Class] [varchar](20) NULL,
	[Price] [money] NULL,
	[Adult] [int] NULL,
	[Child] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportMediums]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportMediums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Source] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Destination] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[PersonId] [int] NULL,
	[TransportWay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransportWays]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransportWays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusesId] [int] NULL,
	[TrainId] [int] NULL,
	[FlightId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleLocations]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](max) NULL,
	[ShopName] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[CreatedBY] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitPlaces]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitPlaces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NULL,
	[PersonId] [int] NULL,
	[PlacesId] [int] NULL,
	[GuidesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Guides] ADD  DEFAULT (newid()) FOR [CreatedBY]
GO
ALTER TABLE [dbo].[Guides] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Guides] ADD  DEFAULT (newid()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Guides] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Hotels] ADD  DEFAULT (newid()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Hotels] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Hotels] ADD  DEFAULT (newid()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Hotels] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (newid()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (newid()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[RentVehicles] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RentVehicles] ADD  DEFAULT (newid()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[RentVehicles] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RentVehicles] ADD  DEFAULT (newid()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[RentVehicles] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[VehicleLocations] ADD  DEFAULT (newid()) FOR [CreatedBY]
GO
ALTER TABLE [dbo].[VehicleLocations] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[VehicleLocations] ADD  DEFAULT (newid()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[VehicleLocations] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdBuses] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_PersonIdBuses]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_SalesIdCustomers] FOREIGN KEY([SalesId])
REFERENCES [dbo].[Sales] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_SalesIdCustomers]
GO
ALTER TABLE [dbo].[deals]  WITH CHECK ADD FOREIGN KEY([person_id])
REFERENCES [dbo].[persons] ([person_id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_SalesIdEmployees] FOREIGN KEY([SalesId])
REFERENCES [dbo].[Sales] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_SalesIdEmployees]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdFlights] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_PersonIdFlights]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdHotels] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_PersonIdHotels]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_VehicleLocationHotels] FOREIGN KEY([VehicleLocation])
REFERENCES [dbo].[VehicleLocations] ([Id])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_VehicleLocationHotels]
GO
ALTER TABLE [dbo].[RentVehicles]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdRentVehicles] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[RentVehicles] CHECK CONSTRAINT [FK_PersonIdRentVehicles]
GO
ALTER TABLE [dbo].[RentVehicles]  WITH CHECK ADD  CONSTRAINT [FK_VehicleLocationRentVehicles] FOREIGN KEY([VehicleLocation])
REFERENCES [dbo].[VehicleLocations] ([Id])
GO
ALTER TABLE [dbo].[RentVehicles] CHECK CONSTRAINT [FK_VehicleLocationRentVehicles]
GO
ALTER TABLE [dbo].[Trains]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdTrains] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[Trains] CHECK CONSTRAINT [FK_PersonIdTrains]
GO
ALTER TABLE [dbo].[TransportMediums]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdTransportMediums] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[TransportMediums] CHECK CONSTRAINT [FK_PersonIdTransportMediums]
GO
ALTER TABLE [dbo].[TransportMediums]  WITH CHECK ADD  CONSTRAINT [FK_TransportWayTransportMediums] FOREIGN KEY([TransportWay])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[TransportMediums] CHECK CONSTRAINT [FK_TransportWayTransportMediums]
GO
ALTER TABLE [dbo].[TransportWays]  WITH CHECK ADD  CONSTRAINT [FK_BusesIdTransportMediums] FOREIGN KEY([BusesId])
REFERENCES [dbo].[Buses] ([Id])
GO
ALTER TABLE [dbo].[TransportWays] CHECK CONSTRAINT [FK_BusesIdTransportMediums]
GO
ALTER TABLE [dbo].[TransportWays]  WITH CHECK ADD  CONSTRAINT [FK_FlightIdTransportWays] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flights] ([Id])
GO
ALTER TABLE [dbo].[TransportWays] CHECK CONSTRAINT [FK_FlightIdTransportWays]
GO
ALTER TABLE [dbo].[TransportWays]  WITH CHECK ADD  CONSTRAINT [FK_TrainIdTransportMediums] FOREIGN KEY([TrainId])
REFERENCES [dbo].[Trains] ([Id])
GO
ALTER TABLE [dbo].[TransportWays] CHECK CONSTRAINT [FK_TrainIdTransportMediums]
GO
ALTER TABLE [dbo].[UserDashboards]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdUserDashboards] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[UserDashboards] CHECK CONSTRAINT [FK_PersonIdUserDashboards]
GO
ALTER TABLE [dbo].[UserDashboards]  WITH CHECK ADD  CONSTRAINT [FK_VisitedPlacesUserDashboards] FOREIGN KEY([VisitedPlaces])
REFERENCES [dbo].[VisitPlaces] ([Id])
GO
ALTER TABLE [dbo].[UserDashboards] CHECK CONSTRAINT [FK_VisitedPlacesUserDashboards]
GO
ALTER TABLE [dbo].[VisitPlaces]  WITH CHECK ADD  CONSTRAINT [FK_GuidesIdVisitPlaces] FOREIGN KEY([GuidesId])
REFERENCES [dbo].[Guides] ([Id])
GO
ALTER TABLE [dbo].[VisitPlaces] CHECK CONSTRAINT [FK_GuidesIdVisitPlaces]
GO
ALTER TABLE [dbo].[VisitPlaces]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdVisitPlaces] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Registrations] ([Id])
GO
ALTER TABLE [dbo].[VisitPlaces] CHECK CONSTRAINT [FK_PersonIdVisitPlaces]
GO
ALTER TABLE [dbo].[VisitPlaces]  WITH CHECK ADD  CONSTRAINT [FK_PlacesIdVisitPlaces] FOREIGN KEY([PlacesId])
REFERENCES [dbo].[Places] ([Id])
GO
ALTER TABLE [dbo].[VisitPlaces] CHECK CONSTRAINT [FK_PlacesIdVisitPlaces]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeDetailsById]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetEmployeeDetailsById]
(
  @ID INT
)
WITH RECOMPILE
AS
BEGIN
  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
  FROM Employee 
  WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Suman]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Suman]
					@Id INT NULL,
					@Name VARCHAR(20) NULL

AS 
BEGIN
	
			SELECT * FROM Registrations
			WHERE 
			Id = @Id OR 
			Name LIKE '%' + @Name + '%';
			
END
GO
/****** Object:  StoredProcedure [dbo].[spAddTwoNumbers]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddTwoNumbers](@no1 INT, @no2 INT)
AS
BEGIN
  DECLARE @Result INT
  SET @Result = @no1 + @no2
  PRINT 'RESULT IS: '+ CAST(@Result AS VARCHAR)
END
GO
/****** Object:  StoredProcedure [dbo].[spBuses]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuses]
(
@PersonId INT ,
@Class VARCHAR(20) OUTPUT
)
AS 
BEGIN
SELECT
BusesName, Price, Class
FROM Buses AS b
WHERE 
Class = @Class
SELECT PersonId = @PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[spChana]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spChana]
(
@table NVARCHAR(128),
@topN INT,
@byColumn NVARCHAR(128)
)
AS
BEGIN
DECLARE 
@sql NVARCHAR(MAX),
@topNStr NVARCHAR(MAX);
SET @topNStr = CAST(@topN AS NVARCHAR(MAX));
SET @sql = N'SELECT TOP' + @topNStr + 
'* FROM ' + @table + 'ORDER BY' + @byColumn	+ 'DESC';
EXECUTE sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[spCrop]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrop] 
AS 
BEGIN
SELECT b.Id, Name, BusesName, Class, Source, Destination
FROM Registrations AS r
JOIN Buses AS b ON b.PersonId = r.Id
JOIN TransportMediums AS tm ON tm.PersonId = b.PersonId
END;
GO
/****** Object:  StoredProcedure [dbo].[spDope]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDope]
(
@tm_Id INT,
@tw_Id INT
)
AS 
BEGIN
DECLARE @OutPut INT
SET @OutPut = @tm_Id + @tw_Id 
SELECT tw.Id, VehicleType, VehicleModel, Source, Destination
FROM RentVehicles AS rv
JOIN VehicleLocations AS vl ON vl.Id = rv.VehicleLocation
JOIN TransportMediums AS tm ON rv.PersonId = tm.PersonId
JOIN TransportWays AS tw ON tw.Id = tm.TransportWay
WHERE
@tm_Id = tm.Id AND
@tw_Id = tw.Id
PRINT 'oUTpUT' + CAST(@OutPut AS VARCHAR)
END
GO
/****** Object:  StoredProcedure [dbo].[spDraw]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDraw] 
(
@VehicleType AS VARCHAR(30) ,
@min_Price AS MONEY = 0,
@max_PriceWithFood AS MONEY = 999999,
@min_PriceWithoutFood AS MONEY = 0
)
AS
BEGIN
SELECT r.Name, HotelName, Price,VehicleModel, PriceWithFood, PriceWithoutFood
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN RentVehicles as rv ON  rv.VehicleLocation = h.VehicleLocation
WHERE 
VehicleType = @VehicleType AND
Price >= @min_Price AND
PriceWithFood >= @max_PriceWithFood AND
PriceWithoutFood >= @min_PriceWithoutFood 
ORDER BY h.PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[spDron]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spDron]
							(
							@PersonId INT NULL,
							@FlightName VARCHAR(30) NULL,
							@Source NVARCHAR(MAX) NULL
							)
AS
BEGIN
	--WHILE @PersonId <= 5
		--SET @PersonId = @PersonId + 1
		IF(@PersonId IS NOT NULL) OR (@PersonId BETWEEN 5 AND 20)
		BEGIN
			SELECT f.Id, Source ,Destination, StartDate, EndDate, FlightName, Class, f.Price, Adult, Child, tm.PersonId
			FROM TransportMediums AS  tm
			LEFT OUTER JOIN Flights AS f ON f.PersonId= tm.PersonId 
			WHERE	@PersonId = tm.PersonId OR
					FlightName LIKE + '%'+ @FlightName OR
					Source LIKE + '_____' + @Source
		END
		ELSE
		BEGIN
			SELECT f.Id, Destination, StartDate, EndDate, FlightName, Class, f.Price, Adult, Child, tm.PersonId
			FROM TransportMediums AS  tm
			LEFT OUTER JOIN Flights AS f ON f.PersonId= tm.PersonId 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spEnum]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spEnum]
							(
							@PlaceName VARCHAR(30) NULL,
							@min_Price MONEY NULL,
							@Id INT
							)
AS
BEGIN
	IF(@PlaceName IS NULL) OR (@PlaceName IS NOT NULL) 
	BEGIN
			SELECT vs.Id, PlaceName, Placelocation, GuideName , GuideCar, vs.Price
			FROM VisitPlaces AS vs
			JOIN Places AS p ON p.Id = vs.PlacesId
			JOIN Guides AS g ON g.Id = vs.GuidesId
			WHERE	PlaceName LIKE '%' + @PlaceName + '%' OR
					@min_Price = vs.Price OR
					@Id = vs.Id 
	END
	ELSE
	BEGIN
			SELECT vs.Id, PlaceName, Placelocation, GuideName , GuideCar, vs.Price
			FROM VisitPlaces AS vs
			JOIN Places AS p ON p.Id = vs.PlacesId
			JOIN Guides AS g ON g.Id = vs.GuidesId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spFlights]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFlights]
AS 
BEGIN
SELECT *
FROM Flights
ORDER BY FlightName
END;
GO
/****** Object:  StoredProcedure [dbo].[spFund]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFund]
AS
BEGIN
RETURN(SELECT COUNT(Id) FROM Registrations)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmplloyeeNameById2]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetEmplloyeeNameById2]
  @ID INT
  WITH RECOMPILE
AS
BEGIN
  RETURN (SELECT VehicleModel FROM RentVehicles WHERE ID = @ID)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeCountByGender]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetEmployeeCountByGender]
  @BusesName VARCHAR(30),
  @Id INT OUTPUT
AS
BEGIN
  SELECT @Id = COUNT(Id)
  FROM    Buses
  WHERE     BusesName = @BusesName
END
GO
/****** Object:  StoredProcedure [dbo].[spGuides]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGuides]
AS
BEGIN
SELECT *
FROM Guides
ORDER BY GuideName
END;
GO
/****** Object:  StoredProcedure [dbo].[spHotels]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spHotels] 
AS
BEGIN
SELECT HotelName,CheckIn, CheckOut, Rooms, PriceWithFood, PriceWithoutFood, Date
FROM Hotels AS h
ORDER BY HotelName
END;
GO
/****** Object:  StoredProcedure [dbo].[spJuga]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spJuga]
							(
							@Id INT NULL
							)
AS
BEGIN
	DECLARE @PlaceName VARCHAR(30);
	SET @PlaceName = '';
	SELECT vs.Id, vs.Price, Placelocation, g.GuideName, g.GuideCar
	FROM VisitPlaces AS vs
	JOIN Places AS p ON p.Id = vs.PlacesId
	JOIN Guides AS g ON g.Id = vs.GuidesId
	WHERE	@Id = vs.Id
END
GO
/****** Object:  StoredProcedure [dbo].[spLike]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLike]
(
@Price AS MONEY,
@VehicleType AS VARCHAR(30),
@vehicleModel AS NVARCHAR(MAX)
)
AS
BEGIN
SELECT Name, VehicleType, VehicleModel, rv.Price, HotelName, h.Date, Source, Destination, CAST(PeriodTimeIn AS time) AS PeriodTimeIn
FROM Registrations AS r	
JOIN RentVehicles AS rv ON r.Id = rv.PersonId
JOIN Hotels AS h ON h.PersonId =  rv.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Price = rv.Price AND
@VehicleType = VehicleType AND
VehicleModel LIKE '%' + @VehicleModel + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spLona]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLona]
(
@Id INT,
@Name VARCHAR(20) OUTPUT
)
AS
BEGIN
SELECT @Name = Name FROM Registrations WHERE Id  = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spModel]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModel]
(
@VehicleModel NVARCHAR(MAX)  OUT
)
AS
--SET NOCOUNT ON
BEGIN
SELECT VehicleModel,VehicleType,ShopName,Location, vl.Price
FROM RentVehicles AS rv 
JOIN VehicleLocations AS vl ON rv.VehicleLocation = vl.Id
WHERE
@VehicleModel = VehicleModel
END;
GO
/****** Object:  StoredProcedure [dbo].[spName]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spName]
(
@Name VARCHAR(20) OUT,
@HotelName NVARCHAR(MAX) 
)
AS
BEGIN
SELECT Name, Email, HotelName, CheckIn, CheckOut, PriceWithFood, PriceWithoutFood, Rooms, Date
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
WHERE
@Name = Name AND
@HotelName = HotelName
END;
GO
/****** Object:  StoredProcedure [dbo].[spOkla]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spOkla](
@a DECIMAL, 
@b DECIMAL,
@c DECIMAL OUTPUT )
AS
BEGIN
BEGIN TRY
SET @c = @a / @b;
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS en,
ERROR_SEVERITY() AS ese,
ERROR_STATE() AS es,
ERROR_PROCEDURE() AS ep,
ERROR_LINE() AS el,
ERROR_MESSAGE() AS em
END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spOla]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spOla]
(
  @ID INT
)
WITH RECOMPILE
AS
BEGIN
  SELECT Name, Email
  FROM Registrations 
  WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spOpra]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[spOpra]
	(@table NVARCHAR(128)
	)
	AS
	BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = N'SELECT * FROM ' + @table;
		EXECUTE sp_execute @sql;
		END

GO
/****** Object:  StoredProcedure [dbo].[spPlaces]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPlaces]
AS
BEGIN
SELECT *
FROM Places
ORDER BY PlaceName
END;
GO
/****** Object:  StoredProcedure [dbo].[spPro]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPro]
(
@min_Prices AS MONEY = 0,
@PlaceNames AS VARCHAR(30) = NULL,
@GuideCars NVARCHAR(MAX)
)
AS
BEGIN
SELECT PlaceName, GuideName, GuideCar, g.Price
FROM Places AS p
JOIN VisitPlaces AS vp ON vp.PlacesId = p.Id
JOIN Guides AS g ON g.Id = vp.GuidesId
WHERE
g.Price>= @min_Prices AND
(@PlaceNames IS NULL OR PlaceName <= @PlaceNames )AND
GuideCar LIKE +'%' + @GuideCars + '%'
ORDER BY PlaceName
END;
GO
/****** Object:  StoredProcedure [dbo].[spProgra]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spProgra]
					(
					@Id INT NULL,
					@VehicleType VARCHAR(30) NULL,
					@HotelName NVARCHAR(MAX) NULL,
					@min_Price MONEY NULL,
					@max_PriceWithFood MONEY NULL
					)
AS
BEGIN
	IF(@HotelName ='T') OR (@VehicleType ='Cycle')
		BEGIN
			SELECT HotelName, VehicleType, VehicleModel, rv.Price, rv.Date
			FROM Hotels As h
			LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId
			WHERE	VehicleType LIKE + '%' + @VehicleType + '%' OR
					@min_Price = rv.Price OR
					@Id = h.Id OR
					@max_PriceWithFood = PriceWithFood OR
					HotelName LIKE + '%' + @HotelName +'%'
			ORDER BY HotelName ASC	
		END
	ELSE
		BEGIN
			SELECT HotelName, VehicleType, VehicleModel, rv.Price, rv.Date
			FROM Hotels As h
			LEFT OUTER JOIN RentVehicles AS rv ON rv.PersonId = h.PersonId 
			ORDER BY HotelName ASC	
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegister]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegister]
AS
BEGIN
SELECT r.Name,Email
FROM Registrations AS r
ORDER BY r.Name
END;
GO
/****** Object:  StoredProcedure [dbo].[spRentVehicles]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRentVehicles]
(
@avg_Price AS MONEY,
@min_VehicleNumber AS VARCHAR,
@max_PersonNumber AS INT
)
AS
BEGIN
SELECT VehicleType, VehicleModel, VehicleNumber, PersonNumber, Date,PersonId, Price
FROM RentVehicles
WHERE
Price >= @avg_Price AND
VehicleNumber >= @min_VehicleNumber AND
PersonNumber >= @max_PersonNumber

ORDER BY VehicleModel
END;
GO
/****** Object:  StoredProcedure [dbo].[spSales]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSales]
(@person_id INT)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
DELETE FROM persons
WHERE person_id = @person_id
COMMIT TRANSACTION
END TRY
BEGIN CATCH
EXECUTE usp_report_error

IF(XACT_STATE()) = -1
BEGIN
PRINT N'the transaction is in uncommitable state' + 'rollback transaction'
		COMMIT TRANSACTION;
		END;
IF (XACT_STATE()) = 1
BEGIN
PRINT	N'the transaction is in commitable state'+'committing transaction'
		COMMIT TRANSACTION;
		END;
END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[spSand]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSand]
(
@Id INT,
@Name NVARCHAR(50),
@Email VARCHAR(20)
)
AS
BEGIN
UPDATE Registrations SET
      Name = @Name, 
	  Email= @Email
WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spSlope]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSlope]
  @BusesName VARCHAR(30),
  @Id INT OUTPUT
AS
BEGIN
  SELECT @Id = COUNT(Id)
  FROM    Buses
  WHERE     BusesName = @BusesName
END
GO
/****** Object:  StoredProcedure [dbo].[spSuman]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spSuman]
					@Id INT NULL,
					@Name VARCHAR(20) NULL

AS 
BEGIN
	
			SELECT * FROM Registrations
			WHERE 
			Id = @Id OR 
			Name LIKE '%' + @Name + '%';
			
END
GO
/****** Object:  StoredProcedure [dbo].[spTrains]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTrains]
AS 
BEGIN
SELECT *
FROM Trains
ORDER BY TrainName
END;
GO
/****** Object:  StoredProcedure [dbo].[spTransportMediums]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransportMediums]
(
@Source NVARCHAR(MAX),
@Id INT OUTPUT
)
AS 
BEGIN
SELECT 
Source, Destination 
FROM TransportMediums AS tm
WHERE
Source = @Source
SELECT @Id = @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[spTransportWays]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransportWays]
AS
BEGIN
SELECT *
FROM TransportWays
ORDER BY Id
END;
GO
/****** Object:  StoredProcedure [dbo].[spTrauma]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTrauma] 
(
@Class VARCHAR(20)
)
AS
BEGIN
SELECT TrainId,TrainName,Class, DateIn, TimeIn, DateOut,Price, Adult, Child  
FROM Trains AS t
JOIN TransportWays AS tm ON tm.TrainId = t.Id
WHERE Class = @Class
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployeeByID]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateEmployeeByID]
(
@Id INT,
@Name NVARCHAR(50),
@Email VARCHAR(20)
)
AS
BEGIN
  UPDATE Registrations SET 
      Name = @Name, 
	  Email= @Email 
  WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUser]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUser]
AS
BEGIN
SELECT PersonId, r.Name, Gender, Wallet
FROM Registrations AS r
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
ORDER BY PersonId
END;
GO
/****** Object:  StoredProcedure [dbo].[spUserDashboards]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserDashboards]
AS
BEGIN
SELECT BookingDetails,PaymentType, Wallet, Gender, PersonId
FROM UserDashboards
ORDER BY Wallet
END;
GO
/****** Object:  StoredProcedure [dbo].[spVehicleLocations]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVehicleLocations]
(
@Location AS NVARCHAR(MAX),
@max_Price AS MONEY = 0,
@min_Price AS MONEY = 5000,
@ShopNames AS NVARCHAR(MAX)
)
AS
BEGIN
SELECT
Location, ShopName, Price
FROM VehicleLocations
WHERE 
Location LIKE '%' + @Location + '%' AND
Price >= @min_Price AND
Price <= @max_Price AND
ShopName LIKE '%' + @ShopNames + '%'
ORDER BY 
Location
END;
GO
/****** Object:  StoredProcedure [dbo].[spVisit]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVisit]
(
@PlaceName VARCHAR(30),
@GuideName VARCHAR(20),
@GuideCar NVARCHAR(MAX),
@min_Price MONEY,
@max_Price MONEY
)
AS
BEGIN
SELECT Name,PlaceName, GuideName, GuideCar,MIN(g.Price) AS PRICE , MAX(vs.Price) AS vsPrice
FROM VisitPlaces AS VS
JOIN Places AS p ON p.Id = vs.PlacesId
JOIN Guides AS g ON g.Id =GuidesId
JOIN Registrations AS r ON r.Id = PersonId
WHERE 
PlaceName = @PlaceName AND
GuideName = @GuideName AND
GuideCar = @GuideCar AND
g.Price >= @min_Price AND
vs.Price <= @max_Price
GROUP BY 
Name,PlaceName, GuideName, GuideCar
ORDER BY r.Name ASC; 
END
GO
/****** Object:  StoredProcedure [dbo].[spVisitPlaces]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVisitPlaces]
AS
BEGIN
SELECT *
FROM VisitPlaces 
ORDER BY Id
END;
GO
/****** Object:  StoredProcedure [dbo].[spWays]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spWays]
(

@VehicleType AS VARCHAR(30),
@VehicleModel AS NVARCHAR(MAX),
@min_Price AS MONEY 
)
AS
BEGIN
SELECT HotelName, Location, VehicleType, VehicleModel,ShopName, MIN(rv.Price) AS Price, h.Date, vl.Price
FROM VehicleLocations AS vl
JOIN RentVehicles AS rv ON rv.VehicleLocation = vl.Id 
JOIN Hotels AS h ON h.VehicleLocation = rv.VehicleLocation
WHERE

@min_Price = vl.Price AND
VehicleType LIKE '%'+ @VehicleType + '%' AND
VehicleModel LIKE '%' + @VehicleModel + '%' 
GROUP BY HotelName, Location, VehicleType, VehicleModel, h.Date, vl.Price,ShopName
END
GO
/****** Object:  StoredProcedure [dbo].[spWhole]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWhole]
(
@Source NVARCHAR(MAX),
@Destination NVARCHAR(MAX),
@Gender VARCHAR(20)
)
AS
BEGIN
SELECT Name, Source, Destination, BookingDetails, HotelName, h.Date, 
COUNT(Rooms) AS pt, MIN(PriceWithFood) AS PWF, MAX(PriceWithoutFood) AS POF, AVG(Wallet) AS W, Gender
FROM Registrations AS r
JOIN Hotels AS h ON h.PersonId = r.Id
JOIN UserDashboards AS ud ON ud.PersonId = h.PersonId
JOIN TransportMediums AS tm ON tm.PersonId = h.PersonId
WHERE
@Source = Source AND
@Destination = Destination AND
@Gender = Gender 
GROUP BY Name, Source, Destination, BookingDetails, HotelName, h.Date, Gender
END
GO
/****** Object:  StoredProcedure [dbo].[spYuk]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spYuk]
(
@Source NVARCHAR(MAX),
@Destination NVARCHAR(MAX),
@Name AS VARCHAR(20),
@Wallet AS MONEY,
@Gender AS VARCHAR(20),
@PaymentType VARCHAR(20) 
)
AS
BEGIN
SELECT Name,Wallet, PaymentType,BookingDetails, Source, StartDate, Destination, EndDate, Price 
FROM TransportMediums AS tm
JOIN Registrations AS r ON r.Id = tm.PersonId 
JOIN UserDashboards AS ud ON ud.PersonId = r.Id
WHERE 
@Source = Source  AND
@Destination = Destination AND
@Name = Name AND
@Gender = Gender AND
@Wallet = Wallet AND
@PaymentType = PaymentType
END
GO
/****** Object:  StoredProcedure [dbo].[usp_query]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_query](
	@table NVARCHAR(128)	
)
AS
BEGIN
	
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = N'SELECT * FROM ' + @table;

	EXECUTE sp_executesql @sql

END
GO
/****** Object:  StoredProcedure [dbo].[usp_query_toopn]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_query_toopn](
	@table NVARCHAR(128),
	@topN INT,
	@byCloumn NVARCHAR(128)
)
AS
BEGIN
	DECLARE
		@sql NVARCHAR(MAX),
		@topNStr NVARCHAR(MAX);

	SET @topNStr = CAST(@topN as nvarchar(max));

	SET @sql = N'SELECT TOP ' + @topNStr + '  * FROM ' + @table + ' ORDER BY ' + @byCloumn + ' DESC';

	EXECUTE sp_executesql @sql;

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_report_error]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_report_error]
AS
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
GO
/****** Object:  StoredProcedure [dbo].[usp_tim]    Script Date: 09-11-2022 11.15.13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_tim]
(
	@schema NVARCHAR(128),
	@table NVARCHAR(128)
)
AS
	BEGIN
		DECLARE 
			@sql NVARCHAR(MAX);

		SET @sql = N'SELECT * FROM ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table);

		EXECUTE sp_executesql @sql;

	END;

GO
