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
