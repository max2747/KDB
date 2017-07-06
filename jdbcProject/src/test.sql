

select first_name, salary, hire_date, department_name
from employees join departments
using(department_id)