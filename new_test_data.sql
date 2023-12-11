ALTER TABLE role
RENAME COLUMN title TO role_position;

UPDATE role
SET role_position = 'Chief Executive Officer (CEO)', description = 'The CEO is typically responsible for making major corporate decisions, managing overall operations, and ensuring that the company meets its goals. The CEO often acts as the public face of the company and works closely with other executives to shape the companys direction.'
WHERE role_id = 'ROLE001';

UPDATE role
SET role_position = 'Chief Technology Officer (CTO)', description = 'CTO is a high-level executive responsible for overseeing the technological aspects of a company. They focus on developing and implementing technology strategies, leading research and development efforts, and ensuring that the companys technological infrastructure aligns with its goals. The CTO often works on innovation, evaluates new technologies, and ensures that the company stays competitive in its industry through technology.'
WHERE role_id = 'ROLE002';

UPDATE role
SET role_position = 'Chief Product Officer (CPO)', description = 'A CPO is responsible for the entire lifecycle of a companys products or services. They lead product development, innovation, and strategy, ensuring that the companys offerings align with market demands and customer needs.'
WHERE role_id = 'ROLE003';

UPDATE role
SET role_position = 'Chief Growth Officer (CGO)', description = 'A CGO is primarily focused on driving and managing growth strategies for the company. They oversee various aspects related to business expansion, customer acquisition, and revenue growth.'
WHERE role_id = 'ROLE004';

UPDATE empuser
SET username = 'tri_pham', password = 'abc123@', first_name = 'Duc Tri', last_name = 'Pham', position = 'Chief Executive Officer (CEO)'
WHERE role_id = 'ROLE001';

UPDATE empuser
SET username = 'hai_le', password = 'abc123@', first_name = 'Trung Hai', last_name = 'Le', position = 'Chief Technology Officer (CTO)'
WHERE role_id = 'ROLE002';

UPDATE empuser
SET username = 'hai_to', password = 'abc123@', first_name = 'Ky Hai', last_name = 'To', position = 'Chief Product Officer (CPO)'
WHERE role_id = 'ROLE003';

UPDATE empuser
SET username = 'son_nguyen', password = 'abc123@', first_name = 'Thai Son', last_name = 'Nguyen', position = 'Chief Growth Officer (CGO)'
WHERE role_id = 'ROLE004';

-- Insert data into role table
INSERT INTO Role (role_id, role_position, description) VALUES
('ROLE005', 'UI/UX Specialist', 'Oversees teams and operations related to user interface (UI) and user experience (UX) design.'),
('ROLE006', 'Operations Specialist', 'Codes and develops applications while likely overseeing administrative operations.'),
('ROLE007', 'Senior Mobile Developer', 'Handles sales and client relations with a focus on mobile development.'),
('ROLE008', 'BD associate', 'Entry-level position for learning'),
('ROLE009', 'Junior Web Developer', 'Entry-level position for learning'),
('ROLE010', 'Junior Web / Wordpress Developer', 'Entry-level position for learning'),
('ROLE011', 'UI/UX Intern', 'Entry-level position for learning'),
('ROLE012', 'Developer Intern', 'Entry-level position for learning');


INSERT INTO EmpUser (user_id, username, password, first_name, last_name, joined_date, position, role_id, department_id) VALUES
('USER005', 'tho_pham', 'abc123@', 'Huynh Tho', 'Pham', '2023-07-13', 'UI/UX Specialist', 'ROLE005', 'DEPT001'),
('USER006', 'minhanh_dang', 'abc123@', 'Thi Minh Anh', 'Dang', '2023-10-02', 'Operations Specialist', 'ROLE006', 'DEPT002'),
('USER007', 'vuong_nguyen', 'abc123@', 'Quoc Vuong', 'Nguyen', '2023-10-01', 'Senior Mobile Developer', 'ROLE007', 'DEPT003'),
('USER008', 'thanh_le', 'abc123@', 'Tien Thanh', 'Le', '2023-10-26', 'Business Developement Associate', 'ROLE008', 'DEPT004'),
('USER009', 'trang_nguyen', 'abc123@', 'Van Trang', 'Nguyen', '2023-11-06', 'Junior JavaScript/TypeScript Developer', 'ROLE009', 'DEPT004'),
('USER010', 'tho_nguyen', 'abc123@', 'Phuoc Tho', 'Nguyen', '2023-11-20', 'Junior Web / Wordpress Developer', 'ROLE010', 'DEPT004'),
('USER011', 'vy_vo', 'abc123@', 'Hoang Vy', 'Vo', '2023-09-18', 'UI/UX Designer Intern', 'ROLE011', 'DEPT004'),
('USER012', 'quan_nguyen', 'abc123@', 'Khac Anh Quan', 'Nguyen', '2023-12-01', 'Intern Developer', 'ROLE012', 'DEPT004'),

ALTER TABLE empuser
ADD COLUMN signed_contract_date DATE;

UPDATE empuser
SET signed_contract_date = '2023-09-13'
WHERE role_id = 'ROLE005';

UPDATE empuser
SET signed_contract_date = '2023-10-02'
WHERE role_id = 'ROLE006';

UPDATE empuser
SET signed_contract_date = '2023-10-01'
WHERE role_id = 'ROLE007';

UPDATE empuser
SET signed_contract_date = '2023-10-26'
WHERE role_id = 'ROLE008';

UPDATE empuser
SET signed_contract_date = '2023-11-06'
WHERE role_id = 'ROLE009';

UPDATE empuser
SET signed_contract_date = '2023-11-20'
WHERE role_id = 'ROLE010';

UPDATE empuser
SET signed_contract_date = '2023-09-18'
WHERE role_id = 'ROLE011';

UPDATE empuser
SET signed_contract_date = '2023-12-01'
WHERE role_id = 'ROLE012';

UPDATE department
SET title = 'CEO Office', description = 'Coordinating and facilitating communication between different departments. Assisting in strategic planning and decision-making.'
WHERE department_id = 'DEPT001';

UPDATE department
SET title = 'Sales & Marketing', description = 'Focuses on selling the companys products or services and promoting its brand.'
WHERE department_id = 'DEPT002';

UPDATE department
SET title = 'R&D', description = 'Focuses on innovation, creating new products, improving existing products, and conducting research to drive the companys future growth.'
WHERE department_id = 'DEPT003';

UPDATE department
SET title = 'UI/UX & Product', description = 'Concentrates on user interface (UI), user experience (UX), and product development.'
WHERE department_id = 'DEPT004';

INSERT INTO Department (department_id, title, description) VALUES
('DEPT005', 'Operation', 'Manages the day-to-day operations and ensures smooth functioning of the company.');

UPDATE empuser
SET department_id = 'DEPT001'
WHERE role_id = 'ROLE001';

UPDATE empuser
SET department_id = 'DEPT003'
WHERE role_id = 'ROLE002';

UPDATE empuser
SET department_id = 'DEPT004'
WHERE role_id = 'ROLE003';

UPDATE empuser
SET department_id = 'DEPT002'
WHERE role_id = 'ROLE004';

UPDATE empuser
SET department_id = 'DEPT004'
WHERE role_id = 'ROLE005';

UPDATE empuser
SET signed_contract_date = '2023-10-02', department_id = 'DEPT005'
WHERE role_id = 'ROLE006';

UPDATE empuser
SET signed_contract_date = '2023-10-01', department_id = 'DEPT003'
WHERE role_id = 'ROLE007';

UPDATE empuser
SET signed_contract_date = '2023-10-26',department_id = 'DEPT002'
WHERE role_id = 'ROLE008';

UPDATE empuser
SET signed_contract_date = '2023-11-06', department_id = 'DEPT003'
WHERE role_id = 'ROLE009';

UPDATE empuser
SET signed_contract_date = '2023-11-20', department_id = 'DEPT004'
WHERE role_id = 'ROLE010';

UPDATE empuser
SET signed_contract_date = '2023-09-18', department_id = 'DEPT002'
WHERE role_id = 'ROLE011';

UPDATE empuser
SET signed_contract_date = '2023-12-01', department_id = 'DEPT003'
WHERE role_id = 'ROLE012';

