-- problem 4

CREATE TABLE salaries (
                          employee_id INTEGER NOT NULL,
                          organisation_id INTEGER NOT NULL,
                          amount NUMERIC NOT NULL,
                          date TEXT NOT NULL
);

INSERT INTO salaries (employee_id, organisation_id, amount, date)
VALUES
    (1, 10, 3000, '2024-01-01'),
    (1, 10, 4000, '2025-01-01'),
    (2, 10, 3500, '2025-01-01'),
    (2, 10, 5000, '2026-01-01'),
    (3, 20, 5000, '2025-01-01'),
    (3, 20, 6000, '2026-01-01');

-- a)

SELECT
    employee_id,
    MAX(amount) AS maximum_salary
FROM salaries
GROUP BY employee_id;

-- b)

SELECT
    organisation_id,
    AVG(amount) AS average_salary
FROM salaries
GROUP BY organisation_id;
