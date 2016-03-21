CREATE TABLE Project (
	ProjectNumber int NOT NULL,
	SponserName VARCHAR(70) NOT NULL,
	StartDate Date NOT NULL,
	EndDate Date NOT NULL,
	StaffNumber int NOT NULL,
  Budget VARCHAR(70) NOT NULL,

	CONSTRAINT Project_PKey1 PRIMARY KEY(ProjectNumber)
);

CREATE TABLE Staff(
	StaffNumber int NOT NULL,
	StaffName VARCHAR(70) NOT NULL,
	DateOfBirth Date NOT NULL,
	LevelOfPosition int NOT NULL,
	WorkDepartment VARCHAR(70) NOT NULL,

	CONSTRAINT Staff_PKey1 PRIMARY KEY(StaffNumber)
);

CREATE TABLE StaffProject(
  StaffProjectNumber int NOT NULL,
  ProjectNumber int NOT NULL,
  StaffNumber int NOT NULL,
  
  CONSTRAINT StaffProject_PKey1 PRIMARY KEY(StaffProjectNumber)
);

CREATE TABLE Department(
  DepartmentName VARCHAR(70) NOT NULL,
  MainOffice VARCHAR(70) NOT NULL,
  DepartmentHeader VARCHAR(70) NOT NULL,
  
  StaffNumber int NOT NULL,
  
  CONSTRAINT Department_PKey1 PRIMARY KEY(DepartmentName)
);

CREATE TABLE StaffDepartment(
  StaffDepartmentNumber int NOT NULL,
  StaffTimePercentage float NOT NULL,
  StaffNumber int NOT NULL,
  DepartmentName VARCHAR(70) NOT NULL,
  
  CONSTRAINT StaffDepartment_PKey1 PRIMARY KEY(StaffDepartmentNumber)
);

CREATE TABLE Student(
  StudentNumber int NOT NULL,
  StudentName VARCHAR(70) NOT NULL,
  DateOfBirth Date NOT NULL,
  DegreeProgram VARCHAR(70) NOT NULL,
  
  CONSTRAINT Student_PKey1 PRIMARY KEY(StudentNumber)
);

CREATE TABLE StudentProject(
  StudentProjectID int NOT NULL,
  StudentNumber int NOT NULL,
  ProjectNumber int NOT NULL,
  StaffNumber int NOT NULL,
  Supervisor VARCHAR(70) NOT NULL,
  
  CONSTRAINT StudentProject_PKey1 PRIMARY KEY(StudentProjectID)
);

ALTER TABLE Project
  ADD CONSTRAINT Project_Fkey1 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);

ALTER TABLE StaffProject
  ADD CONSTRAINT StaffProject_Fkey1 FOREIGN KEY(ProjectNumber) REFERENCES Project(ProjectNumber);
  
ALTER TABLE StaffProject
  ADD CONSTRAINT StaffProject_Fkey2 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);

ALTER TABLE Department
  ADD CONSTRAINT Department_Fkey1 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);
  
ALTER TABLE StaffDepartment
  ADD CONSTRAINT StaffDepartment_Fkey1 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);
  
ALTER TABLE StaffDepartment
  ADD CONSTRAINT StaffDepartment_Fkey2 FOREIGN KEY(DepartmentName) REFERENCES Department(DepartmentName);
  
ALTER TABLE StudentProject
  ADD CONSTRAINT StudentProject_Fkey1 FOREIGN KEY(StudentNumber) REFERENCES Student(StudentNumber);
  
ALTER TABLE StudentProject
  ADD CONSTRAINT StudentProject_Fkey2 FOREIGN KEY(ProjectNumber) REFERENCES Project(ProjectNumber);
  
ALTER TABLE StudentProject
  ADD CONSTRAINT StudentProject_Fkey3 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);
