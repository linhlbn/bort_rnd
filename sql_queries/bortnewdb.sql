-- Table: Department 
CREATE TABLE Department (
    department_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    description TEXT
);

-- Table: Role
CREATE TABLE Role (
    role_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    description TEXT
);

-- Table: RoleGuideline
CREATE TABLE RoleGuideline (
    role_guideline_id SERIAL PRIMARY KEY,
    guideline_content TEXT,
    created_atTIMESTAMP,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Table: EmpUser
CREATE TABLE EmpUser (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    joined_dateTIMESTAMP,
    position VARCHAR(50),
    role_id INT,
    department_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Table: Privilege
CREATE TABLE Privilege (
    privilege_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    permission_level INT
);

-- Table: DocumentType
CREATE TABLE DocumentType (
    doc_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50)
);

-- Table: PerformanceReview
CREATE TABLE PerformanceReview (
    performance_review_id SERIAL PRIMARY KEY,
    content TEXT,
    rating INT,
    reviewed_atTIMESTAMP,
    review_source VARCHAR(50),
    user_id INT,
    manager_id INT,
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (manager_id) REFERENCES EmpUser(user_id)
);

-- Table: UserPrivilege
CREATE TABLE UserPrivilege (
    user_privilege_id SERIAL PRIMARY KEY,
    description VARCHAR(50),
    start_dateTIMESTAMP,
    end_dateTIMESTAMP,
    user_id INT,
    privilege_id INT,
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id)
);

-- Table: OnboardingPlanTemplate
CREATE TABLE OnboardingPlanTemplate (
    onboarding_plan_template_id SERIAL PRIMARY KEY,
    description TEXT,
    role_id INT,
    department_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Table: TaskTemplate
CREATE TABLE TaskTemplate (
    task_template_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    description TEXT
);

-- Table: OnboardingPlanRecord
CREATE TABLE OnboardingPlanRecord (
    onboarding_plan_id SERIAL PRIMARY KEY,
    start_dateTIMESTAMP,
    end_dateTIMESTAMP,
    status VARCHAR(100),
    current_task_id INT,
    user_id INT,
    onboarding_plan_template_id INT,
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (onboarding_plan_template_id) REFERENCES OnboardingPlanTemplate(onboarding_plan_template_id)
);

-- Table: Document
CREATE TABLE Document (
    document_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_dateTIMESTAMP,
    storage_url VARCHAR(50),
    doc_type_id INT,
    privilege_id INT,
    embedding VARCHAR(50),
    FOREIGN KEY (doc_type_id) REFERENCES DocumentType(doc_type_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id)
);

-- Table: TaskRecord
CREATE TABLE TaskRecord (
    task_id SERIAL PRIMARY KEY,
    due_dateTIMESTAMP,
    status VARCHAR(50),
    sort_number INT,
    document_id INT,
    onboarding_plan_id INT,
    task_template_id INT,
    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (onboarding_plan_id) REFERENCES OnboardingPlanRecord(onboarding_plan_id),
    FOREIGN KEY (task_template_id) REFERENCES TaskTemplate(task_template_id)
);

-- Table: RequiredDocument
CREATE TABLE RequiredDocument (
    required_document_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    description TEXT,
    required_dateTIMESTAMP,
    task_id INT,
    FOREIGN KEY (task_id) REFERENCES TaskRecord(task_id)
);

-- Table: ChatbotMetric
CREATE TABLE ChatbotMetric (
    chatbot_metric_id SERIAL PRIMARY KEY,
    gb_answer_ratio VARCHAR(50),
    avg_processing_time VARCHAR(50),
    daily_avg_usage FLOAT,
    created_atTIMESTAMP,
    updated_atTIMESTAMP
);

-- Table: Chatbot
CREATE TABLE Chatbot (
    chatbot_id SERIAL PRIMARY KEY,
    role VARCHAR(50),
    description VARCHAR(50),
    chatbot_metric_id INT,
    FOREIGN KEY (chatbot_metric_id) REFERENCES ChatbotMetric(chatbot_metric_id)
);

-- Table: Conversation
CREATE TABLE Conversation (
    conversation_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_atTIMESTAMP,
    user_id INT,
    chatbot_id INT,
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (chatbot_id) REFERENCES Chatbot(chatbot_id)
);

-- Table: AiMessage
CREATE TABLE AiMessage (
    ai_message_id SERIAL PRIMARY KEY,
    content TEXT,
    created_atTIMESTAMP,
    conversation_id INT,
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);

-- Table: Rating
CREATE TABLE Rating (
    rating_id SERIAL PRIMARY KEY,
    table_type VARCHAR(50),
    created_atTIMESTAMP,
    ai_message_id INT,
    FOREIGN KEY (ai_message_id) REFERENCES AiMessage(ai_message_id)
);

-- Table: HumanMessage
CREATE TABLE HumanMessage (
    human_message_id SERIAL PRIMARY KEY,
    content TEXT,
    created_atTIMESTAMP,
    conversation_id INT,
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);

CREATE TABLE Goal (
    goal_id SERIAL PRIMARY KEY, 
    content TEXT,
    created_atTIMESTAMP,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id)
);


INSERT INTO Goal (content, created_at) values ('Complete Project A','2023-01-10')

-- Table: update tasktemplate - one time runner:
-- ALTER TABLE tasktemplate
-- ADD COLUMN priority varchar(10);
-- ALTER TABLE tasktemplate
-- DROP COLUMN priority CASCADE;

-- ALTER TABLE onboardingtaskplantemplate
-- ADD COLUMN sort_number int;

-- ALTER TABLE onboardingtaskplantemplate
-- ADD COLUMN process_id INTEGER,
-- ADD CONSTRAINT fk_process
-- FOREIGN KEY (process_id) REFERENCES process(process_id);

CREATE TABLE IF NOT EXISTS quiz (
    quiz_id SERIAL PRIMARY KEY, 
    question TEXT,
    correct_answer VARCHAR(100),
    answer_record TEXT[],
    task_template_id INTEGER, 
    FOREIGN KEY (task_template_id) REFERENCES tasktemplate(task_template_id)
);

CREATE TABLE if not exists ComponentScores (
    Component_Score_Id SERIAL PRIMARY KEY,
    User_Id INT,
    Task_Type_Id INT,
    User_Component_Score INT,
    Updated_Date TIMESTAMP,
    FOREIGN KEY (User_Id) REFERENCES EmpUser(User_Id),
    FOREIGN KEY (Task_Type_Id) REFERENCES task_types(Task_Type_Id)
);
