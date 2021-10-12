:setvar SCHEMANAME CONNECT_MS

CREATE TABLE $(SCHEMANAME).MS_SRVC 
( 
	 SRVC_ID SMALLINT NOT NULL IDENTITY(1,1),
	 D_DUP_KEY VARCHAR (255) NOT NULL , 
	 SRVC_TYPE VARCHAR (255) NOT NULL,
	 SRVC_NAME VARCHAR (255) NOT NULL,
	 SRVC_VER VARCHAR (255) , 
     SRVC_INST VARCHAR (255) NOT NULL , 
     SRVC_HOST VARCHAR (255) 
)

-- ADD CONSTRAINT 

-- ALTER TABLE MS_SRVC ADD CONSTRAINT SVC_NAME_PK PRIMARY KEY CLUSTERED (DEDUP_KEY)
ALTER TABLE $(SCHEMANAME).MS_SRVC ADD CONSTRAINT MS_SRVC_ID_PK PRIMARY KEY CLUSTERED (SRVC_ID);

ALTER TABLE $(SCHEMANAME).MS_SRVC ADD CONSTRAINT MS_SVC_DDUP_UK UNIQUE NONCLUSTERED ( D_DUP_KEY );

CREATE TABLE $(SCHEMANAME).MS_MSG_BDY 
( 
	 MSG_BDY_ID BIGINT NOT NULL IDENTITY(1,1) , 
     CRTD_AT DATETIME NOT NULL , 
     LST_UPDT_AT DATETIME NOT NULL , 
     MSG_FRMT VARCHAR (64) NOT NULL , 
	 D_DUP_KEY VARCHAR (255) NOT NULL, 
     MSG_BDY VARBINARY (MAX) NOT NULL,
     ACTIVE TINYINT
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves the  body of a  Message' , 'USER' , 'dbo' , 'TABLE' , 'MS_MSG_BDY'

ALTER TABLE $(SCHEMANAME).MS_MSG_BDY ADD CONSTRAINT MS_BDY_ID_PK PRIMARY KEY CLUSTERED (MSG_BDY_ID);

ALTER TABLE $(SCHEMANAME).MS_MSG_BDY ADD CONSTRAINT MS_BDY_DDUP_UK UNIQUE NONCLUSTERED ( D_DUP_KEY, ACTIVE );

ALTER TABLE $(SCHEMANAME).MS_MSG_BDY ADD CONSTRAINT MS_BDY_ACTIVE_DF DEFAULT 1 FOR ACTIVE;


CREATE TABLE $(SCHEMANAME).MS_MSG_HDR 
( 
	MSG_HDR_ID BIGINT NOT NULL IDENTITY(1,1) , 
    MSG_BDY_ID BIGINT NOT NULL, 
	SRVC_ID SMALLINT NOT NULL ,  
    CRTD_AT DATETIME NOT NULL , 
    LST_UPDT_AT DATETIME NOT NULL , 
    CRNT_STATUS VARCHAR (255) , 
    D_DUP_KEY VARCHAR (255) NOT NULL , 
    END_PNT_TYPE VARCHAR (255) NOT NULL , 
    END_PNT_NAME VARCHAR (255) NOT NULL , 
    MDL_TYPE VARCHAR (255) NOT NULL , 
    MSG_CAT VARCHAR (255) NOT NULL , 
    MSG_TYPE VARCHAR (255) NOT NULL , 
    MSG_VER VARCHAR (255) NOT NULL , 
    MSG_ID VARCHAR (255) NOT NULL , 
    MSG_SNDR VARCHAR (255) , 
    MSG_RCVRS VARCHAR (255) , 
    DOC_ID VARCHAR (255) , 
    DOC_CUST_ID VARCHAR (255) , 
    DOC_TMSTMP DATETIME ,
    REF_MSG_SNDR VARCHAR (255) ,
    REF_MSG_ID VARCHAR (255) , 
    REF_DOC_ID VARCHAR (255) , 
    TST_MSG TINYINT,
    ACTIVE TINYINT
    )
 
-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves Header level information associated to a Message' , 'USER' , 'dbo' , 'TABLE' , 'MS_MSG_HDR'

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MS_HDR_ID_PK PRIMARY KEY CLUSTERED (MSG_HDR_ID);

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MS_HDR_DDUP_UK UNIQUE NONCLUSTERED ( D_DUP_KEY, ACTIVE );

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MS_HDR_TST_MSG_DF DEFAULT 0 FOR TST_MSG;

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MS_HDR_SRVC_SRVID_FK FOREIGN KEY ( SRVC_ID ) REFERENCES $(SCHEMANAME).MS_SRVC ( SRVC_ID );

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MSG_HDR_BDY_ID_FK FOREIGN KEY ( MSG_BDY_ID ) REFERENCES $(SCHEMANAME).MS_MSG_BDY ( MSG_BDY_ID );

ALTER TABLE $(SCHEMANAME).MS_MSG_HDR ADD CONSTRAINT MS_HDR_ACTIVE_DF DEFAULT 1 FOR ACTIVE;


CREATE TABLE $(SCHEMANAME).MS_MSG_EVNT 
( 
	 MSG_EVNT_ID BIGINT NOT NULL IDENTITY(1,1) , 
     MSG_HDR_ID BIGINT NOT NULL ,
     STATUS VARCHAR (64) NOT NULL , 
     CRTD_AT DATETIME NOT NULL , 
     ERR_CODE VARCHAR (40) , 
     ERR_DESC VARCHAR (1000),
	 ERR_CAT VARCHAR(20),
	 ERR_REASON VARCHAR(50),
	 ERR_DETAIL_DESC VARCHAR (2000),
     TASK_ID VARCHAR(255),
	 TASK_NAME VARCHAR(255)
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table which contains events associated with a Message' , 'USER' , 'dbo' , 'TABLE' , 'MS_MSG_EVNT'

ALTER TABLE $(SCHEMANAME).MS_MSG_EVNT ADD CONSTRAINT MS_EVNT_ID_PK PRIMARY KEY NONCLUSTERED (MSG_EVNT_ID);

ALTER TABLE $(SCHEMANAME).MS_MSG_EVNT ADD CONSTRAINT MS_EVNT_HDR_CRTD_UK UNIQUE CLUSTERED (MSG_HDR_ID, CRTD_AT);

ALTER TABLE $(SCHEMANAME).MS_MSG_EVNT ADD CONSTRAINT MS_EVENT_HDR_HDRID_FK FOREIGN KEY ( MSG_HDR_ID ) REFERENCES $(SCHEMANAME).MS_MSG_HDR ( MSG_HDR_ID );


/*
   Create replayable messages schema 
*/

CREATE TABLE $(SCHEMANAME).MS_RPLYBL_MSGS
( 
   --  RPLYBL_MSG_ID   INT NOT NULL IDENTITY(1,1) , 
     CRTD_AT         DATETIME NOT NULL , 
     LST_UPDT_AT     DATETIME NOT NULL , 
     MSG_STORE_ID    BIGINT NOT NULL, 
     RPLY_COUNT      SMALLINT , 
     NXT_RUN_AT      DATETIME NOT NULL,
     ACTIVE          TINYINT,
     RPLYNG          TINYINT 
);
 
-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves Replay level information associated to a Message' , 'USER' , 'dbo' , 'TABLE' , 'MS_RPLYBL_MSGS';

ALTER TABLE $(SCHEMANAME).MS_RPLYBL_MSGS ADD CONSTRAINT RPLYBL_MSG_ID_PK PRIMARY KEY CLUSTERED (MSG_STORE_ID);

-- ALTER TABLE MS_RPLYBL_MSGS ADD CONSTRAINT RPLYBL_MSG_ID_PK PRIMARY KEY CLUSTERED (RPLYBL_MSG_ID);

-- ALTER TABLE MS_RPLYBL_MSGS ADD CONSTRAINT MSG_STORE_ID_UK unique nonclustered ( MSG_STORE_ID );

ALTER TABLE $(SCHEMANAME).MS_RPLYBL_MSGS ADD CONSTRAINT RPLYBL_MSGS_HDR_ID_FK FOREIGN KEY ( MSG_STORE_ID ) REFERENCES $(SCHEMANAME).MS_MSG_HDR ( MSG_HDR_ID );

ALTER TABLE $(SCHEMANAME).MS_RPLYBL_MSGS ADD CONSTRAINT MS_RPLY_COUNT_DF DEFAULT 0 FOR RPLY_COUNT;

ALTER TABLE $(SCHEMANAME).MS_RPLYBL_MSGS ADD CONSTRAINT MS_RPLY_ACTIVE_DF DEFAULT 1 FOR ACTIVE;

ALTER TABLE $(SCHEMANAME).MS_RPLYBL_MSGS ADD CONSTRAINT MS_RPLY_RPLYNG_DF DEFAULT 0 FOR RPLYNG;


CREATE TABLE $(SCHEMANAME).MS_BLK_HDR 
( 
	 BLK_HDR_ID BIGINT NOT NULL IDENTITY(1,1) , 
     CRTD_AT DATETIME NOT NULL , 
     LST_UPDT_AT DATETIME NOT NULL , 
     CRNT_STATUS VARCHAR (64) , 
	 SRVC_ID SMALLINT NOT NULL ,  
     END_PNT_TYPE VARCHAR (255) NOT NULL , 
     END_PNT_NAME VARCHAR (255) NOT NULL , 
     MDL_TYPE VARCHAR (255) NOT NULL ,
     BLK_ID VARCHAR (255) NOT NULL , 
     BLK_TYPE VARCHAR (255) NOT NULL , 
     BLK_VER VARCHAR (255) NOT NULL , 
     BLK_SRC VARCHAR (255) NOT NULL , 
     BLK_LOC VARCHAR (255) NOT NULL , 
     BLK_FORMAT VARCHAR (255) NOT NULL , 
     BLK_SRC_ID VARCHAR (255) 
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that holds Bulk level Message Header information.' , 'USER' , 'dbo' , 'TABLE' , 'MS_BLK_HDR'

ALTER TABLE $(SCHEMANAME).MS_BLK_HDR ADD CONSTRAINT BLK_HDR_ID_PK PRIMARY KEY CLUSTERED (BLK_HDR_ID);

ALTER TABLE $(SCHEMANAME).MS_BLK_HDR ADD CONSTRAINT MS_BLK_HDR_SRVC_SRVID_FK FOREIGN KEY ( SRVC_ID ) REFERENCES $(SCHEMANAME).MS_SRVC ( SRVC_ID );

ALTER TABLE $(SCHEMANAME).MS_BLK_HDR ADD CONSTRAINT BLK_HDR_DTLS_UK UNIQUE NONCLUSTERED (SRVC_ID, BLK_SRC, BLK_ID);

CREATE TABLE $(SCHEMANAME).MS_BLK_EVNT 
( 
	 BLK_EVNT_ID BIGINT NOT NULL IDENTITY(1,1) ,
     BLK_HDR_ID BIGINT NOT NULL ,
     STATUS VARCHAR (64) NOT NULL ,
     CRTD_AT DATETIME NOT NULL ,
     BTCH_ID VARCHAR (255) ,
     BTCH_TASK VARCHAR (255) ,
     BTCH_TOT_REC BIGINT , 
     BTCH_PRC_REC BIGINT , 
     BTCH_SUC_REC BIGINT , 
     BTCH_FLD_REC BIGINT , 
     ERR_CODE VARCHAR (40) , 
     ERR_DESC VARCHAR (1000),
	 ERR_CAT VARCHAR(20),
	 ERR_REASON VARCHAR(50),
	 ERR_DETAIL_DESC VARCHAR (2000)
)


-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that holds information about  events associated with  Bulk Messages' , 'USER' , 'dbo' , 'TABLE' , 'MS_BLK_EVNT';

ALTER TABLE $(SCHEMANAME).MS_BLK_EVNT ADD CONSTRAINT BLK_EVNT_ID_UK UNIQUE (BLK_EVNT_ID);

ALTER TABLE $(SCHEMANAME).MS_BLK_EVNT ADD CONSTRAINT BLK_EVNT_HDR_ID_PK PRIMARY KEY CLUSTERED (BLK_HDR_ID, CRTD_AT);

ALTER TABLE $(SCHEMANAME).MS_BLK_EVNT ADD CONSTRAINT BLK_EVENT_HDR_HDRID_FK FOREIGN KEY ( BLK_HDR_ID ) REFERENCES $(SCHEMANAME).MS_BLK_HDR ( BLK_HDR_ID );

CREATE TABLE $(SCHEMANAME).MS_RCRD_HDR 
( 
	 BLK_RCRD_HDR_ID BIGINT NOT NULL IDENTITY(1,1) , 
     BLK_HDR_ID BIGINT NOT NULL , 
     CRTD_AT DATETIME NOT NULL , 
     LST_UPDT_AT DATETIME NOT NULL ,
     LST_TASK VARCHAR (255) , 
     CRNT_STATUS VARCHAR (64) NOT NULL , 
     RCRD_ID VARCHAR (255) NOT NULL , 
     SEQ_NO BIGINT NOT NULL , 
     RCRD_HDR_BODY VARBINARY (MAX)
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves  Record level information. A bulk is made of one or more records' , 'USER' , 'dbo' , 'TABLE' , 'MS_RCRD_HDR'

ALTER TABLE $(SCHEMANAME).MS_RCRD_HDR ADD CONSTRAINT BLK_HDR_RCRD_HDR_ID_PK PRIMARY KEY CLUSTERED (BLK_HDR_ID, BLK_RCRD_HDR_ID);

ALTER TABLE $(SCHEMANAME).MS_RCRD_HDR ADD CONSTRAINT BLK_RCRD_HDR_ID_UK UNIQUE NONCLUSTERED (BLK_RCRD_HDR_ID);

ALTER TABLE $(SCHEMANAME).MS_RCRD_HDR ADD CONSTRAINT BLK_HDR_CRTD_AT_UK UNIQUE NONCLUSTERED (BLK_HDR_ID, RCRD_ID);

ALTER TABLE $(SCHEMANAME).MS_RCRD_HDR ADD CONSTRAINT BLK_RCRD_HDRID_FK FOREIGN KEY ( BLK_HDR_ID ) REFERENCES $(SCHEMANAME).MS_BLK_HDR ( BLK_HDR_ID );


CREATE TABLE $(SCHEMANAME).MS_RCRD_EVNT 
( 
	 BLK_RCRD_EVNT_ID BIGINT NOT NULL IDENTITY (1,1) , 
     RCRD_HDR_ID BIGINT NOT NULL , 
	 BLK_HDR_ID BIGINT NOT NULL , 
     TASK_NAME VARCHAR (255),
     TASK_ID VARCHAR (255),
     STATUS VARCHAR (64) NOT NULL , 
     CRTD_AT DATETIME NOT NULL , 
     ERR_CODE VARCHAR (40) , 
     ERR_DESC VARCHAR (1000),
	 ERR_CAT VARCHAR(20),
	 ERR_REASON VARCHAR(50),
	 ERR_DETAIL_DESC VARCHAR (2000)
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves information about events associated with a Record' , 'USER' , 'dbo' , 'TABLE' , 'MS_RCRD_EVNT'

ALTER TABLE $(SCHEMANAME).MS_RCRD_EVNT ADD CONSTRAINT BLK_RCRD_EVNT_ID_UK UNIQUE (BLK_RCRD_EVNT_ID);

ALTER TABLE $(SCHEMANAME).MS_RCRD_EVNT ADD CONSTRAINT BLK_RCRD_EVNT_ID_PK PRIMARY KEY CLUSTERED (BLK_HDR_ID, RCRD_HDR_ID, CRTD_AT);

ALTER TABLE $(SCHEMANAME).MS_RCRD_EVNT ADD CONSTRAINT BLK_RCRD_EVNT_ID_FK FOREIGN KEY (BLK_HDR_ID,RCRD_HDR_ID) REFERENCES $(SCHEMANAME).MS_RCRD_HDR ( BLK_HDR_ID, BLK_RCRD_HDR_ID );

CREATE TABLE $(SCHEMANAME).MS_VER 
(
    VER       VARCHAR(255) NOT NULL,
    CRTD_AT   DATETIME NOT NULL,
	PATCH_VER SMALLINT DEFAULT 0
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table to save schema version information' , 'USER' , 'dbo' , 'TABLE' , 'MS_VER'

ALTER TABLE $(SCHEMANAME).MS_VER ADD CONSTRAINT MSG_VER_UK UNIQUE NONCLUSTERED ( VER );


-- ALTER TABLE MS_MSG_EVNT ADD CONSTRAINT MSG_EVNT_BDY_ID_FK FOREIGN KEY ( MSG_BDY_ID ) REFERENCES $(SCHEMANAME).MS_MSG_BDY ( MSG_BDY_ID )


/*
Add current version
*/

INSERT INTO $(SCHEMANAME).MS_VER(VER, CRTD_AT, PATCH_VER) VALUES('2021.2.0', CURRENT_TIMESTAMP, 0);

/*
   Create bulk ingestion related schema 
*/
CREATE TABLE $(SCHEMANAME).MS_INGSTN_RCRD 
(
    INGSTN_RCRD_ID  NUMERIC(16) NOT NULL IDENTITY(1,1),
    CRTD_AT        DATETIME NOT NULL,
    SRVC_NAME      VARCHAR(255) NOT NULL,
    SRVC_INST      VARCHAR(255),
	BULK_ID		   VARCHAR(255) NOT NULL,
    BLK_LOC        VARCHAR(255) NOT NULL    
);

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that saves bulk ingestion records' , 'USER' , 'dbo' , 'TABLE' , 'MS_INGSTN_RCRD'	

ALTER TABLE $(SCHEMANAME).MS_INGSTN_RCRD ADD CONSTRAINT INGSTN_RCRD_ID_PK PRIMARY KEY ( INGSTN_RCRD_ID );

ALTER TABLE $(SCHEMANAME).MS_INGSTN_RCRD ADD CONSTRAINT INGSTN_RCRD_UK UNIQUE ( SRVC_NAME, BULK_ID );

CREATE TABLE $(SCHEMANAME).MS_BLK_INGSTN 
(
    BLK_INGSTN_ID  NUMERIC(16) NOT NULL IDENTITY(1,1),
    LST_INGSTD_AT  DATETIME NOT NULL,
    BLK_INGSTN_RCRD_ID        NUMERIC(16) NOT NULL,
    ING_SRVC_NAME      VARCHAR(255) NOT NULL,
    CUR_POS            NUMERIC(16) NOT NULL    
);

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that keeps track of the bulk ingestions' , 'USER' , 'dbo' , 'TABLE' , 'MS_BLK_INGSTN'	

ALTER TABLE $(SCHEMANAME).MS_BLK_INGSTN ADD CONSTRAINT BLK_INGSTN_ID_PK PRIMARY KEY ( BLK_INGSTN_ID );

ALTER TABLE $(SCHEMANAME).MS_BLK_INGSTN ADD CONSTRAINT BLK_INGSTN_UK UNIQUE ( BLK_INGSTN_RCRD_ID, ING_SRVC_NAME );

ALTER TABLE $(SCHEMANAME).MS_BLK_INGSTN ADD CONSTRAINT MS_BULK_INGSTN_FK FOREIGN KEY ( BLK_INGSTN_RCRD_ID ) REFERENCES $(SCHEMANAME).MS_INGSTN_RCRD ( INGSTN_RCRD_ID );

CREATE TABLE $(SCHEMANAME).MS_BLK_INGSTN_EVNT 
(
    BLK_INGSTN_EVNT_ID        NUMERIC(16) NOT NULL IDENTITY(1,1),
	BLK_INGSTN_ID        NUMERIC(16) NOT NULL,
    INGSTD_AT  DATETIME NOT NULL,
    ING_SRVC_INST      VARCHAR(255),    
    STRT_POS       NUMERIC(16) NOT NULL,
    END_POS       NUMERIC(16) NOT NULL
);

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that captures the ingestion events of a service' , 'USER' , 'dbo' , 'TABLE' , 'MS_BLK_INGSTN_EVNT'		

ALTER TABLE $(SCHEMANAME).MS_BLK_INGSTN_EVNT ADD CONSTRAINT MS_BULK_INGSTN_EVNT_FK FOREIGN KEY ( BLK_INGSTN_ID ) REFERENCES $(SCHEMANAME).MS_BLK_INGSTN ( BLK_INGSTN_ID );

/*
   Create user data related schema 
*/

CREATE TABLE $(SCHEMANAME).MS_USER_DATA
(
	USER_ID		VARCHAR(255)	PRIMARY KEY ,
	USER_DATA	VARCHAR(4000)	NOT NULL ,
	CREATED_AT	DATETIME		NOT NULL
);

/*
   Create message tagging schema
*/

CREATE TABLE $(SCHEMANAME).MS_TAG
(
    TAG_ID      SMALLINT		NOT NULL IDENTITY(1,1),
	TAG_NAME    VARCHAR(255)    NOT NULL,
    CREATED_AT  DATETIME        NOT NULL
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that maintains tags for grouping messages' , 'USER' , 'dbo' , 'TABLE' , 'MS_TAG'

ALTER TABLE $(SCHEMANAME).MS_TAG ADD CONSTRAINT TAG_ID_PK PRIMARY KEY CLUSTERED ( TAG_ID );

ALTER TABLE $(SCHEMANAME).MS_TAG ADD CONSTRAINT TAG_UK UNIQUE ( TAG_NAME );

CREATE TABLE $(SCHEMANAME).MS_MSG_TAG
(
	TAG_ID          SMALLINT NOT NULL,
	MSG_HDR_ID      BIGINT NOT NULL,
    CREATED_AT      DATETIME   NOT NULL
)

-- EXEC sp_addextendedproperty 'MS_Description' , 'Table that assigns messages to tag' , 'USER' , 'dbo' , 'TABLE' , 'MS_MSG_TAG'

-- ALTER TABLE MS_MSG_TAG ADD CONSTRAINT MSG_TAG_UK UNIQUE CLUSTERED ( TAG_ID, MSG_HDR_ID )

ALTER TABLE $(SCHEMANAME).MS_MSG_TAG ADD CONSTRAINT TAG_FK FOREIGN KEY ( TAG_ID ) REFERENCES $(SCHEMANAME).MS_TAG ( TAG_ID );

ALTER TABLE $(SCHEMANAME).MS_MSG_TAG ADD CONSTRAINT MSG_HDR_FK FOREIGN KEY (MSG_HDR_ID ) REFERENCES $(SCHEMANAME).MS_MSG_HDR ( MSG_HDR_ID );