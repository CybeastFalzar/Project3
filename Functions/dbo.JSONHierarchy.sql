SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[JSONHierarchy]
(
    @JSONData varchar(max)
  , @Parent_object_ID int = null
  , @MaxObject_id int = 0
  , @type int = null
)
returns @ReturnTable table
(											  
	-- https://www.red-gate.com/simple-talk/blogs/consuming-hierarchical-json-documents-sql-server-using-openjson/?utm_source=simpletalk&utm_medium=pubemail&utm_content=20171010-slota1&utm_term=simpletalkmain 
	--
    Element_ID int identity(1, 1) primary key /* internal surrogate primary key gives the order of parsing and the list order */
  , SequenceNo int null                       /* the sequence number in a list */
  , Parent_ID int                             /* if the element has a parent then it is in this column. The document is the ultimate parent, so you can get the structure from recursing from the document */
  , Object_ID int                             /* each list or object has an object id. This ties all elements to a parent. Lists are treated as objects here */
  , Name nvarchar(2000)                       /* the name of the object */
  , StringValue nvarchar(max) not null        /*the string representation of the value of the element. */
  , ValueType varchar(10) not null            /* the declared type of the value represented as a string in StringValue*/
)
as
begin
    --the types of JSON
    declare @null    int = 0
          , @string  int = 1
          , @int     int = 2
          , @boolean int = 3
          , @array   int = 4
          , @object  int = 5;

    declare @OpenJSONData table
    (
        sequence int identity(1, 1)
      , [key] varchar(200)
      , Value varchar(max)
      , type int
    );

    declare @key       varchar(200)
          , @Value     varchar(max)
          , @Thetype   int
          , @ii        int
          , @iiMax     int
          , @NewObject int
          , @firstchar char(1);

    insert into @OpenJSONData
    (
        [key]
      , Value
      , type
    )
    select [Key]
         , Value
         , Type
    from openjson(@JSONData);
    select @ii    = 1
         , @iiMax = scope_identity();
    select @firstchar
        = --the first character to see if it is an object or an array
        substring(
                     @JSONData
                   , patindex(
                                 '%[^' + char(0) + '- ' + char(160) + ']%'
                               , ' ' + @JSONData + '!' collate SQL_Latin1_General_CP850_BIN
                             ) - 1
                   , 1
                 );
    if @type is null
       and @firstchar in ( '[', '{' )
    begin
        insert into @ReturnTable
        (
            SequenceNo
          , Parent_ID
          , Object_ID
          , Name
          , StringValue
          , ValueType
        )
        select 1
             , null
             , 1
             , '-'
             , ''
             , case @firstchar
                   when '[' then
                       'array'
                   else
                       'object'
               end;
        select @type             = case @firstchar
                                       when '[' then
                                           @array
                                       else
                                           @object
                                   end
             , @Parent_object_ID = 1
             , @MaxObject_id     = coalesce(@MaxObject_id, 1) + 1;
    end;
    while (@ii <= @iiMax)
    begin
        --OpenJSON renames list items with 0-nn which confuses the consumers of the table
        select @key     = case
                              when [key] like '[0-9]%' then
                                  null
                              else
                                  [key]
                          end
             , @Value   = Value
             , @Thetype = type
        from @OpenJSONData
        where sequence = @ii;

        if @Thetype in ( @array, @object ) --if we have been returned an array or object
        begin
            select @MaxObject_id = coalesce(@MaxObject_id, 1) + 1;
            --just in case we have an object or array returned
            insert into @ReturnTable --record the object itself
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , @MaxObject_id
                 , @key
                 , ''
                 , case @Thetype
                       when @array then
                           'array'
                       else
                           'object'
                   end;

            insert into @ReturnTable --and return all its children
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , [Name]
              , StringValue
              , ValueType
            )
            select SequenceNo
                 , Parent_ID
                 , Object_ID
                 , [Name]
                 , StringValue
                 , ValueType
            from dbo.JSONHierarchy(@Value, @MaxObject_id, @MaxObject_id, @type);
            select @MaxObject_id = max(Object_ID) + 1
            from @ReturnTable;
        end;
        else
            insert into @ReturnTable
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , null
                 , @key
                 , @Value
                 , case @Thetype
                       when @string then
                           'string'
                       when @null then
                           'null'
                       when @int then
                           'int'
                       when @boolean then
                           'boolean'
                       else
                           'int'
                   end;

        select @ii = @ii + 1;
    end;

    return;
end;
GO
