declare
cursor c_emp_dept(v_dept number)
is select employee_id, first_name from
employees where department_id=v_dept;

v_empno employees.employee_id%type;
v_first_name employees.first_name%type;

begin
open c_emp_dept(10);
dbms_output.Put_line('dept 10 contains:');
loop
