SELECT employees.surname + ' ' + employees.name, salary.salary
FROM salary
INNER JOIN employees ON employees.id = salary.employee_id
WHERE salary.dateSetSalary = (
	SELECT MAX(salary2.dateSetSalary)
	FROM salary salary2
	WHERE salary2.dateSetSalary <= GETDATE() AND salary2.employee_id = salary.employee_id
)