use master
GO
     
CREATE DATABASE MclarenApp ON PRIMARY
(
    NAME =N'PrimaryData',FILENAME=N'E:\Database\Mclaren\MclarenApp\PrimaryData.mdf',
    SIZE=3072KB,FILEGROWTH=1024KB
), FILEGROUP [MessageRecord]
(
    NAME =N'MessageRecord',FILENAME=N'E:\Database\Mclaren\MclarenApp\MessageRecordData.ndf',
    SIZE=3072KB,FILEGROWTH=1024KB
), FILEGROUP [Track]
(
    NAME =N'TrackData',FILENAME=N'E:\Database\Mclaren\MclarenApp\TrackData.ndf',
    SIZE=3072KB,FILEGROWTH=1024KB
), FILEGROUP [Log]
(
   NAME =N'LogData',FILENAME=N'E:\Database\Mclaren\MclarenApp\LogData.ndf',
    SIZE=3072KB,FILEGROWTH=1024KB
) LOG ON 
(
NAME =N'DB_log',FILENAME=N'E:\Database\Mclaren\MclarenApp\DB_log.ldf',
    SIZE=3072KB,FILEGROWTH=10%
)
GO