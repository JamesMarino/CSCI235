CREATE TABLE Project (
	ProjectNumber INTEGER NOT NULL,
	SponserName VARCHAR(10) NOT NULL,
	StartDate Date NOT NULL,
	EndDate Date NOT NULL,
  Budget FLOAT NOT NULL,
  
	StaffNumber INTEGER NOT NULL,

	CONSTRAINT Project_PKey1 PRIMARY KEY(ProjectNumber)
);

CREATE TABLE Staff(
	StaffNumber INTEGER NOT NULL,
	StaffName VARCHAR(70) NOT NULL,
	DateOfBirth Date NOT NULL,
	LevelOfPosition VARCHAR(70) NOT NULL,
	WorkDepartment VARCHAR(70) NOT NULL,

	CONSTRAINT Staff_PKey1 PRIMARY KEY(StaffNumber)
);

CREATE TABLE Department(
  DepartmentName VARCHAR(70) NOT NULL,
  MainOffice VARCHAR(70) NOT NULL,
  HeadOfDepartment VARCHAR(70) NOT NULL,
  
  StaffNumber INTEGER NOT NULL,
  
  CONSTRAINT Department_PKey1 PRIMARY KEY(DepartmentName)
);

CREATE TABLE Student(
  StudentNumber INTEGER NOT NULL,
  StudentName VARCHAR(70) NOT NULL,
  DateOfBirth Date NOT NULL,
  DegreeProgram VARCHAR(10) NOT NULL,
  
  DepartmentName VARCHAR(70) NOT NULL,
  
  CONSTRAINT Student_PKey1 PRIMARY KEY(StudentNumber)
);

CREATE TABLE StaffProject(
  StaffNumber INTEGER NOT NULL,
  ProjectNumber INTEGER NOT NULL,
  
  CONSTRAINT StaffProject_PKey1 PRIMARY KEY(StaffNumber, ProjectNumber)
);

CREATE TABLE StaffDepartment(
  StaffNumber INTEGER NOT NULL,
  DepartmentName VARCHAR(70) NOT NULL,
  StaffTimePercentage FLOAT NOT NULL, 
  
  CONSTRAINT StaffDepartment_PKey1 PRIMARY KEY(StaffNumber, DepartmentName)
);

CREATE TABLE StudentProject(
  StudentNumber INTEGER NOT NULL,
  ProjectNumber INTEGER NOT NULL,
  StaffNumber INTEGER NOT NULL,
  Supervisor VARCHAR(70) NOT NULL,
  
  CONSTRAINT StudentProject_PKey1 PRIMARY KEY(StudentNumber, ProjectNumber, StaffNumber)
);

ALTER TABLE Project
  ADD CONSTRAINT Project_Fkey1 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);
  
ALTER TABLE Student
  ADD CONSTRAINT Student_Fkey1 FOREIGN KEY(DepartmentName) REFERENCES Department(DepartmentName);

ALTER TABLE StaffProject
  ADD CONSTRAINT StaffProject_Fkey1 FOREIGN KEY(ProjectNumber) REFERENCES Project(ProjectNumber);
  
ALTER TABLE StaffProject
  ADD CONSTRAINT StaffProject_Fkey2 FOREIGN KEY(StaffNumber) REFERENCES Staff(StaffNumber);
  
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
