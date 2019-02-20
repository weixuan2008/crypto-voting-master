[![][ButlerImage]][website] 

DingDing v1.0 (for java 1.8 +)
-------------------

An monolith and open source e-commerce based on springboot tech stack with rest API service and freemark backend management GUI. 

This prototype can provide the most of common REST APIs for below mudules
It will be splitted into multiple micro service in another repository using spring cloud tech stack.
- Shopping cart
- Category
- Product
- Order
- Inventory
- User
For fontend web project, it is still in progress status.

See the demo:
-------------------
http://www.dingding.com:8080


To get the code:
-------------------
Clone the repository:
$ git clone https://github.com/weixuan2008/dingding-monolith.git

If this is your first time using Github, review http://help.github.com to learn the basics.

You can also download the zip file containing the code from https://github.com/weixuan2008/dingding-monolith/archive/master.zip

To build the application:
-------------------	
From the command line with Maven installed:

	$ cd dingding-monolith-master
	$ mvn clean install -Dmaven.test.skip=true
	

Run the application from Spring boot 
-------------------

       $ cd dingding-micro-service
       $ mvn spring-boot:run

Run the application from Spring boot in eclipse
-------------------

Right click on com.hy.micro.service.dingding.DingdingService

run as Java Application or springboot 


Run the application from docker 
-------------------
	1. build image from Dockerfile
	   docker build -t dingding-v1.0
	2. docker run -d --name dingding -p 9600:9600 -t dingding-v1.0

### Access the application:
-------------------

Access the deployed web application at: http://localhost:9600/

Acces the admin section at: http://localhost:8080/admin

#####username : admin
#####password : password

The instructions above will let you run the application with default settings and configurations.
Of cause, you can change application.yml file to customize yourself configuration.
Please read the instructions on how to connect to MySQL, configure an email server and configure other subsystems


![image](https://github.com/weixuan2008/dingding-monolith/blob/master/dingding-monolith-master/core/dingding-micro-service/src/main/resources/static/images/order.PNG)

![image](https://github.com/weixuan2008/dingding-monolith/blob/master/dingding-monolith-master/core/dingding-micro-service/src/main/resources/static/images/product.PNG)

![image](https://github.com/weixuan2008/dingding-monolith/blob/master/dingding-monolith-master/core/dingding-micro-service/src/main/resources/static/images/inventory.PNG)

![image](https://github.com/weixuan2008/dingding-monolith/blob/master/dingding-monolith-master/core/dingding-micro-service/src/main/resources/static/images/vendor.PNG)


### Documentation:
-------------------
TODO




[ButlerImage]: https://github.com/weixuan2008/dingding-monolith/blob/master/dingding-monolith-master/core/dingding-micro-service/src/main/resources/static/images/dingding-red.png
[website]: https://github.com/weixuan2008/dingding-monolith









https://ropsten.etherscan.io/tx/0xb62e6739ac42a22881431e6e626adf384c85b7bd185ceee725ef2e5d2d968a49

https://ropsten.etherscan.io/tx/0x41ac7cb51fb8c852e667ca88b60380abc5fab496211460495f5bbf632ee5ccdd
https://ropsten.etherscan.io/address/0xbe9c2c487bf791c85a4b96ea056c1d075ab4f154




CBD8771EC0143DD0620E3570289D67FE44C7BD0FED39531E0217356587F0D960
0x805A5bf432806C92F7CFA2d51cE46A7caa8D7e52
WEI XUAN




