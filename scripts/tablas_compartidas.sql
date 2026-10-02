--Tabla USER --
CREATE TABLE dbo.[USER]
(
    user_id INT IDENTITY(1,1) NOT NULL,
    entra_id INT NOT NULL,
    email VARCHAR(200) NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT PK_USER
        PRIMARY KEY (user_id)
);

--Tabla ROLE --
CREATE TABLE dbo.[ROLE]
(
    role_id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL,
    user_id INT NOT NULL,

    CONSTRAINT PK_ROLE
        PRIMARY KEY (role_id),

    CONSTRAINT FK_ROLE_USER
        FOREIGN KEY (user_id)
        REFERENCES dbo.[USER](user_id)
);

--Tabla PERMISSION --
CREATE TABLE dbo.PERMISSION
(
    permission_id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL,
    module VARCHAR(200) NOT NULL,

    CONSTRAINT PK_PERMISSION
        PRIMARY KEY (permission_id)
);

--Tabla ROLE_PERMISSION --
CREATE TABLE dbo.ROLE_PERMISSION
(
    role_permission_id INT IDENTITY(1,1) NOT NULL,
    role_id INT NOT NULL,
    permission_id INT NOT NULL,

    CONSTRAINT PK_ROLE_PERMISSION
        PRIMARY KEY (role_permission_id),

    CONSTRAINT FK_ROLE_PERMISSION_ROLE
        FOREIGN KEY (role_id)
        REFERENCES dbo.[ROLE](role_id),

    CONSTRAINT FK_ROLE_PERMISSION_PERMISSION
        FOREIGN KEY (permission_id)
        REFERENCES dbo.PERMISSION(permission_id)
);
