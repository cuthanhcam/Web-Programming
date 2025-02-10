CREATE DATABASE Tintuc;
GO

USE Tintuc;
GO

CREATE TABLE Theloaitin (
    IDLoai INT PRIMARY KEY IDENTITY(1,1),
    Tentheloai NVARCHAR(100) NOT NULL
);

CREATE TABLE Tintuc (
    IdTin INT PRIMARY KEY IDENTITY(1,1),
    IDLoai INT FOREIGN KEY REFERENCES Theloaitin(IDLoai),
    Tieudetin NVARCHAR(100) NOT NULL,
    Noidungtin NTEXT NOT NULL
);

INSERT INTO Theloaitin (Tentheloai) VALUES (N'Kinh tế');

INSERT INTO Theloaitin (Tentheloai) VALUES (N'Thể thao');

INSERT INTO Tintuc (IDLoai, Tieudetin, Noidungtin) 
VALUES 
	(1, N'Khủng hoảng kinh tế trong năm 2012', N'Tình hình khủng hoảng kinh tế năm 2012 được các chuyên gia kinh tế đánh giá...');

INSERT INTO Tintuc (IDLoai, Tieudetin, Noidungtin) 
VALUES 
	(2, N'Tranh chấp trên biển Đông ngày càng căng thẳng', N'Trên các diễn đàn quân sự đang nóng dần về tình hình biển Đông...');


SELECT * FROM Theloaitin;
SELECT * FROM Tintuc;