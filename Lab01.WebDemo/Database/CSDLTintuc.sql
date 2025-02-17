CREATE DATABASE Tintuc;
GO

USE Tintuc;
GO

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS Tintuc;
DROP TABLE IF EXISTS Theloaitin;

-- Xóa dữ liệu cũ nếu có
DELETE FROM Tintuc;
DELETE FROM Theloaitin;

-- Kiểm tra dữ liệu
SELECT * FROM Theloaitin;
SELECT * FROM Tintuc;

-- Tạo bảng thể loại tin
CREATE TABLE Theloaitin (
    IDLoai INT PRIMARY KEY IDENTITY(1,1),
    Tentheloai NVARCHAR(100) NOT NULL
);

-- Tạo bảng tin tức
CREATE TABLE Tintuc (
    IdTin INT PRIMARY KEY IDENTITY(1,1),
    IDLoai INT FOREIGN KEY REFERENCES Theloaitin(IDLoai),
    Tieudetin NVARCHAR(200) NOT NULL,
    Noidungtin NTEXT NOT NULL,
	ImagePath NVARCHAR(255)
);

-- Chèn danh sách thể loại tin
INSERT INTO Theloaitin (Tentheloai) VALUES 
    (N'Thời sự'), (N'Khoa học'), (N'Công nghệ'), (N'Thế giới'),
    (N'Kinh doanh'), (N'Sức khỏe'), (N'Thể thao'), (N'Giải trí'),
    (N'Pháp luật'), (N'Giáo dục'), (N'Đời sống'), (N'Xe'),
    (N'Du lịch'), (N'Ý kiến'), (N'Tâm sự');
GO

-- Chèn tin tức cho từng thể loại (Mỗi thể loại có 5-7 tin)
INSERT INTO Tintuc (IDLoai, Tieudetin, Noidungtin, ImagePath) VALUES 
-- Thời sự
(1, N'Thời tiết Hà Nội thay đổi bất ngờ', N'Nhiệt độ giảm mạnh trong ngày hôm nay tại Hà Nội...', 'thoi-su-1.jpg'),
(1, N'Chính phủ triển khai dự án giao thông mới', N'Dự án cải tạo đường cao tốc chính thức khởi công...', 'thoi-su-2.jpg'),
(1, N'Kỳ họp Quốc hội với nhiều quyết sách quan trọng', N'Các đại biểu đã thảo luận về vấn đề kinh tế và xã hội...', 'thoi-su-3.jpg'),
(1, N'Tình hình lũ lụt miền Trung', N'Miền Trung tiếp tục chịu ảnh hưởng của đợt mưa lũ lớn...', 'thoi-su-4.jpg'),
(1, N'Chỉ thị mới về bảo vệ môi trường đô thị', N'Chính phủ ban hành chỉ thị về bảo vệ môi trường xanh sạch...', 'thoi-su-5.jpg'),

-- Khoa học
(2, N'Phát hiện hành tinh có dấu hiệu sự sống', N'Các nhà thiên văn học phát hiện hành tinh có bầu khí quyển giống Trái Đất...', 'khoa-hoc-1.jpg'),
(2, N'Công nghệ AI phát triển mạnh mẽ', N'Trí tuệ nhân tạo đang thay đổi ngành khoa học...', 'khoa-hoc-2.jpg'),
(2, N'Vaccine mới chống biến thể COVID-19', N'Loại vaccine mới có khả năng bảo vệ cao hơn...', 'khoa-hoc-3.jpg'),
(2, N'Ứng dụng năng lượng mặt trời trong đời sống', N'Nhiều nước đang tăng cường đầu tư vào năng lượng sạch...', 'khoa-hoc-4.jpg'),
(2, N'Tác động của biến đổi khí hậu đến đại dương', N'Biến đổi khí hậu đang ảnh hưởng nghiêm trọng đến hệ sinh thái biển...', 'khoa-hoc-5.jpg'),

-- Công nghệ
(3, N'Samsung ra mắt điện thoại gập mới', N'Mẫu điện thoại gập mới có nhiều cải tiến về thiết kế...', 'cong-nghe-1.jpg'),
(3, N'Trí tuệ nhân tạo và tương lai công việc', N'AI đang dần thay thế nhiều công việc truyền thống...', 'cong-nghe-2.jpg'),
(3, N'Windows 12 có gì mới?', N'Phiên bản Windows tiếp theo có nhiều tính năng cải tiến...', 'cong-nghe-3.jpg'),
(3, N'Đánh giá chi tiết MacBook M3', N'Model MacBook mới hứa hẹn hiệu năng vượt trội...', 'cong-nghe-4.jpg'),
(3, N'Công nghệ blockchain mở ra cơ hội mới', N'Blockchain không chỉ ứng dụng trong tiền điện tử...', 'cong-nghe-5.jpg'),

-- Thế giới
(4, N'Căng thẳng gia tăng tại khu vực Đông Á', N'Tình hình chính trị khu vực Đông Á tiếp tục có diễn biến phức tạp...', 'the-gioi-1.jpg'),
(4, N'Liên Hợp Quốc kêu gọi hợp tác toàn cầu', N'Tổng thư ký LHQ nhấn mạnh tầm quan trọng của hợp tác quốc tế...', 'the-gioi-2.jpg'),
(4, N'Kinh tế toàn cầu đang phục hồi', N'Báo cáo mới nhất cho thấy sự tăng trưởng kinh tế mạnh mẽ...', 'the-gioi-3.jpg'),
(4, N'Cuộc họp thượng đỉnh G20', N'Lãnh đạo các nước đang thảo luận về chính sách kinh tế chung...', 'the-gioi-4.jpg'),
(4, N'Nhiều quốc gia điều chỉnh chính sách nhập cư', N'Các nước đang xem xét lại chính sách nhập cư để đối phó với thách thức mới...', 'the-gioi-5.jpg'),

-- Kinh doanh
(5, N'Giá vàng tăng cao kỷ lục', N'Thị trường vàng đang có những biến động mạnh...', 'kinh-doanh-1.jpg'),
(5, N'Các startup công nghệ thu hút vốn đầu tư', N'Nhiều startup nhận được khoản đầu tư lớn từ các quỹ quốc tế...', 'kinh-doanh-2.jpg'),
(5, N'Chính sách thuế mới ảnh hưởng đến doanh nghiệp', N'Chuyên gia phân tích tác động của chính sách thuế mới...', 'kinh-doanh-3.jpg'),
(5, N'Cổ phiếu công nghệ tiếp tục tăng trưởng', N'Thị trường chứng khoán ghi nhận mức tăng mạnh...', 'kinh-doanh-4.jpg'),
(5, N'Xu hướng tiêu dùng sau đại dịch', N'Người tiêu dùng thay đổi thói quen mua sắm sau COVID-19...', 'kinh-doanh-5.jpg'),

-- Sức khỏe
(6, N'Đột phá trong điều trị ung thư', N'Các nhà khoa học vừa phát triển phương pháp điều trị ung thư mới...', 'suc-khoe-1.jpg'),
(6, N'Chế độ ăn uống giúp kéo dài tuổi thọ', N'Nghiên cứu mới cho thấy mối liên hệ giữa chế độ ăn và tuổi thọ...', 'suc-khoe-2.jpg'),
(6, N'Tập thể dục đúng cách giúp cải thiện sức khỏe', N'Các chuyên gia khuyến nghị phương pháp tập luyện phù hợp...', 'suc-khoe-3.jpg'),
(6, N'Bệnh cúm gia tăng vào mùa đông', N'Các bác sĩ cảnh báo về sự gia tăng của bệnh cúm trong mùa lạnh...', 'suc-khoe-4.jpg'),
(6, N'Công nghệ y học mới giúp phẫu thuật chính xác hơn', N'Trí tuệ nhân tạo hỗ trợ phẫu thuật chính xác đến từng milimet...', 'suc-khoe-5.jpg'),

-- Thể thao
(7, N'Messi lập kỷ lục mới', N'Ngôi sao bóng đá người Argentina vừa đạt cột mốc ghi bàn ấn tượng...', 'the-thao-1.jpg'),
(7, N'Chung kết Champions League sắp diễn ra', N'Hai đội bóng mạnh nhất châu Âu sẽ tranh tài trong trận chung kết...', 'the-thao-2.jpg'),
(7, N'Việt Nam thắng lớn tại SEA Games', N'Tuyển thể thao Việt Nam đạt thành tích xuất sắc tại đại hội thể thao khu vực...', 'the-thao-3.jpg'),
(7, N'Cristiano Ronaldo chính thức gia nhập CLB mới', N'CR7 vừa ký hợp đồng với câu lạc bộ hàng đầu châu Âu...', 'the-thao-4.jpg'),
(7, N'F1 mùa giải mới khởi tranh', N'Các đội đua đã sẵn sàng cho mùa giải Công thức 1 hấp dẫn...', 'the-thao-5.jpg'),

-- Giải trí
(8, N'Bom tấn Hollywood công phá phòng vé', N'Bộ phim mới nhất của đạo diễn đình đám đạt doanh thu kỷ lục...', 'giai-tri-1.jpg'),
(8, N'Ca sĩ Sơn Tùng M-TP ra mắt MV mới', N'MV mới của nam ca sĩ nhanh chóng đạt triệu lượt xem...', 'giai-tri-2.jpg'),
(8, N'Lễ trao giải Grammy năm nay có gì đặc biệt?', N'Các nghệ sĩ hàng đầu thế giới tề tựu tại Grammy 2025...', 'giai-tri-3.jpg'),
(8, N'Xu hướng thời trang hè năm nay', N'Các nhà mốt tung ra bộ sưu tập xu hướng cho mùa hè...', 'giai-tri-4.jpg'),
(8, N'BTS thông báo về tour diễn mới', N'Nhóm nhạc K-pop đình đám sẽ tổ chức tour diễn toàn cầu...', 'giai-tri-5.jpg'),

-- Pháp luật
(9, N'Chính phủ siết chặt quy định phòng chống tội phạm mạng', N'Tăng cường các biện pháp xử lý các vụ lừa đảo trên mạng...', 'phap-luat-1.jpg'),
(9, N'Vụ án lớn tại TP.HCM sắp xét xử', N'Tòa án sắp đưa ra phán quyết cho vụ án hình sự gây xôn xao dư luận...', 'phap-luat-2.jpg'),
(9, N'Luật mới về lao động chính thức có hiệu lực', N'Những điểm thay đổi quan trọng trong luật lao động năm nay...', 'phap-luat-3.jpg'),
(9, N'Cảnh sát bắt giữ nhóm tội phạm ma túy', N'Lực lượng chức năng vừa triệt phá đường dây buôn bán ma túy lớn...', 'phap-luat-4.jpg'),
(9, N'Quy định mới về xử phạt giao thông', N'Người dân cần nắm rõ các quy định mới để tránh vi phạm...', 'phap-luat-5.jpg'),

-- Giáo dục
(10, N'Bộ GD&ĐT công bố đề án đổi mới giáo dục', N'Nhiều chính sách quan trọng sẽ được áp dụng từ năm học tới...', 'giao-duc-1.jpg'),
(10, N'Các trường đại học công bố điểm chuẩn xét tuyển', N'Nhiều trường đại học top đầu đã công bố điểm chuẩn chính thức...', 'giao-duc-2.jpg'),
(10, N'Tác động của AI trong giáo dục', N'Công nghệ trí tuệ nhân tạo đang thay đổi cách học tập của học sinh...', 'giao-duc-3.jpg'),
(10, N'Kỳ thi tốt nghiệp THPT sắp diễn ra', N'Học sinh trên cả nước chuẩn bị bước vào kỳ thi quan trọng...', 'giao-duc-4.jpg'),
(10, N'Chương trình học STEM ngày càng phổ biến', N'Nhiều trường học đưa chương trình STEM vào giảng dạy...', 'giao-duc-5.jpg'),

-- Đời sống
(11, N'Xu hướng sống tối giản ngày càng phổ biến', N'Nhiều người đang chọn lối sống tối giản để giảm căng thẳng...', 'doi-song-1.jpg'),
(11, N'Bí quyết cân bằng công việc và gia đình', N'Chuyên gia chia sẻ cách sắp xếp cuộc sống hiệu quả...', 'doi-song-2.jpg'),
(11, N'Những thực phẩm giúp tăng cường miễn dịch', N'Các loại thực phẩm giúp cơ thể khỏe mạnh trong mùa dịch...', 'doi-song-3.jpg'),
(11, N'Phong cách nội thất năm 2025', N'Xu hướng trang trí nhà cửa mới nhất được ưa chuộng...', 'doi-song-4.jpg'),
(11, N'Những điều cần biết khi mua nhà lần đầu', N'Chuyên gia bất động sản chia sẻ kinh nghiệm mua nhà...', 'doi-song-5.jpg'),

-- Xe
(12, N'Tesla ra mắt mẫu xe điện mới', N'Chiếc xe điện mới có phạm vi hoạt động lên đến 600km...', 'xe-1.jpg'),
(12, N'Giá xăng dầu có xu hướng giảm nhẹ', N'Thị trường dầu mỏ biến động khiến giá xăng giảm nhẹ...', 'xe-2.jpg'),
(12, N'Đánh giá xe Honda City 2025', N'Mẫu sedan hạng B với nhiều nâng cấp đáng chú ý...', 'xe-3.jpg'),
(12, N'Xu hướng xe hơi tự lái ngày càng phổ biến', N'Công nghệ xe tự lái đang phát triển mạnh...', 'xe-4.jpg'),
(12, N'Các hãng xe đẩy mạnh sản xuất xe điện', N'Nhiều hãng xe lớn đang tập trung vào phân khúc xe điện...', 'xe-5.jpg'),

-- Du lịch
(13, N'Khám phá vẻ đẹp đảo Bali', N'Bali tiếp tục là điểm đến hấp dẫn nhất Đông Nam Á...', 'du-lich-1.jpg'),
(13, N'Những địa điểm du lịch nên đi vào mùa hè', N'Danh sách các điểm đến lý tưởng cho kỳ nghỉ hè...', 'du-lich-2.jpg'),
(13, N'Kinh nghiệm du lịch tiết kiệm chi phí', N'Cách lập kế hoạch du lịch hợp lý và tiết kiệm...', 'du-lich-3.jpg'),
(13, N'Những bãi biển đẹp nhất thế giới', N'Danh sách những bãi biển đẹp mê hồn...', 'du-lich-4.jpg'),
(13, N'Đại lý du lịch mở bán vé sớm cho mùa du lịch 2025', N'Nhiều ưu đãi dành cho du khách đặt vé sớm...', 'du-lich-5.jpg'),

-- Ý kiến
(14, N'Chuyên gia kinh tế phân tích thị trường', N'Nhiều ý kiến trái chiều về xu hướng kinh tế sắp tới...', 'y-kien-1.jpg'),
(14, N'Giáo viên chia sẻ về đổi mới giáo dục', N'Những thách thức khi triển khai chương trình mới...', 'y-kien-2.jpg'),
(14, N'Người dân phản ánh về chất lượng dịch vụ công', N'Bộ phận tiếp nhận phản ánh đang tiếp thu ý kiến từ người dân...', 'y-kien-3.jpg'),
(14, N'Cần có giải pháp bền vững cho giao thông đô thị', N'Chuyên gia đề xuất phương án giúp giảm ùn tắc giao thông...', 'y-kien-4.jpg'),
(14, N'Cộng đồng khởi nghiệp chia sẻ kinh nghiệm', N'Những lời khuyên từ các doanh nhân thành công...', 'y-kien-5.jpg'),

-- Tâm sự
(15, N'Câu chuyện đầy cảm động của một người cha đơn thân', N'Người cha đã vượt qua khó khăn để nuôi dạy con cái...', 'tam-su-1.jpg'),
(15, N'Những tâm sự của người lao động xa quê', N'Cảm xúc của người con xa quê trong ngày Tết...', 'tam-su-2.jpg'),
(15, N'Những nỗi niềm của một người mẹ đơn thân', N'Tâm sự về những khó khăn và niềm vui trong hành trình làm mẹ...', 'tam-su-3.jpg'),
(15, N'Trải lòng của một người về hưu', N'Sống chậm lại và tận hưởng những năm tháng bình yên...', 'tam-su-4.jpg'),
(15, N'Tâm sự của du học sinh Việt Nam tại Mỹ', N'Những khó khăn và thử thách khi học tập nơi xứ người...', 'tam-su-5.jpg');
GO


SELECT IdTin, Tieudetin, ImagePath FROM Tintuc;





