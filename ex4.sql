CREATE DATABASE myDB;
USE myDB;
-- Tạo bảng Classes
    CREATE  TABLE classes(
        class_id INT PRIMARY KEY AUTO_INCREMENT,
        class_name VARCHAR(50) NOT NULL ,
        major VARCHAR(50) NOT NULL ,
        year VARCHAR(4) NOT NULL
    );
-- Tạo bảng Students
CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT ,
    student_name VARCHAR(50) NOT NULL ,
    birthday DATE NOT NULL ,
    city VARCHAR(20) DEFAULT ('Ha Noi'),
    gender VARCHAR(10) NOT NULL ,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)

);
-- Ex2: Quản lý thư viện
-- Tạo bảng books
CREATE TABLE books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(100) NOT NULL ,
    author VARCHAR(100) NOT NULL ,
    year VARCHAR(5) NOT NULL
);
-- Tạo bảng readers
CREATE TABLE readers(
    reader_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL ,
    address VARCHAR(100) NOT NULL ,
    phone varchar(10) NOT NULL
);
-- Tạo bảng trung gian borrowings
CREATE  TABLE  borrowings(
    borrowing_date DATE,
    payment_date DATE,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    reader_id INT,
    FOREIGN KEY (reader_id) REFERENCES readers(reader_id),
    -- Khóa chính
    PRIMARY KEY (book_id,reader_id)
);
-- Thêm ràng buộc not null cho cột ngày mượn
ALTER TABLE borrowings
MODIFY borrowing_date DATE NOT NUll;

-- EX3: Quản lý Sản phẩm - Đơn hàng
-- Tạo bảng orders
CREATE TABLE orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_name VARCHAR(100) NOT NULL ,
    order_date DATE NOT NULL ,
    total DECIMAL(6,2)
);
-- Tạo bảng products
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL ,
    product_type VARCHAR(50) ,
    price DECIMAL(5,2) NOT NULL ,
    stock INT NOT NULL ,
    description VARCHAR(100)
);
-- Tạo bảng trung gian order_items
CREATE TABLE order_items(
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    quantity INT NOT NULL ,
    -- khóa chính
    PRIMARY KEY (product_id,order_id)
);

-- EX4: Quản lý tài khoản người dùng
-- Tạo bảng Users
CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100)  UNIQUE ,
    user_name VARCHAR(100) UNIQUE ,
    password VARCHAR(100) NOT NULL ,
    status BIT DEFAULT (1)

);
-- Thêm ràng buộc check cho trạng thái
ALTER TABLE users
ADD CONSTRAINT check_status CHECK ( status >=0 );
-- Xóa bảng users
# DROP TABLE users

-- EX5: Quản lý khóa học trực tuyến
-- Tạo bảng giảng viên
CREATE TABLE teachers(
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50) NOT NULL ,
    teacher_email VARCHAR(50) NOT NULL UNIQUE
);
-- Tạo bảng khóa học
CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    course_price DECIMAL(5,2) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
-- Thêm ràng buộc check cho giá khóa học
ALTER TABLE courses
ADD CONSTRAINT chk_price CHECK ( course_price > 0 );
-- Tạo bảng sinh viên
CREATE TABLE students_ex5(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL ,
    student_email VARCHAR(50) NOT NULL UNIQUE
);
-- Tạo bảng trung gian Erollments
CREATE TABLE erollments(
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students_ex5(student_id),
    erollment_date DATE NOT NULL ,
    semester VARCHAR(4) NOT NULL,
    PRIMARY KEY (course_id,student_id)
);
-- Xóa bảng erollments
# DROP TABLE erollments;
-- Thêm dữ liệu cho bảng classes
INSERT INTO classes
VALUES (1,"KHMT2","CNTT","2020");
SELECT * FROM classes;
-- Session4
-- EX1 :
ALTER TABLE students
ADD email VARCHAR(50);
ALTER TABLE students
RENAME COLUMN email TO student_email;
-- Thêm dữ liệu cho bảng students
INSERT INTO students
VALUES
        (2,"Trần Anh Tuấn","2003/12/12","Hung Yen","Nam",1,"anhtuan112@gmail.com"),
        (3,"Nguyễn Văn A","2004/03/01","Hà Nội","Nam",1,NULL),
        (4,"Hoàng Thị Oanh","2000/11/03","Hải Dương","Nữ",1,"oanhloanhqoanh@gmail.com"),
        (5,"Dương Hoài Anh","2006/08/09","Phú Thọ","Nữ",1,"anhduong0809@gmail.com");
-- Hiện thị toàn bộ danh sách sinh viên
SELECT * FROM students;
-- Chỉ hiển thị mã sinh viên, họ tên, email
SELECT student_id,student_name,student_email FROM students;

-- EX2 : UPDATE + DELETE
-- Cập nhật email cho sinh viên
UPDATE students
SET student_email = "nguyenvana@gmail.com" WHERE student_id=3;
SELECT * FROM students;
-- Cập nhật giới tính cho sinh viên có mã là 5
UPDATE students
SET gender="Nam" WHERE student_id = 5;
SELECT * FROM students;
-- Xóa sinh viên có mã 3
DELETE FROM students WHERE student_id = 3;
SELECT * FROM students;

-- EX3 : WHERE + BETWEEN + IN
-- Hiển thị sinh viên có năm sinh từ 2003 đến 2005
SELECT * FROM students WHERE birthday BETWEEN "2003-01-01" AND "2005-12-31";
-- Hiển thị sinh viên có giới tính là Nam
SELECT * FROM students WHERE gender="Nam";
-- Hiển thị sinh viên có mã sv thuộc (1,4,5)
SELECT * FROM students WHERE student_id IN (1,4,5);
-- Hiện thị mã sv, họ tên, ngày sinh
SELECT student_id,student_name,birthday FROM students;

-- EX4 : Truy vấn nâng cao cơ bản (LIKE + IS NULL + NOT)
INSERT INTO students
VALUES (6,"Nguyễn Ngọc Linh",'2004-05-06','Hà Nội','Nữ',1,'ngoclinh04@gmail.com'),
       (7,"Nguyễn Thị Cúc",'2000-03-21','Nam Định','Nữ',1,'nguyencuc@gmail.com');
UPDATE students
SET student_email = NULL WHERE student_id IN (6,7);
-- Hiển thị sinh viên chưa có email
SELECT * FROM students WHERE student_email IS NULL;
-- Hiện thị sinh viên đã có email
SELECT * FROM students WHERE student_email IS NOT NULL;
-- Hiển thị sinh viên có họ tên bắt đầu bằng "Ng"
SELECT * FROM students WHERE student_name LIKE 'Ng%';
-- Hiển thị sinh viên không phải giới tính Nam
SELECT * FROM students WHERE gender != 'Nam';