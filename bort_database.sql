-- Table: Privilege
CREATE TABLE Privilege (
    privilege_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    permission_level INT
);

-- Table: Goal
CREATE TABLE Goal (
    goal_id VARCHAR(50) PRIMARY KEY,
    content TEXT,
    created_at DATE,
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id)
);

-- Table: DocumentType
CREATE TABLE DocumentType (
    doc_type_id VARCHAR(50) PRIMARY KEY,
    type_name VARCHAR(50)
);

-- Table: Document
CREATE TABLE Document (
    document_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    created_date DATE,
    storage_url VARCHAR(50),
    doc_type_id VARCHAR(50),
    privilege_id VARCHAR(50),
    embedding VARCHAR(50),
    FOREIGN KEY (doc_type_id) REFERENCES DocumentType(doc_type_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id)
);

-- Table: UserPrivilege
CREATE TABLE UserPrivilege (
    user_privilege_id VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50),
    start_date DATE,
    end_date DATE,
    user_id VARCHAR(50),
    privilege_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(privilege_id)
);

-- Table: RequiredDocument
CREATE TABLE RequiredDocument (
    required_document_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50),
    description TEXT,
    required_date DATE,
    task_id VARCHAR(50),
    FOREIGN KEY (task_id) REFERENCES TaskRecord(task_id)
);

-- Table: PerformanceReview
CREATE TABLE PerformanceReview (
    performance_review_id VARCHAR(50) PRIMARY KEY,
    content TEXT,
    rating INT,
    reviewed_at DATE,
    review_source VARCHAR(50),
    user_id VARCHAR(50),
    manager_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (manager_id) REFERENCES EmpUser(user_id)
);

-- Table: Chatbot
CREATE TABLE Chatbot (
    chatbot_id VARCHAR(50) PRIMARY KEY,
    role VARCHAR(50),
    description VARCHAR(50),
    chatbot_metric_id VARCHAR(50),
    FOREIGN KEY (chatbot_metric_id) REFERENCES ChatbotMetric(chatbot_metric_id)
);

-- Table: ChatbotMetric
CREATE TABLE ChatbotMetric (
    chatbot_metric_id VARCHAR(50) PRIMARY KEY,
    gb_answer_ratio VARCHAR(50),
    avg_processing_time VARCHAR(50),
    daily_avg_usage FLOAT,
    created_at DATE,
    updated_at DATE
);

-- Table: TaskRecord
CREATE TABLE TaskRecord (
    task_id VARCHAR(50) PRIMARY KEY,
    due_date DATE,
    status VARCHAR(50),
    sort_number INT,
    document_id VARCHAR(50),
    onboarding_plan_id VARCHAR(50),
    task_template_id VARCHAR(50),
    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (onboarding_plan_id) REFERENCES OnboardingPlanRecord(onboarding_plan_id),
    FOREIGN KEY (task_template_id) REFERENCES TaskTemplate(task_template_id)
);

-- Table: OnboardingPlanRecord
CREATE TABLE OnboardingPlanRecord (
    onboarding_plan_id VARCHAR(50) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    status VARCHAR(100),
    current_task_id VARCHAR(50),
    user_id VARCHAR(50),
    onboarding_plan_template_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (onboarding_plan_template_id) REFERENCES OnboardingPlanTemplate(onboarding_plan_template_id)
);

-- Table: User
CREATE TABLE EmpUser (
    user_id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    joined_date DATE,
    position VARCHAR(50),
    role_id VARCHAR(50),
    department_id VARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Table: Department 
CREATE TABLE Department (
    department_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50),
    description TEXT
);

-- Table: Conversation
CREATE TABLE Conversation (
    conversation_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    created_at DATE,
    user_id VARCHAR(50),
    chatbot_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES EmpUser(user_id),
    FOREIGN KEY (chatbot_id) REFERENCES Chatbot(chatbot_id)
);

-- Table: HumanMessage
CREATE TABLE HumanMessage (
    human_message_id VARCHAR(50) PRIMARY KEY,
    content TEXT,
    created_at DATE,
    conversation_id VARCHAR(50),
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);

-- Table: AiMessage
CREATE TABLE AiMessage (
    ai_message_id VARCHAR(50) PRIMARY KEY,
    content TEXT,
    created_at DATE,
    conversation_id VARCHAR(50),
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);

-- Table: Rating
CREATE TABLE Rating (
    rating_id VARCHAR(50) PRIMARY KEY,
    table_type VARCHAR(50),
    created_at DATE,
    ai_message_id VARCHAR(250),
    FOREIGN KEY (ai_message_id) REFERENCES AiMessage(ai_message_id)
);

-- Table: TaskTemplate
CREATE TABLE TaskTemplate (
    task_template_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(200),
    description TEXT
);

-- Table: OnboardingPlanTemplate
CREATE TABLE OnboardingPlanTemplate (
    onboarding_plan_template_id VARCHAR(50) PRIMARY KEY,
    description TEXT,
    role_id VARCHAR(50),
    department_id VARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Table: Role
CREATE TABLE Role (
    role_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50),
    description TEXT
);

-- Table: RoleGuideline
CREATE TABLE RoleGuideline (
    role_guideline_id VARCHAR(50) PRIMARY KEY,
    guideline_content TEXT,
    created_at DATE,
    role_id VARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
