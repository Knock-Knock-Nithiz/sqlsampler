CREATE OR REPLACE PROCEDURE hr.archive_and_delete_employee(p_emp_id INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO hr.deleted_employees_backup
    SELECT * FROM hr.employees WHERE emp_id = p_emp_id;

    DELETE FROM hr.employees WHERE emp_id = p_emp_id;
END;
$$;
