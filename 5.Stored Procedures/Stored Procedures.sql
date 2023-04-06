-- Student CRUD ---
create proc add_student 
@stud_id int, 
@fname varchar(20), 
@lname varchar(20), 
@age int,
@email varchar(30)
as
insert into dbo.Student
values(@stud_id, @fname, @lname, @age, @email)

go
create proc update_student
@stud_id int,
@fname varchar(20), 
@lname varchar(20), 
@age int,
@email varchar(30)
as
update Student
set 
fname = @fname,
lname = @lname,
age = @age,
email = @email
where SID = @stud_id

go
create proc get_student
@stud_id int
as
select * from student
where SID = @stud_id

go
create proc delete_student
@stud_id int
as
delete from student
where SID = @stud_id

go
dbo.add_student 1, 'abdo', 'ahmed', 22, 'abdo@gmail.com' 
go
dbo.update_student 1, 'hassan', 'shehata', 50, 'shehata@gmail.com' 
go
dbo.get_student 1
go
dbo.delete_student 1

-- Department CRUD
go
create proc add_department
@id int,
@name varchar(50)
as
insert into department
values(@id, @name)

go
create proc get_department
@id int
as 
select * from department
where DeptId = @id

go
create proc delete_department
@id int
as
delete from department
where deptId = @id

go
create proc update_department
@id int,
@name varchar(50)
as
update department
set deptName = @name
where deptId = @id

go
dbo.add_department 3, 'Mobile'
go
dbo.update_department 1, 'UI'
go
dbo.get_department 1
go
dbo.delete_department 1

-- Dept_Stud CRUD

go
create proc assign_student_to_department
@stud_id int,
@dept_id int
as
insert into dept_stud
values(@stud_id, @dept_id, getDate())

go
create proc delete_student_from_department
@stud_id int,
@dept_id int
as
delete from dept_stud
where studId = @stud_id 
and deptId = @dept_id

go
create proc get_all_students_from_department
@dept_id int
as
select * from dept_stud
where deptId = @dept_id

go
create proc assign_student_to_another_department
@stud_id int,
@dept_id int
as
update dept_stud
set deptId = @dept_id,
	date_of_insertion = getDate()
where studId = @stud_id

go
dbo.assign_student_to_department 1, 1
go
dbo.get_all_students_from_department 2
go
dbo.assign_student_to_another_department 1, 2
go
dbo.delete_student_from_department 1, 2

-- Dept-Course CRUD

go
create proc assign_course_to_department
@course_id int,
@dept_id int
as
insert into dept_course
values(@course_id, @dept_id, getDate())

go
create proc delete_course_from_department
@course_id int,
@dept_id int
as
delete from dept_course
where courseId = @course_id
and deptId = @dept_id

go
create proc assign_course_to_another_department
@course_id int,
@dept_id int
as
update dept_course
set deptId = @dept_id,
	date_of_insertion = getDate()
where courseId = @course_id

go
create proc get_all_courses_from_department
@dept_id int
as
select * from dept_course
where deptId = @dept_id

go
dbo.assign_course_to_department 1, 3
go
dbo.delete_course_from_department 1, 3
go
dbo.assign_course_to_another_department 1, 3
go
dbo.get_all_courses_from_department 3

-- Stud_course

go
create proc assign_student_to_course
@stud_id int,
@course_id int,
@grade int,
@progress varchar(50)
as
insert into stud_course
values(@stud_id, @course_id, @grade, @progress)

go
create proc delete_student_from_course
@stud_id int,
@course_id int
as
delete from stud_course
where studId = @stud_id
and courseId = @course_id

go
create proc get_all_students_from_course
@course_id int
as
select * from stud_course
where courseId = @course_id

go
create proc assign_student_to_another_course
@stud_id int,
@course_id int
as
update stud_course
set courseId = @course_id
where studId = @stud_id

-- St_exam_Q_A

go
create proc add_stud_exam_question_answer
@stud_id int,
@exam_id int,
@ques_id int,
@grade int,
@answer varchar(50)
as
insert into st_exam_q_a
values(@stud_id, @exam_id, @ques_id, @grade, @answer)

go
create proc get_stud_exam_question_answer
@stud_id int
as 
select * from st_exam_q_a
where studId = @stud_id