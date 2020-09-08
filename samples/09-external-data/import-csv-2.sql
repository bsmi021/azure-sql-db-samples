CREATE SCHEMA [test];
GO

DROP TABLE IF EXISTS [test].[ORDERS];
GO

CREATE TABLE [test].[ORDERS]
(
	[O_ORDERKEY] [int] NOT NULL,
	[O_CUSTKEY] [int] NOT NULL,
	[O_ORDERSTATUS] [char](1) NOT NULL,
	[O_TOTALPRICE] [decimal](15, 2) NOT NULL,
	[O_ORDERDATE] [date] NOT NULL,
	[O_ORDERPRIORITY] [char](15) NOT NULL,
	[O_CLERK] [char](15) NOT NULL,
	[O_SHIPPRIORITY] [int] NOT NULL,
	[O_COMMENT] [varchar](79) NOT NULL
) 
GO

BULK INSERT [test].[ORDERS]
FROM 'tpch/1GB/orders.tbl'
WITH
(
	DATA_SOURCE = 'Azure-Storage',
	FIELDTERMINATOR = '|',
	BATCHSIZE=10000
)
GO

CREATE CLUSTERED INDEX IXC ON test.[ORDERS] (O_ORDERKEY)
GO

SELECT TOP (100) * FROM  [test].[ORDERS];

