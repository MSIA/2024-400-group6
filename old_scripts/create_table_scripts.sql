CREATE TABLE STRINFO (
   STORE 		INTEGER PRIMARY KEY
   CITY			VARCHAR()
   ZIP			INTEGER
)
  
CREATE TABLE SKSTINFO (
   SKU			INTEGER PRIMARY KEY
   STORE		INTEGER PRIMARY KEY
   COST			INTEGER
   RETAIL		INTEGER
)
  
CREATE TABLE DEPTINFO (
    DEPT    	INTEGER PRIMARY KEY
    DEPTDESC 	VARCHAR()
)
  
CREATE TABLE SKUINFO (
    SKU			INTEGER PRIMARY KEY
    DEPT		INTEGER
    CLASSID		INTEGER
    UPC			INTEGER
    STYLE		VARCHAR()
    COLOR		VARCHAR()
    SIZE		VARCHAR()
    PACKSIZE	INTEGER / BOOLEAN ?
    VENDOR		INTEGER
    BRAND		VARCHAR()
 )
   
CREATE TABLE TRANSACT (
  SKU			INTEGER PRIMARY KEY
  STORE			INTEGER PRIMARY KEY
  REGISTER		INTEGER	PRIMARY KEY
  TRANNUM		INTEGER PRIMARY KEY
  SALEDATE		TIMESTAMP() PRIMARY KEY
  SEQ			INTEGER	PRIMARY KEY
  INTERID		INTEGER
  STYPE			VARCHAR(1)	
  QUANTITY		INTEGER
  ORGPRICE		INTEGER
  AMT			INTEGER
  MIC			INTEGER
 )
   
    
    
    
    
    
    
    
    
    
  
   
   
   