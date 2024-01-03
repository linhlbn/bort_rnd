CREATE TABLE if not exists DocumentRoleAccess (
    access_id SERIAL PRIMARY KEY,
    doc_type_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (doc_type_id) REFERENCES DocumentType(doc_type_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- 'company_info' 
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(1, 1),  -- Chief Executive Officer (CEO)
(1, 2),  -- Chief Technology Officer (CTO)
(1, 3),  -- Chief Product Officer (CPO)
(1, 4),  -- Chief Growth Officer (CGO)
(1, 5),  -- UI/UX Specialist
(1, 6),  -- Operations Specialist
(1, 7),  -- Senior Mobile Developer
(1, 8),  -- BD associate
(1, 9),  -- Junior Web Developer
(1, 10), -- Junior Web / Wordpress Developer
(1, 11), -- UI/UX Intern
(1, 12); -- Developer Intern

-- 'company_project' - 1, 2, 3, 4
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(2, 1),  -- Chief Executive Officer (CEO)
(2, 2),  -- Chief Technology Officer (CTO)
(2, 3),  -- Chief Product Officer (CPO)
(2, 4);  -- Chief Growth Officer (CGO)

-- 'candidate_cv' - 1, 2, 3, 4
INSERT INTO DocumentRoleAccess (doc_type_id, role_id) VALUES
(3, 1),  -- Chief Executive Officer (CEO)
(3, 2),  -- Chief Technology Officer (CTO)
(3, 3),  -- Chief Product Officer (CPO)
(3, 4);  -- Chief Growth Officer (CGO)

select * from Role;
select * from Documenttype;
select * from DocumentRoleAccess;

-- document in detail about flow related to chatbot will be updated later