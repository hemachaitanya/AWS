        database:
--------------------------
        to store the data
    1)file:  its strore the data is retrive , draw back of this file is we can't work with multiple users on same XL sheet(same file)  at a time .
    2) database) data base is a collection of information 
        DBMS: (data base management system) dbms are softwares/ engines which allows multiple users to parellely work on same data either it read/write(read: select , write: creaate/update/insert the data)

type of database:
![images](./aws1.png)
    1)relational database: 
![images](./aws2.png)
* Relational Database are concept of Databases , we are design the data in terms of tables with rows and columes . the structure of the table is called as schema .
    each row repracend a record
    tables will maintaine unique structure
 relational db does not depends on the horizantal scalling because  application will split into microlithic process (Ex: book ticket it stores one server but our payment process stores in another because of load will be increases extra server will takes by using horizantal scalling )
 * vertical scalling is designed for relational db (it's designed for the read/write operations in single server , if we have too many  work loads we can increase the size of the server )

popular languages  of db engines
    * ms SQL db
    * Oracle
    * my SQL
    * maria db
    * postgre SQL
    * DB2

* db are used from application code aswell as db client s/w deal with data 
![images](./aws3.png)
SCALLiNG: majority of the application read more data then write(in this we have 2 servers one is master(write) , one is read . if incase we have too many read servers we can use)
![image](./aws4.png)


ADMINISTRATION: 
     to installing or patching or configuring 
        os
        dbms
    user management
    connection management
    backups and recovery
    performence tuning
    replications

2) NO SQL db: it has semi structure information .it is designed to support inbuild horizantal scalling . it does not imposed strict schemas(ex: fb, whats up msgs)

    types of no sql db

![images](./aws5.png)

dynamodb: lot of write papers which is push to the databa 
    it's support horizantal scalling content will not stores directly
in  horizantal scalling we have bidirectional 'replications' same way in vertical scalling we have one directional replications.

ON-PREMISES:

installing data in yor organizations/ server databases are generally servers which are connect from client in 3 popular ways
    1. command line
    2. GUI (grafical user interface)
    3. code (sdk)
ssms: sequel server management studio

db could not take extraspace when cpu and ram requires so we download SQL server then it creates service and backups with in 20min.

these server have more feautures and cost also high
* for database two componets are effected
    1. google(bigtable)
    2. amazon ( dynamodb ): open source application refactoring mysql, postgres are less cost, aurora
                            mango db
                            (aws)document dab
                            java
                              corratto
* 

### LOAD BALANCER

* * proxy serveer:
 
	filter out all the out bound network traffic(one service between clinet and application)
* revese proxy: 

filter out all the incomming traffic to the application

*** clint same its try to send traffic to same server(sticky section)

* loadbalancer:(to ensure request is forworded only the servers which are responding)
    (1)layer 4: ip,protocal, port
	
	(2)layer7:http, protocal,ip,sessions, sg(it's the little bit slow than layer -4)
	
* loadbalancer: 
		1. classic load balancers(4&7 layer lb ):  
		2.net-work lb: 4 layer(public dns present its have dns value)
		
		3. application lb: 7 layer (/order)
		
		4. gateway lb:
		route 53 is DNS as a service when ever giving to a own  organaization names 
		
		
		advanced details:
#### for clients we can't give this type of urls so
 * route 53 -- hosted zone --godaddy and chanch name server(it will take 24 hours)
 * local entries and create host file(we can't purchase  domain)

 ![hema](./Images/10.png)

* first we create web ec2 , order ec2 and admin ec2
* and working of loadbalancer is depends on
		path
        headers
        ips
        delete loadbalancers: listeners , admin, lb
        




