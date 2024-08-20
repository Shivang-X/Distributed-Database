
drop database sprint2;
Create database sprint2; 
use sprint2;


CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    Name VARCHAR(255),
    LocationID INT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Clinic (
    ClinicID INT PRIMARY KEY,
    Name VARCHAR(255),
    LocationID INT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255),
    HospitalID INT
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(50),
    SecurityUserID INT,
    ClinicID INT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE SecurityUser (
    SecurityUserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Password VARCHAR(255),
    Token VARCHAR(255),
    DeviceID INT,
    LastSignInTime DATETIME
);

CREATE TABLE HealthCareProvider (
    ProviderID INT PRIMARY KEY,
    EmployeeID INT,
    Type VARCHAR(50),
    AvailabilitySchedule VARCHAR(255)
);

CREATE TABLE Nurse (
    NurseID INT PRIMARY KEY,
    EmployeeID INT,
    AvailabilitySchedule VARCHAR(255),
    Type VARCHAR(50)
);

CREATE TABLE FrontDeskStaff (
    FrontDeskStaffID INT PRIMARY KEY,
    EmployeeID INT,
    AvailabilitySchedule VARCHAR(255),
    Type VARCHAR(50)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    Race VARCHAR(50),
    Ethinicity VARCHAR(50),
    PrimaryProviderID INT
);


CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    AppointmentTime DATETIME,
    PatientID INT,
    ProviderID INT,
    CheckinCheckoutID INT,
    Reason VARCHAR(255),
    ImportantNotes TEXT,
    AppointmentType VARCHAR(50)
);

CREATE TABLE CheckinCheckout (
    CheckinCheckoutID INT PRIMARY KEY,
    CheckinTime DATETIME,
    CheckoutTime DATETIME,
    CheckoutByID INT,
    CheckinByID INT
);


CREATE TABLE PatientInsurancePlan (
    PatientInsurancePlanID INT PRIMARY KEY,
    InsurancePlanID INT,
    PurchasedBy VARCHAR(255),
    CoverageStartsFrom DATETIME,
    CoverageEndsOn DATETIME,
    AmountPaid DECIMAL(10, 2),
    AmountPaidDate DATETIME,
    PatientID INT
);

CREATE TABLE InsurancePlan (
    InsurancePlanID INT PRIMARY KEY,
    Name VARCHAR(255),
    Coverage VARCHAR(255),
    PremiumAmount DECIMAL(10, 2),
    CoverageAmount DECIMAL(10, 2),
    Type VARCHAR(50),
    TimeOfCoverage VARCHAR(255),
    InsuranceCompanyName VARCHAR(255),
    InsuranceCompanyDetails VARCHAR(255)
);

CREATE TABLE InsuranceBilling (
    InsuranceBillingID INT PRIMARY KEY,
    TransactionID INT,
    PatientInsurancePlanID INT,
    Amount DECIMAL(10, 2),
    CreatedDate DATETIME
);

CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AppointmentID INT,
    Amount DECIMAL(10, 2),
    PaidBy VARCHAR(255),
    CreatedDate DATETIME
);


CREATE TABLE PatientConsentForm (
    PatientFormID INT PRIMARY KEY,
    FormType VARCHAR(50),
    Content TEXT,
    CreatedDate DATETIME,
    PatientSignRequired BOOLEAN,
    ProviderSignRequired BOOLEAN
);


CREATE TABLE SignedForms (
    SignedFormID INT PRIMARY KEY,
    PatientID INT,
    PatientFormID INT,
    ConsentDateTime DATETIME,
    PatientSign BLOB, -- Assuming binary data for signature
    ProviderSign BLOB,
    ProviderID INT
);


CREATE TABLE Vaccinations (
    VaccinationID INT PRIMARY KEY,
    VaccinationType VARCHAR(50),
    Name VARCHAR(255),
    NumberOfDoses INT,
    Notes VARCHAR(255),
    ClinicID INT    
);

CREATE TABLE FollowUpAppointment (
    FollowUpAppointmentID INT PRIMARY KEY,
    ProviderID INT,
    PatientID INT,
    InitialAppointmnetID INT,
    SuggestedDate DATE,
    SuggestedTime TIME,
    CreatedDate DATETIME
);

CREATE TABLE VaccinationEnrollment (
    VaccinationEntollmentID INT PRIMARY KEY,
    ScheduleShotsID INT,
    VaccinationID INT,
    ScheduleDateTime DATETIME,
    IsTaken BOOLEAN,
    GiveByName VARCHAR(255),
    NurseID INT
);


CREATE TABLE Allergies (
    AllergyID INT PRIMARY KEY,
    Type VARCHAR(50),
    Name VARCHAR(255),
    AllergySeverityTypeID INT
);


CREATE TABLE PatientAllergies (
    PatientAllergyID INT PRIMARY KEY,
    PatientID INT,
    AllergyID INT,
    CreatedDate DATETIME
);


CREATE TABLE Televisit (
    TelevisitID INT PRIMARY KEY,
    AppointmentID INT,
    TelevisitScheduleTime DATETIME,
    Platform VARCHAR(50),
    CreatedBy VARCHAR(255),
    ProviderID INT,
    PatientID INT
);


CREATE TABLE TelevisitSession (
    TelevisitSessionID INT PRIMARY KEY,
    TelevisitID INT,
    SessionToken VARCHAR(255),
    PatientJoinedTime DATETIME,
    ProviderJoinedTime DATETIME,
    PatientLeaveTime DATETIME,
    ProviderLeaveTime DATETIME
);


CREATE TABLE TelevisitFeedback (
    TelevisitFeedbackID INT PRIMARY KEY,
    TelevisitID INT,
    Feedback TEXT,
    Rating INT,
    CreatedDate DATETIME
);


CREATE TABLE TelevisitNote (
    TelevisitNoteID INT PRIMARY KEY,
    Notes TEXT,
    CreatedAt DATETIME,
    TelevisitID INT,
    ProviderID INT,
    Issue TEXT
);


CREATE TABLE VisitNote (
    VisitNoteID INT PRIMARY KEY,
    Notes VARCHAR(255),
    CreatedDate DATETIME,
    ProviderID INT,
    AppointmentID INT
);


CREATE TABLE DietaryPreferences (
    DietaryPreferenceID INT PRIMARY KEY,
    Name VARCHAR(255),
    DietaryPreferenceTypeID INT,
    PatientID INT,
    CreatedDate DATETIME
);


CREATE TABLE ProviderSpecialization (
    ProviderSpecializationID INT PRIMARY KEY,
    SpecializationID INT,
    
    ProviderID INT,
    CreatedDate DATETIME,
    Level VARCHAR(50)
);

CREATE TABLE Specialization (
    SpecializationID INT PRIMARY KEY,
    Type VARCHAR(50),
    Name VARCHAR(255),
    Category VARCHAR(255)
);

CREATE TABLE DrugRequest (
    DrugRequestID INT PRIMARY KEY,
    Status VARCHAR(50),
    MedicalRecordID INT,
    NumberOfDosage INT,
    Reason VARCHAR(255),
    ProviderID INT,
    PatientID INT,
    CreatedDate DATETIME,
    UpdatedDate DATETIME
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    Street VARCHAR(255),
    PostalCode VARCHAR(20),
    City VARCHAR(255),
    Province VARCHAR(255),
    Lat DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

CREATE TABLE Device (
    DeviceID INT PRIMARY KEY,
    UserID INT,
    DeviceType VARCHAR(50),
    DeviceName VARCHAR(255),
    LastAccessed DATETIME,
    Status VARCHAR(50),
    IPAddress VARCHAR(15),
    DeviceToken VARCHAR(255)
);

CREATE TABLE AllergySeverityType (
    AllergySeverityTypeID INT PRIMARY KEY,
    SeverityType VARCHAR(50),
    Description TEXT,
    TreatmentGuidelines TEXT
);


CREATE TABLE DietaryPreferenceType (
    DietaryPreferenceTypeID INT PRIMARY KEY,
    Type VARCHAR(50),
    Description TEXT,
    RecommendedIntake TEXT,
    Restrictions TEXT
);


CREATE TABLE AllergySideEffects (
    PatientID INT,
    AllergyID INT,
    SideEffects VARCHAR(255),
    PRIMARY KEY (PatientID, AllergyID)
);




CREATE TABLE MedicalRecord (
    MedicalRecordID INT PRIMARY KEY,
    AppointmentID INT,
    VitalsID INT,
    LabTestID INT,
    PrescriptionID INT,
    InsuranceBillingID INT,
    ScheduleShotsID INT,
    DrugRequestID INT
);


CREATE TABLE Vitals (
    VitalsID INT PRIMARY KEY,
    CreatedDate DATETIME,
    HeartRate VARCHAR(50),
    BloodPressure VARCHAR(50),
    Temperature DECIMAL(5, 2),
    Weight DECIMAL(5, 2),
    Height DECIMAL(5, 2),
    SugarLevel DECIMAL(5, 2)
);


CREATE TABLE ScheduleOfShots (
    ScheduleShotsID INT PRIMARY KEY,
    MedicalRecordID INT,
    ScheduleDateTime DATETIME,
    IsTaken BOOLEAN,
    NurseID INT
);


CREATE TABLE Prescription (
PrescriptionID INT PRIMARY KEY,
    MedicalRecordID INT,
    CreatedDate DATETIME,
    Instructions TEXT,
    Notes TEXT
);

CREATE TABLE Drug (
    DrugID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Type VARCHAR(100),
    DrugCategory VARCHAR(100)
);

CREATE TABLE DrugEnrollment (
    MedicalRecordID INT,
    DrugID INT,
    PrescriptionID INT,
    Dosage VARCHAR(100),
    ScheduleTime DATETIME,
    PRIMARY KEY (MedicalRecordID, DrugID, PrescriptionID)
);

CREATE TABLE LabTest (
    LabTestID INT PRIMARY KEY,
    CreatedDate DATETIME,
    Type VARCHAR(255),
    LaboratoryID INT
    -- Assuming a Laboratory table exists. Add FOREIGN KEY constraint if necessary
);

CREATE TABLE LabTestResults (
    LabTestID INT,
    MedicalRecordID INT,
    Results TEXT,
    CreatedDate DATETIME,
    CreatedByName VARCHAR(255),
    SignedByName VARCHAR(255),
    PRIMARY KEY (LabTestID, MedicalRecordID, CreatedDate)
);

CREATE TABLE Pharmacy (
    PharmacyID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address TEXT,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE DrugDelivery (
    PrescriptionID INT,
    PharmacyID INT,
    DeliveryTime DATETIME,
    DeliveryStatus VARCHAR(100),
    Notes TEXT,
    ReceivedBy VARCHAR(255),
    PRIMARY KEY (PrescriptionID, PharmacyID, DeliveryTime)
);




















-- Hospital table references
ALTER TABLE Clinic
ADD FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID);

ALTER TABLE Employee
ADD FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID);

ALTER TABLE SecurityUser
ADD FOREIGN KEY (SecurityUserID) REFERENCES Employee(EmployeeID);

ALTER TABLE HealthCareProvider
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE Patient
ADD FOREIGN KEY (PrimaryProviderID) REFERENCES HealthCareProvider(ProviderID);

-- Clinic table references
ALTER TABLE Employee
ADD FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID);

-- Employee table references
ALTER TABLE HealthCareProvider
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE Nurse
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE FrontDeskStaff
ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);


ALTER TABLE PatientInsurancePlan
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
ADD FOREIGN KEY (InsurancePlanID) REFERENCES InsurancePlan(InsurancePlanID)
;

ALTER TABLE InsuranceBilling
ADD FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID),
ADD FOREIGN KEY (PatientInsurancePlanID) REFERENCES PatientInsurancePlan(PatientInsurancePlanID);

ALTER TABLE Transaction
ADD FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID);



ALTER TABLE VaccinationEnrollment
ADD FOREIGN KEY (ScheduleShotsID) REFERENCES ScheduleOfShots(ScheduleShotsID),
ADD FOREIGN KEY (VaccinationID) REFERENCES Vaccinations(VaccinationID);



ALTER TABLE FollowUpAppointment
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID),
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
ADD FOREIGN KEY (InitialAppointmnetID) REFERENCES Appointment(AppointmentID);


ALTER TABLE VisitNote
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID),
ADD FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID);


ALTER TABLE ProviderSpecialization
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID),
ADD FOREIGN KEY (SpecializationID) REFERENCES Specialization(SpecializationID);

ALTER TABLE AllergySideEffects
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
ADD FOREIGN KEY (AllergyID) REFERENCES Allergies(AllergyID);





ALTER TABLE Clinic
ADD FOREIGN KEY (LocationID) REFERENCES Location(LocationID);

ALTER TABLE Hospital
ADD FOREIGN KEY (LocationID) REFERENCES Location(LocationID);


ALTER TABLE Allergies
ADD FOREIGN KEY (AllergySeverityTypeID) REFERENCES AllergySeverityType(AllergySeverityTypeID);


ALTER TABLE DietaryPreferences
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

ALTER TABLE DietaryPreferences
ADD FOREIGN KEY (DietaryPreferenceTypeID) REFERENCES DietaryPreferenceType(DietaryPreferenceTypeID);

ALTER TABLE TelevisitNote
ADD FOREIGN KEY (TelevisitID) REFERENCES Televisit(TelevisitID);

ALTER TABLE TelevisitNote
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID);

ALTER TABLE TelevisitFeedback
ADD FOREIGN KEY (TelevisitID) REFERENCES Televisit(TelevisitID);

ALTER TABLE TelevisitSession
ADD FOREIGN KEY (TelevisitID) REFERENCES Televisit(TelevisitID);

ALTER TABLE Televisit
ADD FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID);
ALTER TABLE Televisit
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID);
ALTER TABLE Televisit
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

ALTER TABLE PatientAllergies
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

ALTER TABLE PatientAllergies
ADD FOREIGN KEY (AllergyID) REFERENCES Allergies(AllergyID);

ALTER TABLE SignedForms
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

ALTER TABLE SignedForms
ADD FOREIGN KEY (PatientFormID) REFERENCES PatientConsentForm(PatientFormID);

ALTER TABLE SignedForms
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID);

ALTER TABLE Appointment
ADD FOREIGN KEY (PatientID) REFERENCES Patient(PatientID);

ALTER TABLE Appointment
ADD FOREIGN KEY (ProviderID) REFERENCES HealthCareProvider(ProviderID);

ALTER TABLE Appointment
ADD FOREIGN KEY (CheckinCheckoutID) REFERENCES CheckinCheckout(CheckinCheckoutID);





-- AppointmentID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID);

-- VitalsID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (VitalsID) REFERENCES Vitals(VitalsID);

-- LabTestID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (LabTestID) REFERENCES LabTest(LabTestID);

-- PrescriptionID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID);

-- InsuranceBillingID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (InsuranceBillingID) REFERENCES InsuranceBilling(InsuranceBillingID);

-- ScheduleShotsID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (ScheduleShotsID) REFERENCES ScheduleOfShots(ScheduleShotsID);

-- DrugRequestID
ALTER TABLE MedicalRecord
    ADD FOREIGN KEY (DrugRequestID) REFERENCES DrugRequest(DrugRequestID);


-- ClinicID
ALTER TABLE Vaccinations
    ADD FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID);

-- MedicalRecordID
ALTER TABLE ScheduleOfShots
    ADD FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecord(MedicalRecordID);

-- NurseID
ALTER TABLE ScheduleOfShots
    ADD FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID);

-- MedicalRecordID
ALTER TABLE Prescription
    ADD FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecord(MedicalRecordID);

-- MedicalRecordID
ALTER TABLE DrugEnrollment
    ADD FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecord(MedicalRecordID);

-- DrugID
ALTER TABLE DrugEnrollment
    ADD FOREIGN KEY (DrugID) REFERENCES Drug(DrugID);

-- PrescriptionID
ALTER TABLE DrugEnrollment
    ADD FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID);

-- LabTestID
ALTER TABLE LabTestResults
    ADD FOREIGN KEY (LabTestID) REFERENCES LabTest(LabTestID);

-- MedicalRecordID
ALTER TABLE LabTestResults
    ADD FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecord(MedicalRecordID);

-- PrescriptionID
ALTER TABLE DrugDelivery
    ADD FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID);

-- PharmacyID
ALTER TABLE DrugDelivery
    ADD FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID);

-- PharmacyID
ALTER TABLE SecurityUser
    ADD FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID);


