USE lab03banhang

DROP table Categories;
DROP table Products;

INSERT INTO Categories (Name) VALUES
	(N'Laptop'),
	(N'PC Gaming'),
	(N'Màn Hình'),
	(N'Bàn Phím'),
	(N'Chuột');
GO

INSERT INTO Products (Name, Price, Description, CategoryId, ImagePath) VALUES
	(N'Laptop Asus ROG', 2500.00, N'Laptop gaming mạnh mẽ với CPU Intel Core i9.', 1, 'product1'),
	(N'Laptop Dell XPS', 1800.00, N'Laptop mỏng nhẹ với màn hình 4K.', 1, 'product2'),
	(N'Laptop MacBook Pro', 2800.00, N'MacBook Pro M3 Pro mạnh mẽ.', 1, 'product3'),
	(N'PC Gaming Ryzen 9', 3500.00, N'PC gaming trang bị Ryzen 9 và RTX 4090.', 2, 'product4'),
	(N'PC Intel i7 RTX 3080', 2200.00, N'PC gaming cấu hình cao với Intel Core i7.', 2, 'product5'),
	(N'Màn Hình LG UltraGear', 500.00, N'Màn hình gaming 27 inch 144Hz.', 3, 'product6'),
	(N'Màn Hình Dell UltraSharp', 700.00, N'Màn hình thiết kế đồ họa 32 inch 4K.', 3, 'product7'),
	(N'Bàn Phím Cơ Corsair K95', 200.00, N'Bàn phím cơ Corsair RGB siêu nhạy.', 4, 'product8'),
	(N'Bàn Phím Logitech G Pro', 150.00, N'Bàn phím cơ dành cho game thủ.', 4, 'product9'),
	(N'Bàn Phím Razer Huntsman', 250.00, N'Bàn phím cơ switch quang học.', 4, 'product10'),
	(N'Chuột Logitech G502', 80.00, N'Chuột gaming cảm biến HERO 25K.', 5, 'product11'),
	(N'Chuột Razer DeathAdder', 70.00, N'Chuột gaming Razer siêu nhạy.', 5, 'product12'),
	(N'Chuột SteelSeries Rival 600', 100.00, N'Chuột gaming có cảm biến kép.', 5, 'product13'),
	(N'Chuột Corsair Dark Core', 90.00, N'Chuột gaming không dây siêu tốc.', 5, 'product14'),
	(N'Chuột Asus ROG Spatha', 120.00, N'Chuột gaming Asus ROG cao cấp.', 5, 'product15');
GO