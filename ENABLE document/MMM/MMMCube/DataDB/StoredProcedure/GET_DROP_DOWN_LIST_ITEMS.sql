USE [MMM_DATA_DB_DEV]
GO
/****** Object:  StoredProcedure [dbo].[GET_DROP_DOWN_LIST_ITEMS]    Script Date: 10/05/2011 10:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GET_DROP_DOWN_LIST_ITEMS]
	
	@p_item varchar(100),
	@param_1 varchar(100)=null,
	@param_2 varchar(100)=null
	
AS
BEGIN
	
	
	if @p_item = 'Trend' 
	BEGIN
		select distinct NAME as Name,Value as Value from FILTER_DATA
		where ITEM='Trend'
	END
	
	if @p_item = 'ViewBy' and @param_1='Trend'
	BEGIN
		select distinct Name as Name,Value as Value from dbo.FILTER_DATA
		where ITEM='ViewBy_Trend'	
	END
	
	if @p_item = 'ViewBy' and @param_1='Snapshot'
	BEGIN
		--if @param_2='20'
		--BEGIN
		--	select distinct Name as Name,Value as Value from dbo.FILTER_DATA
		--	where ITEM='ViewBy_Snapshot' 
		--		AND Name = 'Brands'
		--END
		
		--ELSE
		BEGIN
			select distinct Name as Name,Value as Value from dbo.FILTER_DATA
			where ITEM='ViewBy_Snapshot'
		END
		
	END
	
	if @p_item = 'CompareToCompetitor'
	BEGIN
		if @param_1='Snapshot' or @param_1='Trend'
		BEGIN
			select distinct Name as Name,Value as Value from dbo.FILTER_DATA
			WHERE ITEM='CompareToCompetitor'+@param_1
		END
		ELSE
		BEGIN
				SELECT DISTINCT Name AS Name,Value AS Value FROM dbo.FILTER_DATA
				WHERE ITEM='CompareToCompetitor'
		END
		
	END
END



--EXEC [GET_DROP_DOWN_LIST_ITEMS] 'Trend'







