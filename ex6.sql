-- EX6 : Quản lý sản phẩm
-- Tạo bảng products
CREATE TABLE products_ex6(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL ,
    category VARCHAR(100) NOT NULL ,
    price DECIMAL(10,2) NOT NULL ,
    quantity INT
);
-- Thêm dữ liệu cho bảng
INSERT INTO products_ex6
VALUES  (1, 'Samsung Galaxy S21', 'Phone', 12000000, 10),
        (2, 'Samsung Galaxy Tab A', 'Tablet', 7000000, 5),
        (3, 'Dell Inspiron 15', 'Laptop', 15000000, 8),
        (4, 'Asus VivoBook', 'Laptop', 9000000, 0),
        (5, 'Xiaomi Air Purifier', 'Appliance', 4000000, 12);
-- Hiển thị sản phẩm có giá từ 5.000.000 đến 15.000.000
SELECT * FROM products_ex6 WHERE price BETWEEN 5000000 AND 15000000;
-- Hiển thị sản phẩm thuộc loại Laptop hoặc Tablet
SELECT * FROM products_ex6 WHERE category IN ('Laptop','Tablet');
-- Hiển thị sản phẩm có tên bắt đầu bằng “Sam”
SELECT * FROM products_ex6 WHERE product_name LIKE 'Sam%';
-- Hiển thị sản phẩm không thuộc loại Phone
SELECT * FROM products_ex6 WHERE category != 'Phone';
-- Giảm giá 5% cho các sản phẩm thuộc loại Laptop
UPDATE products_ex6
SET price = price - (price*0.05)
WHERE category = 'Laptop';
-- Xóa các sản phẩm có số lượng tồn kho bằng 0
DELETE FROM products_ex6
WHERE quantity = 0;

SELECT * FROM products_ex6;