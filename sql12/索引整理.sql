DECLARE @SQL nvarchar(1000)
DECLARE @TableName nvarchar(100)

if EXISTS(Select 1 Where @@version Like 'Microsoft SQL Server  2000 %')
	DECLARE crTmp CURSOR OPTIMISTIC FOR
		SELECT [NAME] FROM sysobjects WHERE [xtype] = 'U' Order By [NAME]
ELSE
	DECLARE crTmp CURSOR OPTIMISTIC FOR
		SELECT [NAME] FROM sys.tables WHERE [type] = 'U' Order By [NAME]


OPEN crTmp
FETCH NEXT FROM crTmp INTO @TableName
WHILE @@FETCH_STATUS = 0
BEGIN
    Print '       '   
    Print '==========================================+
    ==============================='   
	Print '当前表：' + @TableName    

	SET @SQL = 'DBCC DBREINDEX([' + @TableName + '])'
	EXECUTE (@SQL)
    
    SET @SQL = 'UPDATE STATISTICS [' + @TableName + ']'
	EXECUTE (@SQL)

	Print '       '  
    Print @TableName + '   执行完毕'
    Print '========================================================================='   
	
	FETCH NEXT FROM crTmp INTO @TableName
END

CLOSE crTmp
DEALLOCATE crTmp