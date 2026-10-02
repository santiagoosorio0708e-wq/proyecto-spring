CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE relationship_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(50) UNIQUE
);

CREATE TABLE professional_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(40) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE phone_contacts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id UUID,
    phone VARCHAR(30),
    notes TEXT,
    column1 VARCHAR(255),
    column2 VARCHAR(255)
);

CREATE TABLE email_contacts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id UUID,
    email VARCHAR(150) UNIQUE,
    notes TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE studies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(40),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE professional_studies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    study_id UUID,
    professional_id UUID,
    title VARCHAR(100),
    university VARCHAR(100),
    is_valid BOOLEAN,
    resolution_number VARCHAR(60),
    country_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE clinical_record_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE encounter_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50) UNIQUE,
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE patient_contacts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contact_id UUID,
    patient_id UUID,
    is_primary_contact BOOLEAN,
    is_emergency_contact BOOLEAN,
    relationship_type_id UUID
);

CREATE TABLE contacts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(200),
    email VARCHAR(150),
    notes TEXT,
    city_id UUID,
    created_at TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID
);

CREATE TABLE professionals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    document_type_id UUID,
    document_number VARCHAR(30) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    professional_type UUID,
    license_number VARCHAR(100) UNIQUE,
    active BOOLEAN,
    city_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE clinical_records (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    patient_id UUID,
    creation_date TIMESTAMP,
    record_number VARCHAR(50),
    opened_at TIMESTAMP,
    closed_at TIMESTAMP,
    status_id UUID,
    created_at TIMESTAMP,
    created_by UUID
);

CREATE TABLE patients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    document_type_id UUID,
    document_number VARCHAR(30),
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    second_last_name VARCHAR(50),
    birth_date DATE,
    biological_sex_id UUID,
    gender_identity UUID,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(30),
    address VARCHAR(250),
    active BOOLEAN,
    created_at TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID,
    city_id UUID
);

CREATE TABLE document_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE genders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE patient_allergies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    patient_id UUID,
    substance VARCHAR(200),
    reaction TEXT,
    severity VARCHAR(20),
    active BOOLEAN,
    recorded_at TIMESTAMP,
    recorded_by UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE city_municipalities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_city VARCHAR(50),
    code_citi VARCHAR(10),
    description VARCHAR(100),
    is_active BOOLEAN,
    region_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE state_regions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_region VARCHAR(50),
    code_region VARCHAR(10),
    description VARCHAR(100),
    is_active BOOLEAN,
    country_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE countries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_country VARCHAR(50),
    code_country VARCHAR(10),
    description VARCHAR(100),
    is_active BOOLEAN,
    telephone_prefix VARCHAR(5),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE clinical_notes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    encounter_id UUID,
    professional_id UUID,
    subjective TEXT,
    objective TEXT,
    assessment TEXT,
    plan TEXT,
    additional_notes TEXT,
    signed_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE mental_status_exams (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    encounter_id UUID,
    appearance TEXT,
    behavior TEXT,
    attitude TEXT,
    consciousness TEXT,
    orientation TEXT,
    attention TEXT,
    memory TEXT,
    speech TEXT,
    mood TEXT,
    affect TEXT,
    thought_process TEXT,
    thought_content TEXT,
    perception TEXT,
    judgment TEXT,
    insight TEXT,
    psychomotor_activity TEXT,
    observations TEXT,
    created_at TIMESTAMP,
    created_by UUID
);

CREATE TABLE encounter_modalities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE encounter_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE risk_levels (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    severity INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE encounters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    clinical_record_id UUID,
    professional_id UUID,
    encounter_type_id UUID,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    reason_for_visit TEXT,
    current_condition TEXT,
    modality_id UUID,
    status_id UUID,
    created_at TIMESTAMP,
    created_by UUID,
    updated_at TIMESTAMP,
    updated_by UUID
);

CREATE TABLE risk_assessments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    encounter_id UUID,
    risk_level_id UUID,
    suicidal_ideation BOOLEAN,
    suicide_plan BOOLEAN,
    suicide_intent BOOLEAN,
    self_harm BOOLEAN,
    harm_to_others BOOLEAN,
    risk_factors TEXT,
    protective_factors TEXT,
    clinical_actions TEXT,
    observations TEXT,
    assessed_at TIMESTAMP,
    assessed_by UUID
);

CREATE TABLE treatment_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE treatment_goal_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE treatment_plans (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    encounter_id UUID,
    professional_id UUID,
    title VARCHAR(200),
    description TEXT,
    start_date DATE,
    end_date DATE,
    treatment_status_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE treatment_goals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    treatment_plan_id UUID,
    description TEXT,
    target_date DATE,
    completed_at TIMESTAMP,
    notes TEXT,
    treatment_goal_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE medication_routes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE assessment_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE consent_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE diagnostic_systems (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(20) UNIQUE,
    name VARCHAR(50),
    active BOOLEAN,
    version VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE conversations_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_status VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE priorities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_priority VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_conversation_ai_settings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID,
    ai_enabled BOOLEAN,
    default_model_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE ai_models (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    provider_model_id VARCHAR(50),
    name_model VARCHAR(100),
    model_key VARCHAR(120),
    input_token_price DECIMAL(12,6),
    output_token_price DECIMAL(12,6),
    max_tokens INTEGER,
    context_window INTEGER,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE provider_models_ai (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_provider_ai VARCHAR(100),
    razon_social VARCHAR(255),
    sitio_web TEXT,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_escalations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID,
    status_id UUID,
    from_ai BOOLEAN,
    reason TEXT,
    created_at TIMESTAMP
);

CREATE TABLE chat_escalation_assignments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    escalation_id UUID,
    professional_id UUID,
    assigned_at TIMESTAMP
);

CREATE TABLE chat_participants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID,
    participant_type_id UUID,
    patient_id UUID,
    professional_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE sender_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_type VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_conversations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_status_id UUID,
    priority_id UUID,
    last_message_at TIMESTAMP,
    closed BOOLEAN,
    closed_at TIMESTAMP,
    closed_by UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID,
    message_type_id UUID,
    participant_id UUID,
    content TEXT,
    metadata JSONB,
    created_at TIMESTAMP
);

CREATE TABLE message_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_type VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_ai_runs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    conversation_id UUID,
    message_id UUID,
    model_id UUID,
    ai_run_status_id UUID,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_ai_run_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ai_run_id UUID,
    prompt_tokens INTEGER,
    completion_tokens INTEGER,
    total_tokens INTEGER,
    cost DECIMAL(10,6),
    created_at TIMESTAMP
);

CREATE TABLE ai_runs_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_status VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_ai_run_errors (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ai_run_id UUID,
    error_message TEXT,
    error_code VARCHAR(80),
    provider_error_id VARCHAR(120),
    created_at TIMESTAMP
);

CREATE TABLE escalations_statuses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name_status VARCHAR(50) UNIQUE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE chat_escalation_status_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    escalation_id UUID,
    escalation_status_id UUID,
    created_at TIMESTAMP,
    changed_at TIMESTAMP
);

ALTER TABLE phone_contacts ADD CONSTRAINT fk_phone_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts(id);
ALTER TABLE email_contacts ADD CONSTRAINT fk_email_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts(id);
ALTER TABLE professional_studies ADD CONSTRAINT fk_professional_studies_study_id FOREIGN KEY (study_id) REFERENCES studies(id);
ALTER TABLE professional_studies ADD CONSTRAINT fk_professional_studies_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE professional_studies ADD CONSTRAINT fk_professional_studies_country_id FOREIGN KEY (country_id) REFERENCES countries(id);
ALTER TABLE patient_contacts ADD CONSTRAINT fk_patient_contacts_contact_id FOREIGN KEY (contact_id) REFERENCES contacts(id);
ALTER TABLE patient_contacts ADD CONSTRAINT fk_patient_contacts_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE patient_contacts ADD CONSTRAINT fk_patient_contacts_relationship_type_id FOREIGN KEY (relationship_type_id) REFERENCES relationship_types(id);
ALTER TABLE contacts ADD CONSTRAINT fk_contacts_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities(id);
ALTER TABLE contacts ADD CONSTRAINT fk_contacts_created_by FOREIGN KEY (created_by) REFERENCES professionals(id);
ALTER TABLE contacts ADD CONSTRAINT fk_contacts_updated_by FOREIGN KEY (updated_by) REFERENCES professionals(id);
ALTER TABLE professionals ADD CONSTRAINT fk_professionals_document_type_id FOREIGN KEY (document_type_id) REFERENCES document_types(id);
ALTER TABLE professionals ADD CONSTRAINT fk_professionals_professional_type FOREIGN KEY (professional_type) REFERENCES professional_types(id);
ALTER TABLE professionals ADD CONSTRAINT fk_professionals_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities(id);
ALTER TABLE clinical_records ADD CONSTRAINT fk_clinical_records_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE clinical_records ADD CONSTRAINT fk_clinical_records_status_id FOREIGN KEY (status_id) REFERENCES clinical_record_statuses(id);
ALTER TABLE clinical_records ADD CONSTRAINT fk_clinical_records_created_by FOREIGN KEY (created_by) REFERENCES professionals(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_document_type_id FOREIGN KEY (document_type_id) REFERENCES document_types(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_biological_sex_id FOREIGN KEY (biological_sex_id) REFERENCES genders(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_gender_identity FOREIGN KEY (gender_identity) REFERENCES genders(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_created_by FOREIGN KEY (created_by) REFERENCES professionals(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_updated_by FOREIGN KEY (updated_by) REFERENCES professionals(id);
ALTER TABLE patients ADD CONSTRAINT fk_patients_city_id FOREIGN KEY (city_id) REFERENCES city_municipalities(id);
ALTER TABLE patient_allergies ADD CONSTRAINT fk_patient_allergies_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE patient_allergies ADD CONSTRAINT fk_patient_allergies_recorded_by FOREIGN KEY (recorded_by) REFERENCES professionals(id);
ALTER TABLE city_municipalities ADD CONSTRAINT fk_city_municipalities_region_id FOREIGN KEY (region_id) REFERENCES state_regions(id);
ALTER TABLE state_regions ADD CONSTRAINT fk_state_regions_country_id FOREIGN KEY (country_id) REFERENCES countries(id);
ALTER TABLE clinical_notes ADD CONSTRAINT fk_clinical_notes_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters(id);
ALTER TABLE clinical_notes ADD CONSTRAINT fk_clinical_notes_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE mental_status_exams ADD CONSTRAINT fk_mental_status_exams_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters(id);
ALTER TABLE mental_status_exams ADD CONSTRAINT fk_mental_status_exams_created_by FOREIGN KEY (created_by) REFERENCES professionals(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_clinical_record_id FOREIGN KEY (clinical_record_id) REFERENCES clinical_records(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_encounter_type_id FOREIGN KEY (encounter_type_id) REFERENCES encounter_types(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_modality_id FOREIGN KEY (modality_id) REFERENCES encounter_modalities(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_status_id FOREIGN KEY (status_id) REFERENCES encounter_statuses(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_created_by FOREIGN KEY (created_by) REFERENCES professionals(id);
ALTER TABLE encounters ADD CONSTRAINT fk_encounters_updated_by FOREIGN KEY (updated_by) REFERENCES professionals(id);
ALTER TABLE risk_assessments ADD CONSTRAINT fk_risk_assessments_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters(id);
ALTER TABLE risk_assessments ADD CONSTRAINT fk_risk_assessments_risk_level_id FOREIGN KEY (risk_level_id) REFERENCES risk_levels(id);
ALTER TABLE risk_assessments ADD CONSTRAINT fk_risk_assessments_assessed_by FOREIGN KEY (assessed_by) REFERENCES professionals(id);
ALTER TABLE treatment_plans ADD CONSTRAINT fk_treatment_plans_encounter_id FOREIGN KEY (encounter_id) REFERENCES encounters(id);
ALTER TABLE treatment_plans ADD CONSTRAINT fk_treatment_plans_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE treatment_plans ADD CONSTRAINT fk_treatment_plans_treatment_status_id FOREIGN KEY (treatment_status_id) REFERENCES treatment_statuses(id);
ALTER TABLE treatment_goals ADD CONSTRAINT fk_treatment_goals_treatment_plan_id FOREIGN KEY (treatment_plan_id) REFERENCES treatment_plans(id);
ALTER TABLE treatment_goals ADD CONSTRAINT fk_treatment_goals_treatment_goal_id FOREIGN KEY (treatment_goal_id) REFERENCES treatment_goal_statuses(id);
ALTER TABLE chat_conversation_ai_settings ADD CONSTRAINT fk_chat_conversation_ai_settings_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id);
ALTER TABLE chat_conversation_ai_settings ADD CONSTRAINT fk_chat_conversation_ai_settings_default_model_id FOREIGN KEY (default_model_id) REFERENCES ai_models(id);
ALTER TABLE chat_escalations ADD CONSTRAINT fk_chat_escalations_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id);
ALTER TABLE chat_escalations ADD CONSTRAINT fk_chat_escalations_status_id FOREIGN KEY (status_id) REFERENCES escalations_statuses(id);
ALTER TABLE chat_escalation_assignments ADD CONSTRAINT fk_chat_escalation_assignments_escalation_id FOREIGN KEY (escalation_id) REFERENCES chat_escalations(id);
ALTER TABLE chat_escalation_assignments ADD CONSTRAINT fk_chat_escalation_assignments_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE chat_participants ADD CONSTRAINT fk_chat_participants_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id);
ALTER TABLE chat_participants ADD CONSTRAINT fk_chat_participants_participant_type_id FOREIGN KEY (participant_type_id) REFERENCES sender_types(id);
ALTER TABLE chat_participants ADD CONSTRAINT fk_chat_participants_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE chat_participants ADD CONSTRAINT fk_chat_participants_professional_id FOREIGN KEY (professional_id) REFERENCES professionals(id);
ALTER TABLE chat_conversations ADD CONSTRAINT fk_chat_conversations_conversation_status_id FOREIGN KEY (conversation_status_id) REFERENCES conversations_statuses(id);
ALTER TABLE chat_conversations ADD CONSTRAINT fk_chat_conversations_priority_id FOREIGN KEY (priority_id) REFERENCES priorities(id);
ALTER TABLE chat_conversations ADD CONSTRAINT fk_chat_conversations_closed_by FOREIGN KEY (closed_by) REFERENCES professionals(id);
ALTER TABLE chat_messages ADD CONSTRAINT fk_chat_messages_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id);
ALTER TABLE chat_messages ADD CONSTRAINT fk_chat_messages_message_type_id FOREIGN KEY (message_type_id) REFERENCES message_types(id);
ALTER TABLE chat_messages ADD CONSTRAINT fk_chat_messages_participant_id FOREIGN KEY (participant_id) REFERENCES chat_participants(id);
ALTER TABLE chat_ai_runs ADD CONSTRAINT fk_chat_ai_runs_conversation_id FOREIGN KEY (conversation_id) REFERENCES chat_conversations(id);
ALTER TABLE chat_ai_runs ADD CONSTRAINT fk_chat_ai_runs_message_id FOREIGN KEY (message_id) REFERENCES chat_messages(id);
ALTER TABLE chat_ai_runs ADD CONSTRAINT fk_chat_ai_runs_model_id FOREIGN KEY (model_id) REFERENCES ai_models(id);
ALTER TABLE chat_ai_runs ADD CONSTRAINT fk_chat_ai_runs_ai_run_status_id FOREIGN KEY (ai_run_status_id) REFERENCES ai_runs_statuses(id);
ALTER TABLE chat_ai_run_metrics ADD CONSTRAINT fk_chat_ai_run_metrics_ai_run_id FOREIGN KEY (ai_run_id) REFERENCES chat_ai_runs(id);
ALTER TABLE chat_ai_run_errors ADD CONSTRAINT fk_chat_ai_run_errors_ai_run_id FOREIGN KEY (ai_run_id) REFERENCES chat_ai_runs(id);
ALTER TABLE chat_escalation_status_history ADD CONSTRAINT fk_chat_escalation_status_history_escalation_id FOREIGN KEY (escalation_id) REFERENCES chat_escalations(id);
ALTER TABLE chat_escalation_status_history ADD CONSTRAINT fk_chat_escalation_status_history_escalation_status_id FOREIGN KEY (escalation_status_id) REFERENCES escalations_statuses(id);