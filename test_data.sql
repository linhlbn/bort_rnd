-- Insert data into Privilege table
INSERT INTO Privilege (privilege_id, name, permission_level) VALUES
('PRIV001', 'Admin', 5),
('PRIV002', 'User', 3),
('PRIV003', 'Manager', 4),
('PRIV004', 'Guest', 1);

-- Insert data into Goal table
INSERT INTO Goal (goal_id, content, created_at, user_id) VALUES
('GOAL001', 'Complete Project A', '2023-01-10', 'USER001'),
('GOAL002', 'Attend Training Seminar', '2023-02-15', 'USER002'),
('GOAL003', 'Improve Sales by 20%', '2023-03-20', 'USER003'),
('GOAL004', 'Enhance Customer Support', '2023-04-25', 'USER004');

-- Insert data into DocumentType table
INSERT INTO DocumentType (doc_type_id, type_name) VALUES
('DOC001', 'PDF'),
('DOC002', 'Word'),
('DOC003', 'Excel'),
('DOC004', 'Image');

-- Insert data into Document table
INSERT INTO Document (document_id, name, created_date, storage_url, doc_type_id, privilege_id, embedding) VALUES
('DOC001', 'Report.pdf', '2023-01-05', '/storage/Report.pdf', 'DOC001', 'PRIV001', 'Embed1'),
('DOC002', 'Proposal.docx', '2023-02-10', '/storage/Proposal.docx', 'DOC002', 'PRIV002', 'Embed2'),
('DOC003', 'Data.xlsx', '2023-03-15', '/storage/Data.xlsx', 'DOC003', 'PRIV003', 'Embed3'),
('DOC004', 'Image.jpg', '2023-04-20', '/storage/Image.jpg', 'DOC004', 'PRIV004', 'Embed4');

-- Insert data into UserPrivilege table
INSERT INTO UserPrivilege (user_privilege_id, description, start_date, end_date, user_id, privilege_id) VALUES
('UP001', 'Admin Access', '2023-01-01', '2023-12-31', 'USER001', 'PRIV001'),
('UP002', 'User Access', '2023-02-01', '2023-11-30', 'USER002', 'PRIV002'),
('UP003', 'Manager Access', '2023-03-01', '2023-10-31', 'USER003', 'PRIV003'),
('UP004', 'Guest Access', '2023-04-01', '2023-09-30', 'USER004', 'PRIV004');

-- Insert data into RequiredDocument table
INSERT INTO RequiredDocument (required_document_id, title, description, required_date, task_id) VALUES
('REQDOC001', 'Identification Proof', 'Valid ID for verification', '2023-01-15', 'TASK001'),
('REQDOC002', 'Contract Agreement', 'Legal contract for signing', '2023-02-20', 'TASK002'),
('REQDOC003', 'Financial Records', 'Financial statements for review', '2023-03-25', 'TASK003'),
('REQDOC004', 'Project Plan', 'Detailed plan for project execution', '2023-04-30', 'TASK004');

-- Insert data into PerformanceReview table
INSERT INTO PerformanceReview (performance_review_id, content, rating, reviewed_at, review_source, user_id, manager_id) VALUES
('PERF001', 'Exceeded expectations', 5, '2023-01-20', 'Self-assessment', 'USER001', 'USER002'),
('PERF002', 'Met all goals', 4, '2023-02-25', 'Peer review', 'USER002', 'USER003'),
('PERF003', 'Room for improvement', 3, '2023-03-30', 'Manager review', 'USER003', 'USER004'),
('PERF004', 'Needs development', 2, '2023-04-05', '360-degree review', 'USER004', 'USER001');

-- Insert data into Chatbot table
INSERT INTO Chatbot (chatbot_id, role, description, chatbot_metric_id) VALUES
('CHAT001', 'Customer Support', 'Assists in customer queries', 'METRIC001'),
('CHAT002', 'HR Assistant', 'Helps with HR-related queries', 'METRIC002'),
('CHAT003', 'Sales Advisor', 'Provides sales-related information', 'METRIC003'),
('CHAT004', 'Technical Support', 'Assists with technical issues', 'METRIC004');

-- Insert data into ChatbotMetric table
INSERT INTO ChatbotMetric (chatbot_metric_id, gb_answer_ratio, avg_processing_time, daily_avg_usage, created_at, updated_at) VALUES
('METRIC001', '80%', '30 seconds', 200, '2023-01-01', '2023-01-15'),
('METRIC002', '75%', '35 seconds', 180, '2023-02-01', '2023-02-15'),
('METRIC003', '85%', '25 seconds', 220, '2023-03-01', '2023-03-15'),
('METRIC004', '90%', '20 seconds', 250, '2023-04-01', '2023-04-15');

-- Insert data into TaskRecord table
INSERT INTO TaskRecord (task_id, due_date, status, sort_number, document_id, onboarding_plan_id, task_template_id) VALUES
('TASK001', '2023-01-15', 'Pending', 1, 'DOC001', 'ONBOARD001', 'TEMPLATE001'),
('TASK002', '2023-02-20', 'InProgress', 2, 'DOC002', 'ONBOARD002', 'TEMPLATE002'),
('TASK003', '2023-03-25', 'Completed', 3, 'DOC003', 'ONBOARD003', 'TEMPLATE003'),
('TASK004', '2023-04-30', 'Pending', 4, 'DOC004', 'ONBOARD004', 'TEMPLATE004');

-- Insert data into OnboardingPlanRecord table
INSERT INTO OnboardingPlanRecord (onboarding_plan_id, start_date, end_date, status, current_task_id, user_id, onboarding_plan_template_id) VALUES
('ONBOARD001', '2023-01-01', '2023-01-31', 'Active', 'TASK001', 'USER001', 'TEMPLATE001'),
('ONBOARD002', '2023-02-01', '2023-02-28', 'Inactive', 'TASK002', 'USER002', 'TEMPLATE002'),
('ONBOARD003', '2023-03-01', '2023-03-31', 'Active', 'TASK003', 'USER003', 'TEMPLATE003'),
('ONBOARD004', '2023-04-01', '2023-04-30', 'Inactive', 'TASK004', 'USER004', 'TEMPLATE004');

-- Insert data into User table (renamed from EmpUser)
INSERT INTO EmpUser (user_id, username, password, first_name, last_name, joined_date, position, role_id, department_id) VALUES
('USER001', 'johndoe', 'password1', 'John', 'Doe', '2023-01-01', 'Manager', 'ROLE001', 'DEPT001'),
('USER002', 'janedoe', 'password2', 'Jane', 'Doe', '2023-02-01', 'Developer', 'ROLE002', 'DEPT002'),
('USER003', 'alice', 'password3', 'Alice', 'Smith', '2023-03-01', 'Sales Executive', 'ROLE003', 'DEPT003'),
('USER004', 'bob', 'password4', 'Bob', 'Johnson', '2023-04-01', 'Intern', 'ROLE004', 'DEPT004');

-- Insert data into Department table
INSERT INTO Department (department_id, title, description) VALUES
('DEPT001', 'Management', 'Oversees company operations'),
('DEPT002', 'Engineering', 'Handles product development'),
('DEPT003', 'Sales', 'Responsible for sales activities'),
('DEPT004', 'HR', 'Manages human resources');

-- Insert data into Conversation table
INSERT INTO Conversation (conversation_id, name, created_at, user_id, chatbot_id) VALUES
('CONV001', 'Support Chat', '2023-01-10', 'USER001', 'CHAT001'),
('CONV002', 'HR Assistance', '2023-02-15', 'USER002', 'CHAT002'),
('CONV003', 'Sales Queries', '2023-03-20', 'USER003', 'CHAT003'),
('CONV004', 'Technical Support', '2023-04-25', 'USER004', 'CHAT004');

-- Insert data into HumanMessage table
INSERT INTO HumanMessage (human_message_id, content, created_at, conversation_id) VALUES
('HUMAN001', 'How can I help you?', '2023-01-10', 'CONV001'),
('HUMAN002', 'I need information about benefits', '2023-02-15', 'CONV002'),
('HUMAN003', 'Can you provide pricing details?', '2023-03-20', 'CONV003'),
('HUMAN004', 'My device is not working', '2023-04-25', 'CONV004');

-- Insert data into AiMessage table
INSERT INTO AiMessage (ai_message_id, content, created_at, conversation_id) VALUES
('AI001', 'I am here to assist you.', '2023-01-11', 'CONV001'),
('AI002', 'Sure, let me get that information for you.', '2023-02-16', 'CONV002'),
('AI003', 'Here are the pricing details you requested.', '2023-03-21', 'CONV003'),
('AI004', 'Let's troubleshoot the issue.', '2023-04-26', 'CONV004');

-- Insert data into Rating table
INSERT INTO Rating (rating_id, table_type, created_at, ai_message_id) VALUES
('RATE001', 'AiMessage', '2023-01-11', 'AI001'),
('RATE002', 'AiMessage', '2023-02-16', 'AI002'),
('RATE003', 'AiMessage', '2023-03-21', 'AI003'),
('RATE004', 'AiMessage', '2023-04-26', 'AI004');

-- Insert data into TaskTemplate table
INSERT INTO TaskTemplate (task_template_id, title, description) VALUES
('TEMPLATE001', 'Managerial Training', 'Training for managerial skills'),
('TEMPLATE002', 'Development Task', 'Coding and development task'),
('TEMPLATE003', 'Sales Training', 'Training for sales techniques'),
('TEMPLATE004', 'Internship Task', 'Tasks for internship program');

-- Insert data into OnboardingPlanTemplate table
INSERT INTO OnboardingPlanTemplate (onboarding_plan_template_id, description, role_id, department_id) VALUES
('TEMPLATE001', 'Management onboarding plan', 'ROLE001', 'DEPT001'),
('TEMPLATE002', 'Development onboarding plan', 'ROLE002', 'DEPT002'),
('TEMPLATE003', 'Sales onboarding plan', 'ROLE003', 'DEPT003'),
('TEMPLATE004', 'Internship onboarding plan', 'ROLE004', 'DEPT004');

-- Insert data into Role table
INSERT INTO Role (role_id, title, description) VALUES
('ROLE001', 'Manager', 'Oversees teams and operations'),
('ROLE002', 'Developer', 'Codes and develops applications'),
('ROLE003', 'Sales Executive', 'Handles sales and client relations'),
('ROLE004', 'Intern', 'Entry-level position for learning');

-- Insert data into RoleGuideline table
INSERT INTO RoleGuideline (role_guideline_id, guideline_content, created_at, role_id) VALUES
('GUIDE001', 'Managerial guidelines content', '2023-01-01', 'ROLE001'),
('GUIDE002', 'Development guidelines content', '2023-02-01', 'ROLE002'),
('GUIDE003', 'Sales guidelines content', '2023-03-01', 'ROLE003'),
('GUIDE004', 'Internship guidelines content', '2023-04-01', 'ROLE004');
