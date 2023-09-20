-- Lab 05 Examples

-- Find courses offered in Fall 2009 
-- and in Spring 2010

SELECT Course_id
FROM Section
WHERE semester = 'Fall' and year = 2009
     and Course_id IN (SELECT course_id
	                   FROM Section 
					   WHERE semester = 'Spring' 
					   and year = 2010);
					   

-- Find all courses taught in Fall 2009 semester
-- but not in the Spring 2010 semester

SELECT S1.Course_id
FROM Section S1
WHERE semester = 'Fall' and year = 2009
      AND NOT EXISTS (SELECT S2.Course_id
                      FROM Section S2
                      WHERE semester = 'Spring' 
					  and year = 2010 
					  and S1.course_id 
					    = S2.course_id);
						
SELECT dept_name, avg(salary) as dept_avg_salary
FROM Instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;

-- subquery in FROM clause
SELECT dept_name, dept_avg_salary
FROM (SELECT dept_name, avg(salary) as dept_avg_salary
      FROM Instructor
      GROUP BY dept_name) temp
WHERE dept_avg_salary > 42000;

-- Find department names in which the 
-- avg.salary of instructors of that department
-- are greater than the overall avg. salary 
-- of instructors

SELECT temp1.dept_name, temp1.dept_avg_salary
FROM (SELECT dept_name, avg(salary) as dept_avg_salary
      FROM Instructor 
      GROUP BY dept_name) temp1,
     (SELECT avg(salary) as overall_avg_salary
      FROM Instructor) temp2
WHERE temp1.dept_avg_salary > temp2.overall_avg_salary;
 
-- Find the sum of salaries of instructors 
-- of those departments which have more than one 
-- instructor. Show only dept name and sum of salaries

SELECT dept_name, 
       sum(salary) as dept_total_salary
FROM Instructor
GROUP BY dept_name
HAVING count(*) > 1;


SELECT temp1.*
FROM (SELECT dept_name, 
       sum(salary) as dept_total_salary
      FROM Instructor
      GROUP BY dept_name) temp1, 
	  (SELECT dept_name, 
       count(*) as num_instructor
      FROM Instructor
      GROUP BY dept_name) temp2
WHERE temp1.dept_name = temp2.dept_name and temp2.num_instructor>1;

INSERT INTO department VALUES ('LAW','Watson',120000);


SELECT dept_name, COUNT(*) AS num_instructor
FROM Instructor
GROUP BY dept_name;



-- Find number of instructor for each department. 
-- Include departments which have no instructors.

SELECT d.dept_name, (SELECT COUNT(*)
                     FROM Instructor i
					 WHERE d.dept_name = i.dept_name) as NUM_INSTRUCTOR
FROM Department d;

-- Find number of students for each department.
-- Include departments which have no students.








