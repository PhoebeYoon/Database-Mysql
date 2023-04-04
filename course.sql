CREATE TABLE course (
  section_id INT AUTO_INCREMENT PRIMARY KEY,
  section_name CHAR(3) NOT NULL,
  floor TINYINT NOT NULL
);

INSERT INTO course (section_name, floor)
VALUES  ('한식', 2),
        ('분식', 2),
        ('중식', 3),
        ('일식', 3),
        ('양식', 3),
        ('카페', 1),
        ('디저트', 1);