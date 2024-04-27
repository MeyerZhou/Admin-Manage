# Admin-Manage
This is a store management system for SMEs based on .NET Windows Form

**------------------------------ 27/04/2024 -----------------------------------**

To run this application, you have to prepare the following environment for developing and debugging
  1. C# Visual Studio .NET 4.6.1 Framework
  2. XAMPP with the function of Apache and MySQL enabled (you can also use other DBM software for managing the data but need to make sure the .sql file has been imported to the database )

To deploy the database through Apache. 
  1. run the XAMPP and enable Apache and MySQL, as shown below.
  ![image](https://github.com/MeyerZhou/Admin-Manage/assets/52095721/eb769e8a-177b-425a-9430-9e2a1b92cd4f)
  2. open your browser, and go to the following address for the visualised database (http://localhost/phpmyadmin/index.php) and should be like this:
  ![image](https://github.com/MeyerZhou/Admin-Manage/assets/52095721/f2e97ad4-690c-4841-98f2-67baf32b11da)
  3. Create and name the database as "db_SMS", and then import the database from the .sql file attached in this project. Please note, you can also create and name your own database but need to attach the DB name to the main application before you run so that the application can communicate with the DB.
  e.g. ![image](https://github.com/MeyerZhou/Admin-Manage/assets/52095721/677d2576-50ff-4410-8e0c-dbf7668a2703)


To deploy the developing environment, you have to download Visual Studio(2017-2019) from the Microsoft website and install the .NET 4.6.1 Framework targeting pack. 

![image](https://github.com/MeyerZhou/Admin-Manage/assets/52095721/bbb0df18-7ed1-4dc7-a3a3-b83efb730b0c)


Then, you could run the application if the database has successfully connected and the main interface will be shown as bellow:
![image](https://github.com/MeyerZhou/Admin-Manage/assets/52095721/49e9ea58-c3b0-4e43-8cd0-45620d10ff27)
