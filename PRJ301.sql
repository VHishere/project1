CREATE DATABASE PRJ301
GO

use PRJ301
GO

create table Account (
    AccountID int IDENTITY(1,1) primary key,
    Email varchar(50) not null unique,
    Password varchar(50) not null,
    Name varchar(50) not null,
    Phone varchar(50) not null,
    Address varchar(50),
    Role int not null -- 1: admin, 2: user, 3:staff
);
GO

create table Orders (
    OrderID int IDENTITY(1,1) primary key,
    AccountID int not null,
    OrderDate date not null,
    Address varchar(50) not null,
	TotalPrice int not null,
    Status int not null, -- 1: Processing, 0: Completed, 2: Cancelled 
    foreign key (AccountID) references Account(AccountID)
);
GO

create table Category (
    CategoryID int IDENTITY(1,1) primary key,
    Name varchar(50) not NULL,
    Image varchar(500),
);
GO

create table Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name varchar(50) not null,
    Price int not null,
    Description varchar(50) not null,
    Image varchar(500),
    CategoryID int not null,
	Status int not null DEFAULT 1, -- 0 delete -- 1: available, 2: not available
    foreign key (CategoryID) references Category(CategoryID)
);
GO

create table OrderDetail (
    OrderID int not null,
    ProductID int not null,
    Quantity int not null
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Product(ProductID),
    primary key (OrderID, ProductID)
);
GO

--------------------------- Insert data ---------------------------

-- account
insert into Account values ('duc@gmail.com', '1', 'minh duc', '0124727283', 'Ha Dong, Ha Noi', 2);
insert into Account values ('long@abc.com', '123456', 'viet long', '0199928372', 'Nam Tu Liem, Ha Noi', 2);
insert into Account values ('dung@fu.com', '123456', 'thi dung', '0123456789', '', 2);
insert into Account values ('admin', '1', 'admin', '0123456789', '', 1);

-- category
insert into Category values ( 'Chicken', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRagS4BJVRJy9CuKNOt8rkqwDn9yaTuoi7a6VGPV4iDmw&s');
insert into Category values ('Burger', 'https://png.pngtree.com/png-clipart/20230928/original/pngtree-burger-png-images-png-image_13164937.png');
insert into Category values ( 'Pizza', 'https://w7.pngwing.com/pngs/56/985/png-transparent-pizza-margherita-sushi-pizza-pizza-delivery-pizza-thumbnail.png');
insert into Category values ( 'Drink', 'https://pngimg.com/uploads/pepsi/pepsi_PNG8957.png');
insert into Category values ( 'Combo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxkHZMT9LL-ecy9MbQGuMRkPi0-pFewQLMz8dqY0Ulrw&s');

-- type 1: Chicken
insert into Product values ('Henry Chicken', 40, 'Chicken made by Henry', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHJQ-ArP-vv7EB3MmRNnD42ILvA-u6AYgFlCcAnTOjLg&s', 1, 1);
insert into Product values ('Henry Family', 100, 'Combo 3 Pcs Henry Chicken', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgWJqyi-oVdAtN5je-sG-o1Pv_sibZ_bH6J2wJdTDLlUIiKULTsXD_11S3CabxeayPh3Q&usqp=CAU', 1, 1);
insert into Product values ('Chicken Cheese', 40, 'Cheese chicken', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSbEthiJW_s--7GMVJViBINIZ2K217FH3LKTzpJhxEOw&s', 1, 1);
insert into Product values ('Cheese Family', 40, 'Combo 6Pcs Chicken Cheese', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRENjB86cJMHhoHGJYjTL1NuHxhfrSMV4zo9OKJyW_21g&s', 1, 1);
insert into Product values ('Grilled Chicken', 40, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRqxS75lHmdmHCe8cXElCjVtYVzWIrHau_pWEkpzKdjg&s', 1, 1);

-- type 2: Burger
insert into Product values ('Beef Burger', 33, 'No description', 'https://t4.ftcdn.net/jpg/05/61/82/83/360_F_561828375_KCtTuNdpQTjHrMqDrcoCpoLaYhLrZQdI.jpg', 2, 1);
insert into Product values ('Fish Burger', 40, 'No description', 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTExL2Rlc2lnbndpdGhtZTA5X3JlYWxfcGhvdG9fY3Jpc3B5X2NoZWVzeV9maXNoX2J1cmdlcl9pc29sYXRlZF9vbl85M2JiMmYzYS02MGM1LTQ3MWUtODViZi03MmRjZTA1ZGYzNGZfMS5wbmc.png', 2, 1);
insert into Product values ('Shrimp Burger', 48, 'No description', 'https://media.istockphoto.com/id/159156179/photo/shrimp-burger.jpg?s=612x612&w=0&k=20&c=Emsstwo_JM6qFf0Trvjhc2Wmmd2KZryqnYdL6q_l4KU=', 2, 1);

-- type 3: Pizza
insert into Product values ('Pepperoni Pizza', 40, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUk8xaHjYsSPsG1uW-joR32qN7t6--YjpWjMSsORZnRw&s', 3, 1);
insert into Product values ( 'Cheese Pizza', 40, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdhGoVJvMvjquJ2GJ6zvKSvfSd7QitTBScW7rVEKfsjQ&s', 3, 1);
insert into Product values ( 'Seafood Pizza', 40, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUMi6fYECzeDEJEz04lTpV0DSatXRSWzu5poHRQT7LuA&s', 3, 1);

-- type 4: Drink
insert into Product values ( 'Coca Cola', 10, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZkLsCCIZAVcgpdkMti9Uw4m-_8zOxiuQftQ8L07lnhw&s', 4, 1);
insert into Product values ( 'Pepsi', 10, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuFH-sauON8xX9tFbFlmlKNQzFqc5qiFjIcUvJWwwwzw&s', 4, 1);
insert into Product values ( '7Up', 10, 'No description', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnXK5_SlpyEnGBuGD4VaWv-WC4ZPl4GoMvkLiEvxWTqA&s', 4, 1);

-- type 5: Combo
insert into Product values ( 'LChicken Combo', 80, '01 Henry Family - 01 Fried Fries', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlGIEknTSNAu4EUPYdQvGSJ1iBYS4QnY8WjPrJV_tUQg&s', 5, 1);
insert into Product values ( 'Beef Combo', 49, '01 Beef Burger - 01 Fried Fries', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW3XSpJTmpj43uWK6APLs5sva_iUGddzwyQnzPmd6tlA&s', 5, 1);
insert into Product values ( 'Fish Combo', 66, 'Fish - Fried Fries', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk6DCjSd0VyzgB76HIbG_0Cb3d9ruW9T5PvIVqoNOuJg&s', 5, 1);

-- order
insert into Orders values (1, '2023-12-12', 'Ha Dong, Ha Noi', 300, 1);

-- OrderDetail
insert into OrderDetail values (1, 1, 2);
insert into OrderDetail values (1, 5, 2);
insert into OrderDetail values (1, 11, 1);