CREATE TABLE if not exists DocumentRoleAccess (
    access_id SERIAL PRIMARY KEY,
    doc_type_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (doc_type_id) REFERENCES DocumentType(doc_type_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- 'company_info'
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(1, 1), --  Manager
(1, 2), --  Senior
(1, 3), --  Employee
(1, 4); --  New Employee

-- 'company_project'
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(2, 1); --  Manager

-- 'candidate_cv'
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(3, 1), -- Manager
(3, 2); -- Senior

select * from privilege;
select * from Documenttype;
select * from DocumentRoleAccess;