CREATE DATABASE cve ;

CREATE TABLE IF NOT EXISTS cve.opencve(
    id_opencve INT(50) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id VARCHAR(25) NOT NULL, /* "CVE_data_meta" : { "ID" : "CVE-2024-5615" */
    assigner VARCHAR(25), /* "CVE_data_meta" : { "ID" : "CVE-2024-5615", "ASSIGNER" : "cve-request@wordfence.com" */
    references VARCHAR(500),
    description VARCHAR(500),
    publishedDate DATETIME,
    lastModifiedDate DATETIME
);

CREATE TABLE IF NOT EXISTS cve.cvemap(
    id INT(50) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cve VARCHAR(25) NOT NULL,
    cvss FLOAT(10, 10),
    security VARCHAR(25),
    rank INT(50),
    reports INT(50),
    product VARCHAR(100),
    template BOOLEAN,
    age INT(50)
);

CREATE TABLE IF NOT EXISTS cve.osv(
    id_cve INT(50) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    schema_version VARCHAR(10) NOT NULL,
    id VARCHAR(25) NOT NULL,
    modified DATETIME,
    published DATETIME,
    aliases VARCHAR(25),
    summary VARCHAR(100),
    details VARCHAR(100),
    affected VARCHAR(500),
    references VARCHAR(500)
);

/* to do: insert into tables various cve values */


/*CREATE TABLE IF NOT EXISTS myrestaurant.users(
    id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    phone VARCHAR(200),
    address VARCHAR(200),
    password VARCHAR(200) NOT NULL
);
INSERT INTO myrestaurant.users(name,phone,address,password)
VALUES
('Gaurav','123456789','Mumbai,India','pass134'),
('Sakshi','987654321','Chennai,India','pass456');