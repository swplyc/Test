use MclarenApp

/*==============================================================*/
/* Table: LogLogin                                              */
/*==============================================================*/
create table LogLogin (
   Id                   int                  identity,
   LogLevel             varchar(50)          not null default '',
   UserId               int                  not null default 0,
   MemberId             int                  not null default 0,
   Url                  nvarchar(500)        not null default '',
   IP                   nvarchar(20)         not null default '',
   LoginTime            datetime             not null default getdate(),
   ExitTime             datetime             null,
   SourceId             int                  not null default 0,
   SessionId            nvarchar(50)         not null default '',
   UniqueCookie         varchar(200)         not null default '',
   IsSuccess            bit                  not null default 0,
   SystemName           nvarchar(50)         not null default '',
   BrowseName           nvarchar(50)         not null default '',
   Remark               nvarchar(200)        not null default '',
   constraint PK_LOGLOGIN primary key (Id)
)
on Log
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'LogLevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会员编号',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'MemberId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录地址',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'Url'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录IP',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'IP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录时间',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'LoginTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '退出时间',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'ExitTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '来源标识',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'SourceId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会话编号',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'SessionId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '唯一Cookie标识',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'UniqueCookie'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否成功登录',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'IsSuccess'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统名称',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'SystemName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '浏览器名称',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'BrowseName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'LogLogin', 'column', 'Remark'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogLogin (
UserId ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogLogin (
MemberId ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogLogin (
LoginTime ASC
)
go

/*==============================================================*/
/* Index: Index_4                                               */
/*==============================================================*/
create index Index_4 on LogLogin (
LogLevel ASC
)
go



/*==============================================================*/
/* Table: LogException                                          */
/*==============================================================*/
create table LogException (
   Id                   int                  identity,
   Name                 nvarchar(50)         not null default '',
   LogLevel             varchar(50)          null default '1',
   MethodName           nvarchar(200)        not null default '',
   Message              nvarchar(500)        not null default '',
   StackTrace           nvarchar(max)        not null default '',
   Description          nvarchar(500)        not null default '',
   CreateTime           datetime             not null default getdate(),
   UserId               int                  not null default 0,
   DataId               int                  not null default 0,
   Remark               nvarchar(200)        not null default '',
   constraint PK_LOGEXCEPTION primary key (Id)
)
on Log
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志名称',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'LogLevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类及方法名称',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'MethodName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '异常消息',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'Message'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '异常堆栈',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'StackTrace'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '异常描述',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据编号',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'DataId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'LogException', 'column', 'Remark'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogException (
Name ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogException (
CreateTime ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogException (
LogLevel ASC
)
go


/*==============================================================*/
/* Table: LogRun                                                */
/*==============================================================*/
create table LogRun (
   Id                   int                  identity,
   MethodName           nvarchar(200)        not null default '',
   LogLevel             varchar(50)          not null default '',
   Name                 nvarchar(50)         not null default '',
   UserId               int                  not null default 0,
   MemberId             int                  not null default 0,
   DataId               int                  not null default 0,
   Description          varchar(8000)        not null default '',
   Result               varchar(1000)        not null default '',
   StartTime            datetime             not null default getdate(),
   EndTime              datetime             not null default getdate(),
   Timestamp            int                  not null default 0,
   IP                   nvarchar(20)         not null default '',
   Url                  varchar(500)         not null default '',
   Remark               varchar(1000)        not null default '',
   constraint PK_LOGRUN primary key (Id)
)
on Log
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类名方法名',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'MethodName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'LogLevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志名称',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会员编号',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'MemberId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据编号',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'DataId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结果',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Result'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开始时间',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'StartTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'EndTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '时间戳(毫秒),用於輸出從程式啟動到日誌記錄事件建立的時間,以毫秒記.',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Timestamp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'IP',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'IP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '访问路径',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Url'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'LogRun', 'column', 'Remark'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogRun (
Name ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogRun (
StartTime ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogRun (
LogLevel ASC
)
go


/*==============================================================*/
/* Table: LogOperation                                          */
/*==============================================================*/
create table LogOperation (
   Id                   int                  identity,
   LogLevel             varchar(50)          not null default '',
   UserId               int                  not null default 0,
   MemberId             int                  not null default 0,
   OperationType        int                  not null default 0,
   Url                  varchar(500)         not null default '',
   Name                 nvarchar(50)         not null default '',
   DataId               int                  not null default 0,
   TableName            nvarchar(200)        not null default '',
   Description          nvarchar(2000)       not null default '',
   Result               nvarchar(200)        not null default '',
   IP                   nvarchar(20)         not null default '',
   CreateTime           datetime             not null default getdate(),
   Remark               nvarchar(200)        not null default '',
   UniqueCookie         varchar(200)         not null default '',
   constraint PK_LOGOPERATION primary key (Id)
)
on Log
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'LogLevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户操作者',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会员操作者',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'MemberId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作类型:1表示新增、2表示编辑，3表示查询、4表示删除、5表示导出',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'OperationType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '访问路径',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Url'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志名称',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据编号',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'DataId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据库表名',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'TableName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结果',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Result'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'IP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'Remark'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '唯一cookie',
   'user', @CurrentUser, 'table', 'LogOperation', 'column', 'UniqueCookie'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogOperation (
CreateTime ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogOperation (
UserId ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogOperation (
Name ASC
)
go


/*==============================================================*/
/* Table: LogInterface                                          */
/*==============================================================*/
create table LogInterface (
   Id                   int                  identity,
   LogLevel             varchar(50)          not null default '',
   Name                 nvarchar(50)         not null default '',
   MethodName           nvarchar(200)        not null default '',
   IP                   nvarchar(20)         not null default '',
   UserId               int                  not null default 0,
   StartTime            datetime             not null default getdate(),
   EndTime              datetime             not null default getdate(),
   KeyParameter         nvarchar(100)        not null default '',
   ParaDesc             nvarchar(max)        not null default '',
   ReturnCode           nvarchar(50)         not null default '',
   ReturnDescription    nvarchar(200)        not null default '',
   ReturnData           nvarchar(max)        not null default '',
   IsSuccess            bit                  not null default 1,
   AccessToken          varchar(200)         not null default '',
   Timestamp            int                  not null default 0,
   constraint PK_LOGINTERFACE primary key (Id)
)
on Log
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志级别',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'LogLevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志名称',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类名方法名',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'MethodName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'IP',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'IP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '访问者编号',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开始时间',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'StartTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结束时间',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'EndTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关键参数',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'KeyParameter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数描述',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'ParaDesc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '返回代码',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'ReturnCode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '返回描述',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'ReturnDescription'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '返回数据',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'ReturnData'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否成功调用',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'IsSuccess'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '访问令牌',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'AccessToken'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '执行开始所使用的时间(毫秒)',
   'user', @CurrentUser, 'table', 'LogInterface', 'column', 'Timestamp'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogInterface (
Name ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogInterface (
StartTime ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogInterface (
UserId ASC
)
go

/*==============================================================*/
/* Index: Index_4                                               */
/*==============================================================*/
create index Index_4 on LogInterface (
LogLevel ASC
)
go


/*==============================================================*/
/* Table: LogTrack                                              */
/*==============================================================*/
create table LogTrack (
   Id                   int                  identity,
   SystemSign           varchar(50)          not null default '',
   HttpMethod           nvarchar(20)         not null default '',
   PagePath             varchar(500)         not null default '',
   PageUrl              varchar(500)         not null default '',
   BeforeUrl            varchar(500)         not null default '',
   IP                   varchar(20)          not null default '',
   CreateTime           datetime             not null default getdate(),
   RefreshTime          datetime             not null default getdate(),
   SourceId             int                  not null default 0,
   UserId               int                  not null default 0,
   MemberId             int                  not null default 0,
   OpenId               varchar(100)         not null default '',
   SessionId            nvarchar(50)         not null default '',
   BrowserName          nvarchar(100)        not null default '',
   OSName               nvarchar(100)        not null default '',
   SearchName           nvarchar(50)         not null default '',
   SearchKey            nvarchar(200)        not null default '',
   CookiesSign          nvarchar(100)        not null default '',
   ModuleName           nvarchar(100)        not null default '',
   DataId               int                  not null default 0,
   DataType             int                  not null default 0,
   ShareSignId          int                  not null default 0,
   DeviceName           varchar(100)         not null default '',
   Remark               nvarchar(200)        not null default '',
   GUID                 varchar(50)          not null default '',
   constraint PK_LOGTRACK primary key (Id)
)
on Track
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自动编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'Id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统标识',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'SystemSign'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '请求类型',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'HttpMethod'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '请求页面',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'PagePath'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '完整Url',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'PageUrl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '前一Url',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'BeforeUrl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'IP',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'IP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'CreateTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '刷新时间',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'RefreshTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '来源标识',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'SourceId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'UserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会员编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'MemberId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '粉丝编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'OpenId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '会话编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'SessionId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '浏览器',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'BrowserName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作系统',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'OSName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '搜索引擎名称',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'SearchName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '搜索关键词',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'SearchKey'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Cookies标识',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'CookiesSign'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '模块名称',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'ModuleName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'DataId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据类型:1表示消息编号,2表示活动编号,3表示问卷编号,4表示礼品编号,5表示产品编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'DataType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '分享标识编号',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'ShareSignId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设备名称',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'DeviceName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'Remark'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'GUID',
   'user', @CurrentUser, 'table', 'LogTrack', 'column', 'GUID'
go

/*==============================================================*/
/* Index: Index_1                                               */
/*==============================================================*/
create index Index_1 on LogTrack (
CreateTime ASC
)
go

/*==============================================================*/
/* Index: Index_2                                               */
/*==============================================================*/
create index Index_2 on LogTrack (
DataId ASC
)
go

/*==============================================================*/
/* Index: Index_3                                               */
/*==============================================================*/
create index Index_3 on LogTrack (
DataType ASC
)
go

/*==============================================================*/
/* Index: Index_4                                               */
/*==============================================================*/
create index Index_4 on LogTrack (
MemberId ASC
)
go

/*==============================================================*/
/* Index: Index_5                                               */
/*==============================================================*/
create index Index_5 on LogTrack (
UserId ASC
)
go
