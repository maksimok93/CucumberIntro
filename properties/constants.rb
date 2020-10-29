module MainPageLocators
  INPATIENT_WARD = 'li[id="Inpatient Ward"]'
  LOGIN = 'input[id="loginButton"]'
end

module InpatientWardLocators
  FIND_PATIENT_RECORD = '//a[text()[contains(.,"Find Patient Record")]]'
  REGISTER_PATIENT = '//a[text()[contains(.,"Register a patient")]]'
  GENDER_MALE = 'option[value="M"]'
  ADDRESS = '//span[text()[contains(.,"Address")]]'
end

module SysAdminLocators
  SYSTEM_ADMINISTRATION = '//a[text()[contains(.,"System Administration")]]'
  MANAGE_SCHEDULER = '//a[text()[contains(.,"Manage Scheduler")]]'
  ADD_NEW_TASK = '//button[text()[contains(.,"Add Tasks")]]'
  SCHEDULABLE_CLASS = 'select[ng-model="schedulableClass"]'
  DESCRIPTION = 'textarea[ng-model="description"]'
  REPEAT_INTERVAL_TIME = 'select[ng-model="repeatIntervalType"]'
  START_TIME = 'input[ng-model="startTimeVal"]'
  SAVE = 'button[ng-click="saveTaskDefinitions()"]'
end

module DataManagementLocators
  # DATA_MANAGEMENT = '//a[text()[contains(.,"Data Management")]]'
  DATA_MANAGEMENT = 'a[href="/openmrs/coreapps/datamanagement/dataManagement.page"]'
  # MERGE_PATIENT = '//a[text()[contains(.,"Merge Patient Electronic Records")]]'
  MERGE_PATIENT = 'a[id="coreapps-mergePatientsHomepageLink-app"]'
  CONTINUE_DISABLED = 'input[class="confirm disabled"]'
  MERGE_RECORDS_PAGE = 'https://qa-refapp.openmrs.org/openmrs/coreapps/datamanagement/mergePatients.page?app=coreapps.mergePatients'
end
