Use QuanLySinhVien;
-- Hiển thị số lượng sinh viên ở từng nơi: dùng hàm count 
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;
-- Tính điểm trung bình của các môn học của mỗi học viên: dùng hàm AVG
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;
-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15;
-- đầu tiên tính điểm trung bình các môn học cho học viên
-- Sau mới xét điều kiện lớn hơn 15
SELECT s.studentid,s.studentname, Avg(mark)
FROM student s join mark m on s.studentid = m.studentid
GROUP BY s.studentid, s.studentname
HAVING AVG (mark) < 15;
-- Hiển thị các bạn có điểm trung bình môn học lớn nhất.
-- Hiển thị danh sách điểm trung bình của các học viên, sau mới dùng having và all để tìm học viên có điểm trung bình lớn nhất;
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
