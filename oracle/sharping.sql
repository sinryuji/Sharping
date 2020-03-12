DROP TABLE ADMIN;
DROP TABLE BANK;
DROP TABLE BASKET;
DROP TABLE CATEGORY; 
DROP TABLE CSQA;
DROP TABLE CSQACLASS;
DROP TABLE CSQACOMMENT; 
DROP TABLE DECLPRODUCT; 
DROP TABLE DELIVERYADDRESS; 
DROP TABLE DETAILOPTION;
DROP TABLE GUEST; 
DROP TABLE MEMBER;
DROP TABLE NOTICE;
DROP TABLE OPTIONN;
DROP TABLE ORDERLIST;
DROP TABLE ORDERR;
DROP TABLE PAYBANK;
DROP TABLE PAYCARD;
DROP TABLE PQACOMMENT;
DROP TABLE PRODUCT;
DROP TABLE PRODUCTQA;
DROP TABLE REVIEW;
DROP TABLE SELLER;
DROP TABLE VIRTUALACCOUNT;
DROP TABLE WISHLIST;


CREATE TABLE MEMBER (
	"id"	VARCHAR2(30)		PRIMARY KEY,
	"password"	VARCHAR2(70)		NOT NULL,
	"name"	VARCHAR2(20)		NOT NULL,
	"phone"	VARCHAR2(20)		NOT NULL UNIQUE,
	"email"	VARCHAR2(40)		NOT NULL UNIQUE,
	"regDate"	TIMESTAMP		DEFAULT SYSDATE,
	"memberGrade"	NUMBER		DEFAULT 1
);

CREATE TABLE ADMIN (
	"adminId"	VARCHAR2(30)		PRIMARY KEY,
	"adminPassword"	NUMBER		NOT NULL
);

CREATE TABLE CATEGORY (
	"categoryNum"	NUMBER		PRIMARY KEY,
	"categoryName"	VARCHAR(20)		NOT NULL,
	"categoryDepth"	NUMBER		DEFAULT 1,
	"pcNum"	NUMBER
);

CREATE TABLE CSQACLASS (
	"csqacNum"	NUMBER		PRIMARY KEY,
	"csqacName"	VARCHAR2(20)		NOT NULL,
	"csqacDepth"	NUMBER		DEFAULT 1,
	"pcsqacNum"	NUMBER,
	"csqacCase"	VARCHAR2(20) CHECK ("csqacCase" IN ('USER', 'SELLER'))		NOT NULL
);

CREATE TABLE BANK (
	"bankCode"	NUMBER		PRIMARY KEY,
	"bankName"	VARCHAR2(30)		NOT NULL
);

/*멤버아이디 참조*/
CREATE TABLE ORDERR (
	"orderNum"	VARCHAR2(100)		PRIMARY KEY,
	"orderDate"	TIMESTAMP		DEFAULT SYSDATE,
	"state"	VARCHAR2(20) CHECK ("state" in ('입금 대기', '결제 완료', '배송 준비중', '배송 중', '배송 완료', '구매 확정', '주문 취소', '반품 완료', '교환 완료')) NOT NULL,
	"payCase"	VARCHAR2(30) CHECK ("payCase" in ('무통장 입금', '카드'))		NOT NULL,
	"payPrice"	NUMBER		NOT NULL,
	"trackingNum"	VARCHAR2(20)	  NOT NULL,
	"toName"	VARCHAR2(20)		NOT NULL,
	"toPhone"	VARCHAR2(20)		NOT NULL,
	"toPost"	VARCHAR2(20)		NOT NULL,
	"toAddress"	VARCHAR2(200)		NOT NULL,
	"id"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE
);

/*멤버 아이디 참조*/
CREATE TABLE SELLER (
	"id"	VARCHAR2(30)		PRIMARY KEY,
	"storeName"	VARCHAR2(20)		NOT NULL,
	"storeAddress"	VARCHAR2(50)		NOT NULL,
	"storeText"	VARCHAR2(1000),
	"sellerGrade"	NUMBER		DEFAULT 1,
	"post"	VARCHAR2(20)		NOT NULL,
	"address"	VARCHAR2(200)		NOT NULL,
	"bankCode"	NUMBER		NOT NULL,
	"bankAcount"	VARCHAR2(100)		NOT NULL,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE,
  FOREIGN KEY ("bankCode") REFERENCES BANK("bankCode") ON DELETE CASCADE
);

/*멤버아이디 참조*/
CREATE TABLE DELIVERYADDRESS (
	"id"	VARCHAR2(30),
	"daPost"	VARCHAR2(20)		NOT NULL,
	"daAddress"	VARCHAR2(200)		NOT NULL,
	"daaName"	VARCHAR2(30),
	"daName"	VARCHAR2(20)		NOT NULL,
	"daPhone"	VARCHAR2(20)		NOT NULL,
  CONSTRAINT DELIVERYKEY PRIMARY KEY ("id", "daaName"),
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE
);

/*어드민 아이디 참조*/
CREATE TABLE NOTICE (
	"noticeNum"	NUMBER		PRIMARY KEY,
	"adminId"	VARCHAR2(30)		NOT NULL,
	"noticeSubject"	VARCHAR2(50)		NOT NULL,
	"noticeText"	VARCHAR2(1000)		NOT NULL,
	"noticeDate"	TIMESTAMP		DEFAULT SYSDATE,
	"noticePost"	VARCHAR2(20) CHECK ("noticePost" IN ('TRUE', 'FALSE'))		NOT NULL,
  FOREIGN KEY ("adminId") REFERENCES ADMIN("adminId") ON DELETE CASCADE
);

/*오더넘 참조*/
CREATE TABLE REVIEW (
	"reviewNum"	NUMBER		PRIMARY KEY,
	"orderNum"	VARCHAR2(100)		NOT NULL,
	"id"	VARCHAR2(30)		NOT NULL,
	"reviewText"	VARCHAR2(1000)		NOT NULL,
	"score"	NUMBER		NOT NULL,
	"reviewImage"	VARCHAR2(200),
	"reviewTitle"	VARCHAR2(50)		NOT NULL,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE
);

/*오더넘 참조*/
CREATE TABLE GUEST (
	"orderNum"	VARCHAR2(100)		PRIMARY KEY,
	"guestName"	VARCHAR2(30)		NOT NULL,
	"guestPhone"	VARCHAR2(30)		NOT NULL,
	"guestPassword"	VARCHAR2(70)		NOT NULL,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE
);

/*오더넘 참조*/
CREATE TABLE PAYCARD (
	"orderNum"	VARCHAR2(100)		PRIMARY KEY,
	"impId"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE
);




/*오더넘과 뱅크코드 참조*/
CREATE TABLE VIRTUALACCOUNT (
	"vaNum"	VARCHAR2(30)		PRIMARY KEY,
	"orderNum"	VARCHAR2(100)		NOT NULL,
	"bankCode"	NUMBER		NOT NULL,
	"payPrice"	NUMBER		NOT NULL,
	"respCode"	VARCHAR2(20) CHECK ("respCode" IN ('YES', 'NO'))		NOT NULL,
	"depositDate"	TIMESTAMP		DEFAULT SYSDATE,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE,
  FOREIGN KEY ("bankCode") REFERENCES BANK("bankCode") ON DELETE CASCADE
);

/*멤버 아이다 , 카테코리번호 참조*/
CREATE TABLE PRODUCT (
	"productNum"	NUMBER		PRIMARY KEY,
	"productName"	VARCHAR2(200)		NOT NULL,
	"productText"	VARCHAR2(1000)		NOT NULL,
	"productPrice"	NUMBER		NOT NULL,
	"productThumb"	VARCHAR2(200)		NOT NULL,
	"productImage"	VARCHAR2(500)		NOT NULL,
	"productDisplay" VARCHAR2(20) CHECK( "productDisplay" IN ('TRUE', 'FALSE')) NOT NULL,
	"stock"	NUMBER		NOT NULL,
	"categoryNum"	NUMBER		NOT NULL,
	"productDate"	TIMESTAMP		DEFAULT SYSDATE,
	"id"	VARCHAR2(30)		NOT NULL,
	"productMeterial"	VARCHAR2(100),
	"manufacturer"	VARCHAR2(50),
	"mfDate"	TIMESTAMP,
	"origin"	VARCHAR2(50),
	"deliveryPrice"	NUMBER		NOT NULL,
  FOREIGN KEY ("categoryNum") REFERENCES CATEGORY("categoryNum") ON DELETE CASCADE,
  FOREIGN KEY ("id") REFERENCES SELLER("id") ON DELETE CASCADE
);


/*오더넘 / 뱅크코드 / 버츄어 넘버 참조*/
CREATE TABLE PAYBANK (
	"orderNum"	VARCHAR2(100)		PRIMARY KEY,
	"payDate"	TIMESTAMP		NOT NULL,
	"cancleDate"	TIMESTAMP		NOT NULL,
	"bankCode"	NUMBER		NOT NULL,
	"vaNum"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE,
  FOREIGN KEY ("bankCode") REFERENCES BANK("bankCode") ON DELETE CASCADE,
  FOREIGN KEY ("vaNum") REFERENCES VIRTUALACCOUNT("vaNum") ON DELETE CASCADE
);


/*프로덕트넘 참조*/
CREATE TABLE OPTIONN (
	"optionNum"	NUMBER		PRIMARY KEY,
	"productNum"	NUMBER		NOT NULL,
	"cnt"	NUMBER		NOT NULL,
	"optionOneNum"	NUMBER,
	"optionTwoNum"	NUMBER,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE
);

/*프로덕트넘 참조*/
CREATE TABLE DETAILOPTION (
	"doNum"	NUMBER		PRIMARY KEY,
	"optionName"	VARCHAR2(20)		NOT NULL,
	"optionLevel"	NUMBER		NOT NULL,
	"productNum"	NUMBER		NOT NULL,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE
);

/*멤버아이디 프로덕트넘 참조*/
CREATE TABLE WISHLIST (
	"wishNum"	NUMBER		PRIMARY KEY,
	"id"	VARCHAR2(30)		NOT NULL,
	"productNum"	NUMBER		NOT NULL,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE
);

/*멤버아이디 프로덕트넘 참조*/
CREATE TABLE PRODUCTQA (
	"pqaNum"	NUMBER		PRIMARY KEY,
	"pqaCase"	VARCHAR2(40) CHECK ( "pqaCase" IN ('상품', '배송', '교환', '반품/취소/환불', '기타'))		NOT NULL,
	"pqaTitle"	VARCHAR2(50)		NOT NULL,
	"pqaText"	VARCHAR2(1000)		NOT NULL,
	"pqaImage"	VARCHAR2(200),
	"pqaEmail"	VARCHAR2(20)		NOT NULL,
	"productNum"	NUMBER		NOT NULL,
	"pqaSecret"	VARCHAR2(10) CHECK ("pqaSecret" IN ('YES', 'NO'))		NOT NULL,
	"pqaDate"	TIMESTAMP		DEFAULT SYSDATE,
	"id"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE
);

/*csqa넘 , 멤버아이디 , 프로덕트넘 참조 */
CREATE TABLE CSQA (
	"csqaNum"	NUMBER		PRIMARY KEY,
	"csqacNum"	NUMBER		NOT NULL,
	"csqacName"	VARCHAR2(20)		NOT NULL,
	"csqacTitle"	VARCHAR2(30)		NOT NULL,
	"csqacText"	VARCHAR2(500)		NOT NULL,
	"id"	VARCHAR2(30)		NOT NULL,
	"csqacDate"	TIMESTAMP		DEFAULT SYSDATE,
	"csqacEmail"	VARCHAR2(40)		NOT NULL,
	"csqacImagie"	VARCHAR2(200),
	"productNum"	NUMBER		NOT NULL,
  FOREIGN KEY ("csqacNum") REFERENCES CSQACLASS("csqacNum") ON DELETE CASCADE,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE
);


/*pqanum , 판매자 아이디 참조*/
CREATE TABLE PQACOMMENT (
	"pqacNum"	NUMBER		PRIMARY KEY,
	"pqaNum"	NUMBER		NOT NULL,
	"storeName"	VARCHAR2(20)		NOT NULL,
	"pqacText"	VARCHAR2(200)		NOT NULL,
	"id"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("pqaNum") REFERENCES PRODUCTQA("pqaNum") ON DELETE CASCADE,
  FOREIGN KEY ("id") REFERENCES SELLER("id") ON DELETE CASCADE
);


/*csqa넘 , 관리자 아이디 참조*/
CREATE TABLE CSQACOMMENT (
	"pqacNum"	NUMBER		PRIMARY KEY,
	"csqaNum"	NUMBER		NOT NULL,
	"adminId"	VARCHAR2(20)		NOT NULL,
	"csqacText"	VARCHAR2(300)		NOT NULL,
	"processingStatus"	VARCHAR2(30) CHECK( "processingStatus" IN ('답변대기중', '답변완료'))		NOT NULL,
  FOREIGN KEY ("csqaNum") REFERENCES CSQA("csqaNum") ON DELETE CASCADE,
  FOREIGN KEY ("adminId") REFERENCES ADMIN("adminId") ON DELETE CASCADE
);


/*프로덕트넘 , 셀러아이디, 멤버아이디 참조*/
CREATE TABLE DECLPRODUCT (
	"declNum"	NUMBER		PRIMARY KEY,
	"declReason"	VARCHAR2(50) CHECK ( "declReason" IN ('상품정보 다름', '가품/이미테이션', '청소년유해상품 및 이미지', '불법상품', '부적합 판매행위', '개인정보 침해', '결제도용신고', '배송환불분쟁/연락두절', '저작권 위반'))		NOT NULL,
	"productNum"	NUMBER		NOT NULL,
	"declDate"	TIMESTAMP		DEFAULT SYSDATE,
	"sellerId"	VARCHAR2(30)		NOT NULL,
	"declId"	VARCHAR2(30)		NOT NULL,
  FOREIGN KEY ("productNum") REFERENCES PRODUCT("productNum") ON DELETE CASCADE,
  FOREIGN KEY ("sellerId") REFERENCES SELLER("id") ON DELETE CASCADE,
  FOREIGN KEY ("declId") REFERENCES MEMBER("id") ON DELETE CASCADE
);


/*오더넘 , 옵션넘 참조*/
CREATE TABLE ORDERLIST (
	"olNum"	NUMBER		PRIMARY KEY,
	"productName"	VARCHAR2(200)		NOT NULL,
	"productThumb"	VARCHAR2(200),
	"optionOneNum"	VARCHAR2(20),
	"optionTwoNum"	VARCHAR2(20),
	"productPrice"	NUMBER		NOT NULL,
	"cnt"	NUMBER		NOT NULL,
	"orderNum"	VARCHAR2(100)		NOT NULL,
	"optionNum"	NUMBER		NOT NULL,
  FOREIGN KEY ("orderNum") REFERENCES ORDERR("orderNum") ON DELETE CASCADE,
  FOREIGN KEY ("optionNum") REFERENCES OPTIONN("optionNum") ON DELETE CASCADE
);


/*멤버아이디 , 옵션넘 참조*/
CREATE TABLE BASKET (
	"baskitNum"	NUMBER		PRIMARY KEY,
	"id"	VARCHAR2(30)		NOT NULL,
	"optionNum"	NUMBER		NOT NULL,
	"cnt"	NUMBER		NOT NULL,
  FOREIGN KEY ("id") REFERENCES MEMBER("id") ON DELETE CASCADE,
  FOREIGN KEY ("optionNum") REFERENCES OPTIONN("optionNum") ON DELETE CASCADE
);