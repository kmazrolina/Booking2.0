IF OBJECT_ID('ongoing_reservations', 'v') IS NOT NULL
  DROP VIEW ongoing_reservations
GO

DECLARE @sql NVARCHAR(max) = 'CREATE VIEW ongoing_reservations AS '
DECLARE @cur_date DATETIME = '2022-01-01'

WHILE @cur_date < '2024' BEGIN
  SET @sql = ISNULL(@sql, '') +
  'SELECT ' +
  '''' + CONVERT(NVARCHAR, YEAR(@cur_date)) + '-' + CONVERT(NVARCHAR, MONTH(@cur_date)) + ''' month,' +
  'COUNT(*) reservation_count ' +
  'FROM reservation r ' +
  'LEFT JOIN reservation_details rd ON rd.reservation_id = r.id ' +
  'WHERE r.end_date >= ''' + CONVERT(NVARCHAR, @cur_date) + ''' ' +
  'AND r.start_date < ''' + CONVERT(NVARCHAR, DATEADD(MONTH,1,@cur_date)) + ''' '

  SET @cur_date = DATEADD(MONTH,1,@cur_date)

  IF @cur_date < '2024'
     SET @sql = @sql + 'UNION ALL '
END

EXECUTE (@sql)
GO

SELECT * FROM ongoing_reservations
