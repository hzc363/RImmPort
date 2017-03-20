
db_table_stmts <- c(
  "CREATE  TABLE IF NOT EXISTS `lk_gender` (
  `name` VARCHAR(20) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_ethnicity` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_race` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_species` (
  `name` VARCHAR(30) NOT NULL ,
  `common_name` VARCHAR(100) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `taxonomy_id` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `workspace` (
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  `category` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(125) NOT NULL ,
  `type` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`workspace_id`) )",
  "CREATE  TABLE IF NOT EXISTS `subject` (
  `subject_accession` VARCHAR(15) NOT NULL ,
  `ancestral_population` VARCHAR(100) NULL DEFAULT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `ethnicity` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `gender` VARCHAR(20) NOT NULL DEFAULT 'Not Specified' ,
  `race` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `race_specify` VARCHAR(1000) NULL DEFAULT NULL ,
  `species` VARCHAR(50) NOT NULL ,
  `strain` VARCHAR(50) NULL DEFAULT NULL ,
  `strain_characteristics` VARCHAR(500) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`subject_accession`) ,
  CONSTRAINT `fk_subject_1`
  FOREIGN KEY (`gender` )
  REFERENCES `lk_gender` (`name` ),
  CONSTRAINT `fk_subject_2`
  FOREIGN KEY (`ethnicity` )
  REFERENCES `lk_ethnicity` (`name` ),
  CONSTRAINT `fk_subject_3`
  FOREIGN KEY (`race` )
  REFERENCES `lk_race` (`name` ),
  CONSTRAINT `fk_subject_4`
  FOREIGN KEY (`species` )
  REFERENCES `lk_species` (`name` ),
  CONSTRAINT `fk_subject_5`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_study_type` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_data_completeness` (
  `id` INT(11) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )",
  "CREATE  TABLE IF NOT EXISTS `study` (
  `study_accession` VARCHAR(15) NOT NULL ,
  `actual_completion_date` DATE NULL DEFAULT NULL ,
  `actual_enrollment` INT(11) NULL DEFAULT NULL ,
  `actual_start_date` DATE NULL DEFAULT NULL ,
  `age_unit` VARCHAR(40) NULL DEFAULT NULL ,
  `brief_description` VARCHAR(4000) NULL DEFAULT NULL ,
  `brief_title` VARCHAR(250) NULL DEFAULT NULL ,
  `clinical_trial` VARCHAR(1) NOT NULL DEFAULT 'N' ,
  `condition_studied` VARCHAR(1000) NULL DEFAULT NULL ,
  `dcl_id` INT(11) NOT NULL DEFAULT '0' ,
  `delete_study` VARCHAR(1) NULL DEFAULT 'N' ,
  `description` LONGTEXT NULL DEFAULT NULL ,
  `doi` VARCHAR(250) NULL DEFAULT NULL ,
  `download_page_available` VARCHAR(1) NULL DEFAULT 'N' ,
  `endpoints` MEDIUMTEXT NULL DEFAULT NULL ,
  `final_public_release_date` DATE NULL DEFAULT NULL ,
  `gender_included` VARCHAR(50) NULL DEFAULT NULL ,
  `hypothesis` VARCHAR(4000) NULL DEFAULT NULL ,
  `initial_data_release_date` DATE NULL DEFAULT NULL ,
  `initial_data_release_version` VARCHAR(10) NULL DEFAULT NULL ,
  `intervention_agent` VARCHAR(1000) NULL DEFAULT NULL ,
  `latest_data_release_date` DATE NULL DEFAULT NULL ,
  `latest_data_release_version` VARCHAR(10) NULL DEFAULT NULL ,
  `maximum_age` VARCHAR(40) NULL DEFAULT NULL ,
  `minimum_age` VARCHAR(40) NULL DEFAULT NULL ,
  `objectives` MEDIUMTEXT NULL DEFAULT NULL ,
  `official_title` VARCHAR(500) NULL DEFAULT NULL ,
  `planned_public_release_date` DATE NULL DEFAULT NULL ,
  `shared_study` VARCHAR(1) NOT NULL DEFAULT 'N' ,
  `sponsoring_organization` VARCHAR(250) NULL DEFAULT NULL ,
  `target_enrollment` INT(11) NULL DEFAULT NULL ,
  `type` VARCHAR(50) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`study_accession`) ,
  CONSTRAINT `fk_study_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_study_2`
  FOREIGN KEY (`type` )
  REFERENCES `lk_study_type` (`name` ),
  CONSTRAINT `fk_study_3`
  FOREIGN KEY (`dcl_id` )
  REFERENCES `lk_data_completeness` (`id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_adverse_event_severity` (
  `name` VARCHAR(60) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `adverse_event` (
  `adverse_event_accession` VARCHAR(15) NOT NULL ,
  `causality` VARCHAR(250) NULL DEFAULT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `end_study_day` FLOAT NULL DEFAULT NULL ,
  `end_time` VARCHAR(40) NULL DEFAULT NULL ,
  `location_of_reaction_preferred` VARCHAR(126) NULL DEFAULT NULL ,
  `location_of_reaction_reported` VARCHAR(126) NULL DEFAULT NULL ,
  `name_preferred` VARCHAR(126) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(126) NULL DEFAULT NULL ,
  `organ_or_body_system_preferred` VARCHAR(126) NULL DEFAULT NULL ,
  `organ_or_body_system_reported` VARCHAR(126) NULL DEFAULT NULL ,
  `other_action_taken` VARCHAR(250) NULL DEFAULT NULL ,
  `outcome_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `outcome_reported` VARCHAR(40) NULL DEFAULT NULL ,
  `relation_to_nonstudy_treatment` VARCHAR(250) NULL DEFAULT NULL ,
  `relation_to_study_treatment` VARCHAR(250) NULL DEFAULT NULL ,
  `severity_preferred` VARCHAR(60) NULL DEFAULT NULL ,
  `severity_reported` VARCHAR(60) NOT NULL ,
  `start_study_day` FLOAT NULL DEFAULT NULL ,
  `start_time` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `study_treatment_action_taken` VARCHAR(250) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`adverse_event_accession`) ,
  CONSTRAINT `fk_adverse_event_1`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_adverse_event_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_adverse_event_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_adverse_event_4`
  FOREIGN KEY (`severity_preferred` )
  REFERENCES `lk_adverse_event_severity` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `arm_or_cohort` (
  `arm_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `name` VARCHAR(126) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `type` VARCHAR(20) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`arm_accession`) ,
  CONSTRAINT `fk_arm_or_cohort_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_arm_or_cohort_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_time_unit` (
  `name` VARCHAR(25) NOT NULL ,
  `description` VARCHAR(1000) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_age_event` (
  `name` VARCHAR(40) NOT NULL ,
  `description` VARCHAR(1000) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `arm_2_subject` (
  `arm_accession` VARCHAR(15) NOT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `age_event` VARCHAR(50) NOT NULL DEFAULT 'Not Specified' ,
  `age_event_specify` VARCHAR(50) NULL DEFAULT NULL ,
  `age_unit` VARCHAR(50) NOT NULL DEFAULT 'Not Specified' ,
  `max_subject_age` FLOAT NULL DEFAULT NULL ,
  `min_subject_age` FLOAT NULL DEFAULT NULL ,
  `subject_phenotype` VARCHAR(200) NULL DEFAULT NULL ,
  PRIMARY KEY (`arm_accession`, `subject_accession`) ,
  CONSTRAINT `fk_arm_2_subject_1`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_arm_2_subject_2`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_arm_2_subject_3`
  FOREIGN KEY (`age_unit` )
  REFERENCES `lk_time_unit` (`name` ),
  CONSTRAINT `fk_arm_2_subject_4`
  FOREIGN KEY (`age_event` )
  REFERENCES `lk_age_event` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_file_detail` (
  `name` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_file_purpose` (
  `name` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `file_info` (
  `file_info_id` INT(11) NOT NULL ,
  `detail` VARCHAR(100) NOT NULL ,
  `filesize_bytes` INT(11) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `original_file_name` VARCHAR(250) NOT NULL ,
  `purpose` VARCHAR(100) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`file_info_id`) ,
  CONSTRAINT `fk_file_info_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_file_info_2`
  FOREIGN KEY (`detail` )
  REFERENCES `lk_file_detail` (`name` ),
  CONSTRAINT `fk_file_info_3`
  FOREIGN KEY (`purpose` )
  REFERENCES `lk_file_purpose` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `assessment_panel` (
  `assessment_panel_accession` VARCHAR(15) NOT NULL ,
  `assessment_type` VARCHAR(125) NULL DEFAULT NULL ,
  `name_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(125) NULL DEFAULT NULL ,
  `status` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`assessment_panel_accession`) ,
  CONSTRAINT `fk_assessment_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_assessment_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_data_format` (
  `name` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_expsample_result_schema` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `table_name` VARCHAR(30) NOT NULL DEFAULT 'NONE' ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `assessment_2_file_info` (
  `assessment_panel_accession` VARCHAR(15) NOT NULL ,
  `file_info_id` INT(11) NOT NULL ,
  `data_format` VARCHAR(100) NOT NULL ,
  `result_schema` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`assessment_panel_accession`, `file_info_id`) ,
  CONSTRAINT `fk_assessment_2_file_info_1`
  FOREIGN KEY (`file_info_id` )
  REFERENCES `file_info` (`file_info_id` ),
  CONSTRAINT `fk_assessment_2_file_info_2`
  FOREIGN KEY (`assessment_panel_accession` )
  REFERENCES `assessment_panel` (`assessment_panel_accession` ),
  CONSTRAINT `fk_assessment_2_file_info_3`
  FOREIGN KEY (`data_format` )
  REFERENCES `lk_data_format` (`name` ),
  CONSTRAINT `fk_assessment_2_file_info_4`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `reference_range` (
  `reference_range_accession` VARCHAR(15) NOT NULL ,
  `age_range` VARCHAR(40) NULL DEFAULT NULL ,
  `category` VARCHAR(40) NULL DEFAULT NULL ,
  `gender` VARCHAR(40) NULL DEFAULT NULL ,
  `lab_or_study_source` VARCHAR(256) NULL DEFAULT NULL ,
  `lower_limit` VARCHAR(40) NOT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `subject_condition` VARCHAR(40) NULL DEFAULT NULL ,
  `test_or_assessment_name` VARCHAR(125) NULL DEFAULT NULL ,
  `unit_of_measure` VARCHAR(40) NOT NULL ,
  `upper_limit` VARCHAR(40) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`reference_range_accession`) ,
  CONSTRAINT `fk_reference_range_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_reference_range_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_unit_of_measure` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `type` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `assessment_component` (
  `assessment_component_accession` VARCHAR(15) NOT NULL ,
  `age_at_onset_preferred` FLOAT NULL DEFAULT NULL ,
  `age_at_onset_reported` VARCHAR(100) NULL DEFAULT NULL ,
  `age_at_onset_unit_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `age_at_onset_unit_reported` VARCHAR(25) NULL DEFAULT NULL ,
  `assessment_panel_accession` VARCHAR(15) NOT NULL ,
  `is_clinically_significant` VARCHAR(1) NULL DEFAULT 'U' ,
  `location_of_finding_preferred` VARCHAR(256) NULL DEFAULT NULL ,
  `location_of_finding_reported` VARCHAR(256) NULL DEFAULT NULL ,
  `name_preferred` VARCHAR(150) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(150) NOT NULL ,
  `organ_or_body_system_preferred` VARCHAR(100) NULL DEFAULT NULL ,
  `organ_or_body_system_reported` VARCHAR(100) NULL DEFAULT NULL ,
  `planned_visit_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `reference_range_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `result_unit_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `result_unit_reported` VARCHAR(40) NULL DEFAULT NULL ,
  `result_value_category` VARCHAR(40) NULL DEFAULT NULL ,
  `result_value_preferred` FLOAT NULL DEFAULT NULL ,
  `result_value_reported` VARCHAR(250) NULL DEFAULT NULL ,
  `study_day` FLOAT NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `subject_position_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `subject_position_reported` VARCHAR(40) NULL DEFAULT NULL ,
  `time_of_day` VARCHAR(40) NULL DEFAULT NULL ,
  `verbatim_question` VARCHAR(250) NULL DEFAULT NULL ,
  `who_is_assessed` VARCHAR(40) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`assessment_component_accession`) ,
  CONSTRAINT `fk_assessment_component_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_assessment_component_2`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_assessment_component_4`
  FOREIGN KEY (`assessment_panel_accession` )
  REFERENCES `assessment_panel` (`assessment_panel_accession` ),
  CONSTRAINT `fk_assessment_component_5`
  FOREIGN KEY (`reference_range_accession` )
  REFERENCES `reference_range` (`reference_range_accession` ),
  CONSTRAINT `fk_assessment_component_6`
  FOREIGN KEY (`result_unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ),
  CONSTRAINT `fk_assessment_component_7`
  FOREIGN KEY (`age_at_onset_unit_preferred` )
  REFERENCES `lk_time_unit` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_t0_event` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `period` (
  `period_accession` VARCHAR(15) NOT NULL ,
  `name` VARCHAR(250) NULL DEFAULT NULL ,
  `order_number` INT(11) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`period_accession`) ,
  CONSTRAINT `fk_period_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_period_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `planned_visit` (
  `planned_visit_accession` VARCHAR(15) NOT NULL ,
  `end_rule` VARCHAR(256) NULL DEFAULT NULL ,
  `max_start_day` FLOAT NULL DEFAULT NULL ,
  `min_start_day` FLOAT NULL DEFAULT NULL ,
  `name` VARCHAR(125) NULL DEFAULT NULL ,
  `order_number` INT(11) NULL DEFAULT NULL ,
  `period_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `start_rule` VARCHAR(256) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`planned_visit_accession`) ,
  CONSTRAINT `fk_planned_visit_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_planned_visit_2`
  FOREIGN KEY (`period_accession` )
  REFERENCES `period` (`period_accession` ),
  CONSTRAINT `fk_planned_visit_3`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_sample_type` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `biosample` (
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `name` VARCHAR(200) NULL DEFAULT NULL ,
  `planned_visit_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NOT NULL DEFAULT 'Not Specified' ,
  `study_time_t0_event` VARCHAR(50) NOT NULL DEFAULT 'Not Specified' ,
  `study_time_t0_event_specify` VARCHAR(50) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `subtype` VARCHAR(50) NULL DEFAULT NULL ,
  `type` VARCHAR(50) NOT NULL DEFAULT 'Not Specified' ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`biosample_accession`) ,
  CONSTRAINT `fk_biosample_1`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_biosample_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_biosample_4`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_biosample_5`
  FOREIGN KEY (`study_time_collected_unit` )
  REFERENCES `lk_time_unit` (`name` ),
  CONSTRAINT `fk_biosample_6`
  FOREIGN KEY (`study_time_t0_event` )
  REFERENCES `lk_t0_event` (`name` ),
  CONSTRAINT `fk_biosample_7`
  FOREIGN KEY (`planned_visit_accession` )
  REFERENCES `planned_visit` (`planned_visit_accession` ),
  CONSTRAINT `fk_biosample_8`
  FOREIGN KEY (`type` )
  REFERENCES `lk_sample_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `treatment` (
  `treatment_accession` VARCHAR(15) NOT NULL ,
  `amount_unit` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `amount_value` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `duration_unit` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `duration_value` VARCHAR(200) NULL DEFAULT 'Not Specified' ,
  `name` VARCHAR(100) NULL DEFAULT NULL ,
  `temperature_unit` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `temperature_value` VARCHAR(50) NULL DEFAULT 'Not Specified' ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`treatment_accession`) ,
  CONSTRAINT `fk_treatment_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_treatment_2`
  FOREIGN KEY (`amount_unit` )
  REFERENCES `lk_unit_of_measure` (`name` ),
  CONSTRAINT `fk_treatment_3`
  FOREIGN KEY (`duration_unit` )
  REFERENCES `lk_time_unit` (`name` ),
  CONSTRAINT `fk_treatment_4`
  FOREIGN KEY (`temperature_unit` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `biosample_2_treatment` (
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `treatment_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`biosample_accession`, `treatment_accession`) ,
  CONSTRAINT `fk_biosample_2_treatment_1`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_biosample_2_treatment_2`
  FOREIGN KEY (`treatment_accession` )
  REFERENCES `treatment` (`treatment_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_visibility_category` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `program` (
  `program_id` INT(11) NOT NULL ,
  `category` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `name` VARCHAR(200) NOT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`program_id`) ,
  CONSTRAINT `fk_program_1`
  FOREIGN KEY (`category` )
  REFERENCES `lk_visibility_category` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `contract_grant` (
  `contract_grant_id` INT(11) NOT NULL ,
  `category` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  `external_id` VARCHAR(200) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `name` VARCHAR(1000) NULL DEFAULT NULL ,
  `program_id` INT(11) NULL DEFAULT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`contract_grant_id`) ,
  CONSTRAINT `fk_contract_1`
  FOREIGN KEY (`program_id` )
  REFERENCES `program` (`program_id` ))",
  "CREATE  TABLE IF NOT EXISTS `personnel` (
  `personnel_id` INT(11) NOT NULL ,
  `email` VARCHAR(100) NULL DEFAULT NULL ,
  `first_name` VARCHAR(50) NOT NULL ,
  `last_name` VARCHAR(50) NOT NULL ,
  `organization` VARCHAR(125) NOT NULL ,
  PRIMARY KEY (`personnel_id`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_user_role_type` (
  `name` VARCHAR(2) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `contract_grant_2_personnel` (
  `contract_grant_id` INT(11) NOT NULL ,
  `personnel_id` INT(11) NOT NULL ,
  `role_type` VARCHAR(12) NULL DEFAULT NULL ,
  PRIMARY KEY (`contract_grant_id`, `personnel_id`) ,
  CONSTRAINT `fk_contract_2_personnel_1`
  FOREIGN KEY (`contract_grant_id` )
  REFERENCES `contract_grant` (`contract_grant_id` ),
  CONSTRAINT `fk_contract_2_personnel_2`
  FOREIGN KEY (`personnel_id` )
  REFERENCES `personnel` (`personnel_id` ),
  CONSTRAINT `fk_contract_2_personnel_3`
  FOREIGN KEY (`role_type` )
  REFERENCES `lk_user_role_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `contract_grant_2_study` (
  `contract_grant_id` INT(11) NOT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`contract_grant_id`, `study_accession`) ,
  CONSTRAINT `fk_contract_2_study_1`
  FOREIGN KEY (`contract_grant_id` )
  REFERENCES `contract_grant` (`contract_grant_id` ),
  CONSTRAINT `fk_contract_2_study_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_experiment_purpose` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_exp_measurement_tech` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `experiment` (
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `measurement_technique` VARCHAR(50) NOT NULL ,
  `name` VARCHAR(500) NULL DEFAULT NULL ,
  `purpose` VARCHAR(50) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`experiment_accession`) ,
  CONSTRAINT `fk_experiment_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_experiment_2`
  FOREIGN KEY (`purpose` )
  REFERENCES `lk_experiment_purpose` (`name` ),
  CONSTRAINT `fk_experiment_3`
  FOREIGN KEY (`measurement_technique` )
  REFERENCES `lk_exp_measurement_tech` (`name` ),
  CONSTRAINT `fk_experiment_4`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `control_sample` (
  `control_sample_accession` VARCHAR(15) NOT NULL ,
  `assay_group_id` VARCHAR(100) NULL DEFAULT NULL ,
  `assay_id` VARCHAR(100) NULL DEFAULT NULL ,
  `catalog_id` VARCHAR(100) NULL DEFAULT NULL ,
  `dilution_factor` VARCHAR(100) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `lot_number` VARCHAR(100) NULL DEFAULT NULL ,
  `result_schema` VARCHAR(50) NOT NULL DEFAULT 'OTHER' ,
  `source` VARCHAR(100) NULL DEFAULT NULL ,
  `upload_result_status` VARCHAR(20) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`control_sample_accession`) ,
  CONSTRAINT `fk_control_sample_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_control_sample_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_control_sample_3`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `control_sample_2_file_info` (
  `control_sample_accession` VARCHAR(15) NOT NULL ,
  `file_info_id` INT(11) NOT NULL ,
  `data_format` VARCHAR(100) NOT NULL ,
  `result_schema` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`control_sample_accession`, `file_info_id`) ,
  CONSTRAINT `fk_control_sample_2_file_info_1`
  FOREIGN KEY (`control_sample_accession` )
  REFERENCES `control_sample` (`control_sample_accession` ),
  CONSTRAINT `fk_control_sample_2_file_info_2`
  FOREIGN KEY (`file_info_id` )
  REFERENCES `file_info` (`file_info_id` ),
  CONSTRAINT `fk_control_sample_2_file_info_3`
  FOREIGN KEY (`data_format` )
  REFERENCES `lk_data_format` (`name` ),
  CONSTRAINT `fk_control_sample_2_file_info_4`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `expsample` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `name` VARCHAR(200) NULL DEFAULT NULL ,
  `result_schema` VARCHAR(50) NOT NULL DEFAULT 'OTHER' ,
  `upload_result_status` VARCHAR(20) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`expsample_accession`) ,
  CONSTRAINT `fk_expsample_1`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_expsample_3`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `elisa_result` (
  `result_id` INT(11) NOT NULL ,
  `analyte_preferred` VARCHAR(100) NULL DEFAULT NULL ,
  `analyte_reported` VARCHAR(100) NOT NULL ,
  `arm_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `biosample_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `unit_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `unit_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `value_preferred` FLOAT NULL DEFAULT NULL ,
  `value_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_elisa_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_elisa_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_elisa_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_elisa_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_elisa_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_elisa_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_elisa_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_elisa_result_9`
  FOREIGN KEY (`unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `elispot_result` (
  `result_id` INT(11) NOT NULL ,
  `analyte_preferred` VARCHAR(100) NULL DEFAULT NULL ,
  `analyte_reported` VARCHAR(100) NOT NULL ,
  `arm_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `biosample_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `cell_number_preferred` FLOAT NULL DEFAULT NULL ,
  `cell_number_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `spot_number_preferred` FLOAT NULL DEFAULT NULL ,
  `spot_number_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_elispot_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_elispot_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_elispot_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_elispot_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_elispot_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_elispot_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_elispot_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_protocol_type` (
  `name` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `protocol` (
  `protocol_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `file_name` VARCHAR(250) NOT NULL ,
  `name` VARCHAR(250) NOT NULL ,
  `original_file_name` VARCHAR(250) NOT NULL ,
  `type` VARCHAR(100) NOT NULL DEFAULT 'Not Specified' ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`protocol_accession`) ,
  CONSTRAINT `fk_protocol_1`
  FOREIGN KEY (`type` )
  REFERENCES `lk_protocol_type` (`name` ),
  CONSTRAINT `fk_protocol_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `experiment_2_protocol` (
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `protocol_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`experiment_accession`, `protocol_accession`) ,
  CONSTRAINT `fk_experiment_2_protocol_1`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_exp_2_protocol_2`
  FOREIGN KEY (`protocol_accession` )
  REFERENCES `protocol` (`protocol_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `expsample_2_biosample` (
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`expsample_accession`, `biosample_accession`) ,
  CONSTRAINT `fk_expsample_2_biosample_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_2_biosample_2`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `expsample_2_file_info` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `file_info_id` INT(11) NOT NULL ,
  `data_format` VARCHAR(100) NOT NULL ,
  `result_schema` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`expsample_accession`, `file_info_id`) ,
  CONSTRAINT `fk_expsample_2_file_info_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_2_file_info_2`
  FOREIGN KEY (`file_info_id` )
  REFERENCES `file_info` (`file_info_id` ),
  CONSTRAINT `fk_expsample_2_file_info_3`
  FOREIGN KEY (`data_format` )
  REFERENCES `lk_data_format` (`name` ),
  CONSTRAINT `fk_expsample_2_file_info_4`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_reagent_type` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `reagent` (
  `reagent_accession` VARCHAR(15) NOT NULL ,
  `analyte_preferred` VARCHAR(200) NULL DEFAULT NULL ,
  `analyte_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `antibody_registry_id` VARCHAR(250) NULL DEFAULT NULL ,
  `catalog_number` VARCHAR(250) NULL DEFAULT NULL ,
  `clone_name` VARCHAR(200) NULL DEFAULT NULL ,
  `contact` VARCHAR(1000) NULL DEFAULT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `is_set` VARCHAR(1) NULL DEFAULT 'N' ,
  `lot_number` VARCHAR(250) NULL DEFAULT NULL ,
  `manufacturer` VARCHAR(100) NULL DEFAULT NULL ,
  `name` VARCHAR(200) NULL DEFAULT NULL ,
  `reporter_name` VARCHAR(200) NULL DEFAULT NULL ,
  `type` VARCHAR(50) NULL DEFAULT NULL ,
  `weblink` VARCHAR(250) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`reagent_accession`) ,
  CONSTRAINT `fk_reagent_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_reagent_2`
  FOREIGN KEY (`type` )
  REFERENCES `lk_reagent_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `expsample_2_reagent` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `reagent_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`expsample_accession`, `reagent_accession`) ,
  CONSTRAINT `fk_expsample_2_reagent_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_2_reagent_2`
  FOREIGN KEY (`reagent_accession` )
  REFERENCES `reagent` (`reagent_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `expsample_2_treatment` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `treatment_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`expsample_accession`, `treatment_accession`) ,
  CONSTRAINT `fk_expsample_2_treatment_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_2_treatment_2`
  FOREIGN KEY (`treatment_accession` )
  REFERENCES `treatment` (`treatment_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_plate_type` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `expsample_mbaa_detail` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `assay_group_id` VARCHAR(100) NULL DEFAULT NULL ,
  `assay_id` VARCHAR(100) NULL DEFAULT NULL ,
  `dilution_factor` VARCHAR(100) NULL DEFAULT NULL ,
  `plate_type` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`expsample_accession`) ,
  CONSTRAINT `fk_expsample_mbaa_detail_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_mbaa_detail_2`
  FOREIGN KEY (`plate_type` )
  REFERENCES `lk_plate_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_public_repository` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `expsample_public_repository` (
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `repository_accession` VARCHAR(20) NOT NULL ,
  `repository_name` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`expsample_accession`, `repository_accession`) ,
  CONSTRAINT `fk_expsample_public_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_expsample_public_2`
  FOREIGN KEY (`repository_name` )
  REFERENCES `lk_public_repository` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `fcs_analyzed_result` (
  `result_id` INT(11) NOT NULL ,
  `arm_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `biosample_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `parent_population_preferred` VARCHAR(150) NULL DEFAULT NULL ,
  `parent_population_reported` VARCHAR(150) NULL DEFAULT NULL ,
  `population_defnition_preferred` VARCHAR(150) NULL DEFAULT NULL ,
  `population_defnition_reported` VARCHAR(150) NULL DEFAULT NULL ,
  `population_name_preferred` VARCHAR(150) NULL DEFAULT NULL ,
  `population_name_reported` VARCHAR(150) NULL DEFAULT NULL ,
  `population_stat_unit_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `population_stat_unit_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `population_statistic_preferred` FLOAT NULL DEFAULT NULL ,
  `population_statistic_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_file_info_id` INT(11) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_fcs_analyzed_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_12`
  FOREIGN KEY (`population_stat_unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ),
  CONSTRAINT `fk_fcs_analyzed_result_13`
  FOREIGN KEY (`workspace_file_info_id` )
  REFERENCES `file_info` (`file_info_id` ),
  CONSTRAINT `fk_fcs_analyzed_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_fcs_analyzed_result_8`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `fcs_analyzed_result_marker` (
  `fcs_analyzed_result_marker_id` INT(11) NOT NULL ,
  `population_marker_preferred` VARCHAR(500) NULL DEFAULT NULL ,
  `population_marker_reported` VARCHAR(500) NULL DEFAULT NULL ,
  `result_id` INT(11) NOT NULL ,
  PRIMARY KEY (`fcs_analyzed_result_marker_id`) ,
  CONSTRAINT `fk_fcs_analyzed_result_marker_1`
  FOREIGN KEY (`result_id` )
  REFERENCES `fcs_analyzed_result` (`result_id` ))",
  "CREATE  TABLE IF NOT EXISTS `fcs_header` (
  `fcs_header_id` INT(11) NOT NULL ,
  `compensation_flag` VARCHAR(1) NULL DEFAULT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `fcs_file_name` VARCHAR(250) NULL DEFAULT NULL ,
  `fcs_header_text` LONGTEXT NULL DEFAULT NULL ,
  `fcs_version` FLOAT NULL DEFAULT NULL ,
  `file_info_id` INT(11) NULL DEFAULT NULL ,
  `maximum_intensity` FLOAT NULL DEFAULT NULL ,
  `minimum_intensity` FLOAT NULL DEFAULT NULL ,
  `number_of_events` INT(11) NULL DEFAULT NULL ,
  `number_of_markers` INT(11) NULL DEFAULT NULL ,
  `panel_preferred` VARCHAR(2000) NULL DEFAULT NULL ,
  `panel_reported` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`fcs_header_id`) ,
  CONSTRAINT `fk_fcs_header_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_fcs_header_2`
  FOREIGN KEY (`file_info_id` )
  REFERENCES `file_info` (`file_info_id` ))",
  "CREATE  TABLE IF NOT EXISTS `fcs_header_marker` (
  `fcs_header_id` INT(11) NOT NULL ,
  `parameter_number` INT(11) NOT NULL ,
  `pnn_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `pnn_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `pns_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `pns_reported` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`fcs_header_id`, `parameter_number`) ,
  CONSTRAINT `fk_fcs_header_marker_1`
  FOREIGN KEY (`fcs_header_id` )
  REFERENCES `fcs_header` (`fcs_header_id` ))",
  "CREATE  TABLE IF NOT EXISTS `fcs_header_marker_2_reagent` (
  `fcs_header_id` INT(11) NOT NULL ,
  `parameter_number` INT(11) NOT NULL ,
  `reagent_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`fcs_header_id`, `parameter_number`, `reagent_accession`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_virus_strain` (
  `name` VARCHAR(200) NOT NULL ,
  `center_id_name_season_list` VARCHAR(500) NULL DEFAULT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `season_list` VARCHAR(100) NULL DEFAULT NULL ,
  `taxonomy_id` INT(11) NULL DEFAULT NULL ,
  `virus_name` VARCHAR(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `hai_result` (
  `result_id` INT(11) NOT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `unit_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `unit_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `value_preferred` FLOAT NULL DEFAULT NULL ,
  `value_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `virus_strain_preferred` VARCHAR(200) NULL DEFAULT NULL ,
  `virus_strain_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_hai_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_hai_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_hai_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_hai_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_hai_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_hai_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_hai_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_hai_result_8`
  FOREIGN KEY (`virus_strain_preferred` )
  REFERENCES `lk_virus_strain` (`name` ),
  CONSTRAINT `fk_hai_result_9`
  FOREIGN KEY (`unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `hla_typing_result` (
  `result_id` INT(11) NOT NULL ,
  `allele_1` VARCHAR(250) NULL DEFAULT NULL ,
  `allele_2` VARCHAR(250) NULL DEFAULT NULL ,
  `ancestral_population` VARCHAR(250) NULL DEFAULT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `locus_name` VARCHAR(25) NULL DEFAULT NULL ,
  `result_set_id` INT(11) NOT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_hla_typing_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_hla_typing_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_hla_typing_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_hla_typing_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_hla_typing_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_hla_typing_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_hla_typing_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_criterion_category` (
  `name` VARCHAR(40) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `inclusion_exclusion` (
  `criterion_accession` VARCHAR(15) NOT NULL ,
  `criterion` VARCHAR(750) NULL DEFAULT NULL ,
  `criterion_category` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`criterion_accession`) ,
  CONSTRAINT `fk_inclusion_exclusion_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_inclusion_exclusion_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_inclusion_exclusion_3`
  FOREIGN KEY (`criterion_category` )
  REFERENCES `lk_criterion_category` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_compound_role` (
  `name` VARCHAR(40) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `intervention` (
  `intervention_accession` VARCHAR(15) NOT NULL ,
  `compound_name_reported` VARCHAR(250) NULL DEFAULT NULL ,
  `compound_role` VARCHAR(40) NOT NULL ,
  `dose` FLOAT NULL DEFAULT NULL ,
  `dose_freq_per_interval` VARCHAR(40) NULL DEFAULT NULL ,
  `dose_reported` VARCHAR(150) NULL DEFAULT NULL ,
  `dose_units` VARCHAR(40) NULL DEFAULT NULL ,
  `duration` FLOAT NULL DEFAULT NULL ,
  `duration_unit` VARCHAR(10) NULL DEFAULT NULL ,
  `end_day` FLOAT NULL DEFAULT NULL ,
  `end_time` VARCHAR(40) NULL DEFAULT NULL ,
  `formulation` VARCHAR(125) NULL DEFAULT NULL ,
  `is_ongoing` VARCHAR(40) NULL DEFAULT NULL ,
  `name_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(125) NOT NULL ,
  `reported_indication` VARCHAR(255) NULL DEFAULT NULL ,
  `route_of_admin_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `route_of_admin_reported` VARCHAR(40) NULL DEFAULT NULL ,
  `start_day` FLOAT NULL DEFAULT NULL ,
  `start_time` VARCHAR(40) NULL DEFAULT NULL ,
  `status` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`intervention_accession`) ,
  CONSTRAINT `fk_intervention_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_intervention_2`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_intervention_3`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_intervention_4`
  FOREIGN KEY (`compound_role` )
  REFERENCES `lk_compound_role` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `kir_typing_result` (
  `result_id` INT(11) NOT NULL ,
  `allele` VARCHAR(500) NULL DEFAULT NULL ,
  `ancestral_population` VARCHAR(250) NOT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `copy_number` INT(11) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `gene_name` VARCHAR(25) NOT NULL ,
  `present_absent` VARCHAR(10) NULL DEFAULT NULL ,
  `result_set_id` INT(11) NOT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_kir_typing_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_kir_typing_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_kir_typing_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_kir_typing_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_kir_typing_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_kir_typing_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_kir_typing_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `lab_test_panel` (
  `lab_test_panel_accession` VARCHAR(15) NOT NULL ,
  `name_preferred` VARCHAR(125) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(125) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`lab_test_panel_accession`) ,
  CONSTRAINT `fk_lab_test_panel_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_lab_test_panel_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_lab_test_name` (
  `name` VARCHAR(50) NOT NULL ,
  `cdisc_lab_test_code` VARCHAR(50) NULL DEFAULT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `lab_test_panel_name` VARCHAR(50) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lab_test` (
  `lab_test_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `lab_test_panel_accession` VARCHAR(15) NOT NULL ,
  `name_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `name_reported` VARCHAR(125) NULL DEFAULT NULL ,
  `reference_range_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `result_unit_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `result_unit_reported` VARCHAR(40) NULL DEFAULT NULL ,
  `result_value_preferred` FLOAT NULL DEFAULT NULL ,
  `result_value_reported` VARCHAR(250) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`lab_test_accession`) ,
  CONSTRAINT `fk_lab_test_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_lab_test_2`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_lab_test_3`
  FOREIGN KEY (`lab_test_panel_accession` )
  REFERENCES `lab_test_panel` (`lab_test_panel_accession` ),
  CONSTRAINT `fk_lab_test_4`
  FOREIGN KEY (`name_preferred` )
  REFERENCES `lk_lab_test_name` (`name` ),
  CONSTRAINT `fk_lab_test_5`
  FOREIGN KEY (`result_unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `lab_test_panel_2_protocol` (
  `lab_test_panel_accession` VARCHAR(15) NOT NULL ,
  `protocol_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`lab_test_panel_accession`, `protocol_accession`) ,
  CONSTRAINT `fk_lab_test_2_protocol_2`
  FOREIGN KEY (`protocol_accession` )
  REFERENCES `protocol` (`protocol_accession` ),
  CONSTRAINT `fk_lab_test__panel_2_protocol_1`
  FOREIGN KEY (`lab_test_panel_accession` )
  REFERENCES `lab_test_panel` (`lab_test_panel_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `lk_analyte` (
  `analyte_accession` VARCHAR(15) NOT NULL ,
  `analyte_preferred` VARCHAR(100) NOT NULL ,
  `cluster_subunit_gene_ids` VARCHAR(1000) NULL DEFAULT NULL ,
  `cluster_subunit_gene_symbols` VARCHAR(1000) NULL DEFAULT NULL ,
  `cluster_subunit_uniprot_ids` VARCHAR(1000) NULL DEFAULT NULL ,
  `cluster_subunit_uniprot_names` TEXT NULL DEFAULT NULL ,
  `gene_additional_names` TEXT NULL DEFAULT NULL ,
  `gene_aliases` TEXT NULL DEFAULT NULL ,
  `gene_id` VARCHAR(10) NULL DEFAULT NULL ,
  `genetic_nomenclature_id` VARCHAR(15) NULL DEFAULT NULL ,
  `immunology_gene_symbol` VARCHAR(100) NULL DEFAULT NULL ,
  `ix_synonyms` TEXT NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  `mesh_id` VARCHAR(10) NULL DEFAULT NULL ,
  `mesh_name` VARCHAR(255) NULL DEFAULT NULL ,
  `official_gene_name` VARCHAR(255) NULL DEFAULT NULL ,
  `omim_id` VARCHAR(50) NULL DEFAULT NULL ,
  `ortholog_ids` VARCHAR(100) NULL DEFAULT NULL ,
  `protein_ontology_id` VARCHAR(15) NULL DEFAULT NULL ,
  `protein_ontology_name` VARCHAR(100) NULL DEFAULT NULL ,
  `protein_ontology_synonyms` TEXT NULL DEFAULT NULL ,
  `protein_ontology_url` VARCHAR(500) NULL DEFAULT NULL ,
  `shen_orr_id` VARCHAR(10) NULL DEFAULT NULL ,
  `taxonomy_id` VARCHAR(10) NULL DEFAULT NULL ,
  `typographical_variations` VARCHAR(1000) NULL DEFAULT NULL ,
  `uniprot_alt_prot_names` TEXT NULL DEFAULT NULL ,
  `uniprot_id` VARCHAR(20) NULL DEFAULT NULL ,
  `uniprot_protein_name` VARCHAR(255) NULL DEFAULT NULL ,
  `unique_id` VARCHAR(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`analyte_accession`) )",
  "CREATE UNIQUE INDEX `idx_lk_analyte_1` ON `lk_analyte` (`analyte_preferred` ASC)",
  "CREATE  TABLE IF NOT EXISTS `lk_ancestral_population` (
  `name` VARCHAR(30) NOT NULL ,
  `abbreviation` VARCHAR(3) NULL DEFAULT NULL ,
  `description` VARCHAR(4000) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_cell_population` (
  `name` VARCHAR(150) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `definition` VARCHAR(150) NULL DEFAULT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_kir_gene` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_kir_locus` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(250) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_kir_present_absent` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_lab_test_panel_name` (
  `name` VARCHAR(125) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_locus_name` (
  `name` VARCHAR(100) NOT NULL ,
  `description` VARCHAR(250) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_organization` (
  `name` VARCHAR(125) NOT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_personnel_role` (
  `name` VARCHAR(40) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_research_focus` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_source_type` (
  `name` VARCHAR(30) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_study_file_type` (
  `name` VARCHAR(50) NOT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `link` VARCHAR(2000) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `lk_study_panel` (
  `name` VARCHAR(100) NOT NULL ,
  `collapsible` VARCHAR(1) NULL DEFAULT NULL ,
  `description` VARCHAR(1000) NULL DEFAULT NULL ,
  `display_name` VARCHAR(100) NULL DEFAULT NULL ,
  `sort_order` INT(11) NULL DEFAULT NULL ,
  `visible` VARCHAR(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`name`) )",
  "CREATE  TABLE IF NOT EXISTS `mbaa_result` (
  `result_id` INT(11) NOT NULL ,
  `analyte_preferred` VARCHAR(100) NULL DEFAULT NULL ,
  `analyte_reported` VARCHAR(100) NULL DEFAULT NULL ,
  `arm_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `assay_group_id` VARCHAR(100) NULL DEFAULT NULL ,
  `assay_id` VARCHAR(100) NULL DEFAULT NULL ,
  `biosample_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `concentration_unit` VARCHAR(100) NULL DEFAULT NULL ,
  `concentration_value` VARCHAR(100) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `mfi` VARCHAR(100) NULL DEFAULT NULL ,
  `mfi_coordinate` VARCHAR(100) NULL DEFAULT NULL ,
  `source_accession` VARCHAR(15) NOT NULL ,
  `source_type` VARCHAR(30) NOT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_mbaa_result_1`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_mbaa_result_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_mbaa_result_3`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_mbaa_result_4`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_mbaa_result_5`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_mbaa_result_6`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_mbaa_result_7`
  FOREIGN KEY (`source_type` )
  REFERENCES `lk_source_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `neut_ab_titer_result` (
  `result_id` INT(11) NOT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `unit_preferred` VARCHAR(50) NULL DEFAULT NULL ,
  `unit_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `value_preferred` FLOAT NULL DEFAULT NULL ,
  `value_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `virus_strain_preferred` VARCHAR(200) NULL DEFAULT NULL ,
  `virus_strain_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_neut_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_neut_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_neut_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_neut_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_neut_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_neut_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_neut_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_neut_result_8`
  FOREIGN KEY (`virus_strain_preferred` )
  REFERENCES `lk_virus_strain` (`name` ),
  CONSTRAINT `fk_neut_result_9`
  FOREIGN KEY (`unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `pcr_result` (
  `result_id` INT(11) NOT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  `biosample_accession` VARCHAR(15) NOT NULL ,
  `comments` VARCHAR(500) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `expsample_accession` VARCHAR(15) NOT NULL ,
  `gene_id` VARCHAR(10) NULL DEFAULT NULL ,
  `gene_name` VARCHAR(4000) NULL DEFAULT NULL ,
  `gene_symbol` VARCHAR(100) NULL DEFAULT NULL ,
  `other_gene_accession` VARCHAR(250) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `study_time_collected` FLOAT NULL DEFAULT NULL ,
  `study_time_collected_unit` VARCHAR(25) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `unit_preferred` VARCHAR(200) NULL DEFAULT NULL ,
  `unit_reported` VARCHAR(200) NULL DEFAULT NULL ,
  `value_preferred` FLOAT NULL DEFAULT NULL ,
  `value_reported` VARCHAR(50) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`result_id`) ,
  CONSTRAINT `fk_pcr_result_1`
  FOREIGN KEY (`expsample_accession` )
  REFERENCES `expsample` (`expsample_accession` ),
  CONSTRAINT `fk_pcr_result_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_pcr_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_pcr_result_4`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ),
  CONSTRAINT `fk_pcr_result_5`
  FOREIGN KEY (`biosample_accession` )
  REFERENCES `biosample` (`biosample_accession` ),
  CONSTRAINT `fk_pcr_result_6`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_pcr_result_7`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_pcr_result_8`
  FOREIGN KEY (`unit_preferred` )
  REFERENCES `lk_unit_of_measure` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `planned_visit_2_arm` (
  `planned_visit_accession` VARCHAR(15) NOT NULL ,
  `arm_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`planned_visit_accession`, `arm_accession`) ,
  CONSTRAINT `fk_planned_visit_2_arm_1`
  FOREIGN KEY (`planned_visit_accession` )
  REFERENCES `planned_visit` (`planned_visit_accession` ),
  CONSTRAINT `fk_planned_visit_2_arm_2`
  FOREIGN KEY (`arm_accession` )
  REFERENCES `arm_or_cohort` (`arm_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `program_2_personnel` (
  `program_id` INT(11) NOT NULL ,
  `personnel_id` INT(11) NOT NULL ,
  `role_type` VARCHAR(12) NULL DEFAULT NULL ,
  PRIMARY KEY (`program_id`, `personnel_id`) ,
  CONSTRAINT `fk_program_2_personnel_1`
  FOREIGN KEY (`program_id` )
  REFERENCES `program` (`program_id` ),
  CONSTRAINT `fk_program_2_personnel_2`
  FOREIGN KEY (`personnel_id` )
  REFERENCES `personnel` (`personnel_id` ),
  CONSTRAINT `fk_program_2_personnel_3`
  FOREIGN KEY (`role_type` )
  REFERENCES `lk_user_role_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `protocol_deviation` (
  `protocol_deviation_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NOT NULL ,
  `is_adverse_event_related` VARCHAR(1) NULL DEFAULT NULL ,
  `reason_for_deviation` VARCHAR(250) NULL DEFAULT NULL ,
  `resolution_of_deviation` VARCHAR(500) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_end_day` INT(11) NULL DEFAULT NULL ,
  `study_start_day` INT(11) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `subject_continued_study` VARCHAR(1) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`protocol_deviation_accession`) ,
  CONSTRAINT `fk_protocol_deviation_1`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_protocol_deviation_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_protocol_deviation_3`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ))",
  "CREATE  TABLE IF NOT EXISTS `reagent_set_2_reagent` (
  `reagent_set_accession` VARCHAR(15) NOT NULL ,
  `reagent_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`reagent_set_accession`, `reagent_accession`) ,
  CONSTRAINT `fk_reagent_set_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_reagent_set_2`
  FOREIGN KEY (`reagent_accession` )
  REFERENCES `reagent` (`reagent_accession` ),
  CONSTRAINT `fk_reagent_set_3`
  FOREIGN KEY (`reagent_set_accession` )
  REFERENCES `reagent` (`reagent_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `reported_early_termination` (
  `early_termination_accession` VARCHAR(15) NOT NULL ,
  `is_adverse_event_related` VARCHAR(1) NULL DEFAULT NULL ,
  `is_subject_requested` VARCHAR(1) NULL DEFAULT NULL ,
  `reason_preferred` VARCHAR(40) NULL DEFAULT NULL ,
  `reason_reported` VARCHAR(250) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_day_reported` INT(11) NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`early_termination_accession`) ,
  CONSTRAINT `fk_reported_early_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_reported_early_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_reported_early_3`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `standard_curve` (
  `standard_curve_accession` VARCHAR(15) NOT NULL ,
  `analyte_preferred` VARCHAR(100) NULL DEFAULT NULL ,
  `analyte_reported` VARCHAR(100) NULL DEFAULT NULL ,
  `assay_group_id` VARCHAR(100) NULL DEFAULT NULL ,
  `assay_id` VARCHAR(100) NULL DEFAULT NULL ,
  `experiment_accession` VARCHAR(15) NOT NULL ,
  `formula` VARCHAR(500) NULL DEFAULT NULL ,
  `lower_limit` VARCHAR(100) NULL DEFAULT NULL ,
  `lower_limit_unit` VARCHAR(100) NULL DEFAULT NULL ,
  `result_schema` VARCHAR(50) NOT NULL DEFAULT 'OTHER' ,
  `upload_result_status` VARCHAR(20) NULL DEFAULT NULL ,
  `upper_limit` VARCHAR(100) NULL DEFAULT NULL ,
  `upper_limit_unit` VARCHAR(100) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`standard_curve_accession`) ,
  CONSTRAINT `fk_standard_curve_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_standard_curve_2`
  FOREIGN KEY (`experiment_accession` )
  REFERENCES `experiment` (`experiment_accession` ),
  CONSTRAINT `fk_standard_curve_3`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `standard_curve_2_file_info` (
  `standard_curve_accession` VARCHAR(15) NOT NULL ,
  `file_info_id` INT(11) NOT NULL ,
  `data_format` VARCHAR(100) NOT NULL ,
  `result_schema` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`standard_curve_accession`, `file_info_id`) ,
  CONSTRAINT `fk_standard_curve_2_file_info_1`
  FOREIGN KEY (`standard_curve_accession` )
  REFERENCES `standard_curve` (`standard_curve_accession` ),
  CONSTRAINT `fk_standard_curve_2_file_info_2`
  FOREIGN KEY (`file_info_id` )
  REFERENCES `file_info` (`file_info_id` ),
  CONSTRAINT `fk_standard_curve_2_file_info_3`
  FOREIGN KEY (`data_format` )
  REFERENCES `lk_data_format` (`name` ),
  CONSTRAINT `fk_standard_curve_2_file_info_4`
  FOREIGN KEY (`result_schema` )
  REFERENCES `lk_expsample_result_schema` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `study_2_panel` (
  `study_accession` VARCHAR(15) NOT NULL ,
  `panel_name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`study_accession`, `panel_name`) ,
  CONSTRAINT `fk_study_2_panel_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_study_2_panel_2`
  FOREIGN KEY (`panel_name` )
  REFERENCES `lk_study_panel` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `study_2_protocol` (
  `study_accession` VARCHAR(15) NOT NULL ,
  `protocol_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`study_accession`, `protocol_accession`) ,
  CONSTRAINT `fk_study_2_protocol_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_study_2_protocol_2`
  FOREIGN KEY (`protocol_accession` )
  REFERENCES `protocol` (`protocol_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `study_categorization` (
  `study_categorization_id` INT(11) NOT NULL ,
  `research_focus` VARCHAR(50) NOT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`study_categorization_id`) ,
  CONSTRAINT `fk_study_categorization_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_study_categorization_2`
  FOREIGN KEY (`research_focus` )
  REFERENCES `lk_research_focus` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `study_file` (
  `study_file_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `file_name` VARCHAR(250) NOT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `study_file_type` VARCHAR(50) NOT NULL DEFAULT 'Study Summary Description' ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`study_file_accession`) ,
  CONSTRAINT `fk_study_file_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_study_file_2`
  FOREIGN KEY (`study_file_type` )
  REFERENCES `lk_study_file_type` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `study_glossary` (
  `study_accession` VARCHAR(15) NOT NULL ,
  `definition` VARCHAR(500) NOT NULL ,
  `term` VARCHAR(125) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`study_accession`, `term`) ,
  CONSTRAINT `fk_study_glossary_1`
  FOREIGN KEY (`workspace_id` )
  REFERENCES `workspace` (`workspace_id` ),
  CONSTRAINT `fk_study_glossary_2`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `study_image` (
  `schematic_accession` VARCHAR(15) NOT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `image_filename` VARCHAR(250) NULL DEFAULT NULL ,
  `image_type` VARCHAR(40) NULL DEFAULT NULL ,
  `name` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`schematic_accession`) ,
  CONSTRAINT `fk_study_image_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `study_link` (
  `study_link_id` INT(11) NOT NULL ,
  `name` VARCHAR(500) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `type` VARCHAR(50) NULL DEFAULT NULL ,
  `value` VARCHAR(2000) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`study_link_id`) ,
  CONSTRAINT `fk_study_link_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `study_personnel` (
  `person_accession` VARCHAR(15) NOT NULL ,
  `site_name` VARCHAR(100) NULL DEFAULT NULL ,
  `email` VARCHAR(40) NULL DEFAULT NULL ,
  `first_name` VARCHAR(40) NULL DEFAULT NULL ,
  `honorific` VARCHAR(20) NULL DEFAULT NULL ,
  `last_name` VARCHAR(40) NULL DEFAULT NULL ,
  `organization` VARCHAR(125) NULL DEFAULT NULL ,
  `role_in_study` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NOT NULL ,
  `suffixes` VARCHAR(40) NULL DEFAULT NULL ,
  `title_in_study` VARCHAR(100) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`person_accession`) ,
  CONSTRAINT `fk_study_personnel_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ),
  CONSTRAINT `fk_study_personnel_2`
  FOREIGN KEY (`role_in_study` )
  REFERENCES `lk_personnel_role` (`name` ))",
  "CREATE  TABLE IF NOT EXISTS `study_pubmed` (
  `study_accession` VARCHAR(15) NOT NULL ,
  `pubmed_id` VARCHAR(16) NULL DEFAULT NULL ,
  `authors` VARCHAR(4000) NULL DEFAULT NULL ,
  `doi` VARCHAR(100) NULL DEFAULT NULL ,
  `issue` VARCHAR(20) NULL DEFAULT NULL ,
  `journal` VARCHAR(250) NULL DEFAULT NULL ,
  `month` VARCHAR(12) NULL DEFAULT NULL ,
  `pages` VARCHAR(20) NULL DEFAULT NULL ,
  `title` VARCHAR(4000) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  `year` VARCHAR(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`study_accession`, `pubmed_id`) ,
  CONSTRAINT `fk_study_pubmed_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `subject_measure_definition` (
  `subject_measure_accession` VARCHAR(15) NOT NULL ,
  `algorithm` VARCHAR(1024) NULL DEFAULT NULL ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `measureofcentraltendency` VARCHAR(40) NULL DEFAULT NULL ,
  `measureofdispersion` VARCHAR(40) NULL DEFAULT NULL ,
  `measuretype` VARCHAR(40) NULL DEFAULT NULL ,
  `name` VARCHAR(125) NULL DEFAULT NULL ,
  `outcometype` VARCHAR(70) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `timeframe` VARCHAR(256) NULL DEFAULT NULL ,
  `unitofmeasure` VARCHAR(40) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`subject_measure_accession`) ,
  CONSTRAINT `fk_subject_measure_def_1`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))",
  "CREATE  TABLE IF NOT EXISTS `subject_measure_result` (
  `subject_measure_res_accession` VARCHAR(15) NOT NULL ,
  `centraltendencymeasurevalue` VARCHAR(40) NULL DEFAULT NULL ,
  `datavalue` VARCHAR(40) NULL DEFAULT NULL ,
  `dispersionmeasurevalue` VARCHAR(40) NULL DEFAULT NULL ,
  `study_accession` VARCHAR(15) NULL DEFAULT NULL ,
  `study_day` FLOAT NULL DEFAULT NULL ,
  `subject_accession` VARCHAR(15) NOT NULL ,
  `subject_measure_accession` VARCHAR(15) NOT NULL ,
  `time_of_day` VARCHAR(40) NULL DEFAULT NULL ,
  `workspace_id` INT(11) NULL DEFAULT NULL ,
  `year_of_measure` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`subject_measure_res_accession`) ,
  CONSTRAINT `fk_subject_measure_result_1`
  FOREIGN KEY (`subject_accession` )
  REFERENCES `subject` (`subject_accession` ),
  CONSTRAINT `fk_subject_measure_result_2`
  FOREIGN KEY (`subject_measure_accession` )
  REFERENCES `subject_measure_definition` (`subject_measure_accession` ),
  CONSTRAINT `fk_subject_measure_result_3`
  FOREIGN KEY (`study_accession` )
  REFERENCES `study` (`study_accession` ))"
  )

db_index_stmts <- c(
  "CREATE INDEX `idx_subject_gender` ON `subject` (`gender` ASC)",
  "CREATE INDEX `idx_subject_race` ON `subject` (`race` ASC)",
  "CREATE INDEX `idx_subject_species` ON `subject` (`species` ASC)",
  "CREATE INDEX `idx_subject_workspace` ON `subject` (`workspace_id` ASC)",
  "CREATE INDEX `fk_subject_2` ON `subject` (`ethnicity` ASC)",
  "CREATE INDEX `idx_study_type` ON `study` (`type` ASC)",
  "CREATE INDEX `idx_study_workspace` ON `study` (`workspace_id` ASC)",
  "CREATE INDEX `fk_study_3` ON `study` (`dcl_id` ASC)",
  "CREATE INDEX `idx_adverse_event_subject` ON `adverse_event` (`subject_accession` ASC)",
  "CREATE INDEX `idx_adverse_event_study` ON `adverse_event` (`study_accession` ASC)",
  "CREATE INDEX `idx_adverse_event_workspace` ON `adverse_event` (`workspace_id` ASC)",
  "CREATE INDEX `fk_adverse_event_4` ON `adverse_event` (`severity_preferred` ASC)",
  "CREATE INDEX `idx_arm_or_cohort_study` ON `arm_or_cohort` (`study_accession` ASC, `arm_accession` ASC)",
  "CREATE INDEX `idx_arm_or_cohort_workspace` ON `arm_or_cohort` (`workspace_id` ASC)",
  "CREATE INDEX `idx_arm_2_subject_1` ON `arm_2_subject` (`subject_accession` ASC, `arm_accession` ASC)",
  "CREATE INDEX `fk_arm_2_subject_3` ON `arm_2_subject` (`age_unit` ASC)",
  "CREATE INDEX `fk_arm_2_subject_4` ON `arm_2_subject` (`age_event` ASC)",
  "CREATE INDEX `idx_file_info_file_info_id` ON `file_info` (`file_info_id` ASC)",
  "CREATE INDEX `idx_file_info_workspace` ON `file_info` (`workspace_id` ASC)",
  "CREATE INDEX `fk_file_info_2` ON `file_info` (`detail` ASC)",
  "CREATE INDEX `fk_file_info_3` ON `file_info` (`purpose` ASC)",
  "CREATE INDEX `idx_assessment_panel_study` ON `assessment_panel` (`study_accession` ASC)",
  "CREATE INDEX `idx_assessment_panel_workspace` ON `assessment_panel` (`workspace_id` ASC)",
  "CREATE INDEX `idx_assessment_2_file_info` ON `assessment_2_file_info` (`file_info_id` ASC, `assessment_panel_accession` ASC)",
  "CREATE INDEX `fk_assessment_2_file_info_3` ON `assessment_2_file_info` (`data_format` ASC)",
  "CREATE INDEX `fk_assessment_2_file_info_4` ON `assessment_2_file_info` (`result_schema` ASC)",
  "CREATE INDEX `idx_reference_range_study` ON `reference_range` (`study_accession` ASC)",
  "CREATE INDEX `idx_reference_range_workspace` ON `reference_range` (`workspace_id` ASC)",
  "CREATE INDEX `idx_assessment_component_assessment_panel` ON `assessment_component` (`assessment_panel_accession` ASC)",
  "CREATE INDEX `idx_assessment_component_subject` ON `assessment_component` (`subject_accession` ASC)",
  "CREATE INDEX `idx_assessment_component_planned_visit` ON `assessment_component` (`planned_visit_accession` ASC)",
  "CREATE INDEX `idx_assessment_component_workspace` ON `assessment_component` (`workspace_id` ASC)",
  "CREATE INDEX `fk_assessment_component_5` ON `assessment_component` (`reference_range_accession` ASC)",
  "CREATE INDEX `fk_assessment_component_6` ON `assessment_component` (`result_unit_preferred` ASC)",
  "CREATE INDEX `fk_assessment_component_7` ON `assessment_component` (`age_at_onset_unit_preferred` ASC)",
  "CREATE INDEX `idx_period_study` ON `period` (`study_accession` ASC)",
  "CREATE INDEX `idx_period_workspace` ON `period` (`workspace_id` ASC)",
  "CREATE INDEX `idx_planned_visit_workspace` ON `planned_visit` (`workspace_id` ASC)",
  "CREATE INDEX `idx_planned_visit_period` ON `planned_visit` (`period_accession` ASC)",
  "CREATE INDEX `fk_planned_visit_1` ON `planned_visit` (`study_accession` ASC)",
  "CREATE INDEX `idx_biosample_subject` ON `biosample` (`subject_accession` ASC)",
  "CREATE INDEX `idx_biosample_study` ON `biosample` (`study_accession` ASC)",
  "CREATE INDEX `idx_biosample_planned_visit` ON `biosample` (`planned_visit_accession` ASC)",
  "CREATE INDEX `idx_biosample_workspace` ON `biosample` (`workspace_id` ASC)",
  "CREATE INDEX `fk_biosample_5` ON `biosample` (`study_time_collected_unit` ASC)",
  "CREATE INDEX `fk_biosample_6` ON `biosample` (`study_time_t0_event` ASC)",
  "CREATE INDEX `fk_biosample_8` ON `biosample` (`type` ASC)",
  "CREATE INDEX `idx_treatment_workspace` ON `treatment` (`workspace_id` ASC)",
  "CREATE INDEX `fk_treatment_2` ON `treatment` (`amount_unit` ASC)",
  "CREATE INDEX `fk_treatment_3` ON `treatment` (`duration_unit` ASC)",
  "CREATE INDEX `fk_treatment_4` ON `treatment` (`temperature_unit` ASC)",
  "CREATE INDEX `idx_biosample_2_treatment` ON `biosample_2_treatment` (`treatment_accession` ASC, `biosample_accession` ASC)",
  "CREATE INDEX `fk_program_1` ON `program` (`category` ASC)",
  "CREATE INDEX `idx_contract_program` ON `contract_grant` (`program_id` ASC)",
  "CREATE INDEX `idx_contract_2_personnel` ON `contract_grant_2_personnel` (`personnel_id` ASC, `contract_grant_id` ASC)",
  "CREATE INDEX `fk_contract_2_personnel_3` ON `contract_grant_2_personnel` (`role_type` ASC)",
  "CREATE INDEX `idx_contract_grant_2_study_study` ON `contract_grant_2_study` (`study_accession` ASC, `contract_grant_id` ASC)",
  "CREATE INDEX `idx_experiment_study` ON `experiment` (`study_accession` ASC)",
  "CREATE INDEX `idx_experiment_workspace` ON `experiment` (`workspace_id` ASC)",
  "CREATE INDEX `fk_experiment_2` ON `experiment` (`purpose` ASC)",
  "CREATE INDEX `fk_experiment_3` ON `experiment` (`measurement_technique` ASC)",
  "CREATE INDEX `idx_control_sample_workspace` ON `control_sample` (`workspace_id` ASC)",
  "CREATE INDEX `fk_control_sample_2` ON `control_sample` (`experiment_accession` ASC)",
  "CREATE INDEX `fk_control_sample_3` ON `control_sample` (`result_schema` ASC)",
  "CREATE INDEX `idx_control_sample_2_file_info` ON `control_sample_2_file_info` (`file_info_id` ASC, `control_sample_accession` ASC)",
  "CREATE INDEX `fk_control_sample_2_file_info_3` ON `control_sample_2_file_info` (`data_format` ASC)",
  "CREATE INDEX `fk_control_sample_2_file_info_4` ON `control_sample_2_file_info` (`result_schema` ASC)",
  "CREATE INDEX `idx_expsample_experiment` ON `expsample` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_expsample_workspace` ON `expsample` (`workspace_id` ASC)",
  "CREATE INDEX `idx_elisa_study_accession` ON `elisa_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_elisa_arm_accession` ON `elisa_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_elisa_biosample_accession` ON `elisa_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_elisa_experiment_accession` ON `elisa_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_elisa_expsample_accession` ON `elisa_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_elisa_subject_accession` ON `elisa_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_elisa_workspace` ON `elisa_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_elisa_result_9` ON `elisa_result` (`unit_preferred` ASC)",
  "CREATE INDEX `idx_elispot_study_accession` ON `elispot_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_elispot_arm_accession` ON `elispot_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_elispot_biosample_accession` ON `elispot_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_elispot_experiment_accession` ON `elispot_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_elispot_expsample_accession` ON `elispot_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_elispot_subject_accession` ON `elispot_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_elispot_workspace` ON `elispot_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_protocol_1` ON `protocol` (`type` ASC)",
  "CREATE INDEX `fk_protocol_2` ON `protocol` (`workspace_id` ASC)",
  "CREATE INDEX `idx_experiment_2_protocol` ON `experiment_2_protocol` (`protocol_accession` ASC, `experiment_accession` ASC)",
  "CREATE INDEX `idx_expsample_2_biosample` ON `expsample_2_biosample` (`biosample_accession` ASC, `expsample_accession` ASC)",
  "CREATE INDEX `idx_expsample_2_file_info` ON `expsample_2_file_info` (`file_info_id` ASC, `expsample_accession` ASC)",
  "CREATE INDEX `idx_expsample_2_file_info_id` ON `expsample_2_file_info` (`file_info_id` ASC)",
  "CREATE INDEX `fk_expsample_2_file_info_3` ON `expsample_2_file_info` (`data_format` ASC)",
  "CREATE INDEX `fk_expsample_2_file_info_4` ON `expsample_2_file_info` (`result_schema` ASC)",
  "CREATE INDEX `idx_reagent_workspace` ON `reagent` (`workspace_id` ASC)",
  "CREATE INDEX `fk_reagent_2` ON `reagent` (`type` ASC)",
  "CREATE INDEX `idx_expsample_2_reagent` ON `expsample_2_reagent` (`reagent_accession` ASC, `expsample_accession` ASC)",
  "CREATE INDEX `idx_expsample_2_treatment` ON `expsample_2_treatment` (`treatment_accession` ASC, `expsample_accession` ASC)",
  "CREATE INDEX `fk_expsample_mbaa_detail_2` ON `expsample_mbaa_detail` (`plate_type` ASC)",
  "CREATE INDEX `fk_expsample_public_2` ON `expsample_public_repository` (`repository_name` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_study_accession` ON `fcs_analyzed_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_arm_accession` ON `fcs_analyzed_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_biosample_accession` ON `fcs_analyzed_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_experiment_accession` ON `fcs_analyzed_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_expsample_accession` ON `fcs_analyzed_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_subject_accession` ON `fcs_analyzed_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_fcs_analyzed_workspace` ON `fcs_analyzed_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_fcs_analyzed_result_12` ON `fcs_analyzed_result` (`population_stat_unit_preferred` ASC)",
  "CREATE INDEX `fk_fcs_analyzed_result_13` ON `fcs_analyzed_result` (`workspace_file_info_id` ASC)",
  "CREATE INDEX `fk_fcs_analyzed_result_marker_1` ON `fcs_analyzed_result_marker` (`result_id` ASC)",
  "CREATE INDEX `idx_fcs_header_expsample_accession` ON `fcs_header` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_fcs_header_file_info_id` ON `fcs_header` (`file_info_id` ASC)",
  "CREATE INDEX `idx_fcs_header_marker_2_reagent` ON `fcs_header_marker_2_reagent` (`reagent_accession` ASC, `fcs_header_id` ASC)",
  "CREATE INDEX `idx_hai_arm_accession` ON `hai_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_hai_biosample_accession` ON `hai_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_hai_experiment_accession` ON `hai_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_hai_expsample_accession` ON `hai_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_hai_study_accession` ON `hai_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_hai_subject_accession` ON `hai_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_hai_workspace` ON `hai_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_hai_result_8` ON `hai_result` (`virus_strain_preferred` ASC)",
  "CREATE INDEX `fk_hai_result_9` ON `hai_result` (`unit_preferred` ASC)",
  "CREATE INDEX `fk_hla_typing_result_1` ON `hla_typing_result` (`expsample_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_2` ON `hla_typing_result` (`experiment_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_3` ON `hla_typing_result` (`study_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_4` ON `hla_typing_result` (`arm_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_5` ON `hla_typing_result` (`biosample_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_6` ON `hla_typing_result` (`subject_accession` ASC)",
  "CREATE INDEX `fk_hla_typing_result_7` ON `hla_typing_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_inclusion_exclusion_1` ON `inclusion_exclusion` (`study_accession` ASC)",
  "CREATE INDEX `fk_inclusion_exclusion_2` ON `inclusion_exclusion` (`workspace_id` ASC)",
  "CREATE INDEX `fk_inclusion_exclusion_3` ON `inclusion_exclusion` (`criterion_category` ASC)",
  "CREATE INDEX `idx_intervention_subject` ON `intervention` (`subject_accession` ASC)",
  "CREATE INDEX `idx_intervention_study` ON `intervention` (`study_accession` ASC)",
  "CREATE INDEX `idx_intervention_workspace` ON `intervention` (`workspace_id` ASC)",
  "CREATE INDEX `fk_intervention_4` ON `intervention` (`compound_role` ASC)",
  "CREATE INDEX `idx_kir_arm_accession` ON `kir_typing_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_kir_biosample_accession` ON `kir_typing_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_kir_experiment_accession` ON `kir_typing_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_kir_expsample_accession` ON `kir_typing_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_kir_subject_accession` ON `kir_typing_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_kir_study_accession` ON `kir_typing_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_kir_workspace` ON `kir_typing_result` (`workspace_id` ASC)",
  "CREATE INDEX `idx_lab_test_panel_study` ON `lab_test_panel` (`study_accession` ASC)",
  "CREATE INDEX `fk_lab_test_panel_1` ON `lab_test_panel` (`workspace_id` ASC)",
  "CREATE INDEX `idx_lab_test_biosample` ON `lab_test` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_lab_test_workspace` ON `lab_test` (`workspace_id` ASC)",
  "CREATE INDEX `fk_lab_test_3` ON `lab_test` (`lab_test_panel_accession` ASC)",
  "CREATE INDEX `fk_lab_test_4` ON `lab_test` (`name_preferred` ASC)",
  "CREATE INDEX `fk_lab_test_5` ON `lab_test` (`result_unit_preferred` ASC)",
  "CREATE INDEX `idx_lab_test_2_protocol` ON `lab_test_panel_2_protocol` (`protocol_accession` ASC, `lab_test_panel_accession` ASC)",
  "CREATE INDEX `idx_mbaa_arm_accession` ON `mbaa_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_mbaa_biosample_accession` ON `mbaa_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_mbaa_experiment_accession` ON `mbaa_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_mbaa_source_accession` ON `mbaa_result` (`source_accession` ASC)",
  "CREATE INDEX `idx_mbaa_study_accession` ON `mbaa_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_mbaa_subject_accession` ON `mbaa_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_mbaa_workspace` ON `mbaa_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_mbaa_result_7` ON `mbaa_result` (`source_type` ASC)",
  "CREATE INDEX `idx_neut_arm_accession` ON `neut_ab_titer_result` (`arm_accession` ASC)",
  "CREATE INDEX `idx_neut_biosample_accession` ON `neut_ab_titer_result` (`biosample_accession` ASC)",
  "CREATE INDEX `idx_neut_experiment_accession` ON `neut_ab_titer_result` (`experiment_accession` ASC)",
  "CREATE INDEX `idx_neut_expsample_accession` ON `neut_ab_titer_result` (`expsample_accession` ASC)",
  "CREATE INDEX `idx_neut_study_accession` ON `neut_ab_titer_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_neut_subject_accession` ON `neut_ab_titer_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx__workspace` ON `neut_ab_titer_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_neut_result_8` ON `neut_ab_titer_result` (`virus_strain_preferred` ASC)",
  "CREATE INDEX `fk_neut_result_9` ON `neut_ab_titer_result` (`unit_preferred` ASC)",
  "CREATE INDEX `fk_pcr_result_1` ON `pcr_result` (`expsample_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_2` ON `pcr_result` (`experiment_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_3` ON `pcr_result` (`study_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_4` ON `pcr_result` (`arm_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_5` ON `pcr_result` (`biosample_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_6` ON `pcr_result` (`subject_accession` ASC)",
  "CREATE INDEX `fk_pcr_result_7` ON `pcr_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_pcr_result_8` ON `pcr_result` (`unit_preferred` ASC)",
  "CREATE INDEX `fk_planned_visit_2_arm_2` ON `planned_visit_2_arm` (`arm_accession` ASC)",
  "CREATE INDEX `idx_program_2_personnel` ON `program_2_personnel` (`personnel_id` ASC, `program_id` ASC)",
  "CREATE INDEX `fk_program_2_personnel_3` ON `program_2_personnel` (`role_type` ASC)",
  "CREATE INDEX `idx_procotol_deviation_study` ON `protocol_deviation` (`study_accession` ASC)",
  "CREATE INDEX `idx_procotol_deviation_subject` ON `protocol_deviation` (`subject_accession` ASC)",
  "CREATE INDEX `idx_procotol_deviation_workspace` ON `protocol_deviation` (`workspace_id` ASC)",
  "CREATE INDEX `idx_reagent_set_reagent` ON `reagent_set_2_reagent` (`reagent_accession` ASC, `reagent_set_accession` ASC)",
  "CREATE INDEX `idx_reagent_set_workspace` ON `reagent_set_2_reagent` (`workspace_id` ASC)",
  "CREATE INDEX `idx_early_termination_study` ON `reported_early_termination` (`study_accession` ASC)",
  "CREATE INDEX `idx_early_termination_subject` ON `reported_early_termination` (`subject_accession` ASC)",
  "CREATE INDEX `idx_early_termination_workspace` ON `reported_early_termination` (`workspace_id` ASC)",
  "CREATE INDEX `fk_standard_curve_1` ON `standard_curve` (`workspace_id` ASC)",
  "CREATE INDEX `fk_standard_curve_2` ON `standard_curve` (`experiment_accession` ASC)",
  "CREATE INDEX `fk_standard_curve_3` ON `standard_curve` (`result_schema` ASC)",
  "CREATE INDEX `fk_standard_curve_2_file_info_2` ON `standard_curve_2_file_info` (`file_info_id` ASC)",
  "CREATE INDEX `fk_standard_curve_2_file_info_3` ON `standard_curve_2_file_info` (`data_format` ASC)",
  "CREATE INDEX `fk_standard_curve_2_file_info_4` ON `standard_curve_2_file_info` (`result_schema` ASC)",
  "CREATE INDEX `fk_study_2_panel_2` ON `study_2_panel` (`panel_name` ASC)",
  "CREATE INDEX `fk_study_2_protocol_2` ON `study_2_protocol` (`protocol_accession` ASC)",
  "CREATE INDEX `fk_study_categorization_1` ON `study_categorization` (`study_accession` ASC)",
  "CREATE INDEX `fk_study_categorization_2` ON `study_categorization` (`research_focus` ASC)",
  "CREATE INDEX `idx_study_file_study` ON `study_file` (`study_accession` ASC)",
  "CREATE INDEX `idx_study_file_type` ON `study_file` (`study_file_type` ASC)",
  "CREATE INDEX `idx_study_file_workspace` ON `study_file` (`workspace_id` ASC)",
  "CREATE INDEX `idx_study_glossaryworkspace` ON `study_glossary` (`workspace_id` ASC)",
  "CREATE INDEX `idx_study_image_study` ON `study_image` (`study_accession` ASC)",
  "CREATE INDEX `idx_study_image_workspace` ON `study_image` (`workspace_id` ASC)",
  "CREATE INDEX `fk_study_link_1` ON `study_link` (`study_accession` ASC)",
  "CREATE INDEX `fk_study_personnel_1` ON `study_personnel` (`study_accession` ASC)",
  "CREATE INDEX `fk_study_personnel_2` ON `study_personnel` (`role_in_study` ASC)",
  "CREATE INDEX `idx_subject_measure_study` ON `subject_measure_definition` (`study_accession` ASC)",
  "CREATE INDEX `idx_subject_measure_workspace` ON `subject_measure_definition` (`workspace_id` ASC)",
  "CREATE INDEX `idx_subject_measure_result_study` ON `subject_measure_result` (`study_accession` ASC)",
  "CREATE INDEX `idx_subject_measure_result_subject` ON `subject_measure_result` (`subject_accession` ASC)",
  "CREATE INDEX `idx_subject_measure_result_workspace` ON `subject_measure_result` (`workspace_id` ASC)",
  "CREATE INDEX `fk_subject_measure_result_2` ON `subject_measure_result` (`subject_measure_accession` ASC)"
)


##' buildNewSqliteDb
##' 
##' The function \code{buildSqliteDb} builds a sqlite db of ImmPort study data. It takes in as input the 
##' study files in the TSV (Tab) format. 
##' 
##' @param data_dir File directory where the study TSV files are stored
##' @param db_dir File directory where the sqlite database will be stored
##' @return The SQLite database name
##' @examples
##' studies_dir <- system.file("extdata", "ImmPortStudies", package = "RImmPort")
##' # set tab_dir to the folder where the zip files are located
##' tab_dir <- file.path(studies_dir, "Tab")
##' # set db_dir to the folder where the database file 'ImmPort.sqlite' should be stored
##' db_dir <- file.path(studies_dir, "Db")
##' # build a new ImmPort SQLite database with the data in the downloaded zip files
##' # dbname <- buildNewSqliteDb(tab_dir, db_dir) 
##' @importFrom DBI dbGetQuery dbConnect dbListFields
##' @importFrom RSQLite SQLite
##' @importFrom RSQLite dbWriteTable
##' @importFrom sqldf sqldf
##' @importFrom tools file_path_sans_ext
##' @importFrom data.table setnames
##' @importFrom utils unzip
##' @importFrom utils read.table
##' @export
##' 
buildNewSqliteDb <- function(data_dir, db_dir) {
  dbname="ImmPort.sqlite"
  
  prevWD <- getwd()
  on.exit(setwd(prevWD))
  
  setwd(db_dir)
  if (file.exists(dbname)) {
    stop(paste("ImmPort.sqlite database already exists. Please remove the file ImmPort.sqlite in ", 
               db_dir, " before building a new ImmPort database"))
  }
  
  sqldf(paste("attach \'", dbname, "\' as new", sep=""), drv = "SQLite") 
  
  db <- dbConnect(SQLite(), dbname)
  
  for (i in db_table_stmts) {
    dbGetQuery(db, i)
  }
  
  setwd(data_dir)
  
  # unzip study files into data directory
  zipfiles <- list.files(pattern = "Tab\\.zip$")
  for (zf in zipfiles) {
    #      zipname <- file_path_sans_ext(zf)
    #      study_dir <- file.path(data_dir, zipname)
    #      dir.create(study_dir)
    unzip(zf)
  }
  
  # process each study dir and load data into SQLite db
  study_dirs <- list.files(pattern = "Tab$")
  for (sd in study_dirs) {
    study_dir <- file.path(data_dir, sd)
    cat("study dir = ", study_dir, "\n")
    if (dir.exists(study_dir) == FALSE) {
      cat("skipping = ", study_dir, "\n")
      next
    }
    
    if (dir.exists(file.path(study_dir, "Tab")))
      setwd(file.path(study_dir, "Tab"))
    else
      setwd(study_dir)
    cat("processing files of study dir = ", study_dir, "\n")
    files <- list.files(pattern = "\\.txt$")
    for (f in files) {
      fname <- file_path_sans_ext(f)
      cat("processing file = ", fname, "\n")
      
      df <- read.table(f, sep="\t", header=TRUE, fill=TRUE, quote = "", stringsAsFactors = FALSE)
      df <- df[rowSums(is.na(df)) != ncol(df),]
      colnames(df) <- tolower(colnames(df))
      
      tb_col_names <- dbListFields(conn = db, name = fname)
      #cat("tb_col_names = ", tolower(tb_col_names), "\n")
      #cat("df_col_names = ", tolower(colnames(df)), "\n")
      
      # if (all(tolower(tb_col_names) != tolower(colnames(df)))) {
      #   cat("column mismatch in ", fname, " file \n")
      # }
      if (length(tb_col_names) != length(colnames(df))) {
        cat("length of tb_col_names = ", length(tb_col_names), "\n")
        cat("length of df_col_names = ", length(colnames(df)), "\n")
        cat("column mismatch in ", fname, " file \n")
      }
      if ((substr(fname, 1,3) == "lk_") || (fname == "personnel") || 
          (fname == "program_2_personnel") || (fname == "program"))
        dbWriteTable(conn = db, name = fname, value = df, overwrite = TRUE, row.names = FALSE)
      else
        dbWriteTable(conn = db, name = fname, value = df, append = TRUE, row.names = FALSE)
    }
  }

  for (i in db_index_stmts) {
    dbGetQuery(db, i)
  }
  
  dbname
}

