drop table Distributor cascade constraints;
drop table Shop cascade constraints;
drop table Owner cascade constraints;
drop table Employees cascade constraints;
drop table Customers cascade constraints;
drop table Orders cascade constraints;
drop table Payment cascade constraints;
drop table Flower_item cascade constraints;
drop table Shop_phno cascade constraints;
drop table Order_Lines cascade constraints;
drop table Distribute_Flower cascade constraints;
create table Distributor
(
D_id int primary key,
Fir_name varchar2(20),
Mid_name varchar2(20),
Las_name varchar2(20),
Phoneno varchar2(20),
Street varchar2(30),
City varchar2(20),
State1 varchar2(20),
Pincode int
);
desc distributor;
create table Owner
(
O_Uid int primary key,
O_Name varchar2(20),
Ph_no varchar2(20),
Gender char,
Street varchar2(30),
City varchar2(20),
State varchar2(20),
Pincode int
);
desc owner;
create table Shop
(
Shop_id int primary key,
S_name varchar2(40),
Street varchar2(30),
City varchar2(20),
State varchar2(20),
Pincode int,
Owner_id int  references Owner(O_Uid),
Mgr_id int         
);
desc Shop;

create table Employees
(
E_id int primary key,
Fname varchar2(20),
Mname varchar2(20),
Lname varchar2(20),
Dob date,
Ph_no varchar2(20),
Gender char,
Start_date date,
Street varchar2(30),
City varchar2(20),
State varchar2(20),
Pincode int,
Shopid int  references Shop(Shop_id),      /*foreign key of shop*/
salary int
);
desc Employees;
alter table Shop add constraint fkshop foreign key(Mgr_id) references Employees(E_id);

create table Customers
(
C_id int primary key,
Fi_name varchar2(20),
Mi_name varchar2(20),
La_name varchar2(20),
Gender char,
Dob date,
house_no varchar2(20),
Street varchar2(30),
City varchar2(20),
State varchar2(20),
Pincode int,
Ph_no int
);
desc Customer;

create table Orders
( 
Order_no int primary key,
Ord_date date,
Cid int references Customers(C_id),
Eid int references Employees (E_id)
);
desc Orders;

create table Payment
(
Payment_id int,
Paymethod varchar2(20),
Cu_id int references Customers(C_id) /* foreign customer */
);
desc Payment;

create table Flower_item
(
floweritemcode int primary key,
f_name varchar2(20),
Price int,
Occasion_code int,
Occasion_name varchar2(50)
);
desc Flower_item;

create table Shop_Phno
(
Shopid int references Shop(shop_id),
Phno int,
 primary key(Shopid,Phno)
);
desc Shop_Phno;

create table Order_Lines
(
Orderno int references Orders(Order_no),  /*foreign Orders */
Orderlineno int,
Quantity int,
flower_icode int references Flower_item(floweritemcode),   /*foreign key flower item */
primary key(Orderno,orderlineno,flower_icode)
);
desc Order_Lines;


create table Distribute_flower
(
Di_id int references Distributor(D_id),  
S_id int references Shop(shop_id),
Flower_item_name  varchar2(30),
Quantity int,
primary key(Di_id,S_id)
);
desc Distribute_flower;

/*Distributor*/
insert all
into Distributor values(101,'Saru','Ashok','Patil','9876533210','Jublie circle','Dharwad','Karnataka',580001)
into Distributor values(102,'Raghu','Maruti','Rathod','9876534211','Vidyanagar','Hubli','Karnataka',580021)
into Distributor values(103,'Yash','Siddarth','Mishra','9876534212','Ganesh nagar','Gadag','Karnataka',582102)
into Distributor values(104,'Aniket','Basavaraj','Gadagin','9876533213','Gavi nagar','Belagum','Karnataka',583231)
into Distributor values(105,'Sandhya','Ajay','Bhat','9876533214','Saptapur','Dharwad','Karnataka',580001)
into Distributor values(106,'Anish','Sankalp','Raj','9876533215','Pavate nangar','Dharwad','Karnataka',580001)
into Distributor values(107,'Aruna','Ashok','Joshi','9876533216','CB nagar','Dharwad','Karnataka',580001)
into Distributor values(108,'Manju','Maruti','Rathod','9876534217','Vidyagiri','Dharwad','Karnataka',580005)
into Distributor values(109,'Bheema','Ramji','Ambedkar','9876534218','Gandhi nagar','Gadag','Karnataka',582102)
into Distributor values(110,'Anjuma','Shaheed','Saheb','9876533219','Rani chennammma circle','Gokak','Karnataka',583231)
into Distributor values(111,'Sandhya','Ajay','Bhat','9876533220','Pavate nagar','Dharwad','Karnataka',580001)
into Distributor values(112,'Manoj','Mahantesh','Reddy','8765432101','CBT','Hubli','Karnataka',580021)
into Distributor values(113,'Rukmini','Ashok','Patil','9876533221','KC park','Dharwad','Karnataka',580001)
into Distributor values(114,'Amogh','Mallesh',' Nayak','9876534222','basava nagar','Annigeri','Karnataka',580005)
into Distributor values(115,'Yash','Siddarth','Mishra','9876534223','Gopal nagar','Gadag','Karnataka',582102)
into Distributor values(116,'Saket','Bharat','Goud','9876533224','Sardar Patel circle','Belagum','Karnataka',583231)
into Distributor values(117,'Ram','Chetan','Badri','9876533225','Mrutyunjay nagar','Dharwad','Karnataka',580001)
into Distributor values(118,'Nitin','Das','Revankar','87654321226','Renuka devi street','Savadatti','Karnataka',580021)
into Distributor values(119,'Rahul','Anish','Jakati','9876533227','Anjaney nagar','Dandeli','Karnataka',580031)
into Distributor values(120,'Rani','Mallappa','Rathod','9876534228','APMC','Hubli','Karnataka',580001)
into Distributor values(121,'Anand','Satya','Kulkarni','9876534229','Eshwar nagar','Gadag','Karnataka',582102)
into Distributor values(122,'Nalini','Basavaraj','Shettar','9876533230','Vishwesahwarayya circle','Belagum','Karnataka',583231)
into Distributor values(123,'Ajay','Sankalp','Rao','8765432232','Gandi nagar','Dharwad','Karnataka',580001)
into Distributor values(124,'Anvar','Shaheed','Bhanu','9876533231','Chennamma circle','Lakshmeshwar','Karnataka',582103)
into Distributor values(125,'Ramba','Mallappa','Nayak','9876534233','Maruti circle','Vijayapura','Karnataka',586101)
into Distributor values(126,'Ninad','Santosh','Kulkarni','9876534234','Ganesh nagar','Vijayapura','Karnataka',586101)
into Distributor values(127,'Nitya','Basava','Shettar','9876533235','Sai nagar','Vijayapur','Karnataka',586101)
into Distributor values(128,'Naland','Sarati','Rao','8765432236','CBT','Vijayapur','Karnataka',586101)
into Distributor values(129,'Kapil','Shan','Sharma','9876533237','Parvati nagar','Vijaypur','Karnataka',586101)
into Distributor values(130,'Lakshman','Narayan','Raj','8765432238','Kalyan nangar','Sindagi','Karnataka',586102)
into Distributor values(131,'Ravi','Satish','Ullagaddi','9876534239','RK nagar','Indi','Karnataka',586102)
into Distributor values(132,'Ganesh','M','Karjagi','9876534240','Mandar nagar','Vijayapur','Karnataka',586101)
into Distributor values(133,'Deepika','Basavaraj','Das','9876533241','shivaji nagar','Belagum','Karnataka',583231)
into Distributor values(134,'Vasuki','Sankalp','Vaibhav','8765432242','Gandhi Bajar','Gadag','Karnataka',582102)
into Distributor values(135,'Shain','Sharat','Shetty','9876533243','Mahant nagar','Betageri','Karnataka',582102)
into Distributor values(136,'Bhumi','Narayan','Karjagi','8765432244','Pakirswami nagar','Shirahatti','Karnataka',582104)
into Distributor values(137,'Rachana','Satish','Sambargi','9876534245','Sai nagar','Hubli','Karnataka',580021)
into Distributor values(138,'Danush','M','Karvar','9876534246','Sattur','Dharwad','Karnataka',580004)
into Distributor values(139,'Divya','B','Doddamani','9876533247','Radhakrisha nagar','Belagum','Karnataka',583231)
into Distributor values(140,'Rishi','S','Bhat','8765432248','Mulagund naka','Gadag','Karnataka',582102)
into Distributor values(141,'Murali','S','Shetty','9876533249','Station road','Vijayapur','Karnataka',586101)
into Distributor values(142,'Rashi','N','Karjagi','8765432250','Tondadarya nagar','Mundaragi','Karnataka',582100)
into Distributor values(143,'Chandan','Samarth','Katavate','8765432251','Mallikarjun nagar','Betageri','Karnataka',582102)
into Distributor values(144,'Laxmi','Bhuvan','Shetty','9876533252','MK nagar','Betageri','Karnataka',582102)
into Distributor values(145,'Neha','Naresh','Gowda','8765432253','Bajar road','Mundaragi','Karnataka',582100)
into Distributor values(146,'Chandan','Samarth','Katavate','8765432254','Eshwar nagar','Rona','Karnataka',582105)
into Distributor values(147,'Laxmi','Vasuki','Sardar','9876533255','Bus stand road ','Rona','Karnataka',582105)
into Distributor values(148,'Neha','Ananad','Gowdru','8765432256','Bahvani temple road','Gadag','Karnataka',582100)
into Distributor values(149,'Mithun','N','Betageri','8765432257','Bharati nagar','Naragund','Karnataka',582106)
into Distributor values(150,'Ramya','S','Karvar','8765432258','Banashri nagar','Naragund','Karnataka',582106)
into Distributor values(151,'Dasrshan','B','Jataki','9876533259','Patel nagar','Gajendragad','Karnataka',582107)
into Distributor values(152,'Sudeep','N','K','8765432260','Bajar road','Gajendragad','Karnataka',582107)
into Distributor values(153,'Puneet','S','Bhat','8765432261','Nekar nagar','Vijayapur','Karnataka',586101)
into Distributor values(154,'Prajwal','p','Patil','9876533262','Bus stand road','Kalagatagi','Karnataka',580015)
into Distributor values(155,'Param','Pandu','Garag','8765432263','Gokul road','Gadag','Karnataka',582102)
into Distributor values(156,'Mahant','N','B','8765432264','Rajajinagar','Banglore','Karnataka',560064)
into Distributor values(157,'Manish','N','Ballary','8765432265','Electronic city','Banglore','Karnataka',560065)
into Distributor values(158,'Manohar','M','k','8765432266','Madiwala','Banglore','Karnataka',560066)
into Distributor values(159,'Roopa','M','Haveri','8765432267','Basavanagudi','Banglore','Karnataka',560067)
into Distributor values(160,'Manjesh','P','Badri','8765432268','Jayanagar','Banglore','Karnataka',560068)
into Distributor values(161,'Mallika','N','Joshi','8765432269','Rajajinagar','Banglore','Karnataka',560069)
into Distributor values(162,'Murari','Ninad','Gupta','8765432270','KR Market','Banglore','Karnataka',560070)
into Distributor values(163,'Bhargav','L','Marabad','8765432271','JP nagar','Banglore','Karnataka',560071)
into Distributor values(164,'Bhanu','Naman','Goud','8765432272','Lingarag nagar','Banglore','Karnataka',560072)
into Distributor values(165,'Geeta','L','Haravi','8765432273','IT park','Banglore','Karnataka',560073)
into Distributor values(166,'Amogh','Saket','Gupta','8765432274','HSR layout','Banglore','Karnataka',560074)
into Distributor values(167,'Hari','Basuva','Kattimani','8765432275','Kormangala','Banglore','Karnataka',560075)
into Distributor values(168,'Mani','Neeraj','Gupta','8765432276','Nagarabhavi','Banglore','Karnataka',560076)
into Distributor values(169,'Bharat','L','Das','8765432278','Rajarajeshwari nagar','Banglore','Karnataka',560077)
into Distributor values(170,'Shan','K','p','8765432279','Kengeri','Banglore','Karnataka',560078)
into Distributor values(171,'Prakash','L','Marabad','8765432280','Vijaynagar','Banglore','Karnataka',560079)
into Distributor values(172,'Harish','Narahari','Gouda','8765432281','Girinagar','Banglore','Karnataka',560080)
into Distributor values(173,'Raghu','M','Bhat','8765432282','CV Raman nagar ','Banglore','Karnataka',560081)
into Distributor values(174,'Rama','Satish','Ullagaddi','9876534283','Kalyan nagar','Banaglore','Karnataka',560082)
into Distributor values(175,'Netra','Naresh','Raj','9876534284','Padbanabhanagar','Banglore','Karnataka',560083)
into Distributor values(176,'Nadish','Bhuvan','hallimani','9876533285','Kumaraswamy layout','Banglore','Karnataka',560084)
into Distributor values(177,'shilpa','Rishi','Kattimani','8765432286','CBT','Bannerugatta','Karnataka',560085)
into Distributor values(178,'Kalavati','Sharat','Kulkarni','9876533287','Kammanahalli','Banglore','Karnataka',560086)
into Distributor values(179,'Murali','Arush','Rao','8765432288','Mysore road','Banglore','Karnataka',560087)
into Distributor values(180,'Rajesi','Nanjunda','Patil','9876534289','Tumkur road','Banglore','Karnataka',560088)
into Distributor values(181,'Bhargav','K','Banni','9876534290','Somapur','Banglore','Karnataka',560089)
into Distributor values(182,'Kamakshi','S','S','9876533291','Shanti nagar','Banglore','Karnataka',560090)
into Distributor values(183,'Chetan','U','R','8765432292','Chikpet','Banglore','Karnataka',560091)
into Distributor values(184,'Chanakya','R','K','9876533293','CBT','Banglore','Karnataka',560092)
into Distributor values(185,'Vaibhav','H','R','8765432294','Kempe gowda circle','Banglore','Karnataka',560093)
into Distributor values(186,'Kalesh','N','N','9876534295','Kannur','Banglore','Karnataka',560094)
into Distributor values(187,'Gayatri','Sanpat','Kali','9876534296','Ganesh nagar','Davanagere','Karnataka',577002)
into Distributor values(188,'Giri','Satish','Kale','9876533297','CB nagar','Davanagere','Karnataka',577002)
into Distributor values(189,'Rahim','Alladin','Bhanu','8765432298','CBT','Davanagere','Karnataka',577002)
into Distributor values(190,'Umesh','Ramesh','Kulkarni','9876533299','Ishwar nagar','Davanagere','Karnataka',577002)
into Distributor values(191,'Kantesh','H','Rao','8765432300','Shanti nagar','Davanagere','Karnataka',577002)
into Distributor values(192,'Ram','N','Reddy','9876534301','Shreenivas nagar','Davanagere','Karnataka',577002)
into Distributor values(193,'Niraj','U','Hadapad','9876534302','Shivaji nagar','Davanagere','Karnataka',577002)
into Distributor values(194,'Nitya','S','Sharma','9876533303','Ganeshpete','Davanagere','Karnataka',577002)
into Distributor values(195,'Anish','S','Raj','8765432304','CBT','Davanagere','Karnataka',577002)
into Distributor values(196,'Arun','R','Kulkarni','9876533305','Vidya nagar','Davanagere','Karnataka',577002)
into Distributor values(197,'Arjun','Y','Rao','8765432306','Bharati nagar','Davanagere','Karnataka',577002)
into Distributor values(198,'Bheema','N','Nayak','9876534307','Lingaraj nagar','Davanagere','Karnataka',577002)
into Distributor values(199,'Rana','Shankar','Shettar','9876534308','Rani chennamma circle','Harihar','Karnataka',577001)
into Distributor values(200,'Nitin','Aravind','Ullagaddi','9876533309','Vivekanad circle','Harihar','Karnataka',577001)
into Distributor values(201,'Pratap','Prakash','Shettar','8765432310','Basava nagar','Harihar','Karnataka',577001)
into Distributor values(202,'Gorish','Rakesh','Kulkarni','9876533311','Venkatesh nagar','Chennagiri','Karnataka',577003)
into Distributor values(203,'Lakshman','Harish','Kulkarni','8765432312','Brundavan pete','Chennagiri','Karnataka',577003)
into Distributor values(204,'Nitin','Balaji','Rao','9876534313','KR nagar','Chennagiri','Karnataka',577003)
select * from dual;

/* Owner*/
insert all
into Owner values(301,'Vrushab','7540956440','m','Saptapur','Dharwad','Karnataka',580001)
into Owner values(302,'Arun','7540956441','m','Jublie circle','Dharwad','Karnataka',580001)
into Owner values(303,'Vallab','7540956442','m','Shivagiri','Dharwad','Karnataka',580001)
into Owner values(304,'Hari','7540956443','m','Saptapur','Dharwad','Karnataka',580001)
into Owner values(305,'Rana','7540956444','m','Pavate nagar','Dharwad','Karnataka',580001)
into Owner values(306,'Vashista','7540956445','m','Banashri nagar','Dharwad','Karnataka',580001)
into Owner values(307,'Varun','7540956446','m','Kalyan nagar','Dharwad','Karnataka',580001)
into Owner values(308,'Ankita','7540956447','f','Basava nagar','Dharwad','Karnataka',580001)
into Owner values(309,'Soumya','7540956448','f','Vidyagiri','Dharwad','Karnataka',580005)
into Owner values(310,'Anil','7540956449','m','Gandhi nagar','Dharwad','Karnataka',580001)
into Owner values(311,'Buvan','7540956450','m','Vidyanagar','Hubli','Karnataka',580021)
into Owner values(312,'Vijay','7540956451','m','CBT','Hubli','Karnataka',580021)
into Owner values(313,'Hemanth','7540956452','m','APMC','Hubli','Karnataka',580021)
into Owner values(314,'Prabhas','7540956453','m','Gokul road','Hubli','Karnataka',580021)
into Owner values(315,'Ram','7540956454','m','Ganesh nagar','Hubli','Karnataka',580021)
into Owner values(316,'Nitin','7540956455','m','Eshwar nagar','Hubli','Karnataka',580021)
into Owner values(317,'Virat','7540956456','m','Rajajinagar','Banaglore','Karnataka',580069)
into Owner values(318,'Vanita','7540956457','f','Kr market','Banaglore','Karnataka',580070)
into Owner values(319,'Ambika','7540956458','f','JP nagar','Banaglore','Karnataka',580071)
into Owner values(320,'Umesh','7540956459','m','Lingraj nagar','Banaglore','Karnataka',580072)
into Owner values(321,'Chetan','7540956460','m','IT park','Banaglore','Karnataka',580073)
into Owner values(322,'Baghya','7540956461','f','HSR layout','Banaglore','Karnataka',580074)
into Owner values(323,'Arun','7540956462','m','HSR layout','Banglore','Karnataka',580074)
into Owner values(324,'Akshay','7540956463','m','Rajajinagar','Banaglore','Karnataka',580069)
into Owner values(325,'Anu','7540956464','f','Jp nagar','Banaglore','Karnataka',580071)
into Owner values(326,'Bhvya','7540956465','f','Koremangal','Banaglore','Karnataka',580075)
into Owner values(327,'Mahesh','7540956466','m','Nagarabhavi','Banaglore','Karnataka',580076)
into Owner values(328,'Dev','7540956467','m','Rjarajeshwari nagar','Banaglore','Karnataka',580077)
into Owner values(329,'Bhanu','7540956468','f','Kengeri','Banaglore','Karnataka',580078)
into Owner values(330,'Sangeeta','7540956470','f','Koremangal','Banaglore','Karnataka',580075)
into Owner values(331,'Anurag','7540956471','m','Nagarabhavi','Banaglore','Karnataka',580076)
into Owner values(332,'Dev','7540956472','m','Rjarajeshwari nagar','Banaglore','Karnataka',580077)
into Owner values(333,'Barat','7540956473','m','Kengeri','Banaglore','Karnataka',580078)
into Owner values(334,'Manikant','7540956474','m','Vijaynagar','Banaglore','Karnataka',580079)
into Owner values(335,'Chaitra','7540956475','f','Giri nagar','Banaglore','Karnataka',580080)
into Owner values(336,'Kavya','7540956476','f','Raman nagar','Banaglore','Karnataka',580081)
into Owner values(337,'Shruti','7540956477','f','Kalyan nagar','Banaglore','Karnataka',580082)
into Owner values(338,'Rajan','7540956478','m','Sardar patel nagar','Belagum','Karnataka',583231)
into Owner values(339,'Revan','7540956479','m','Vishweshwarayya circle','Belagum','Karnataka',583231)
into Owner values(340,'Barat','7540956480','m','Renuka devi street','Savadatti','Karnataka',580021)
into Owner values(341,'Ganapati','7540956481','m','Basava nagar','Annigeri','Karnataka',580005)
into Owner values(342,'Shruti','7540956482','f','Ganesh nagar','Gadag','Karnataka',582102)
into Owner values(343,'Chitra','7540956483','f','Jp nagar','Banaglore','Karnataka',580071)
into Owner values(344,'Kanasu','7540956484','f','Raman nagar','Banaglore','Karnataka',580081)
into Owner values(345,'Shweta','7540956485','f','Kalyan nagar','Banaglore','Karnataka',580082)
into Owner values(346,'Abhay','7540956486','m','Sardar patel nagar','Belagum','Karnataka',583231)
into Owner values(347,'Anvar','7540956487','m','Vishweshwarayya circle','Belagum','Karnataka',583231)
into Owner values(348,'Shaheed','7540956488','m','Renuka devi street','Savadatti','Karnataka',580021)
into Owner values(349,'Jaheed','7540956489','m','Basava nagar','Annigeri','Karnataka',580005)
into Owner values(350,'Charan','7540956490','f','Ganesh nagar','Gadag','Karnataka',582102)
into Owner values(351,'Aarpita','7540956483','f','Mahant nagar','Betageri','Karnataka',582102)
into Owner values(352,'Kajol','7540956484','f','Mulgund naka','Gadag','Karnataka',582102)
into Owner values(353,'Shrushti','7540956486','f','Pakeerswami nagar','Shirahatti','Karnataka',582102)
into Owner values(354,'Raj','7540956487','m','Tontadarya nagar','Mundaragi','Karnataka',582112)
into Owner values(355,'Ram','7540956488','m','Bajar road','Mundaragi','Karnataka',582112)
into Owner values(356,'Harish','7540956489','m','Chennamma circle','Lakshmeshwar','Karnataka',582103)
into Owner values(357,'Ganapati','7540956490','m','Eshwar nagar','Annigeri','Karnataka',580005)
into Owner values(358,'Satish','7540956491','m','Basava nagar','Gadag','Karnataka',582102)
into Owner values(359,'Sambrama','7540956492','f','Vidya nagar','Davanagere','Karnataka',577002)
into Owner values(360,'Ashok','7540956493','f','Shanti nagar','Davanagere','Karnataka',577002)
into Owner values(361,'Samarth','7540956494','m','Shreenivas nagar','Davanagere','Karnataka',577002)
into Owner values(362,'Avinash','7540956495','m','Shivaji nagar','Davanagere','Karnataka',577002)
into Owner values(363,'Aravind','7540956496','m','Ganeshpet','Davanagere','Karnataka',577002)
into Owner values(364,'Pratap','7540956497','m','Bajar raod','Davanagere','Karnataka',577002)
into Owner values(365,'Sambrama','7540956498','f','Vidya nagar','Davanagere','Karnataka',577002)
into Owner values(366,'Praveen','7540956499','m','Basava nagar','Harihar','Karnataka',577002)
into Owner values(367,'Devraj','7540956500','m','Ganeshpet','Davanagere','Karnataka',577002)
into Owner values(368,'Roja','7540956501','f','KR nagar','Chennagiri','Karnataka',577003)
into Owner values(369,'Prekshit','7540956502','m','Venkatesh nagar','Chennagiri','Karnataka',577003)
into Owner values(370,'Bhanu','7540956503','f','Anjaney nagar','Dandeli','Karnataka',580031)
select * from dual;

/*Employee*/
insert all
into Employees values(501,'Pushpa','Ram','Tulla','01-mar-1994','9672816382','f','01-Aug-2002','Jayanagr','Dharwad','Karnataka',580001,'',7000)
into Employees values(502,'Suma','Talreja','Murlidhar','12-aug-1992','9382916392','f','18-Jun-2011','Renuka devi street','Savadatti','Karnataka',580001,'',8000)
into Employees values(503,'Meenakshi','Kusum','Agrawal','09-apr-1997','9629369173','f','28-Jul-2009','Vidyagiri','Dharwad','Karnataka',580005,'',9500)
into Employees values(504,'Sanjay','Kumar','Parwani','30-dec-1984','9352825137','m','04-May-2016','Rani chennammma circle','Gokak','Karnataka',583231,'',9000)
into Employees values(505,'Ursel','Chetan','Shravani','28-may-1995','9348254813','f','05-Oct-2020','Pavate nagar','Dharwad','Karnataka',580001,'',10000)
into Employees values(506,'Neelam','Jain','Shankar','07-feb-1998','9382797282','f','21-Aug-2020','basava nagar','Annigeri','Karnataka',580005,'',7000)
into Employees values(507,'Neelam','Lal','Taneja','24-jun-1972','9364926384','f','26-Feb-2003','Sai nagar','Hubli','Karnataka',580021,'',8000)
into Employees values(508,'Ramesh','Ramachandra','Shankar','15-jul-1969','9462842748','m','29-Jun-2001','Pakirswami nagar','Shirahatti','Karnataka',582104,'',9000)
into Employees values(509,'Surendar','Kumar','Sanu','22-sep-1995','9936479173','m','17-Aug-2018','shivaji nagar','Belagum','Karnataka',583231,'',10000)
into Employees values(510,'Gulwant','Kaur','Gill','12-mar-1999','9682648263','m','15-Sep-2017','RK nagar','Indi','Karnataka',586102,'',11000)
into Employees values(511,'Parveen','Bala','Dalip','27-oct-1997','9647384922','m','17-Jan-2019','KC park','Dharwad','Karnataka',580001,'',8500)
into Employees values(512,'Arun','Waman','Lele','18-aug-1945','9124345435','m','18-Feb-2000','basava nagar','Annigeri','Karnataka',580005,'',7500)
into Employees values(513,'Abhishek','Anand','Mahalingam','04-apr-1978','9424354676','m','04-Oct-2018','Chennamma circle','Lakshmeshwar','Karnataka',582103,'',9500)
into Employees values(514,'Kumaran','Arora','Tulla','25-dec-1945','9132432566','m','08-Jun-2014','Ganesh nagar','Vijayapura','Karnataka',586101,'',12000)
into Employees values(515,'Raj','Mohan','Late','09-may-1972','9345346566','m','03-Mar-2002','basava nagar','Annigeri','Karnataka',580005,'',11500)
into Employees values(516,'Ajay','Rakeah','Joshi','25-feb-1991','9235345232','m','12-Apr-2017','Mandar nagar','Vijayapur','Karnataka',586101,'',12300)
into Employees values(517,'Ramakrishna','ladda','Mahalay','05-jun-1994','9354363242','m','19-Sep-2009','Mahant nagar','Betageri','Karnataka',582102,'',11000)
into Employees values(518,'Ashish','Aruna','Hedge','23-jul-1994','9534578654','m','17-Oct-2005','Pakirswami nagar','Shirahatti','Karnataka',582104,'',9000)
into Employees values(519,'Mahek','Rajesh','Kohli','03-sep-1992','9243546754','f','22-Nov-2018','basava nagar','Annigeri','Karnataka',580005,'',10000)
into Employees values(520,'Saroja','Ashok','Patil','04-sep-1992','9243546757','f','21-Nov-2018','Saptapur','Dharwad','Karnataka',580001,'',12000)
into Employees values(521,'Aruna','Ashok','J','05-sep-1992','9243546758','f','21-Nov-2018','Shivagiri','Dharwad','Karnataka',580001,'',15000)
into Employees values(522,'Yash','Sampath','M','09-sep-1992','9243546759','m','22-Dec-2018','Pavate nagar','Dharwad','Karnataka',580001,'',15000)
into Employees values(523,'Ram','Chetan','Badri','06-sep-1992','9243546760','m','23-Jan-2018','Nehru nagar','Dharwad','Karnataka',580001,'',13000)
into Employees values(524,'Anjuma','Shaheed','Saheb','07-sep-1992','9243546761','f','24-Feb-2018','CBT','Dharwad','Karnataka',580001,'',13000)
into Employees values(525,'Sandhya','Ajay','Bhat','08-sep-1992','9243546762','f','25-Mar-2018','Vidyagiri','Dharwad','Karnataka',580005,'',20000)
into Employees values(526,'Raghu','Maruti','Rathod','09-sep-1992','9243546763','m','26-April-2018','Shreenagar','Dharwad','Karnataka',580001,'',12500)
into Employees values(527,'Aruna','Ashok','Joshi','10-Oct-1992','9243546764','f','27-May-2018','Ganesh nagar','Dharwad','Karnataka',580001,'',11800)
into Employees values(528,'Aniket','Basavaraj','Gadagin','11-Nov-1992','9243546765','m','28-Jun-2018','Shivagiri','Dharwad','Karnataka',580001,'',12000)
into Employees values(529,'Sandhya','Ajay','Bhat','12-Nov-1992','9243546766','f','21-July-2018','Pavate nagar','Dharwad','Karnataka',580001,'',13000)
into Employees values(530,'Bheema','Ramji','Ambedkar','13-Nov-1992','9243546767','m','29-Aug-2018','Sai nagar','Dharwad','Karnataka',580001,'',19000)
into Employees values(531,'Aniket','Basavaraj','G','14-sep-1990','9243546768','m','01-Oct-2016','Mandar nagar','Vijayapur','Karnataka',586101,'',15000)
into Employees values(532,'Manju','Manish','Rathod','15-Jan-1991','9243546769','m','01-nov-2017','Gandhi Bajar','Gadag','Karnataka',582102,'',13200)
into Employees values(533,'Nitin','D','Revankar','16-Dec-1992','9243546770','m','02-Dec-2018','Patel nagar','Gajendragad','Karnataka',582107,'',13300)
into Employees values(534,'Amogh','Mallesh','Patnakar','17-Nov-1993','9243546771','m','23-Jan-2019','Madiwala','Banglore','Karnataka',560066,'',13700)
into Employees values(535,'Rani','Mallesh','Rathod','17-Oct-1992','9243546772','f','24-Feb-2020','Kannur','Banglore','Karnataka',560094,'',12300)
into Employees values(536,'Nalini','Basava','Bhat','18-sep-1993','9243546773','f','25-Mar-2020','Nekar nagar','Vijayapur','Karnataka',586101,'',11000)
into Employees values(537,'Anvar','Jaaheed','Rathod','19-sep-1992','9243546774','m','26-Apr-2018','Eshwar nagar','Rona','Karnataka',582105,'',6000)
into Employees values(538,'Ravi','S','Joshi','20-Oct-1993','9243546775','m','27-May-2017','Banashri nagar','Naragund','Karnataka',582106,'',7000)
into Employees values(539,'Nitya','B','Shettar','21-Nov-1992','9243546776','f','28-Jun-2016','Bahvani temple road','Gadag','Karnataka',582100,'',8000)
into Employees values(540,'Danush','M','Karvar','22-Nov-1993','924354677','m','21-Jul-2014','Bharati nagar','Naragund','Karnataka',582106,'',9000) 
into Employees values(541,'Bheemarav','Ramji','Ambedkar','24-Nov-1993','9243546778','m','29-Aug-2018','Bus stand road ','Rona','Karnataka',582105,'',10000)
into Employees values(542,'Geeta','P','H','03-Jan-1990','9243546779','f','01-Dec-2017','KR nagar','Chennagiri','Karnataka',577003,'',11000)
into Employees values(543,'Manohar','M','Kappatnavr','16-Dec-1991','9243546780','m','02-Dec-2018','Patel nagar','Gajendragad','Karnataka',582107,'',12000)
into Employees values(544,'Sudeep','Narayan','Katavate','17-Nov-1992','9243546781','m','23-Jan-2019','Bajar raod','Davanagere','Karnataka',577002,'',13000)
into Employees values(545,'Mandara','N','Ballary','17-Oct-1993','9243546782','f','24-Feb-2020','Ganesh nagar','Davanagere','Karnataka',577002,'',14000)
into Employees values(546,'Mithun','N','Banad','18-sep-1994','9243546783','m','25-Mar-2020','Ishwar nagar','Davanagere','Karnataka',577002,'',15000)
into Employees values(547,'Neha','Ananad','Gadag','19-sep-1995','9243546784','f','26-Apr-2020','Tontadarya nagar','Mundaragi','Karnataka',582112,'',15000)
into Employees values(548,'Lavanya','V','Sardar','20-Oct-1996','9243546785','f','27-May-2020','Shanti nagar','Davanagere','Karnataka',577002,'',16000)
into Employees values(549,'Laxmi','Vasuki','Sardar','21-Nov-1997','9243546786','f','28-Jun-2020','Ganesh nagar','Davanagere','Karnataka',577002,'',17000)
into Employees values(550,'Vaibhav','Harish','R','22-Nov-1999','924354687','m','21-Jul-2021','Basavanagudi','Banglore','Karnataka',560067,'',18000)
into Employees values(551,'Nalini','N','Karjagi','24-Nov-1998','9243546788','f','29-Aug-2021','Vidya nagar','Davanagere','Karnataka',577002,'',19000)
into Employees values(552,'Pushpalata','Ramesh','Tulla','01-apr-1994','9672816389','f','11-Aug-2002','Jayanagr','Dharwad','Karnataka',580001,'',13000)
into Employees values(553,'Sumalata','Tanmay','Murlidhar','22-aug-1992','9382916390','f','12-Jun-2011','Renuka devi street','Savadatti','Karnataka',580001,'',20000)
into Employees values(554,'Meena','Kumar','Agrawal','19-apr-1997','9629369191','f','28-Jan-2009','Vidyagiri','Dharwad','Karnataka',580005,'',12000)
into Employees values(555,'Sandeep','Kumar','Parwani','10-dec-1984','9352825192','m','05-May-2016','Rani chennammma circle','Gokak','Karnataka',583231,'',13500)
into Employees values(556,'Umesh','Chetan','Sharvani','25-may-1995','9348254893','f','15-Oct-2020','Pavate nagar','Dharwad','Karnataka',580001,'',18000)
into Employees values(557,'Neela','Shankar','Jain','17-feb-1998','9382797294','f','21-Aug-2020','basava nagar','Annigeri','Karnataka',580005,'',9000)
into Employees values(558,'Neelambari','Lal','Taneja','25-jun-1972','9364926395','f','26-Feb-2003','Jublie circle','Hubli','Karnataka',580021,'',10500)
into Employees values(559,'Bheem','Ramachandra','Shankar','25-jul-1969','9462842796','m','29-Jun-2001','Pakirswami nagar','Shirahatti','Karnataka',582104,'',7500)
into Employees values(560,'Sundar','Kumar','Sanu','24-sep-1995','9936479197','m','17-Aug-2018','shivaji nagar','Belagum','Karnataka',583231,'',8000)
into Employees values(561,'Goutam','Kaur','Gill','10-mar-1999','9682648298','m','15-Sep-2017','RK nagar','Indi','Karnataka',586102,'',10000)
into Employees values(562,'Pradeep','Bala','Dalip','28-oct-1997','9647384999','m','18-Jan-2019','KC park','Dharwad','Karnataka',580001,'',11000)
into Employees values(563,'Tarun','Aman','Lele','18-aug-1945','9124345435','m','28-Feb-2000','basava nagar','Annigeri','Karnataka',580005,'',17000)
into Employees values(564,'Abhinav','Anand','Mahalingam','24-apr-1978','9424354612','m','05-Oct-2018','Chennamma circle','Lakshmeshwar','Karnataka',582103,'',17000)
into Employees values(565,'Kumar','Jagadish','Tulla','10-dec-1945','9132432513','m','28-Jun-2014','Ganesh nagar','Vijayapura','Karnataka',586101,'',17000)
into Employees values(566,'Rajendra','Mohan','Late','19-may-1972','9345346514','m','13-Mar-2002','basava nagar','Annigeri','Karnataka',580005,'',16000)
into Employees values(567,'Vijay','Rakeah','Joshi','23-feb-1991','9235345215','m','22-Apr-2017','Mandar nagar','Vijayapur','Karnataka',586101,'',14000)
into Employees values(568,'Santosh','Raman','Mahalay','15-jun-1994','9354363216','m','29-Sep-2009','Mahant nagar','Betageri','Karnataka',582102,'',13000)
into Employees values(569,'Guru','Raj','Hedge','13-jul-1994','9534578617','m','27-Oct-2005','Pakirswami nagar','Shirahatti','Karnataka',582104,'',12000)
into Employees values(570,'Mohita','Rajesh','Kohli','13-sep-1992','9243546718','f','23-Nov-2018','basava nagar','Annigeri','Karnataka',580005,'',10000)
into Employees values(571,'Sandya','Ramesh','Patil','14-sep-1992','92435467519','f','22-Nov-2018','Saptapur','Dharwad','Karnataka',580001,'',11000)
into Employees values(572,'Tanvi','Ashok','J','15-sep-1992','9243546720','f','01-Nov-2018','Shivagiri','Dharwad','Karnataka',580001,'',13500)
into Employees values(573,'Yashavant','Sampath','M','19-sep-1992','9243546721','m','02-Dec-2018','Pavate nagar','Dharwad','Karnataka',580001,'',12500)
into Employees values(574,'Raguram','Naveen','Badri','16-sep-1992','9243546722','m','13-Jan-2018','Nehru nagar','Dharwad','Karnataka',580001,'',14500)
into Employees values(575,'Avani','Shaheed','Saheb','17-sep-1992','9243546723','f','15-Feb-2018','CBT','Dharwad','Karnataka',580001,'',11000)
into Employees values(576,'Shradda','Arun','Bhat','18-sep-1992','9243546724','f','15-Mar-2018','Vidyagiri','Dharwad','Karnataka',580005,'',9000)
into Employees values(577,'Akshata','Murti','Rathod','19-sep-1992','9243546725','f','28-April-2018','Shreenagar','Dharwad','Karnataka',580001,'',8000)
into Employees values(578,'Brunda','Tarun','Joshi','11-Oct-1992','9243546726','f','17-May-2018','Ganesh nagar','Dharwad','Karnataka',580001,'',7000)
into Employees values(579,'Varun','Basavaraj','Gadagin','11-Nov-1992','9243546727','m','28-Jun-2018','Shivagiri','Dharwad','Karnataka',580001,'',7000)
into Employees values(580,'Vanaja','Vijay','Bhat','02-Nov-1992','9243546728','f','20-July-2018','Pavate nagar','Dharwad','Karnataka',580001,'',7500)
into Employees values(581,'Ram','Somashekar','Ambedkar','13-Nov-1992','9243546729','m','19-Aug-2018','Sai nagar','Dharwad','Karnataka',580001,'',8000)
into Employees values(582,'Deepika','Mahesh','Gouda','24-sep-1990','9243546730','f','21-Oct-2016','Mandar nagar','Vijayapur','Karnataka',586101,'',8500)
into Employees values(583,'Kartik','Ramachandra','Rathod','05-Jan-1991','9243546731','m','11-nov-2017','Gandhi Bajar','Gadag','Karnataka',582102,'',8000)
into Employees values(584,'Nitish','Damodar','Revankar','26-Dec-1992','9243546732','m','02-Dec-2018','Patel nagar','Gajendragad','Karnataka',582107,'',7500)
into Employees values(585,'Amar','Mallikarjun','Patnakar','27-Nov-1993','9243546733','m','13-Jan-2019','Madiwala','Banglore','Karnataka',560066,'',8000)
into Employees values(586,'Rani','Mallesh','Rathod','27-Oct-1992','9243546734','f','14-Feb-2020','Kannur','Banglore','Karnataka',560094,'',9000)
into Employees values(587,'Neela','Basava','Shettar','28-sep-1993','9243546735','f','15-Mar-2020','Nekar nagar','Vijayapur','Karnataka',586101,'',8000)
into Employees values(588,'Sameer','Jaaheed','Rathod','19-sep-1992','9243546736','m','16-Apr-2018','Eshwar nagar','Rona','Karnataka',582105,'',9000)
into Employees values(589,'Ravindra','S','Joshi','21-Oct-1993','9243546737','m','27-May-2017','Banashri nagar','Naragund','Karnataka',582106,'',8500)
into Employees values(590,'Satya','Kartik','Shettar','22-Nov-1992','9243546738','f','18-Jun-2016','Bahvani temple road','Gadag','Karnataka',582100,'',9000)
into Employees values(591,'Druv','Mohit','Karvar','12-Nov-1993','924354639','m','01-Jul-2014','Bharati nagar','Naragund','Karnataka',582106,'',8000)
into Employees values(592,'Druvant','Ram','Ambedkar','04-Nov-1993','9243546740','m','09-Aug-2018','Bus stand road ','Rona','Karnataka',582105,'',7000)
into Employees values(593,'Geeta','Vijay','H','13-Jan-1990','9243546741','f','11-Dec-2017','KR nagar','Chennagiri','Karnataka',577003,'',9000)
into Employees values(594,'Manohar','Prashant','Kappatnavr','11-Dec-1991','9243546742','m','02-Dec-2018','Patel nagar','Gajendragad','Karnataka',582107,'',8000)
into Employees values(595,'Prasanna','Arjun','Katavate','14-Nov-1992','9243546743','m','23-Jan-2019','Bajar raod','Davanagere','Karnataka',577002,'',9000)
into Employees values(596,'Mayuri','N','Ballary','17-Oct-1993','9243546744','f','04-Feb-2020','Ganesh nagar','Davanagere','Karnataka',577002,'',7000)
into Employees values(597,'Mohit','V','Banad','08-sep-1994','9243546745','m','05-Mar-2020','Ishwar nagar','Davanagere','Karnataka',577002,'',9500)
into Employees values(598,'Nalini','Ananad','Gouda','09-sep-1995','9243546746','f','06-Apr-2020','Tontadarya nagar','Mundaragi','Karnataka',582112,'',8500)
into Employees values(599,'Leela','V','Naik','30-Oct-1996','9243546747','f','07-May-2020','Shanti nagar','Davanagere','Karnataka',577002,'',9500)
into Employees values(600,'Bharat','Harish','Shettar','12-Nov-1999','924354687','m','20-Jul-2021','Basavanagudi','Banglore','Karnataka',560067,'',10000)
select *from dual;


/*Customer*/
insert all 
into Customers values(601,'Ratna','Mahesh','Byadagi','f','02-Jan-1994','#81A','Saptapur','Dharwad','Karnataka',580001,6754321090)
into Customers values(602,'Ravi','Ashok','Patil','m','11-Mar-1996','#83A','Pavate nagar','Dharwad','Karnataka',580001,6754321091)
into Customers values(603,'Bhargav','Param','Badiger','m','21-Feb-1997','#82A','Nehru nagar','Dharwad','Karnataka',580001,6754321092)
into Customers values(604,'Hari','Anand','Banad','m','31-Jan-1998','#89A','Banashree nagar','Dharwad','Karnataka',580001,6754321093)
into Customers values(605,'Bhanu','Mallesh','Bellary','f','11-Feb-1999','#91A','Shivagiri','Dharwad','Karnataka',580001,6754321094)
into Customers values(606,'Kalyani','Kallesh','Ullagaddi','f','17-Dec-1994','#911A','Shrinagar','Dharwad','Karnataka',580001,6754321095)
into Customers values(607,'Vineet','Mahesh','Byadagi','m','21-Apr-1993','#100A','Shreenagar','Dharwad','Karnataka',580001,6754321096)
into Customers values(608,'Raj','Ashok','Patil','m','01-May-1997','#99A','Klyan nagar','Dharwad','Karnataka',580001,6754321097)
into Customers values(609,'Bhargav','Param','Banad','m','01-Feb-1994','#97A','Basava nagar','Dharwad','Karnataka',580001,6754321098)
into Customers values(610,'Harish','Anand','Patil','m','11-Nov-1995','#95A','Banashree nagar','Dharwad','Karnataka',580001,6754321099)
into Customers values(611,'Anupama','Mallesh','Badiger','f','12-May-1996','#101A','Shivalaya','Dharwad','Karnataka',580001,6754321100)
into Customers values(612,'Niranjan','Kallesh','Deshpande','m','13-Dec-1997','#102A','Shivaji nagarr','Dharwad','Karnataka',580001,6754321101)
into Customers values(613,'Geeta','P','Haravi','f','03-Jan-1994','#71A','Bus stand road ','Rona','Karnataka',582105,6754321102)
into Customers values(614,'Ravi','Ashok','Patil','m','12-Mar-1980','#73A','Bahvani temple road','Gadag','Karnataka',582100,6754321103)
into Customers values(615,'Manohar','M','H','m','23-Feb-1987','#72A','Bharati nagar','Naragund','Karnataka',582106,6754321104)
into Customers values(616,'Manish','N','Ballary','m','30-Jan-1988','#79A','Banashri nagar','Naragund','Karnataka',582106,6754321105)
into Customers values(617,'Laxmi','Vasuki','Sardar','f','21-Feb-1989','#61A','Eshwar nagar','Rona','Karnataka',582105,6754321106)
into Customers values(618,'Ramya','S','Karvar','f','07-Dec-1984','#74A','Bajar road','Gajendragad','Karnataka',582107,6754321107)
into Customers values(619,'Roopa','M','Haveri','f','21-Apr-1983','#75A','Nekar nagar','Vijayapur','Karnataka',586101,6754321108)
into Customers values(620,'Prajwal','K','Patil','m','11-May-1987','#76A','Patel nagar','Gajendragad','Karnataka',582107,6754321109)
into Customers values(621,'Sudeep','Narayan','K','m','17-Feb-1984','#77A','Gokul road','Gadag','Karnataka',582102,6754321110)
into Customers values(622,'Dasrshan','K','Jataki','m','18-Nov-1985','#75A','Basavanagudi','Banglore','Karnataka',560067,6754321081)
into Customers values(623,'Neha','Ananad','Gadag','f','19-May-1986','#70A','Madiwala','Banglore','Karnataka',560066,6754321082)
into Customers values(624,'Mithun','N','Banad','m','23-Dec-1987','#80A','Patel nagar','Gajendragad','Karnataka',582107,6754321083)
into Customers values(625,'Geeta','P','Haravi','f','04-Jan-1990','#61A','Gokul road','Gadag','Karnataka',582102,6754321084)
into Customers values(626,'Ravi','Ashok','Patil','m','13-Mar-1978','#63A','Electronic city','Banglore','Karnataka',560065,6754321085)
into Customers values(627,'Manohar','M','H','m','24-Feb-1987','#62A','Rajajinagar','Banglore','Karnataka',560064,6754321086)
into Customers values(628,'Mandara','N','Ballary','f','28-Jan-1988','#64','CBT','Banglore','Karnataka',560092,6754321087)
into Customers values(629,'Lavanya','V','Sardar','f','27-Feb-1999','#569','Shreenivas nagar','Davanagere','Karnataka',577002,6754321088)
into Customers values(630,'Ragini','P','Karvar','f','17-Dec-1994','#65','Kannur','Banglore','Karnataka',560094,6754321089)
into Customers values(631,'Ravi','Ashok','Reddy','m','22-Apr-1993','#67','Ganesh nagar','Davanagere','Karnataka',577002,6754321001)
into Customers values(632,'Prajwal','K','Patil','m','12-May-1967','#788A','Kempe gowda circle','Banglore','Karnataka',560093,6754321002)
into Customers values(633,'Sudeep','Narayan','K','m','13-Feb-1978','#797A','Madiwala','Banglore','Karnataka',560066,6754321091)
into Customers values(634,'Dasrshan','K','Jataki','m','14-Nov-1977','#790A','Bus stand road','Kalagatagi','Karnataka',580015,6754321003)
into Customers values(635,'Neha','N','Gadag','f','15-May-1986','#793A','Basavanagudi','Banglore','Karnataka',560067,6754321004)
into Customers values(636,'Geeta','Hanuma','Haravi','f','16-Dec-1989','#887A','Jayanagar','Banglore','Karnataka',560068,6754321005)
into Customers values(637,'Vaibhav','Harish','R','m','23-Mar-1967','#780A','Kannur','Banglore','Karnataka',560094,6754321006)
into Customers values(638,'Rana','Shankar','Shettar','m','13-Feb-1978','#797A','Ganesh nagar','Davanagere','Karnataka',577002,6754321007)
into Customers values(639,'Nikita','N','Gadag','f','14-Nov-1977','#780A','Bus stand road','Kalagatagi','Karnataka',580015,6754321008)
into Customers values(640,'Rahim','Shaheeed','Bhanu','m','15-Jul-2000','#793B','CB nagar','Davanagere','Karnataka',577002,6754321009)
into Customers values(641,'Umesh','Rakesk','Kinnal','m','16-Jul-2000','#887B','CBT','Davanagere','Karnataka',577002,6754321010)
into Customers values(642,'Sudeep','Sarathi','K','m','15-Feb-1979','#797B','Bharati nagar','Davanagere','Karnataka',577002,6754321011)
into Customers values(643,'Dasrshan','Krishna','Jataki','m','16-Nov-1979','#790B','Ishwar nagar','Davanagere','Karnataka',577002,6754321012)
into Customers values(644,'Neha','N','Kakkar','f','17-May-1989','#777B','Vidya nagar','Davanagere','Karnataka',577002,6754321013)
into Customers values(645,'Shreya','Hanuma','Goshal','f','17-Dec-1999','#897B','Shanti nagar','Davanagere','Karnataka',577002,6754321014)
into Customers values(646,'Varun','Harish','Ratnakar','m','28-Mar-1988','#780B','Lingaraj nagar','Davanagere','Karnataka',577002,6754321015)
into Customers values(647,'Vivek','Harish','M','m','26-Mar-1967','#780C','CBT','Vijayapura','Karnataka',586101,6754321016)
into Customers values(648,'Rana','Shankar','P','m','19-Feb-1978','#797C','Sai nagar','Vijayapur','Karnataka',586101,6754321017)
into Customers values(649,'Nalini','N','K','f','15-Nov-1977','#780C','Sardar Patel circle','Belagum','Karnataka',583231,6754321018)
into Customers values(650,'Akbar','S','B','m','16-Jul-2000','#793C','Pakeerswami nagar','Shirahatti','Karnataka',582102,6754321019)
into Customers values(651,'Umesh','Rakesk','Kinnal','m','17-Jul-2000','#887C','Tontadarya nagar','Mundaragi','Karnataka',582112,6754321020)
into Customers values(652,'Sudeep','Sarathi','K','m','18-Feb-1979','#797C','CBT','Banglore','Karnataka',560092,6754321021)
into Customers values(653,'Dasrshan','Krishna','Jataki','m','19-Nov-1979','#790C','Basava nagar','Harihar','Karnataka',577002,6754321022)
into Customers values(654,'Nanda','N','Kakkar','f','18-May-1989','#777C','basava nagar','Annigeri','Karnataka',580005,6754321023)
into Customers values(655,'Shreyas','Hanuma','Goshal','m','18-Dec-1999','#897C','basava nagar','Annigeri','Karnataka',580005,6754321024)
into Customers values(656,'Vadiraj','Harish','R','m','29-Mar-1988','#780C','shivaji nagar','Annigeri','Karnataka',580005,6754321025)
into Customers values(657,'Anthony','S','B','m','16-Jul-2001','#793D','Shanti nagar','Davanagere','Karnataka',577002,6754321026)
into Customers values(658,'Hanuman','Rakesk','Kinnal','m','17-Jan-2000','#887D','Bajar raod','Davanagere','Karnataka',577002,6754321027)
into Customers values(659,'Sandeep','Sarathi','K','m','18-Mar-1979','#797D','KR nagar','Chennagiri','Karnataka',577003,6754321028)
into Customers values(660,'Dasrshan','Krishna','Raval','m','19-Apr-1979','#790D','Gavi nagar','Vijayapur','Karnataka',586101,6754321029)
into Customers values(661,'Padma','N','Kakkar','f','30-May-1989','#777D','Chennamma circle','Lakshmeshwar','Karnataka',582103,6754321030)
into Customers values(662,'Shashi','Hanuma','tarur','f','18-Jun-1999','#897D','Sardar Patel circle','Belagum','Karnataka',583231,6754321031)
into Customers values(663,'Varada','Harish','R','m','29-Jul-1988','#780D','Mandar nagar','Vijayapur','Karnataka',586101,6754321032)
into Customers values(664,'Nisha','N','Kakkar','f','18-Aug-1989','#777D','Venkatesh nagar','Chennagiri','Karnataka',577003,6754321033)
into Customers values(665,'Sahas','Hanuma','Goshal','m','18-Sep-1999','#897D','Shanti nagar','Davanagere','Karnataka',577002,6754321034)
into Customers values(666,'Walter','Harish','R','m','29-Oct-1988','#780D','KR nagar','Chennagiri','Karnataka',577003,6754321035)
into Customers values(667,'Nandini','N','Kakkar','f','18-Nov-1989','#777D','Basava nagar','Gadag','Karnataka',582102,6754321036)
into Customers values(668,'Shambu','Hanuma','Goshal','m','22-Dec-1999','#897D','Eshwar nagar','Annigeri','Karnataka',580005,6754321037)
into Customers values(669,'Bhaskar','Harish','R','m','22-Mar-1988','#780D','Chennamma circle','Lakshmeshwar','Karnataka',582103,6754321038)
into Customers values(670,'Raj','Harish','R','m','20-Mar-1988','#780D','Bajar road','Mundaragi','Karnataka',582112,6754321039)
into Customers values(671,'Raj','Harish','R','m','27-Mar-2000','#780E','Gandhi nagar','Gadag','Karnataka',582102,6754321040)
into Customers values(672,'Anu','S','B','f','16-Jul-2002','#793E','Sai nagar','Hubli','Karnataka',580021,6754321041)
into Customers values(673,'Maruti','Rakesk','Kinnal','m','17-Jan-1970','#887E','Sardar Patel circle','Belagum','Karnataka',583231,6754321042)
into Customers values(674,'Sahas','Sarathi','K','m','18-Mar-1978','#797E','basava nagar','Annigeri','Karnataka',580005,6754321043)
into Customers values(675,'Deep','Krishna','Raval','m','19-Apr-1976','#790E','CBT','Hubli','Karnataka',580021,6754321044)
into Customers values(676,'Param','N','Kakkar','m','30-May-1985','#777E','Shivaji nagar','Davanagere','Karnataka',577002,6754321045)
into Customers values(677,'Sharada','Harish','T','f','18-Jun-1994','#897E','Gokul road','Hubli','Karnataka',580021,6754321046)
into Customers values(678,'Varada','Harish','R','m','29-Jul-1987','#780E','Anjaney nagar','Dandeli','Karnataka',580031,6754321047)
into Customers values(679,'Rashmika','S','Mandanna','f','18-Aug-1983','#777E','Shivagiri','Dharwad','Karnataka',580001,6754321048)
into Customers values(680,'Sahas','Hanuma','Goshal','m','18-Sep-1992','#897E','Gokul road','Hubli','Karnataka',580021,6754321049)
into Customers values(681,'Rohit','Harish','R','m','29-Oct-1981','#780E','APMC','Hubli','Karnataka',580021,6754321050)
into Customers values(682,'Anushka','N','Kakkar','f','18-Nov-1979','#777E','Eshwar nagar','Hubli','Karnataka',580021,6754321051)
into Customers values(683,'Virat','Hanuma','Goshal','m','22-Dec-1969','#897E','Ganesh nagar','Hubli','Karnataka',580021,6754321052)
into Customers values(684,'Akshay','Harish','Roy','m','22-Mar-1988','#75E','CBT','Hubli','Karnataka',580021,6754321053)
into Customers values(685,'Varun','Harish','Raj','m','20-Mar-1998','#991E','Vidyanagar','Hubli','Karnataka',580021,6754321054)
into Customers values(686,'Das','Krishna','Raval','m','19-May-1976','#790F','Sai nagar','Hubli','Karnataka',580021,6754321055)
into Customers values(687,'Pandu','N','Kakkar','m','30-Jun-1985','#777F','Durga nagar','Hubli','Karnataka',580021,6754321056)
into Customers values(688,'Vidya','Harish','T','f','18-July-1994','#897F','Radhakrisha nagar','Belagum','Karnataka',583231,6754321057)
into Customers values(689,'Samarth','Harish','R','m','29-Aug-1987','#780F','Ganesh nagar','Vijayapura','Karnataka',586101,6754321058)
into Customers values(690,'Ashika','S','Mandanna','f','18-Sep-1983','#777F','Mandar nagar','Vijayapur','Karnataka',586101,6754321059)
into Customers values(691,'Santosh','Laluprasad','Goshal','m','18-Oct-1992','#770F','Pakirswami nagar','Shirahatti','Karnataka',582104,6754321060)
into Customers values(692,'Siddu','Harish','R','m','29-Nov-1981','#780F','Maruti circle','Vijayapura','Karnataka',586101,6754321061)
into Customers values(693,'Bhaskar','N','Kakkar','m','18-Dec-1979','#777F','Kalyan nangar','Sindagi','Karnataka',586102,6754321062)
into Customers values(694,'Vallabh','Hanuma','Goshal','m','22-Jan-1969','#897F','Parvati nagar','Vijaypur','Karnataka',586101,6754321063)
into Customers values(695,'Akash','Harish','Roy','m','22-Jul-1988','#780F','RK nagar','Indi','Karnataka',586102,6754321064)
into Customers values(696,'Upendra','Harish','Raj','m','20-Jun-1998','#780F','CBT','Vijayapur','Karnataka',586101,6754321065)
into Customers values(697,'Surya','N','Kakkar','m','18-Nov-1979','#777F','Chennamma circle','Lakshmeshwar','Karnataka',582103,6754321066)
into Customers values(698,'Vibha','Hanuma','Goshal','f','22-Oct-1969','#897F','Vishwesahwarayya circle','Belagum','Karnataka',583231,6754321067)
into Customers values(699,'Appu','Harish','Raj','m','22-Oct-1988','#780F','APMC','Hubli','Karnataka',580001,6754321068)
into Customers values(700,'Upendra','Hari','Roy','m','20-Oct-1998','#780F','Anjaney nagar','Dandeli','Karnataka',580031,6754321069)
select * from dual;

/*SHOP  */
insert all
into Shop values(401,'Blossom flower Bouquet shop','Saptapur','Dharwad','Karnataka',580001,301,501)
into Shop values(402,'Ajay Bouquet shop','Jublie circle','Dharwad','Karnataka',580001,301,502)
into Shop values(403,'Sona Bouquet shop','Vidyagiri','Dharwad','Karnataka',580005,301,503)
into Shop values(404,'Aniket Bouquet shop','Pavate nagar','Dharwad','Karnataka',580001,302,504)
into Shop values(405,'Jasmine Bouquet shop','CBT','Dharwad','Karnataka',580001,303,505)
into Shop values(406,'Blossom Bouquet shop','Neharu nagar','Dharwad','Karnataka',580001,305,506)
into Shop values(407,'Flower Hut Bouquet shop','Shivagiri','Dharwad','Karnataka',580001,307,507)
into Shop values(408,'Flower studio Bouquet shop','Banashree','Dharwad','Karnataka',580001,304,508)
into Shop values(409,'Rainbow Bouquet shop','Gandhi nagar','Dharwad','Karnataka',580001,310,509)
into Shop values(410,'Flower city Bouquet shop','Basava','Dharwad','Karnataka',580001,310,510)
into Shop values(411,'Fashion Flower Bouquet shop','Vidyanagar','Hubli','Karnataka',580021,306,511)
into Shop values(412,'Ganesh Bouquet shop','CBT','Hubli','Karnataka',580021,307,512)
into Shop values(413,'Suman Bouquet shop','Ganesh nagar','Hubli','Karnataka',580021,308,513)
into Shop values(414,'Harish Bouquet shop','Eshwar nagar','Hubli','Karnataka',580021,308,514)
into Shop values(415,'Kala Bouquet shop','APMC','Hubli','Karnataka',580021,309,515)
into Shop values(416,'Flower world Bouquet shop','Gokul road','Hubli','Karnataka',580021,310,516)
into Shop values(417,'Harish Bouquet shop','Shivagiri','Dharwad','Karnataka',580001,311,517)
into Shop values(418,'Nayan Bouquet shop','Anjaney nagar','Dandeli','Karnataka',580031,312,518)
into Shop values(419,'Street Bouquet shop','Venkatesh nagar','Chennagiri','Karnataka',577003,317,519)
into Shop values(420,'Beautiful Bouquet shop','KR nagar','Chennagiri','Karnataka',577003,318,520)
into Shop values(421,'Gaja Bouquet shop','Ganeshpet','Davanagere','Karnataka',577002,316,521)
into Shop values(422,'Garden fresh Bouquet shop','Shivaji nagar','Davanagere','Karnataka',577002,315,522)
into Shop values(423,'Laxmi Bouquet shop','Bajar raod','Davanagere','Karnataka',577002,314,523)
into Shop values(424,'Nayak Bouquet shop','Shanti nagar','Davanagere','Karnataka',577002,320,524)
into Shop values(425,'Das Bouquet shop','Vidya nagar','Davanagere','Karnataka',577002,321,525)
into Shop values(426,'Rao Bouquet shop','Eshwar nagar','Annigeri','Karnataka',580005,331,528)
into Shop values(427,'Flower bank Bouquet shop','Tontadarya nagar','Mundaragi','Karnataka',582112,341,529)
into Shop values(428,'Anu Bouquet shop','Mulgund naka','Gadag','Karnataka',582102,351,530)
into Shop values(429,'Abhi Bouquet shop','Mulgund naka','Gadag','Karnataka',582102,313,531)
into Shop values(430,'Radha Bouquet shop','Rajajinagar','Banaglore','Karnataka',580069,321,532)
into Shop values(431,'Basava Bouquet shop','Kr market','Banaglore','Karnataka',580070,322,533)
into Shop values(432,'Banjara Bouquet shop','HSR layout','Banglore','Karnataka',580074,323,534)
into Shop values(433,'Colourful Bouquet shop','Mahant nagar','Betageri','Karnataka',582102,324,543)
into Shop values(434,'Prism Bouquet shop','Shreenivas nagar','Davanagere','Karnataka',577002,325,535)
into Shop values(435,'Rathod Bouquet shop','HSR layout','Banglore','Karnataka',580074,326,537)
into Shop values(436,'Kannan Bouquet shop','Sardar patel nagar','Belagum','Karnataka',583231,327,536)
into Shop values(437,'Pavan Bouquet shop','Kalyan nagar','Banaglore','Karnataka',580082,329,538)
into Shop values(438,'Sunrise Bouquet shop','Vishweshwarayya circle','Belagum','Karnataka',583221,332,539)
into Shop values(439,'Sunshine Bouquet shop','Koremangal','Banaglore','Karnataka',580075,331,540)
into Shop values(440,'Pallavi Bouquet shop','Chennamma circle','Lakshmeshwar','Karnataka',582103,337,541)
into Shop values(441,'Shan Bouquet shop','Raman nagar','Banaglore','Karnataka',580081,331,542)
into Shop values(442,'Khan Bouquet shop','Pakeerswami nagar','Shirahatti','Karnataka',582102,332,527)
into Shop values(443,'Bharat Bouquet shop','Rjarajeshwari nagar','Banaglore','Karnataka',580077,333,526)
into Shop values(444,'Nehru Bouquet shop','Somapur','Banglore','Karnataka',560089,330,544)
into Shop values(445,'Kalam Bouquet shop','Bus stand road ','Rona','Karnataka',582105,330,546)
into Shop values(446,'Rama Bouquet shop','Mallikarjun nagar','Betageri','Karnataka',582102,336,547)
into Shop values(447,'Soumyashree Bouquet shop','Chennamma circle','Lakshmeshwar','Karnataka',582103,337,545)
into Shop values(448,'Shree Bouquet shop','Mandar nagar','Vijayapur','Karnataka',586101,338,551)
into Shop values(449,'Devi Bouquet shop','Parvati nagar','Vijaypur','Karnataka',586101,339,552)
into Shop values(450,'Mahaveer Bouquet shop','Maruti circle','Vijayapura','Karnataka',586101,344,548)
into Shop values(451,'Majili Bouquet shop','CBT','Vijayapura','Karnataka',586101,342,550)
into Shop values(452,'Ajanta Bouquet shop','Sai nagar','Vijayapur','Karnataka',586101,342,549)
into Shop values(453,'Colourful Bouquet shop','Sardar Patel circle','Belagum','Karnataka',583231,317,554)
into Shop values(454,'Colourful Bouquet shop','basava nagar','Annigeri','Karnataka',580005,317,557)
into Shop values(455,'Dharma Bouquet shop','CB nagar','Davanagere','Karnataka',577002,319,555)
into Shop values(456,'Veena Bouquet shop','Ishwar nagar','Davanagere','Karnataka',577002,320,556)
into Shop values(457,'Hari bank Bouquet shop','Rani chennammma circle','Gokak','Karnataka',583231,321,558)
into Shop values(458,'Bhuvan Bouquet shop','Tontadarya nagar','Mundaragi','Karnataka',582112,321,559)
into Shop values(459,'Banashree Bouquet shop','Basava nagar','Harihar','Karnataka',577002,322,560)
into Shop values(460,'Vanaja Bouquet shop','Pakeerswami nagar','Shirahatti','Karnataka',582102,317,565)
into Shop values(461,'Prism Bouquet shop','CBT','Banglore','Karnataka',560092,325,562)
into Shop values(462,'Flower hut Bouquet shop','CBT','Davanagere','Karnataka',577002,326,563)
into Shop values(463,'Kanmani Bouquet shop','Kannur','Banglore','Karnataka',560094,327,564)
into Shop values(464,'Aruna Bouquet shop','Tumkur road','Banglore','Karnataka',560088,328,561)
into Shop values(465,'Ajay Bouquet shop','Eshwar nagar','Gadag','Karnataka',582102,328,566)
into Shop values(466,'Karavali Bouquet shop','Mysore road','Banglore','Karnataka',560087,329,567)
into Shop values(467,'Krishna Bouquet shop','Vishwesahwarayya circle','Belagum','Karnataka',583231,329,571)
into Shop values(468,'Shiva Bouquet shop','Renuka devi street','Savadatti','Karnataka',580021,332,568)
into Shop values(469,'Sunshine Bouquet shop','Mrutyunjay nagar','Dharwad','Karnataka',580001,332,570)
into Shop values(470,'Anuradha Bouquet shop','Gopal nagar','Gadag','Karnataka',582102,341,569)
select * from dual;

update Employees set Shopid = 401 where E_id=501 or E_id=571;
update Employees set Shopid = 402 where E_id=502;
update Employees set Shopid = 403 where E_id=503 or E_id=588;
update Employees set Shopid = 404 where E_id=504;
update Employees set Shopid = 405 where E_id=505 or E_id=572;
update Employees set Shopid = 406 where E_id=506;
update Employees set Shopid = 407 where E_id=507 or E_id=573;
update Employees set Shopid = 408 where E_id=508;
update Employees set Shopid = 409 where E_id=509;
update Employees set Shopid = 410 where E_id=510 or E_id=574;
update Employees set Shopid = 411 where E_id=511;
update Employees set Shopid = 412 where E_id=512 or E_id=553;
update Employees set Shopid = 413 where E_id=513;
update Employees set Shopid = 414 where E_id=514 or E_id=575;
update Employees set Shopid = 415 where E_id=515;
update Employees set Shopid = 416 where E_id=516 or E_id=576;
update Employees set Shopid = 417 where E_id=517 or E_id=537;
update Employees set Shopid = 418 where E_id=518;
update Employees set Shopid = 419 where E_id=519 or E_id=577;
update Employees set Shopid = 420 where E_id=520;
update Employees set Shopid = 421 where E_id=521 or E_id=578;
update Employees set Shopid = 422 where E_id=522;
update Employees set Shopid = 423 where E_id=523 or E_id=579;
update Employees set Shopid = 424 where E_id=524;
update Employees set Shopid = 425 where E_id=525;
update Employees set Shopid = 426 where E_id=528 or E_id=580;
update Employees set Shopid = 427 where E_id=529;
update Employees set Shopid = 428 where E_id=530 or E_id=581;
update Employees set Shopid = 429 where E_id=531;
update Employees set Shopid = 430 where E_id=532 or E_id=582;
update Employees set Shopid = 431 where E_id=533;
update Employees set Shopid = 432 where E_id=534 or E_id=583;
update Employees set Shopid = 433 where E_id=543;
update Employees set Shopid = 434 where E_id=535 or E_id=584;
update Employees set Shopid = 435 where E_id=534;
update Employees set Shopid = 436 where E_id=536 or E_id=585;
update Employees set Shopid = 437 where E_id=538;
update Employees set Shopid = 438 where E_id=539;
update Employees set Shopid = 439 where E_id=540 or E_id=586;
update Employees set Shopid = 440 where E_id=541;
update Employees set Shopid = 441 where E_id=542 or E_id=599;
update Employees set Shopid = 442 where E_id=527;
update Employees set Shopid = 443 where E_id=526;
update Employees set Shopid = 444 where E_id=544 or E_id=587;
update Employees set Shopid = 445 where E_id=546;
update Employees set Shopid = 446 where E_id=547;
update Employees set Shopid = 447 where E_id=545 or E_id=589;
update Employees set Shopid = 448 where E_id=551;
update Employees set Shopid = 449 where E_id=552;
update Employees set Shopid = 450 where E_id=548 or E_id=590;
update Employees set Shopid = 451 where E_id=550;
update Employees set Shopid = 452 where E_id=549 or E_id=591;
update Employees set Shopid = 453 where E_id=554;
update Employees set Shopid = 454 where E_id=557;
update Employees set Shopid = 455 where E_id=555 or E_id=592;
update Employees set Shopid = 456 where E_id=556;
update Employees set Shopid = 457 where E_id=558;
update Employees set Shopid = 458 where E_id=559 or E_id=593;
update Employees set Shopid = 459 where E_id=560;
update Employees set Shopid = 460 where E_id=565 or E_id=594;
update Employees set Shopid = 461 where E_id=562;
update Employees set Shopid = 462 where E_id=563 or E_id=595;
update Employees set Shopid = 463 where E_id=564;
update Employees set Shopid = 464 where E_id=561 or E_id=596;
update Employees set Shopid = 465 where E_id=566;
update Employees set Shopid = 466 where E_id=567 or E_id=597;
update Employees set Shopid = 467 where E_id=571;
update Employees set Shopid = 468 where E_id=568 or E_id=598;
update Employees set Shopid = 469 where E_id=570;
update Employees set Shopid = 470 where E_id=569 or E_id=600;


insert all 
into Shop_Phno values(401,9876543210)
into Shop_Phno values(402,9876543211)
into Shop_Phno values(403,9876543212)
into Shop_Phno values(404,9876543213)
into Shop_Phno values(405,9876543214)
into Shop_Phno values(406,9876543215)
into Shop_Phno values(407,9876543216)
into Shop_Phno values(408,9876543217)
into Shop_Phno values(409,9876543218)
into Shop_Phno values(410,9876543219)
into Shop_Phno values(411,9876543220)
into Shop_Phno values(411,9876543221)
into Shop_Phno values(412,9876543222)
into Shop_Phno values(413,9876543223)
into Shop_Phno values(414,9876543224)
into Shop_Phno values(415,9876543225)
into Shop_Phno values(416,9876543226)
into Shop_Phno values(417,9876543227)
into Shop_Phno values(417,9876543228)
into Shop_Phno values(418,9876543229)
into Shop_Phno values(419,9876543230)
into Shop_Phno values(420,9876543231)
into Shop_Phno values(421,9876543232)
into Shop_Phno values(421,9876543233)
into Shop_Phno values(422,9876543234)
into Shop_Phno values(423,9876543235)
into Shop_Phno values(424,9876543236)
into Shop_Phno values(425,9876543237)
into Shop_Phno values(426,9876543238)
into Shop_Phno values(427,9876543239)
into Shop_Phno values(428,9876543240)
into Shop_Phno values(429,9876543241)
into Shop_Phno values(430,9876543242)
into Shop_Phno values(430,9876543243)
into Shop_Phno values(431,9876543244)
into Shop_Phno values(432,9876543245)
into Shop_Phno values(433,9876543246)
into Shop_Phno values(433,9876543247)
into Shop_Phno values(434,9876543248)
into Shop_Phno values(435,9876543249)
into Shop_Phno values(436,9876543250)
into Shop_Phno values(437,9876543251)
into Shop_Phno values(438,9876543252)
into Shop_Phno values(438,9876543253)
into Shop_Phno values(439,9876543254)
into Shop_Phno values(439,9876543255)
into Shop_Phno values(440,9876543256)
into Shop_Phno values(441,9876543257)
into Shop_Phno values(442,9876543258)
into Shop_Phno values(443,9876543259)
into Shop_Phno values(443,9876543260)
into Shop_Phno values(444,9876543261)
into Shop_Phno values(445,9876543262)
into Shop_Phno values(446,9876543263)
into Shop_Phno values(447,9876543264)
into Shop_Phno values(448,9876543265)
into Shop_Phno values(449,9876543266)
into Shop_Phno values(449,9876543267)
into Shop_Phno values(450,9876543268)
into Shop_Phno values(451,9876543269)
into Shop_Phno values(452,9876543270)
into Shop_Phno values(453,9876543271)
into Shop_Phno values(454,9876543272)
into Shop_Phno values(454,9876543273)
into Shop_Phno values(455,9876543274)
into Shop_Phno values(455,9876543275)
into Shop_Phno values(456,9876543276)
into Shop_Phno values(457,9876543277)
into Shop_Phno values(458,9876543278)
into Shop_Phno values(460,9876543279)
into Shop_Phno values(460,9876543280)
into Shop_Phno values(461,9876543281)
into Shop_Phno values(462,9876543282)
into Shop_Phno values(463,9876543283)
into Shop_Phno values(464,9876543285)
into Shop_Phno values(464,9876543286)
into Shop_Phno values(465,9876543287)
into Shop_Phno values(466,9876543288)
into Shop_Phno values(467,9876543289)
into Shop_Phno values(467,9876543290)
into Shop_Phno values(468,9876543291)
into Shop_Phno values(468,9876543292)
into Shop_Phno values(469,9876543293)
into Shop_Phno values(469,9876543294)
into Shop_Phno values(470,9876543295)
into Shop_Phno values(470,9876543296)
into Shop_Phno values(469,9876543297)
into Shop_Phno values(469,9876543298)
into Shop_Phno values(470,9876543299)
into Shop_Phno values(470,9876543300)
select *from dual;

/*Payment*/
insert all
into Payment values(11001,'cash',601)
into Payment values(11002,'credit card',602)
into Payment values(11003,'cash',603)
into Payment values(11004,'cash',604)
into Payment values(11005,'credit card',605)
into Payment values(11006,'credit card',606)
into Payment values(11007,'cash',607)
into Payment values(11008,'cash',608)
into Payment values(11009,'credit card',609)
into Payment values(11010,'cash',610)
into Payment values(11011,'credit card',611)
into Payment values(11012,'cash',612)
into Payment values(11013,'credit card',613)
into Payment values(11014,'cash',614)
into Payment values(11015,'cash',615)
into Payment values(11016,'credit card',616)
into Payment values(11017,'credit card',617)
into Payment values(11018,'cash',618)
into Payment values(11019,'cash',619)
into Payment values(11020,'credit card',620)
into Payment values(11021,'cash',621)
into Payment values(11022,'credit card',622)
into Payment values(11023,'cash',623)
into Payment values(11024,'cash',624)
into Payment values(11025,'credit card',625)
into Payment values(11026,'credit card',626)
into Payment values(11027,'cash',627)
into Payment values(11028,'cash',628)
into Payment values(11029,'credit card',629)
into Payment values(11030,'cash',630)
into Payment values(11031,'credit card',631)
into Payment values(11032,'cash',632)
into Payment values(11033,'credit card',633)
into Payment values(11034,'cash',634)
into Payment values(11035,'cash',635)
into Payment values(11036,'credit card',636)
into Payment values(11037,'credit card',637)
into Payment values(11038,'cash',638)
into Payment values(11039,'cash',639)
into Payment values(11040,'credit card',640)
into Payment values(11041,'cash',641)
into Payment values(11042,'credit card',642)
into Payment values(11043,'cash',643)
into Payment values(11044,'cash',644)
into Payment values(11045,'credit card',645)
into Payment values(11046,'credit card',646)
into Payment values(11047,'cash',647)
into Payment values(11048,'cash',648)
into Payment values(11049,'credit card',649)
into Payment values(11050,'cash',650)
into Payment values(11051,'credit card',651)
into Payment values(11052,'cash',652)
into Payment values(11053,'credit card',653)
into Payment values(11054,'cash',654)
into Payment values(11055,'cash',655)
into Payment values(11056,'credit card',656)
into Payment values(11057,'credit card',657)
into Payment values(11058,'cash',658)
into Payment values(11059,'cash',659)
into Payment values(11060,'credit card',660)
into Payment values(11061,'cash',661)
into Payment values(11062,'credit card',662)
into Payment values(11063,'cash',663)
into Payment values(11064,'cash',664)
into Payment values(11065,'credit card',665)
into Payment values(11066,'credit card',666)
into Payment values(11067,'cash',667)
into Payment values(11068,'cash',668)
into Payment values(11069,'credit card',669)
into Payment values(11070,'cash',670)
into Payment values(11071,'cash',671)
into Payment values(11072,'credit card',672)
into Payment values(11073,'cash',673)
into Payment values(11074,'cash',674)
into Payment values(11075,'credit card',675)
into Payment values(11076,'credit card',676)
into Payment values(11077,'cash',677)
into Payment values(11078,'cash',678)
into Payment values(11079,'credit card',679)
into Payment values(11080,'cash',680)
into Payment values(11081,'credit card',681)
into Payment values(11082,'cash',682)
into Payment values(11083,'credit card',683)
into Payment values(11084,'cash',684)
into Payment values(11085,'cash',685)
into Payment values(11086,'credit card',686)
into Payment values(11087,'credit card',687)
into Payment values(11088,'cash',688)
into Payment values(11089,'cash',689)
into Payment values(11090,'credit card',690)
into Payment values(11091,'cash',691)
into Payment values(11092,'credit card',692)
into Payment values(11093,'cash',693)
into Payment values(11094,'cash',694)
into Payment values(11095,'credit card',695)
into Payment values(11096,'credit card',696)
into Payment values(11097,'cash',697)
into Payment values(11098,'cash',698)
into Payment values(11099,'credit card',699)
into Payment values(11100,'cash',700)
select *from dual;

/*Flower_item*/
insert all
into flower_item values(1001,'Red roses',400,10,'passion')
into flower_item values(1002,'White roses',450,11,' chaste love')
into flower_item values(1003,'Orange roses',350,12,'Birthday')
into flower_item values(1004,'Jasmine',425,13,' grace and elegance')
into flower_item values(1005,'Yellow roses',470,14,'friendship')
into flower_item values(1006,'Coral roses',474,15,'desire')
into flower_item values(1007,'Pink roses',487,16,'admiration')
into flower_item values(1008,'Primroses',465,17,'new love, new beginnings')
into flower_item values(1009,'Camellia',480,18,'excellence and finesse')
into flower_item values(1010,'Daffodils',575,19,'truth and forgiveness')
into flower_item values(1011,'Daisies',498,20,'innocence and playfulness')
into flower_item values(1012,'Dahlias',479,21,'change and excitement')
into flower_item values(1013,'Orchids',480,22,'Love')
into flower_item values(1014,'Pink carnations',500,23,'gratitude')
into flower_item values(1015,'Red chrysanthemums',495,24,'sharing and love')
into flower_item values(1016,'Forget-me-nots',380,25,'remember me forever')
into flower_item values(1017,'Geraniums',590,26,'comfort and true friendship')
into flower_item values(1018,'Gerbera daisies',476,27,'cheerfulness')
into flower_item values(1019,'White lilacs',458,28,' innocence of childhood')
into flower_item values(1020,'Daylilies',494,29,'mother')
into flower_item values(1021,'Lily-of-the-valley',479,30,'sweetness, pure love')
into flower_item values(1022,'Dwarf sunflowers',480,31,' adoration')
into flower_item values(1023,'Red tulips',473,32,'declaration of love')
into flower_item values(1024,'Yellow tulips',465,33,'a smile with sunshine')
into flower_item values(1025,'Red poinsettia',487,34,' blood of Christ')
into flower_item values(1026,'Christmas roses',400,35,' gift for Christ')
into flower_item values(1027,'Holly',400,36,'everlasting life')
into flower_item values(1028,'Winter jasmine',400,37,'Purity and modestry')
into flower_item values(1029,'Narcissus',400,38,'rebirth, renewal')
into flower_item values(1030,'Lilies',400,39,'restored innocence to the departed soul')
into flower_item values(1031,'Gladioli',480,40,'moral integrity and sincerity')
into flower_item values(1032,'Red carnations',400,16,' admiration')
into flower_item values(1033,'Pink carnations',400,41,'remembrance')
into flower_item values(1034,'Chrysanthemums',400,42,'honoring a full life')
into flower_item values(1035,'White roses',400,43,'reverence')
into flower_item values(1036,'Crimson roses',400,44,'Grief and sorrow')
into flower_item values(1037,'Orchids',400,45,'sympathy and eternal love')
into flower_item values(1038,'Acacia',400,46,'Beauty in retirement')
into flower_item values(1039,'sweet pea',400,23,'gratitude')
into flower_item values(1040,'sunflower',400,24,'royalty')
into flower_item values(1041,'light pink rose',400,25,'birth')
into flower_item values(1042,'yellow marie gold',400,26,'honesty')
into flower_item values(1043,'Red marie gold',400,26,'honesty')
into flower_item values(1044,'light pink flower',400,27,'integrity')
into flower_item values(1045,'purple flower',400,28,'Proposal')
into flower_item values(1046,'crimson flower',400,29,'good bye')
into flower_item values(1047,'Red elite flower',400,30,'Proposal')
into flower_item values(1048,'pink elite',400,31,'gift')
into flower_item values(1049,'Reddish blue flower',400,32,'happiness')
into flower_item values(1050,'pinkish blue flowers',400,33,'joy')
select * from dual;

/*Distribute_flower*/
insert all
into Distribute_flower values(101,401,'Red roses',40)
into Distribute_flower values(102,401,'Orange roses',40)
into Distribute_flower values(101,402,'Coral roses',30)
into Distribute_flower values(103,402,'Daylilies',40)
into Distribute_flower values(104,403,'White lilacs',50)
into Distribute_flower values(105,404,'Gerbera daisies',40)
into Distribute_flower values(106,404,'Geraniums',30)
into Distribute_flower values(107,405,'Jasmine',20)
into Distribute_flower values(107,406,'White roses',50)
into Distribute_flower values(107,407,'Pink roses',40)
into Distribute_flower values(108,408,'Primroses',70)
into Distribute_flower values(109,409,'Orange roses',40)
into Distribute_flower values(110,409,'Forget-me-nots',40)
into Distribute_flower values(110,410,'Red chrysanthemums',80)
into Distribute_flower values(111,411,'Pink carnations',40)
into Distribute_flower values(112,411,'Yellow roses',40)
into Distribute_flower values(111,412,'Orchids',30)
into Distribute_flower values(113,412,'Coral roses',40)
into Distribute_flower values(114,413,'Dahlias',50)
into Distribute_flower values(115,414,'Red roses',40)
into Distribute_flower values(116,414,'Daisies',30)
into Distribute_flower values(117,415,'Daffodils',20)
into Distribute_flower values(117,416,'White roses',50)
into Distribute_flower values(117,417,'Red tulips',40)
into Distribute_flower values(118,418,'Red carnations',70)
into Distribute_flower values(119,419,'Gladioli',40)
into Distribute_flower values(120,419,'Red roses',40)
into Distribute_flower values(120,420,'Lilies',80)
into Distribute_flower values(121,421,'Narcissus',40)
into Distribute_flower values(122,421,'Winter jasmine',40)
into Distribute_flower values(121,422,'Holly',30)
into Distribute_flower values(123,422,'Christmas roses',40)
into Distribute_flower values(124,423,'Orange roses',50)
into Distribute_flower values(125,424,'Red poinsettia',40)
into Distribute_flower values(126,424,'Yellow tulips',30)
into Distribute_flower values(127,425,'pinkish blue flowers',20)
into Distribute_flower values(127,426,'Yellow roses',50)
into Distribute_flower values(127,427,'Reddish blue flower',40)
into Distribute_flower values(128,428,'pink elite',70)
into Distribute_flower values(129,429,'Red elite flower',40)
into Distribute_flower values(130,429,'White roses',40)
into Distribute_flower values(130,430,'crimson flower',80)
into Distribute_flower values(131,431,'Red roses',40)
into Distribute_flower values(132,431,'purple flower',40)
into Distribute_flower values(131,432,'light pink flower',30)
into Distribute_flower values(133,432,'White roses',40)
into Distribute_flower values(134,443,'Red marie gold',50)
into Distribute_flower values(145,444,'yellow marie gold',40)
into Distribute_flower values(146,444,'light pink rose',30)
into Distribute_flower values(147,445,'Camellia',20)
into Distribute_flower values(147,446,'White roses',50)
into Distribute_flower values(147,447,'sunflower',40)
into Distribute_flower values(148,448,'Red roses',70)
into Distribute_flower values(149,449,'Orange roses',40)
into Distribute_flower values(150,449,'sweet pea',40)
into Distribute_flower values(150,450,'Acacia',80)
into Distribute_flower values(151,451,'Reddish blue flower',40)
into Distribute_flower values(152,451,'White roses',40)
into Distribute_flower values(151,452,'Crimson roses',30)
into Distribute_flower values(153,452,'sunflower',40)
into Distribute_flower values(154,453,'Chrysanthemums',50)
into Distribute_flower values(155,454,'pinkish blue flowers',40)
into Distribute_flower values(156,454,'Orange roses',30)
into Distribute_flower values(157,455,'Red roses',20)
into Distribute_flower values(157,456,'Reddish blue flower',50)
into Distribute_flower values(157,457,'Chrysanthemums',40)
into Distribute_flower values(158,458,'Jasmine',70)
into Distribute_flower values(159,459,'pink elite',40)
into Distribute_flower values(160,459,'Chrysanthemums',40)
into Distribute_flower values(160,460,'White roses',80)
into Distribute_flower values(161,461,'Winter jasmine',40)
into Distribute_flower values(162,461,'sweet pea',40)
into Distribute_flower values(161,462,'yellow marie gold',30)
into Distribute_flower values(163,462,'Pink carnations',40)
into Distribute_flower values(164,463,'Yellow roses',50)
into Distribute_flower values(165,464,'Reddish blue flower',40)
into Distribute_flower values(166,464,'White roses',30)
into Distribute_flower values(167,465,'light pink rose',20)
into Distribute_flower values(167,466,'yellow marie gold',50)
into Distribute_flower values(167,467,'sunflower',40)
into Distribute_flower values(168,468,'Chrysanthemums',70)
into Distribute_flower values(169,469,'White roses',40)
into Distribute_flower values(170,469,'Winter jasmine',40)
into Distribute_flower values(170,470,'sweet pea',80)
into Distribute_flower values(171,401,'Jasmine',40)
into Distribute_flower values(172,421,'pinkish blue flowers',40)
into Distribute_flower values(173,432,'Reddish blue flower',30)
into Distribute_flower values(174,433,'pink elite',40)
into Distribute_flower values(175,440,'sunflower',50)
into Distribute_flower values(176,443,'Chrysanthemums',40)
into Distribute_flower values(177,450,'Crimson roses',30)
into Distribute_flower values(178,455,'White roses',20)
into Distribute_flower values(179,457,'Gladioli',50)
into Distribute_flower values(180,456,'Red carnations',40)
into Distribute_flower values(181,445,'Lilies',70)
into Distribute_flower values(182,424,'Winter jasmine',40)
into Distribute_flower values(183,421,'Jasmine',40)
into Distribute_flower values(184,446,'Narcissus',80)
into Distribute_flower values(185,401,'Red elite flower',40)
into Distribute_flower values(186,401,'yellow marie gold',40)
into Distribute_flower values(187,402,'White roses',30)
into Distribute_flower values(188,402,'yellow marie gold',40)
into Distribute_flower values(189,403,'pinkish blue flowers',50)
into Distribute_flower values(190,404,'Reddish blue flower',40)
into Distribute_flower values(191,404,'pink elite',30)
into Distribute_flower values(192,405,'White roses',20)
into Distribute_flower values(193,406,'sunflower',50)
into Distribute_flower values(194,407,'Crimson roses',40)
into Distribute_flower values(195,408,'Chrysanthemums',70)
into Distribute_flower values(196,409,'yellow marie gold',40)
into Distribute_flower values(197,409,'Reddish blue flower',40)
into Distribute_flower values(198,410,'Red marie gold',80)
into Distribute_flower values(199,409,'pinkish blue flowers',40)
into Distribute_flower values(200,410,'Yellow roses',80)
into Distribute_flower values(201,420,'yellow marie gold',80)
into Distribute_flower values(202,430,'Winter jasmine',50)
into Distribute_flower values(203,440,'Orange roses',70)
into Distribute_flower values(204,450,'Yellow roses',40)
select *from dual;

/*Orders*/
insert all
into Orders values(111001,'28-mar-2021',601,501)
into Orders values(111002,'28-mar-2021',601,501)
into Orders values(111003,'28-mar-2021',601,501)
into Orders values(111004,'28-mar-2021',602,502)
into Orders values(111005,'28-mar-2021',603,503)
into Orders values(111006,'28-mar-2021',604,504)
into Orders values(111007,'28-mar-2021',604,504)
into Orders values(111008,'30-mar-2021',605,505)
into Orders values(111009,'30-mar-2021',606,501)
into Orders values(111010,'31-mar-2021',607,506)
into Orders values(111011,'01-apr-2021',608,506)
into Orders values(111012,'10-apr-2021',609,507)
into Orders values(111013,'28-mar-2021',601,501)
into Orders values(111014,'12-apr-2021',610,508)
into Orders values(111015,'12-apr-2021',611,509)
into Orders values(111016,'13-apr-2021',612,510)
into Orders values(111017,'14-apr-2021',601,501)
into Orders values(111018,'15-apr2021',653,501)
into Orders values(111019,'15-apr-2021',613,511)
into Orders values(111020,'15-apr-2021',614,512)
into Orders values(111021,'16-apr-2021',615,513)
into Orders values(111022,'17-apr-2021',616,514)
into Orders values(111023,'18-apr-2021',617,515)
into Orders values(111024,'19-apr-2021',618,516)
into Orders values(111025,'20-apr-2021',619,517)
into Orders values(111026,'20-apr-2021',619,517)
into Orders values(111027,'21-apr-2021',620,518)
into Orders values(111028,'21-apr-2021',621,519)
into Orders values(111029,'22-apr-2021',622,520)
into Orders values(111030,'22-apr-2021',623,521)
into Orders values(111031,'22-apr-2021',623,521)
into Orders values(111032,'22-apr-2021',623,521)
into Orders values(111033,'22-apr-2021',624,522)
into Orders values(111034,'22-apr-2021',625,523)
into Orders values(111035,'22-apr-2021',625,523)
into Orders values(111036,'23-apr-2021',626,523)
into Orders values(111037,'23-apr-2021',627,523)
into Orders values(111038,'23-apr-2021',628,524)
into Orders values(111039,'23-apr-2021',629,525)
into Orders values(111040,'24-apr-2021',630,526)
into Orders values(111041,'24-apr-2021',631,527)
into Orders values(111042,'24-apr-2021',632,528)
into Orders values(111043,'24-apr-2021',632,528)
into Orders values(111044,'24-apr-2021',633,529)
into Orders values(111045,'24-apr-2021',634,530)
into Orders values(111046,'24-apr-2021',635,531)
into Orders values(111047,'24-apr-2021',636,532)
into Orders values(111048,'24-apr-2021',637,533)
into Orders values(111049,'24-apr-2021',638,534)
into Orders values(111050,'24-apr-2021',639,535)
into Orders values(111051,'24-apr-2021',639,535)
into Orders values(111052,'25-apr-2021',639,535)
into Orders values(111053,'25-apr-2021',640,536)
into Orders values(111054,'25-apr-2021',641,537)
into Orders values(111055,'25-apr-2021',642,538)
into Orders values(111056,'25-apr-2021',643,539)
into Orders values(111057,'25-apr-2021',644,540)
into Orders values(111058,'26-apr-2021',645,541)
into Orders values(111059,'26-apr-2021',646,541)
into Orders values(111060,'26-apr-2021',646,541)
into Orders values(111061,'26-apr-2021',646,541)
into Orders values(111062,'26-apr-2021',647,542)
into Orders values(111063,'27-apr-2021',648,543)
into Orders values(111064,'28-apr-2021',649,544)
into Orders values(111065,'28-apr-2021',650,545)
into Orders values(111066,'28-apr-2021',651,546)
into Orders values(111067,'28-apr-2021',652,547)
into Orders values(111068,'29-apr-2021',652,548)
into Orders values(111069,'29-apr-2021',654,549)
into Orders values(111070,'29-apr-2021',601,550)
into Orders values(111071,'30-apr-2021',655,551)
into Orders values(111072,'30-apr-2021',656,552)
into Orders values(111073,'30-apr-2021',657,553)
into Orders values(111074,'12-may-2021',658,554)
into Orders values(111075,'13-may-2021',659,555)
into Orders values(111076,'13-may-2021',660,556)
into Orders values(111077,'13-may-2021',661,557)
into Orders values(111078,'13-may-2021',662,558)
into Orders values(111079,'14-may-2021',663,559)
into Orders values(111080,'14-may-2021',664,560)
into Orders values(111081,'14-may-2021',665,561)
into Orders values(111082,'14-may-2021',666,562)
into Orders values(111083,'15-may-2021',667,563)
into Orders values(111084,'15-may-2021',668,564)
into Orders values(111085,'15-may-2021',669,565)
into Orders values(111086,'16-may-2021',670,566)
into Orders values(111087,'16-may-2021',671,567)
into Orders values(111088,'16-may-2021',672,568)
into Orders values(111089,'17-may-2021',673,569)
into Orders values(111090,'17-may-2021',674,570)
into Orders values(111091,'18-may-2021',675,571)
into Orders values(111092,'14-may-2021',676,572)
into Orders values(111093,'14-may-2021',677,573)
into Orders values(111094,'14-may-2021',678,574)
into Orders values(111095,'14-may-2021',679,575)
into Orders values(111096,'14-may-2021',680,576)
into Orders values(111097,'14-may-2021',681,577)
into Orders values(111098,'15-may-2021',682,578)
into Orders values(111099,'15-may-2021',683,579)
into Orders values(111100,'16-may-2021',684,580)
into Orders values(111101,'16-may-2021',685,581)
into Orders values(111102,'17-may-2021',686,582)
into Orders values(111103,'17-may-2021',687,583)
into Orders values(111104,'17-may-2021',688,584)
into Orders values(111105,'18-may-2021',689,585)
into Orders values(111106,'18-may-2021',690,586)
into Orders values(111107,'18-may-2021',691,587)
into Orders values(111108,'19-may-2021',692,588)
into Orders values(111109,'19-may-2021',693,589)
into Orders values(111110,'19-may-2021',694,590)
into Orders values(111111,'20-may-2021',695,591)
into Orders values(111112,'21-may-2021',696,592)
into Orders values(111113,'21-may-2021',697,593)
into Orders values(111114,'22-may-2021',698,594)
into Orders values(111115,'23-may-2021',699,595)
into Orders values(111116,'23-may-2021',700,596)
into Orders values(111117,'23-may-2021',671,597)
into Orders values(111118,'23-may-2021',672,598)
into Orders values(111119,'24-may-2021',673,599)
into Orders values(111120,'24-may-2021',675,600)
select* from dual;

/*Order_lines*/
insert all
into Order_lines values(111001,101001,10,1001)
into Order_lines values(111002,101001,20,1002)
into Order_lines values(111003,101001,30,1003)
into Order_lines values(111004,101002,35,1004)
into Order_lines values(111005,101003,50,1005)
into Order_lines values(111006,101004,40,1006)
into Order_lines values(111007,101004,40,1007)
into Order_lines values(111008,101005,15,1008)
into Order_lines values(111009,101006,8,1009)
into Order_lines values(111010,101007,12,1010)
into Order_lines values(111011,101008,14,1011)
into Order_lines values(111012,101009,40,1012)
into Order_lines values(111013,101001,40,1013)
into Order_lines values(111014,101010,25,1014)
into Order_lines values(111015,101011,30,1015)
into Order_lines values(111016,101012,31,1016)
into Order_lines values(111017,101013,41,1017)
into Order_lines values(111018,101014,12,1018)
into Order_lines values(111019,101015,51,1019)
into Order_lines values(111020,101016,13,1020)
into Order_lines values(111021,101017,43,1021)
into Order_lines values(111022,101018,20,1022)
into Order_lines values(111023,101019,10,1023)
into Order_lines values(111024,101020,10,1024)
into Order_lines values(111025,101021,10,1025)
into Order_lines values(111026,101021,10,1026)
into Order_lines values(111027,101022,11,1027)
into Order_lines values(111028,101023,13,1028)
into Order_lines values(111029,101024,4,1029)
into Order_lines values(111030,101025,5,1030)
into Order_lines values(111031,101025,6,1031)
into Order_lines values(111032,101025,7,1032)
into Order_lines values(111033,101026,8,1033)
into Order_lines values(111034,101027,9,1034)
into Order_lines values(111035,101027,14,1035)
into Order_lines values(111036,101028,1,1036)
into Order_lines values(111037,101028,2,1037)
into Order_lines values(111038,101029,5,1038)
into Order_lines values(111039,101030,7,1039)
into Order_lines values(111040,101031,2,1040)
into Order_lines values(111041,101032,1,1041)
into Order_lines values(111042,101033,3,1042)
into Order_lines values(111043,101034,2,1043)
into Order_lines values(111044,101035,6,1044)
into Order_lines values(111045,101036,4,1045)
into Order_lines values(111046,101037,3,1046)
into Order_lines values(111047,101038,2,1047)
into Order_lines values(111048,101039,12,1048)
into Order_lines values(111049,101040,14,1049)
into Order_lines values(111050,101041,11,1050)
into Order_lines values(111051,101041,5,1001)
into Order_lines values(111052,101041,4,1002)
into Order_lines values(111053,101042,4,1003)
into Order_lines values(111054,101043,13,1004)
into Order_lines values(111055,101044,40,1005)
into Order_lines values(111056,101045,40,1006)
into Order_lines values(111057,101046,40,1007)
into Order_lines values(111058,101047,40,1008)
into Order_lines values(111059,101048,40,1009)
into Order_lines values(111060,101048,40,1010)
into Order_lines values(111061,101048,40,1011)
into Order_lines values(111062,101049,40,1012)
into Order_lines values(111063,101050,40,1013)
into Order_lines values(111064,101060,40,1014)
into Order_lines values(111065,101061,40,1015)
into Order_lines values(111066,101062,40,1016)
into Order_lines values(111067,101063,40,1017)
into Order_lines values(111068,101064,40,1018)
into Order_lines values(111069,101065,40,1019)
into Order_lines values(111070,101066,40,1020)
into Order_lines values(111071,101067,40,1021)
into Order_lines values(111072,101068,40,1022)
into Order_lines values(111073,101069,40,1023)
into Order_lines values(111074,101070,40,1024)
into Order_lines values(111075,101071,40,1025)
into Order_lines values(111076,101072,40,1026)
into Order_lines values(111077,101073,40,1027)
into Order_lines values(111078,101074,40,1028)
into Order_lines values(111079,101075,40,1029)
into Order_lines values(111080,101075,40,1030)
into Order_lines values(111081,101076,40,1031)
into Order_lines values(111082,101077,40,1032)
into Order_lines values(111083,101078,40,1033)
into Order_lines values(111084,101079,40,1034)
into Order_lines values(111085,101080,40,1035)
into Order_lines values(111086,101081,40,1036)
into Order_lines values(111087,101082,40,1037)
into Order_lines values(111088,101083,40,1038)
into Order_lines values(111089,101084,40,1039)
into Order_lines values(111090,101085,40,1040)
into Order_lines values(111091,101086,24,1041)
into Order_lines values(111092,101087,19,1042)
into Order_lines values(111093,101088,17,1043)
into Order_lines values(111094,101089,15,1044)
into Order_lines values(111095,101090,13,1045)
into Order_lines values(111096,101091,11,1046)
into Order_lines values(111097,101092,27,1047)
into Order_lines values(111098,101093,21,1048)
into Order_lines values(111099,101094,25,1049)
into Order_lines values(111100,101095,15,1050)
into Order_lines values(111101,101096,10,1031)
into Order_lines values(111102,101097,20,1032)
into Order_lines values(111103,101098,30,1033)
into Order_lines values(111104,101099,40,1034)
into Order_lines values(111105,101100,1,1035)
into Order_lines values(111106,101101,2,1036)
into Order_lines values(111107,101102,3,1037)
into Order_lines values(111108,101103,4,1038)
into Order_lines values(111109,101104,5,1039)
into Order_lines values(111110,101105,6,1040)
into Order_lines values(111111,101106,7,1041)
into Order_lines values(111112,101107,8,1042)
into Order_lines values(111113,101108,9,1043)
into Order_lines values(111114,101109,10,1044)
into Order_lines values(111115,101110,11,1045)
into Order_lines values(111116,101111,17,1046)
into Order_lines values(111117,101112,16,1047)
into Order_lines values(111118,101113,30,1048)
into Order_lines values(111119,101114,20,1049)
into Order_lines values(111120,101115,10,1050)
select *from dual;


select *from Distributor;
select *from Owner;
select *from Customers;
select *from Shop;
select *from Employees;
select *from Shop_Phno;
select *from Payment;
select *from flower_item;
select *from Distribute_flower;
select *from Orders;
select *from Order_lines;

/*Join Operator*/
/*1.Join table orders and orderlines based on orderno*/
select *
from Orders o
join Order_lines l on l.Orderno=o.Order_no;

/*2.Join the tables distribute_flowers with floweritem table where
names of flower item should match in both the tables and quantity should be 40*/
select Di_id,S_id,Flower_item_name,f_name
from Distribute_flower,Flower_item
where Flower_item_name=f_name and quantity=40;

/*3.Join table Customers and orders where customer ordered from vijayapur */ 
select C_id,Fi_name,city,order_no,ord_date
from Customers 
join Orders on
c_id=cid and city='Vijayapur';

/*4.Display Customer id ,name who paid by credit card  */
select C_id,Fi_name,Payment_id,Paymethod
from Customers,Payment
where C_id=cu_id and Paymethod='credit card';

/*5.dislpay shop name ,id,phno for the shop and also display along with owner id for shop*/
select Shop_id,S_name,Phno,O_Uid
from shop,Shop_phno,Owner
where Shop_id=shopid and owner_id=O_Uid;

/*Arithmetic and Logical Operator*/
/*1.Display customer details(id,name,address) whose City is 'Hubli' and ordered flower item in may */
select c.c_id,c.fi_name,c.mi_name,c.la_name,c.house_no,c.street,c.city,c.state,c.pincode,o.order_no,o.ord_date
from customers c,orders o
where c.city='Hubli' and o.ord_date between '01-may-2021' and '31-may-2021' 
and c.c_id=o.cid;

/*2.Display employee name,id ,phone no who is manager or employee of the shop whose shop id is 405 or 414*/
select e.e_id,e.fname as employee_name,e.ph_no,e.Shopid
from employees e,shop s
where (s.mgr_id = e.e_id or e.Shopid=s.shop_id)  and e.shopid= 405 or e.shopid=414 and e.shopid=s.shop_id;

/*3.Display distributor name, id, phone number who supplies flower item "Chrysanthemums" or "White roses" 
and also display shop name and id to which distributor supplies those flower also display quantity*/
select d.D_id,d.fir_name Distributor_name ,d.phoneno,s.shop_id,s.s_name shop_name,df.flower_item_name,df.quantity
from distributor d,shop s, distribute_flower df
where df.di_id=d.d_id and df.s_id=s.shop_id and 
(lower(df.flower_item_name)='chrysanthemums' or lower(df.flower_item_name)='white roses') ;

/*4.Display names of flowers which are used as a sign of friendship or love*/
select *
from flower_item
where upper(occasion_name) like '%FRIEND%' or upper(occasion_name) like '%LOVE%' ;

/*5.Retrieve Employee id ,name,and new salary after increment of 5% for those 
whose dob is between 01 jan 1994 to 1 dec 1999*/
select E_id,Fname,salary+(salary*5/100) as inc_salary
from Employees
where dob between '01-Jan-1994' and '31-12-1999';

/*6.Retrieve details of Distributors with the shopname and id to which he/she supplies flowers sweet pea*/
select Di_id,fir_name,Shop_id,S_name,Flower_item_name
from Distribute_flower,Shop,Distributor
where Shop_id=S_id and DI_id=D_id and Flower_item_name='sweet pea';


/*Aggregation function*/
/*1.Retrieve customer id and number of items they have ordered*/
select c.c_id,count(*)
from customers c,orders o
where c.c_id=o.cid 
group by c.c_id;

/*2.Retrive flower details which has minimum cost*/
select *
from flower_item
where price = (select min(price)
from flower_item);

/*3.display details of flower items with maximum price*/
select *
from flower_item
where price = (select max(price)
from flower_item);

/*4.Display shop id, name and average salary given by shop*/
select shop_id,s.s_name,avg(salary)
from shop s,employees e
where s.shop_id=e.shopid
group by s.shop_id,s.s_name
order by s.shop_id;

/*5.Retrieve name of the shop which gives salary more than average salary of all shops */
select s.shop_id,s.s_name
from shop s,employees e
where e.salary > (select avg(salary) 
from employees) and s.shop_id=e.shopid
order by s.shop_id;


/*Nested Query */
/*1.Display details of customers who ordered red roses*/
select *
from customers c,orders o
where c.c_id=o.cid
and o.order_No in (select orderno 
from order_lines
where flower_icode in (select floweritemcode
from flower_item
where upper(f_name) like '%RED ROSES%'));

/*2.Display customer details who ordered the flowers which are best known for friendship or love*/
select *
from customers c,orders o
where c.c_id=o.cid
and o.order_No in (select orderno 
from order_lines
where flower_icode in (select floweritemcode
from flower_item
where upper(occasion_name) like '%FRIEND%' or upper(occasion_name) like '%LOVE%' ));


/*3.display details of customer who have purchased the items worth more than 20000*/
select *
from customers
where c_id in (select cid
from orders
where order_no in (select orderno
from order_lines,flower_item
where flower_icode=floweritemcode and (price*quantity)>20000));


/*4.details of customers who paid amount via credit card and ordered more than one item*/
select * 
from customers c
where c_id in (select cu_id
from payment
where  paymethod like '%cash%' )and c_id in (select cid
from orders
group by  cid 
having count(*)>1);

/*5.Display customer details with maximum number of orders*/
select c.c_id,c.fi_name,o.order_no,fi.f_name
from customers c,orders o,order_lines ol,flower_item fi
where c.c_id=o.cid and o.order_no=ol.orderno and ol.flower_icode=fi.floweritemcode
and ol.quantity=(select max(quantity)
from customers c,orders o,order_lines ol,flower_item fi
where c.c_id=o.cid and o.order_no=ol.orderno and ol.flower_icode=fi.floweritemcode);

/*Having clause*/
/*1.Retrieve customer details who ordered different variety of flower item*/
select c.fi_name,c.c_id,count(*) no_of_flower_item
from customers c,orders o,order_lines ol
where c.c_id=o.cid and o.order_no=ol.orderno
group by c.fi_name,c.c_id
having count(*)>1
order by c.c_id;

/*2.Retrieve customer details who ordered only one type flower item*/
select c.fi_name,c.c_id
from customers c,orders o,order_lines ol
where c.c_id=o.cid and o.order_no=ol.orderno
group by c.fi_name,c.c_id
having count(*)=1
order by c.c_id;

/*3.Display details of employee who delivered more no of items in the month of may*/
select e.e_id,e.fname,e.lname,count(*)
from employees e,orders o,order_lines ol,flower_item fi
where e.e_id=o.eid and o.order_no=ol.orderno and ol.flower_icode=fi.floweritemcode 
and o.ord_date between '01-may-2021' and '31-may-2021'
having count(*)=1
group by e.e_id,e.fname,e.lname;

/*4.Display details of employees(who delivered two or more orders)
and number of items delivered in month of may by them*/
select e.e_id,e.fname,e.lname,count(*)
from employees e,orders o,order_lines ol,flower_item fi
where e.e_id=o.eid and o.order_no=ol.orderno and ol.flower_icode=fi.floweritemcode
group by e.e_id,e.fname,e.lname
having count(*)>2 or count(*)=2;


/*5.Display shop id,name and phone numbers which has more than one phone number*/
select s.shop_id,s.s_name,sp.phno
from shop s,shop_phno sp
where s.shop_id=sp.shopid and s.shop_id in (select shop_id from shop_phno,shop where shop_id=shopid 
group by shop_id
having count(*)>1)
order by s.shop_id;


drop view Employee_new;
drop view employees_age;
drop view customers_dharwad;
drop view customers_age;
drop view customer_bill;
/*View*/
/*1.Create view for employee table containing employee id,first name,age
and a new salary after 10% increment in salary*/
create view Employee_new as
select E_id,Fname,to_char(sysdate,'yyyy')-to_char(dob,'yyyy') age,salary+(salary*10/100) as newsalary
from Employees;

select *
from Employee_new;

/*Create a view table with employee name,id and age*/
create view employees_age as
select fname,e_id,to_char(sysdate,'yyyy')-to_char(dob,'yyyy') employee_age
from employees;
select *from employees_age;

/*2.Display employee details whose age is above 20 and below 40 using employees_age view*/
select *from employees_age
where employee_age>20 and employee_age<40;

/*3.Create customer view table with customer id,fname,and only details of customers from dharwad city*/
create view Customers_dharwad as
select C_id,Fi_name,house_no,City
from Customers
where upper(City) like '%DHARWAD%';

select *
from Customers_dharwad;

/*Create a view table with customer name, id and age*/
create view customers_age as
select fi_name,c_id,to_char(sysdate,'yyyy')-to_char(dob,'yyyy') customer_age
from customers;
select *from customers_age;

/*4.Display customer details whose age is above 50 using customers_age view*/
select *from customers_age
where customer_age>50;

/*Create a view table with customer id,first name, last name,city,order number,quantity,price of a flower item 
and total price*/
create view customer_bill as
select c.c_id,c.fi_name,c.la_name,c.city,ol.orderno,ol.quantity,f.price,(ol.quantity*f.price)as total
from customers c,orders o,order_lines ol,flower_item f
where c.c_id=o.cid and o.order_no=ol.orderno and f.floweritemcode=ol.flower_icode;

select * from customer_bill
order by c_id;

/*5.Display customer id,first name,last name,Total amount to be paid by the customer for all the item using 
customer_bill view*/
select c_id,fi_name,la_name,sum(total) Total_bill_amount
from customer_bill
group by c_id,fi_name,la_name
order by c_id;

/*group by*/
/*1.Display the distributor id and flower item and shop with id 401 or 402  */
select Di_id,S_id,flower_item_name
from Distribute_flower
where S_id=401 or S_id=402
group by di_id,S_id,flower_item_name;

/*2.Retrieve the number of flower items along with the price which is less than maximum price*/               
select price,count(*)
from Flower_item
where price < (select max(price)
from flower_item)
group by price;
 
/*3.Retrieve shop details which has female manager*/             
select *
from Shop
where Mgr_id in(select E_id from Employees
where Mgr_id=E_id and Gender='f'
group by E_id);

/*4.Retrieve shop name, shopid, number of employees in each shop*/
select s.s_name,s.shop_id,count(*)
from employees e, shop s
where s.shop_id=e.shopid
group by s.s_name,s.shop_id;

/*5.Retrieve distributor id, name, and number of shops to which they supplies flower*/
select d.d_id,d.fir_name,count(*)
from distributor d,distribute_flower df,shop s
where d.d_id=df.di_id and s.shop_id=df.s_id
group by d.d_id,d.fir_name
order by d.d_id;

/*correlated*/
/*1.details of customers who paid amount via credit*/
select * 
from customers c
where exists (select cu_id
from payment
where c.c_id=cu_id and  paymethod like '%credit%' );

/*2.details of customers who placed more than 2 orders*/
select * 
from customers c
where exists (select cid
from orders o
where c.c_id=o.cid
group by cid
having count(*)>2);

/*3.Retrieve employee name, id who earn more than avg salary in the shop they work*/
select e.fname,e.e_id
from employees e
where e.salary >(select avg(salary)
from employees e1
where e1.shopid=e1.shopid);

/*4.Retrieve details of manager of the shops along with shop id*/
select *
from employees e
where exists (select s.mgr_id
from shop s where e.e_id=s.mgr_id 
)
order by e.e_id;

/*5.Retrieve the details of the shop with the owner id who owns the shop*/
select *
from shop s
where exists (select o.O_uid
from owner o
where s.owner_id=o.O_uid);

/*single row*/
/*1.Display the items purchased by customer with id 646*/
select c.c_id,c.fi_name,fi.f_name
from customers c,orders o,order_lines ol,flower_item fi
where c.c_id=o.cid and o.order_no=ol.orderno and fi.floweritemcode=ol.flower_icode
and c.c_id=645;

/*2.Display the employee details with minimum salary*/
select *
from employees
where salary = (select min(salary)
from employees);

/*3.Retrieve the details of the flower item with lilies */
select *
from Flower_item
where f_name='Lilies';

/*4.Retrieve the employees details who assigned for the orderno 111028*/
select E_id,fname,Ph_no,Order_no,Ord_date
From Employees,Orders
where E_id =Eid and Order_no=111028;

/*5.Retrieve details of Distributors with the shop id and name to which he/she supplies flower item with Daylilies*/
select Di_id,fir_name,Shop_id,S_name,Flower_item_name
from Distribute_flower,Shop,Distributor
where Shop_id=S_id and DI_id=D_id and Flower_item_name='Daylilies';

/*Set theory*/
/*1.Display shop id ,street,city,state,pincode of the shop details where it is not there in Employees with same details */
select s.shop_id, street,city,state,pincode
from shop s
minus
select e.shopid, e.street, e.city,e.state,e.pincode
from employees e;

/*2.Display shop id ,street,city,state,pincode of the shop details where it is same in Employees with same details *//
select s.shop_id, street,city,state,pincode
from shop s
intersect
select e.shopid, e.street, e.city,e.state,e.pincode
from employees e;

/*3.Display union of ownername, uid, street,city state of the owner and the shop          */
select o.o_name,o.o_uid,o.street,o.city,o.state
from owner o
union
select s.s_name,s.owner_id,s.street,s.city,s.state
from shop s;

/*4 Display the union of owner and shop only if city should be Hubli or dharwad */
select O_name,O_Uid,street,city,state
from Owner
where city='Hubli'
union
select S_name,Owner_id,street,city,state
from Shop
where city='Dharwad';

/*5 Display union of shop id ,street,city ,pincode from the shop and employee data */
select s.shop_id, street,city,state,pincode
from shop s union (select e.shopid, e.street, e.city,e.state,e.pincode
from employees e);

/*Cursor*/
/*1. create a cursor to get the details of customer living in hubli*/
declare
cursor cur is select c_id,fi_name,la_name,city from customers where upper(city) like '%HUBLI';
cid customers.c_id%type;
fn customers.fi_name%type;
ln customers.la_name%type;
ct customers.city%type;
begin
open cur;
loop
fetch cur into cid,fn,ln,ct;
exit when cur%notfound;
dbms_output.put_line('Customer id='||cid||' customer name='||fn||' '||ln ||' City ='||ct);
end loop;
close cur;
end;
/

/*2.create a cursor to get the details of customers who paid via cash*/
declare
cursor cur is select c_id,fi_name,la_name,city from customers where c_id in (select cu_id from payment where paymethod ='cash');
cid customers.c_id%type;
fn customers.fi_name%type;
ln customers.la_name%type;
ct customers.city%type;
begin
open cur;
loop
fetch cur into cid,fn,ln,ct;
exit when cur%notfound;
dbms_output.put_line('Customer id='||cid||' customer name='||fn||' '||ln ||' City ='||ct);
end loop;
close cur;
end;
/

/*Function*/
/*1.Counting the number of customers living in Dharwad*/
create or replace function total_customers
return number
is
total number(2):=0;
begin
select count(*) into total
from customers 
where city like '%Dharwad%';
return total;
end;
/
/*executing function1*/
declare
c number(2);
begin
c:=total_customers();
dbms_output.put_line('Total is '||c);
end;
/

/*2.count number of customers paying cash */
create or replace function customers_cash
return number
is
total number(3):=0;
begin
select count(*) into total
from customers,payment 
where c_id=cu_id and paymethod like '%cash%';
return total;
end;
/

/*executing function2*/
declare
c number(3);
begin
c:=customers_cash();
dbms_output.put_line('Total no of customers paying cash ='||c);
end;
/

/*Procedure*/
/*1.Create a procedure for bill if quantity and price are given*/
DECLARE 
   qty number; 
   price number;
PROCEDURE bill(x IN number,y in out number) IS 
BEGIN 
  y := x * y; 
END;  
BEGIN 
   qty:= 23; 
   price:=200;
   bill(qty,price);
   dbms_output.put_line(' bill amt =' || price); 
END; 
/
/*2.Create a procedure to display price of a flower*/
create or replace procedure flower(name in varchar2)
as 
fprice number;
begin
select price into fprice from flower_item where f_name=name;
dbms_output.put_line('Price of  '||name||' is = '||fprice);
end;
/
/*execute procedure flower*/
execute flower('Red roses');
/*2.create a procedure to welcome the customers to the shop*/
create or replace procedure greet
as
begin
   dbms_output.put_line('Welcome to the shop...');
end;
/

/*Trigger*/
/*1. Create a trigger if there is any insertion, deletion or updation of any row in employees table*/
create or replace trigger t
before insert or delete or update on employees
begin
case 
when inserting then
dbms_output.put_line('inserted');
when deleting then
dbms_output.put_line('deleted');
when updating then
dbms_output.put_line('updated');
end case;
end;
/

/*2. Create a trigger if the salary of the employee is updated*/
create or replace trigger sal_change
after update of salary on employees
for each row
begin
dbms_output.put_line('updated salary successfully');
end;
/


/*3.create a trigger if there is any update,delete or insert in customers table*/ 
create or replace trigger t4
before insert or delete or update on customers
begin 
case 
when inserting then
dbms_output.put_line('inserted data');
when deleting then 
dbms_output.put_line('deleted data');
when updating then
dbms_output.put_line('updated data');
end case;
end;
/

commit;