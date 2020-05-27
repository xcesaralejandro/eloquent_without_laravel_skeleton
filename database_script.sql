CREATE TABLE users (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    canvas_sis_id VARCHAR(256) NOT NULL UNIQUE,
    canvas_id VARCHAR(256) NOT NULL UNIQUE,
    name VARCHAR(256) NOT NULL,
    lastname VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL
);
CREATE INDEX index_student_sis_id ON users (canvas_sis_id);
CREATE INDEX index_student_canvas_id ON users (canvas_id);
CREATE INDEX index_student_email ON users (email);


CREATE TABLE courses (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    canvas_id VARCHAR(256) NOT NULL UNIQUE,
    name VARCHAR(256) NOT NULL,
    creation_date integer NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL
);
CREATE INDEX index_course_canvas_id ON courses (canvas_id);


CREATE TABLE modules (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id INTEGER UNSIGNED NOT NULL,
    canvas_id VARCHAR (256) NOT NULL,
    name VARCHAR (256) NOT NULL,
    position INTEGER(2) NOT NULL DEFAULT 0,
    creation_date integer NULL, 
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    CONSTRAINT modules_course_id_fk FOREIGN KEY(course_id) REFERENCES courses(id) ON DELETE CASCADE
);
CREATE INDEX index_modules_canvas_id ON modules (canvas_id);


CREATE TABLE resources (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    module_id INTEGER UNSIGNED NOT NULL,
    canvas_id VARCHAR (256) NOT NULL,
    name VARCHAR (256) NOT NULL,
    creation_date integer NULL, 
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    CONSTRAINT resources_module_id_fk FOREIGN KEY(module_id) REFERENCES modules(id) ON DELETE CASCADE
);
CREATE INDEX index_canvas_id ON modules (canvas_id);

CREATE TABLE interactions (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    module_id INTEGER UNSIGNED NOT NULL,
    email VARCHAR(256) NOT NULL,
    date INTEGER NOT NULL,
    duration INTEGER DEFAULT 0,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    CONSTRAINT interactions_module_id_fk FOREIGN KEY(module_id) REFERENCES modules(id) ON DELETE CASCADE,
    CONSTRAINT interactions_email_fk FOREIGN KEY(email) REFERENCES users(email) ON DELETE CASCADE
);

CREATE TABLE users_courses(
    user_id INTEGER UNSIGNED,
    course_id INTEGER UNSIGNED,
    role VARCHAR(100) DEFAULT 'student',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    CONSTRAINT mixed_user_course_pk PRIMARY KEY (user_id, course_id),
    CONSTRAINT users_courses_first_pk FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT users_courses_second_pk FOREIGN KEY(course_id) REFERENCES courses(id) ON DELETE CASCADE
);
