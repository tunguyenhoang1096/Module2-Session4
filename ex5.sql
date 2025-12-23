-- EX5 : Quản lý nhân viên
-- Tạo bảng employees
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL ,
    birth_year INT NOT NULL ,
    department VARCHAR(50) NOT NULL ,
    salary DECIMAL(10,2) NOT NULL ,
    phone VARCHAR(20)
);
-- Thêm 10 dữ liệu mẫu vào bảng
INSERT INTO employees
VALUES      (1, 'Nguyen Van An', 1995, 'IT', 25000000, '0912345678'),
            (2, 'Tran Thi Binh', 1998, 'HR', 18000000, '0987654321'),
            (3, 'Le Minh Chau', 1992, 'Finance', 3000000, '0901122334'),
            (4, 'Pham Quoc Dung', 1990, 'IT', 35000000, NULL),
            (5, 'Hoang Thi Hoa', 1997, 'Marketing', 22000000, '0933445566'),
            (6, 'Do Van Hung', 1994, 'Sales', 2700000, NULL),
            (7, 'Vu Ngoc Lan', 1999, 'HR', 16000000, '0977889900'),
            (8, 'Bui Thanh Long', 1988, 'Management', 45000000, '0922334455'),
            (9, 'Dang Thi Mai', 1996, 'Finance', 28000000, NULL),
            (10, 'Phan Tuan Nam', 1993, 'IT', 32000000, '0966554433');
-- Hiển thị danh sách nhân viên có lương từ 10tr-20tr
SELECT * FROM employees WHERE salary BETWEEN 10000000 AND 20000000;
-- Hiển thị nhân viên thuộc phòng ban IT hoặc HR
SELECT * FROM employees WHERE department IN ('IT','HR');
-- Hiển thị nhân viên có họ tên chứa chữ “Anh”
SELECT * FROM employees WHERE full_name LIKE '%Anh%';
-- Hiển thị nhân viên chưa có số điện thoại
SELECT * FROM employees WHERE phone IS NULL;
-- Cập nhật lương tăng thêm 10% cho nhân viên phòng IT
UPDATE employees
SET salary = salary + salary/100
WHERE department= 'IT';
-- Cập nhật số điện thoại cho nhân viên chưa có số điện thoại
UPDATE employees
SET phone = '090999000'
WHERE phone IS NULL;
-- Xóa nhân viên có mức lương thấp hơn 5.000.000
DELETE FROM employees
WHERE salary < 5000000;

SELECT * FROM employees;