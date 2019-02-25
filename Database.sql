create table Roles (
    Id int not null PRIMARY KEY auto_increment,
    Name VARCHAR(20) not null
);

create table Majors (
    Id int not null PRIMARY KEY auto_increment,
    Name varchar(50) not null,
    ShortForm varchar(5) not null
);

create table Partners (
    Id int not null primary key auto_increment,
    Name varchar(50) not null,
    Address varchar(200) not null,
    Country varchar(50) not null,
    Status varchar(5)
);

create table MMOs (
    Id INT NOT NULL PRIMARY KEY auto_increment,
    Image text not null,
    PartnerId int not null,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME not NULL,
    FOREIGN KEY (PartnerId) REFERENCES Partners(Id)
);

create table Users (
    Id int not null PRIMARY KEY auto_increment,
    Name VARCHAR(50) not null,
    Email VARCHAR(50) NOT null,
    Address VARCHAR(200) not null,
    Image text,
    MajorId int not null,
    RoleId int not null,
    Visa text,
    Passport text,
    Certificate text,
    FOREIGN KEY (MajorId) REFERENCES Majors(Id),
    FOREIGN KEY (RoleId) REFERENCES Roles(Id)
);

create table Events (
    Id int not null PRIMARY KEY auto_increment,
    Name VARCHAR(50) not null,
    PartnerId int not null,
    LeaderId int not null,
    HeaderImage text,
    Description text,
    FOREIGN KEY (PartnerId) REFERENCES Partners(Id),
    FOREIGN KEY (LeaderId) REFERENCES Users(Id)
);

create table Requirements (
    Id INT NOT NULL PRIMARY KEY auto_increment,
    EventId int not null,
    Name VARCHAR(50) not null,
    Content varchar(50) not null,
    FOREIGN KEY (EventId) REFERENCES Events(Id)
);

create table PersonalRequirement (
  EventId int not null,
  UserId int not null,
  RequirementId int not null,
  Verified bit,
  primary key (EventId, UserId, RequirementId),
  foreign key (EventId) references Events(Id),
  foreign key (UserId) references Users(Id),
  foreign key (RequirementId) references Requirements(Id)
);

create table Events_Majors (
    EventId int not null,
    MajorId int not null,
    primary KEY (EventId, MajorId),
    FOREIGN KEY (EventId) REFERENCES Events(Id),
    FOREIGN KEY (MajorId) REFERENCES Majors(Id)
);

create table Users_Lead_Events (
    UserId int not null,
    EventId int not null,
    PRIMARY KEY (UserId, EventId),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EventId) REFERENCES Events(Id)
);

create table Users_Enroll_Events (
    UserId int not null,
    EventId int not null,
    PRIMARY KEY (UserId, EventId),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EventId) REFERENCES Events(Id)
);

create table Users_Follow_Events (
    UserId int not null,
    EventId int not null,
    PRIMARY KEY (UserId, EventId),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EventId) REFERENCES Events(Id)
);

create table Notifications (
    Id int not null PRIMARY KEY auto_increment,
    EventId int not null,
    NotifierId int not null,
    ReceiverId int not null,
    Content varchar(100),
    FOREIGN KEY (EventId) REFERENCES Events(Id),
    FOREIGN KEY (NotifierId) REFERENCES Users(Id),
    FOREIGN KEY (ReceiverId) REFERENCES Users(Id)
);

create table Comments (
    Id int not null PRIMARY KEY auto_increment,
    UserId int not null,
    PreviousCommentId int not null,
    Content text not null,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (PreviousCommentId) REFERENCES Comments(Id)
);

create table Transcripts (
    Id int not null primary key auto_increment,
    Name varchar(50) not null,
    Total FLOAT not null,
    Status BIT,
    UserId int not null,
    EventId int not null,
    FOREIGN key (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EventId) REFERENCES Events(Id)
);

create table Marks (
    Id int not null PRIMARY KEY auto_increment,
    Name VARCHAR(50) not null,
    Coefficient FLOAT not null
);

create table Transcripts_Marks (
    TranscriptId int not null,
    MarkId int not null,
    PRIMARY KEY (TranscriptId, MarkId),
    FOREIGN KEY (TranscriptId) REFERENCES Transcripts(Id),
    FOREIGN KEY (MarkId) REFERENCES Marks(Id)
);
