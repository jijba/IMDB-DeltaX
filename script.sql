USE [IMDB]
GO
/****** Object:  UserDefinedTableType [dbo].[ActorList]    Script Date: 5/22/2018 12:17:27 AM ******/
CREATE TYPE [dbo].[ActorList] AS TABLE(
	[Actor_ID] [int] NULL,
	[RowNo] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 5/22/2018 12:17:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[Actor_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Sex] [nchar](10) NULL,
	[Bio] [text] NULL,
	[DOB] [datetime] NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[Actor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Movie_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Plot] [text] NULL,
	[Poster] [text] NULL,
	[Producer] [bigint] NULL,
	[Year_Of_Release] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Movie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie_Rel_Actor]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie_Rel_Actor](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Movie_ID] [bigint] NULL,
	[Actor_ID] [bigint] NULL,
 CONSTRAINT [PK_Movie_Rel_Actor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[Producer_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Sex] [nchar](10) NULL,
	[Bio] [text] NULL,
	[DOB] [datetime] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[Producer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actor] ON 

INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (1, N'Actor1', N'Male      ', N'have done a lot of movies', CAST(N'1994-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (2, N'Actor2', N'Female    ', N'Like working in movies which I can connect with', CAST(N'1989-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (3, N'Actor3', N'Male      ', N'Started career as a stage actor in 2010', CAST(N'2010-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (4, N'Actor4', N'Female    ', N'Live life happily', CAST(N'1898-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (9, N'Actor5', N'Male      ', N'new', CAST(N'2016-05-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (10, N'Actor New', N'Male      ', N'New', CAST(N'2018-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Actor] ([Actor_ID], [Name], [Sex], [Bio], [DOB]) VALUES (13, N'Actor Last', N'Female    ', N'New an last', CAST(N'1998-05-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Actor] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (1, N'Movie1', N'Drama', N'/images/Shared/Movie/MomentCam_20151021_161156.png', 1, 1994)
INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (2, N'Movie2', N'Horror', N'\images\Shared\Movie\Movie2.jpg', 2, 2010)
INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (3, N'Movie3', N'Romatic', N'\images\Shared\Movie\Movie3.jpg', 1, 2017)
INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (4, N'Movie4', N'Plot4', N'\images\Shared\Movie\Movie4.jpg', 2, 2010)
INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (5, N'Movie New', N'Drama', N'/images/Shared/Movie/MomentCam_20151021_161324.png', 4, 1994)
INSERT [dbo].[Movie] ([Movie_ID], [Name], [Plot], [Poster], [Producer], [Year_Of_Release]) VALUES (6, N'Dear Zindagi', N'Drama', N'/images/Shared/Movie/Movie1.jpg', 1, 2012)
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[Movie_Rel_Actor] ON 

INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (3, 2, 2)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (4, 2, 3)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (5, 3, 2)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (6, 3, 3)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (10, 4, 1)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (15, 5, 2)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (16, 1, 1)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (17, 1, 4)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (18, 6, 2)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (19, 6, 3)
INSERT [dbo].[Movie_Rel_Actor] ([ID], [Movie_ID], [Actor_ID]) VALUES (20, 6, 4)
SET IDENTITY_INSERT [dbo].[Movie_Rel_Actor] OFF
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([Producer_ID], [Name], [Sex], [Bio], [DOB]) VALUES (1, N'Producer1', N'Male      ', N'My Bio', CAST(N'1998-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Producer] ([Producer_ID], [Name], [Sex], [Bio], [DOB]) VALUES (2, N'Producer2', N'Female    ', N'Her Bio', CAST(N'1992-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Producer] ([Producer_ID], [Name], [Sex], [Bio], [DOB]) VALUES (4, N'Producer New', N'Female    ', N'New', CAST(N'1997-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Producer] ([Producer_ID], [Name], [Sex], [Bio], [DOB]) VALUES (6, N'Producer Last', N'Male      ', N'Last', CAST(N'1918-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Producer] ([Producer_ID], [Name], [Sex], [Bio], [DOB]) VALUES (7, N'Last Last Producer', N'Female    ', N'Last Check', CAST(N'2018-05-22T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Producer] OFF
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Producer] FOREIGN KEY([Producer])
REFERENCES [dbo].[Producer] ([Producer_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Producer]
GO
ALTER TABLE [dbo].[Movie_Rel_Actor]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Rel_Actor_Actor] FOREIGN KEY([Actor_ID])
REFERENCES [dbo].[Actor] ([Actor_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie_Rel_Actor] CHECK CONSTRAINT [FK_Movie_Rel_Actor_Actor]
GO
ALTER TABLE [dbo].[Movie_Rel_Actor]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Rel_Actor_Movie] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie_Rel_Actor] CHECK CONSTRAINT [FK_Movie_Rel_Actor_Movie]
GO
/****** Object:  StoredProcedure [dbo].[AddNewActor]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewActor]  
      @Name nvarchar(MAX),
	   @Sex nvarchar(MAX),
	  @DOB datetime,
	  @Bio nvarchar(max)
AS   

    SET NOCOUNT ON;  
    Insert into Actor ([Name]
           ,[Sex]
           ,[DOB]
           ,[Bio])
     VALUES( @Name,
	         @Sex,
			 @DOB,
			 @Bio)

	select SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [dbo].[AddNewMovie]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddNewMovie]
      @Name nvarchar(MAX),
	  @Plot text,
	  @Poster text,
	  @ProducerID BIGINT,
	  @YearOfRelease int,
	  @Actors dbo.ActorList READONLY
AS   

    Declare @Movie_ID bigint
    SET NOCOUNT ON;  
    INSERT INTO [dbo].[Movie]
           ([Name]
           ,[Plot]
           ,[Poster]
           ,[Producer]
           ,[Year_Of_Release])
     VALUES
	       (@Name,
		   @Plot,
		   @Poster,
		   @ProducerID,
		   @YearOfRelease)

    Set @Movie_ID =SCOPE_IDENTITY();
	DECLARE @cnt INT = 0;
	
WHILE (@cnt < (select COUNT(*) from @Actors))
BEGIN
  set @cnt=@cnt+1
  Insert into Movie_Rel_Actor(Actor_ID,Movie_ID)
	Values((Select Actor_ID from @Actors where RowNo=@cnt),@Movie_ID)
END
	
GO
/****** Object:  StoredProcedure [dbo].[AddNewProducer]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddNewProducer]  
      @Name nvarchar(MAX),
	  @Sex nvarchar(MAX),
	  @DOB datetime,
	  @Bio nvarchar(max)
AS   

    DECLARE @Chcek int

    SET NOCOUNT ON;  
   INSERT INTO [dbo].[Producer]
           ([Name]
           ,[Sex]
           ,[DOB]
           ,[Bio])
     VALUES( @Name,
	         @Sex,
			 @DOB,
			 @Bio)

	select SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [dbo].[EditMovie]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EditMovie]
      @MovieID bigint,
      @Name nvarchar(MAX),
	  @Plot text,
	  @Poster text,
	  @ProducerID bigint,
	  @YearOfRelease int,	  
	  @Actors dbo.ActorList READONLY
AS   

    SET NOCOUNT ON;  
    UPDATE [dbo].[Movie]
   SET [Name] = @Name
      ,[Plot] = @Plot
      ,[Poster] =  @Poster
      ,[Producer] =  @ProducerID
      ,[Year_Of_Release] = @YearOfRelease
 WHERE Movie_ID=@MovieID

DELETE FROM Movie_Rel_Actor where Movie_ID=@MovieID
 DECLARE @cnt INT = 0;
	
WHILE (@cnt < (select COUNT(*) from @Actors))
BEGIN
  set @cnt=@cnt+1
  Insert into Movie_Rel_Actor(Actor_ID,Movie_ID)
	Values((Select Actor_ID from @Actors where RowNo=@cnt),@MovieID)
END
	
	
GO
/****** Object:  StoredProcedure [dbo].[GetAllActors]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllActors]  
      
AS   

    SET NOCOUNT ON;  
    SELECT Actor.Actor_ID,
	       Actor.Name
    FROM Actor
	

GO
/****** Object:  StoredProcedure [dbo].[GetAllMovies]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMovies]   
      
AS   

    SET NOCOUNT ON;  
    SELECT Movie.Movie_ID,
	       Movie.Name, 
	       Movie.Plot, 
		   Movie.Poster,
		   Movie.Year_Of_Release,
		   (Select Producer.Name from Producer where Producer.Producer_ID=Movie.Producer) as Producer
    FROM Movie ;
	
DROP TABLE IF EXISTS #Temp
create table #Temp
(
    Movie_ID bigint, 
    Actor nVarchar(Max), 
    
)
Insert Into #Temp
	SELECT Movie.Movie_ID,
	        Actor.Name
			   FROM Movie 
	inner join Movie_Rel_Actor
	on Movie.Movie_ID=Movie_Rel_Actor.Movie_ID
	inner join Actor
	on Actor.Actor_ID=Movie_Rel_Actor.Actor_ID
	GROUP by Movie.Movie_ID,Actor.Name


	 SELECT Movie_ID,
	        Substring((Select ',' + Actor  From #Temp B Where B.Movie_ID=A.Movie_ID For XML Path('')),2,8000) As Actors
    FROM #Temp A
	Group by Movie_ID
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducers]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducers]  
      
AS   

    SET NOCOUNT ON;  
    SELECT Producer.Producer_ID,
	       Producer.Name
    FROM Producer

GO
/****** Object:  StoredProcedure [dbo].[GetMovieDetails]    Script Date: 5/22/2018 12:17:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[GetMovieDetails]   
       @MovieID int
AS   

    SET NOCOUNT ON;  
    SELECT Movie.Movie_ID,
	       Movie.Name, 
	       Movie.Plot, 
		   Movie.Poster,
		   Movie.Year_Of_Release,
		   (Select Producer.Name from Producer where Producer.Producer_ID=Movie.Producer) as Producer
    FROM Movie 
	where Movie.Movie_ID=@MovieID;
	
DROP TABLE IF EXISTS #Temp
create table #Temp
(
    Movie_ID bigint, 
    Actor nVarchar(Max), 
    
)

	 Select Substring((Select ',' + CONVERT(varchar(100),Actor_ID)  FROM [IMDB].[dbo].[Movie_Rel_Actor]
	where Movie_Rel_Actor.Movie_ID=@MovieID For XML Path('')),2,8000) As Actors
	
	


GO
