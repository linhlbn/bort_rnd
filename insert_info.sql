ALTER TABLE role
RENAME COLUMN title TO role_position;

DELETE FROM role;

-- Insert data into role table
INSERT INTO Role (role_id, role_position, description) VALUES
('001', 'Chief Executive Officer (CEO)', 'The CEO is typically responsible for making major corporate decisions, managing overall operations, and ensuring that the company meets its goals. The CEO often acts as the public face of the company and works closely with other executives to shape the companys direction.'),
('002', 'Chief Technology Officer (CTO)', 'CTO is a high-level executive responsible for overseeing the technological aspects of a company. They focus on developing and implementing technology strategies, leading research and development efforts, and ensuring that the companys technological infrastructure aligns with its goals. The CTO often works on innovation, evaluates new technologies, and ensures that the company stays competitive in its industry through technology.'),
('003', 'Chief Product Officer (CPO)', 'A CPO is responsible for the entire lifecycle of a companys products or services. They lead product development, innovation, and strategy, ensuring that the companys offerings align with market demands and customer needs.'),
('004', 'Chief Growth Officer (CGO)', 'A CGO is primarily focused on driving and managing growth strategies for the company. They oversee various aspects related to business expansion, customer acquisition, and revenue growth.'),
('005', 'UI/UX Specialist', 'Oversees teams and operations related to user interface (UI) and user experience (UX) design.'),
('006', 'Operations Specialist', 'Codes and develops applications while likely overseeing administrative operations.'),
('007', 'Senior Mobile Developer', 'Handles sales and client relations with a focus on mobile development.'),
('008', 'BD associate', 'Entry-level position for learning'),
('009', 'Junior Web Developer', 'Entry-level position for learning'),
('010', 'Junior Web / Wordpress Developer', 'Entry-level position for learning'),
('011', 'UI/UX Intern', 'Entry-level position for learning'),
('012', 'Developer Intern', 'Entry-level position for learning');

INSERT INTO department (department_id, title, description) VALUES
('001', 'CEO Office', 'Coordinating and facilitating communication between different departments. Assisting in strategic planning and decision-making.');

INSERT INTO department (department_id, title, description) VALUES
('002', 'Sales & Marketing', 'Focuses on selling the companys products or services and promoting its brand.');

INSERT INTO department (department_id, title, description) VALUES
('003', 'R&D', 'Focuses on innovation, creating new products, improving existing products, and conducting research to drive the companys future growth.');

INSERT INTO department (department_id, title, description) VALUES
('004', 'UI/UX & Product', 'Concentrates on user interface (UI), user experience (UX), and product development.');

INSERT INTO department (department_id, title, description) VALUES
('005', 'Operation', 'Manages the day-to-day operations and ensures smooth functioning of the company.');

INSERT INTO EmpUser (user_id, username, password, first_name, last_name, joined_date, position, role_id, department_id) VALUES
('001', 'tri_pham', 'abc123@', 'Duc Tri', 'Pham', '2022-01-19', 'Chief Executive Officer (CEO)', '001', '001'),
('002', 'hai_le', 'abc123@', 'Trung Hai', 'Le', '2022-01-19', 'Chief Technology Officer (CTO)', '002', '003'),
('003', 'hai_to', 'abc123@', 'Ky Hai', 'To', '2022-01-19', 'Chief Product Officer (CPO)', '003', '004'),
('004', 'son_nguyen', 'abc123@', 'Thai Son', 'Nguyen', '2022-01-19', 'Chief Growth Officer (CGO)', '004', '002'),
('005', 'tho_pham', 'abc123@', 'Huynh Tho', 'Pham', '2023-07-13', 'UI/UX Specialist', '004', '001'),
('006', 'minhanh_dang', 'abc123@', 'Thi Minh Anh', 'Dang', '2023-10-02', 'Operations Specialist', '006', '002'),
('007', 'vuong_nguyen', 'abc123@', 'Quoc Vuong', 'Nguyen', '2023-10-01', 'Senior Mobile Developer', '007', '003'),
('008', 'thanh_le', 'abc123@', 'Tien Thanh', 'Le', '2023-10-26', 'Business Developement Associate', '008', '004'),
('009', 'trang_nguyen', 'abc123@', 'Van Trang', 'Nguyen', '2023-11-06', 'Junior JavaScript/TypeScript Developer', '009', '004'),
('010', 'tho_nguyen', 'abc123@', 'Phuoc Tho', 'Nguyen', '2023-11-20', 'Junior Web / Wordpress Developer', '010', '004'),
('011', 'vy_vo', 'abc123@', 'Hoang Vy', 'Vo', '2023-09-18', 'UI/UX Designer Intern', '011', '004'),
('012', 'quan_nguyen', 'abc123@', 'Khac Anh Quan', 'Nguyen', '2023-12-01', 'Intern Developer', '012', '004');

ALTER TABLE empuser
ADD COLUMN signed_contract_date DATE;

UPDATE empuser
SET signed_contract_date = '2023-09-13'
WHERE role_id = '005';

UPDATE empuser
SET signed_contract_date = '2023-10-02'
WHERE role_id = '006';

UPDATE empuser
SET signed_contract_date = '2023-10-01'
WHERE role_id = '007';

UPDATE empuser
SET signed_contract_date = '2023-10-26'
WHERE role_id = '008';

UPDATE empuser
SET signed_contract_date = '2023-11-06'
WHERE role_id = '009';

UPDATE empuser
SET signed_contract_date = '2023-11-20'
WHERE role_id = '010';

UPDATE empuser
SET signed_contract_date = '2023-09-18'
WHERE role_id = '011';

UPDATE empuser
SET signed_contract_date = '2023-12-01'
WHERE role_id = '012';

UPDATE empuser
SET department_id = '001'
WHERE role_id = '001';

UPDATE empuser
SET department_id = '003'
WHERE role_id = '002';

UPDATE empuser
SET department_id = '004'
WHERE role_id = '003';

UPDATE empuser
SET department_id = '002'
WHERE role_id = '004';

UPDATE empuser
SET department_id = '004'
WHERE role_id = '005';

UPDATE empuser
SET signed_contract_date = '2023-10-02', department_id = '005'
WHERE role_id = '006';

UPDATE empuser
SET signed_contract_date = '2023-10-01', department_id = '003'
WHERE role_id = '007';

UPDATE empuser
SET signed_contract_date = '2023-10-26',department_id = '002'
WHERE role_id = '008';

UPDATE empuser
SET signed_contract_date = '2023-11-06', department_id = '003'
WHERE role_id = '009';

UPDATE empuser
SET signed_contract_date = '2023-11-20', department_id = '004'
WHERE role_id = '010';

UPDATE empuser
SET signed_contract_date = '2023-09-18', department_id = '002'
WHERE role_id = '011';

UPDATE empuser
SET signed_contract_date = '2023-12-01', department_id = '003'
WHERE role_id = '012';

INSERT INTO privilege (privilege_id, name, permission_level)
VALUES (1, 'Manager', '1'),
       (2, 'Senior', '2'),
       (3, 'Employee', '3');
	   
INSERT INTO documentType (doc_type_id, type_name)
VALUES (001, 'PDF File'),
       (002, 'CSV File'),
       (003, 'Docx File');

ALTER TABLE document
ALTER COLUMN name TYPE VARCHAR(250);

UPDATE document
SET name = 'Orthian Services', storage_url = 'https://storage.cloud.google.com/bort_storage/Orthian%20Services.pdf?authuser=1', doc_type_id = '001', privilege_id = 3
WHERE document_id = 1;

UPDATE document
SET name = 'Data Project Information', storage_url = 'https://storage.cloud.google.com/bort_storage/Data%20Project%20Information.csv?authuser=1', doc_type_id = '002', privilege_id = 1
WHERE document_id = 2;

UPDATE document
SET name = 'Android Bui_Thanh_Khoi_-_Software_Engineer+(2)', storage_url = 'https://storage.cloud.google.com/bort_storage/Fresher%20Android%20Developer%20(JD%20_%20CV)/CV/Android%20Bui_Thanh_Khoi_-_Software_Engineer%2B(2).pdf?authuser=1', doc_type_id = '001', privilege_id = 1
WHERE document_id = 3;

INSERT INTO document (document_id, name, created_date, storage_url, doc_type_id, privilege_id)
VALUES (4, 'Android Danh_Vo_Senior_Resume', '2023-12-07 19:34:47', 'https://storage.cloud.google.com/bort_storage/Fresher%20Android%20Developer%20(JD%20_%20CV)/CV/Android%20Danh_Vo_Senior_Resume.pdf?authuser=1', '001', '1'),
       (5, 'CV NguyenDucHung_AndroidDeveloper','2023-12-07 19:34:49', 'https://storage.cloud.google.com/bort_storage/Fresher%20Android%20Developer%20(JD%20_%20CV)/CV/CV%20NguyenDucHung_AndroidDeveloper.pdf?authuser=1', '001', '1'),
       (6, 'CV [Android]Tam_Nguyen', '2023-12-07 19:34:48', 'https://storage.cloud.google.com/bort_storage/Fresher%20Android%20Developer%20(JD%20_%20CV)/CV/CV%20%5BAndroid%5DTam_Nguyen.pdf?authuser=1', '001', '1'),
	   (7, 'Fresher Android Developer', '2023-12-07 19:34:47', 'https://storage.cloud.google.com/bort_storage/Fresher%20Android%20Developer%20(JD%20_%20CV)/JD/Fresher%20Android%20Developer.docx?authuser=1', '003', '3'),
	   (8, 'Fresher An_Nguyen_-_iOS_Developer', '2023-12-07 19:34:47', 'https://storage.cloud.google.com/bort_storage/Fresher%20IOS%20Developer%20(JD%20_%20CV)/CV/Fresher%20An_Nguyen_-_iOS_Developer.pdf?authuser=1', '001', '1'),
	   (9, 'Fresher HoangMinh-Resume', '2023-12-07 19:36:34', 'https://storage.cloud.google.com/bort_storage/Fresher%20IOS%20Developer%20(JD%20_%20CV)/CV/Fresher%20HoangMinh-Resume.pdf.pdf?authuser=1', '001', '1'),
	   (10, 'Fresher Le-Anh-Duc-iOS-Developer', '2023-12-07 19:36:34', 'https://storage.cloud.google.com/bort_storage/Fresher%20IOS%20Developer%20(JD%20_%20CV)/CV/Fresher%20Le-Anh-Duc-iOS-Developer.pdf?authuser=1', '001', '1'),
	   (11, 'Fresher iOS+Developer_TruongHoangAnh+', '2023-12-07 19:36:35', 'https://storage.cloud.google.com/bort_storage/Fresher%20IOS%20Developer%20(JD%20_%20CV)/CV/Fresher%20iOS%2BDeveloper_TruongHoangAnh%2B.pdf?authuser=1', '001', '1'),
	   (12, 'Fresher IOS Developer', '2023-12-07 19:36:34', 'https://storage.cloud.google.com/bort_storage/Fresher%20IOS%20Developer%20(JD%20_%20CV)/JD/Fresher%20IOS%20Developer.docx?authuser=1', '003', '3'),
	   (13, 'CV-Interview/CV_HuyNguyen (React Native _ Flutter)', '2023-12-07 19:36:58', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Interview/CV_HuyNguyen%20(React%20Native%20_%20Flutter).pdf?authuser=1', '001', '1'),
	   (14, 'CV-Interview/CV_Junior_DuongHoangLong', '2023-12-07 19:36:59', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_DuongHoangLong.pdf?authuser=1', '001', '1'),
	   (15, 'CV-Interview/CV_Junior_Phan_Nhat_Duy', '2023-12-07 19:36:59', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_Phan_Nhat_Duy.pdf?authuser=1', '001', '1'),
	   (16, 'CV-Interview/CV_Trang Nguyen Van', '2023-12-07 19:36:59', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Trang%20Nguyen%20Van.pdf?authuser=1', '001', '1'),
	   (17, 'CV-Rejected/CV_Fresher_PHAM_HUYNH_MI', '2023-12-07 19:37:00', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Rejected/CV_Fresher_PHAM_HUYNH_MI.pdf?authuser=1', '001', '1'),
	   (18, 'CV-Rejected/CV_Fresher_TranThanhTung', '2023-12-07 19:37:01', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Rejected/CV_Fresher_TranThanhTung.pdf?authuser=1', '001', '1'),
	   (19, 'CV-Rejected/CV_Junior_DuongHuuNguyen', '2023-12-07 19:37:02', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Rejected/CV_Junior_DuongHuuNguyen.pdf?authuser=1', '001', '1'),
	   (20, 'CV-Rejected/CV_Junior_TranQuangHuy', '2023-12-07 19:37:01', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/CV-Rejected/CV_Junior_TranQuangHuy.pdf?authuser=1', '001', '1'),
	   (21, 'Junior JavaScript_TypeScript Developer JD', '2023-12-07 19:36:59', 'https://storage.cloud.google.com/bort_storage/Junior%20JavaScript-TypeScript%20Developer%20(JD%20_%20CV)/JD/Junior%20JavaScript_TypeScript%20Developer%20JD.docx?authuser=1', '003', '3'),
	   (22, 'CV-Interview/CV_Junior_Khuong Tran Resume - IT Application', '2023-12-07 19:37:11', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_Khuong%20Tran%20Resume%20-%20IT%20Application.pdf?authuser=1', '001', '1'),
	   (23, 'CV-Interview/CV_Junior_PhamMinhDung_CV', '2023-12-07 19:37:11', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_PhamMinhDung_CV.pdf?authuser=1', '001', '1'),
	   (24, 'CV-Interview/CV_Junior_ThaiBao-CV-Wordpress', '2023-12-07 19:37:11', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_ThaiBao-CV-Wordpress.pdf?authuser=1', '001', '1'),
	   (25, 'CV-Interview/CV_Junior_ThoNguyen', '2023-12-07 19:37:11', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Interview/CV_Junior_ThoNguyen.pdf?authuser=1', '001', '1'),
	   (26, 'CV-Rejected/CV_Junior- Lu Tai Lan', '2023-12-07 19:37:11', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Rejected/CV_Junior-%20Lu%20Tai%20Lan.pdf?authuser=1', '001', '1'),
	   (27, 'CV-Rejected/Junior_Nguon Duc-cv', '2023-12-07 19:37:09', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Rejected/Junior_Nguon%20Duc-cv.pdf?authuser=1', '001', '1'),
	   (28, 'CV-Rejected/Junior_Pham Duc Thanh CV - Wordpress Developer', '2023-12-07 19:37:10', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Rejected/Junior_Pham%20Duc%20Thanh%20CV%20-%20Wordpress%20Developer.pdf?authuser=1', '001', '1'),
	   (29, 'CV-Rejected/Junior_ngdangtu-cv', '2023-12-07 19:37:10', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/CV-Rejected/Junior_ngdangtu-cv.pdf?authuser=1', '001', '1'),
	   (30, 'Junior WordPress Developer JD', '2023-12-07 19:37:09', 'https://storage.cloud.google.com/bort_storage/Junior%20WordPress%20Developer%20(JD%20_%20CV)/JD/Junior%20WordPress%20Developer%20JD.docx?authuser=1', '003', '3'),
	   (31, 'JD-Interview/Marketing Specialist CV+-+Marketing+Specialist+-+Phan+Ngoc+TRan', '2023-12-07 19:37:17', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Interview/Marketing%20Specialist%20CV%2B-%2BMarketing%2BSpecialist%2B-%2BPhan%2BNgoc%2BTRan.pdf?authuser=1', '001', '1'),
	   (32, 'JD-Interview/Marketing Specialist CV_Phan+Ngoc+Thao+Tien', '2023-12-07 19:37:18', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Interview/Marketing%20Specialist%20CV_Phan%2BNgoc%2BThao%2BTien.pdf?authuser=1', '001', '1'),
	   (33, 'JD-Interview/Marketing Specialist Duong+Thi+Quynh+Anh_Marketing+_+Communications', '2023-12-07 19:37:18', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Interview/Marketing%20Specialist%20Duong%2BThi%2BQuynh%2BAnh_Marketing%2B_%2BCommunications.pdf?authuser=1', '001', '1'),	   (34, 'JD-Interview/Marketing Specialist Nguyen+Thi+Thu+Hai+digital-+cv', '2023-12-07 19:37:17', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Interview/Marketing%20Specialist%20Nguyen%2BThi%2BThu%2BHai%2Bdigital-%2Bcv.pdf?authuser=1', '001', '1'),
	   (35, 'JD-Rejected/CV Marketing_Executive_Application_ThaoHo_2006.pdf', '2023-12-07 19:37:19', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Rejected/CV%20Marketing_Executive_Application_ThaoHo_2006.pdf?authuser=1', '001', '1'),
	   (36, 'JD-Rejected/Marketing Specialist Vi+Manh+Tuan(Tony)_Resume2', '2023-12-07 19:37:18', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Rejected/Marketing%20Specialist%20Vi%2BManh%2BTuan(Tony)_Resume2.pdf?authuser=1', '001', '1'),
	   (37, 'JD-Interview/Marketing Specialist Duong+Thi+Quynh+Anh_Marketing+_+Communications', '2023-12-07 19:37:18', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD-Interview/Marketing%20Specialist%20Duong%2BThi%2BQuynh%2BAnh_Marketing%2B_%2BCommunications.pdf?authuser=1', '001', '1'),
	   (38, 'Marketing Specialist', '2023-12-07 19:37:17', 'https://storage.cloud.google.com/bort_storage/MKT%20Specialist%20(JD%20_%20CV)/JD/Marketing%20Specialist.docx?authuser=1', '003', '3'),
	   (39, 'Nguyen Thi Thanh Van-UIUX Designer Intern', '2023-12-07 19:37:26', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/CV/Nguyen%20Thi%20Thanh%20Van-UIUX%20Designer%20Intern.pdf?authuser=1', '001', '1'),
	   (40, 'Nguyen Tran - CV 2023', '2023-12-07 19:37:30', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/CV/Nguyen%20Tran%20-%20CV%202023.pdf?authuser=1', '001', '1'),
	   (41, 'Nguyen Thi Thanh Van-UIUX Designer Intern', '2023-12-07 19:37:26', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/CV/Nguyen%20Thi%20Thanh%20Van-UIUX%20Designer%20Intern.pdf?authuser=1', '001', '1'),
	   (42, 'UIUX_Intern_Nguyễn Văn Pháp (1)', '2023-12-07 19:37:29', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/CV/UIUX_Intern_Nguy%E1%BB%85n%20V%C4%83n%20Ph%C3%A1p%20(1).pdf?authuser=1', '001', '1'),
	   (43, 'UI_UX Intern Designer', '2023-12-07 19:37:27', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/JD/UI_UX%20Intern%20Designer.docx?authuser=1', '003', '3'),
	   (44, 'CV - Rejected/Junior CV - LE ANH TUAN - Multimedia- UIUX', '2023-12-07 19:37:39', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV%20-%20Rejected/Junior%20CV%20-%20LE%20ANH%20TUAN%20-%20Multimedia-%20UIUX.pdf?authuser=1', '001', '1'),
	   (45, 'UIUX_Intern_Nguyễn Văn Pháp (1)', '2023-12-07 19:37:29', 'https://storage.cloud.google.com/bort_storage/UI-UX%20Intern%20Designer%20(JD%20_%20CV)/CV/UIUX_Intern_Nguy%E1%BB%85n%20V%C4%83n%20Ph%C3%A1p%20(1).pdf?authuser=1', '001', '1'),
	   (46, 'CV - Rejected/Junior CV - UI UX Designer - Ha Nguyen Yen Nhi', '2023-12-07 19:37:39', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV%20-%20Rejected/Junior%20CV%20-%20UI%20UX%20Designer%20-%20Ha%20Nguyen%20Yen%20Nhi.pdf?authuser=1', '001', '1'),
	   (47, 'CV - Rejected/Junior CV-Vo Phuong Thao-UXUI', '2023-12-07 19:37:39', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV%20-%20Rejected/Junior%20CV-Vo%20Phuong%20Thao-UXUI.pdf?authuser=1', '001', '1'),
	   (48, 'CV - Rejected/Junior CV_NguyenHoangTuanHuu_UXUI', '2023-12-07 19:37:40', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV%20-%20Rejected/Junior%20CV_NguyenHoangTuanHuu_UXUI.pdf?authuser=1', '001', '1'),
	   (49, 'CV-Interview/Junior CV PHAM BA DUY', '2023-12-07 19:37:41', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV-Interview/Junior%20CV%20PHAM%20BA%20DUY.pdf?authuser=1', '001', '1'),
	   (50, 'CV-Interview/Junior CV_PhamHuynhTho_UXUI', '2023-12-07 19:37:40', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV-Interview/Junior%20CV_PhamHuynhTho_UXUI.pdf?authuser=1', '001', '1'),
	   (51, 'CV-Interview/Junior LE_HONG_CUONG_(1)', '2023-12-07 19:37:40', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV-Interview/Junior%20LE_HONG_CUONG_(1).pdf?authuser=1', '001', '1'),
	   (52, 'CV-Interview/Junior LE_HONG_CUONG_', '2023-12-07 19:37:41', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/CV-Interview/Junior%20LE_HONG_CUONG_.pdf?authuser=1', '001', '1'),
	   (53, '(JUNIOR) APP _ WEB DESIGNER', '2023-12-07 19:37:37', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/JD/(JUNIOR)%20APP%20_%20WEB%20DESIGNER.docx?authuser=1', '003', '3'),
	   (54, '(JUNIOR) APP _ WEB DESIGNER', '2023-12-07 19:37:37', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/JD/(JUNIOR)%20APP%20_%20WEB%20DESIGNER.pdf?authuser=1', '003', '3'),
	   (55, '~$UNIOR) APP _ WEB DESIGNER.docx', '2023-12-07 19:37:37', 'https://storage.cloud.google.com/bort_storage/Web-App%20Designer%20(JD%20_%20CV)/JD/~%24UNIOR)%20APP%20_%20WEB%20DESIGNER.docx?authuser=1', '003', '3');

ALTER TABLE EmpUser
ADD COLUMN privilege_id INT;

ALTER TABLE EmpUser
ADD CONSTRAINT fk_empuser_privilege FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id);

UPDATE EmpUser
SET privilege_id = 1
WHERE user_id = 1;

UPDATE EmpUser
SET privilege_id = 1
WHERE user_id = 2;

UPDATE EmpUser
SET privilege_id = 1
WHERE user_id = 3;

UPDATE EmpUser
SET privilege_id = 1
WHERE user_id = 4;

UPDATE EmpUser
SET privilege_id = 2
WHERE user_id = 5;

UPDATE EmpUser
SET privilege_id = 1
WHERE user_id = 6;

UPDATE EmpUser
SET privilege_id = 2
WHERE user_id = 7;

UPDATE EmpUser
SET privilege_id = 3
WHERE user_id = 8;

UPDATE EmpUser
SET privilege_id = 3
WHERE user_id = 9;

UPDATE EmpUser
SET privilege_id = 3
WHERE user_id = 10;

UPDATE EmpUser
SET privilege_id = 3
WHERE user_id = 11;

UPDATE EmpUser
SET privilege_id = 3
WHERE user_id = 12;
