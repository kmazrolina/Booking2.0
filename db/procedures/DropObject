GO
CREATE PROCEDURE DropObject(@objectname varchar(max))
AS
BEGIN
IF EXISTS( SELECT * FROM sys.objects WHERE name = @objectname)
	BEGIN
	  DECLARE @ObjectType varchar(max) = (SELECT [type] FROM sys.objects WHERE name = @objectname)
	  DECLARE @DropType varchar(max) = ''
  
	  IF @ObjectType IN ('PC', 'P')
		SELECT @DropType = 'PROCEDURE'

	  IF @ObjectType IN ('FN', 'FS', 'FT', 'IF', 'TF')
		SELECT @DropType = 'FUNCTION'
    
	  IF @ObjectType = 'AF'
		SELECT @DropType = 'AGGREGATE'
    
	  IF @ObjectType = 'U'
		SELECT @DropType = 'TABLE'
    
	  IF @ObjectType = 'V'
		SELECT @DropType = 'VIEW'
 
	  IF @DropType <> ''
		EXEC('DROP '+ @DropType + ' [' + @objectname + ']')
	END
END
GO
