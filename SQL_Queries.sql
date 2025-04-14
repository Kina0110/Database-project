-- 1. Return the ID and Name of interviewers who participate in interviews where the interviewee's name is "Hellen Cole" arranged for job "11111".
SELECT i1.Personal_id, p.Fname, p.Lname
FROM `company_database`.`Interviews_1` i1
JOIN `company_database`.`People` p ON i1.Personal_id = p.Personal_id
WHERE i1.Candidates = 'Hellen Cole' AND i1.Job_id = 11111;

-- 2. Return the ID of all jobs which are posted by department "Marketing" in January 2011.
SELECT j.Job_id
FROM `company_database`.`Job_position` j
JOIN `company_database`.`Department` d ON j.Dept_id = d.Dept_id
WHERE d.Dept_name = 'Marketing' AND j.Posted_date BETWEEN '2011-01-01' AND '2011-01-31';

-- 3. Return the ID and Name of the employees having no supervisees.
SELECT e1.Personal_id, p.Fname, p.Lname
FROM `company_database`.`Employee_1` e1
JOIN `company_database`.`People` p ON e1.Personal_id = p.Personal_id
LEFT JOIN `company_database`.`Employee_2` e2 ON e1.Personal_id = e2.Supervisor_id
WHERE e2.Supervisor_id IS NULL;

-- 4. Return the Id and Location of the marketing sites with no sale records during March 2011.
SELECT ms.Site_id, ms.Location
FROM `company_database`.`Marketing Sites` ms
LEFT JOIN `company_database`.`Works_on_1` w1 ON ms.Site_id = w1.Side_id
LEFT JOIN `company_database`.`Works_on_3` w3 ON w1.Personal_id = w3.Salespeople
WHERE (w3.Sale_time NOT BETWEEN '2011-03-01' AND '2011-03-31' OR w3.Sale_time IS NULL);

-- 5. Return the job's id and description, which does not hire a suitable person one month after it is posted.
SELECT j.Job_id, j.Job_description
FROM `company_database`.`Job_position` j
LEFT JOIN `company_database`.`Interviews_1` i1 ON j.Job_id = i1.Job_id
WHERE i1.Job_id IS NULL AND j.Posted_date < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 6. Return the ID and Name of the salespeople who have sold all product types whose price is above $200.
SELECT DISTINCT e1.Personal_id, p.Fname, p.Lname
FROM `company_database`.`Employee_1` e1
JOIN `company_database`.`People` p ON e1.Personal_id = p.Personal_id
JOIN `company_database`.`Works_on_3` w3 ON e1.Personal_id = w3.Salespeople
JOIN `company_database`.`Product_2` pr2 ON w3.Product = pr2.Product_type
WHERE pr2.List_price > 200
GROUP BY e1.Personal_id, p.Fname, p.Lname
HAVING COUNT(DISTINCT pr2.Product_type) = (SELECT COUNT(DISTINCT Product_type) FROM `company_database`.`Product_2` WHERE List_price > 200);

-- 7. Return the department's id and name, which has no job post during 1/1/2011 and 2/1/2011.
SELECT d.Dept_id, d.Dept_name
FROM `company_database`.`Department` d
LEFT JOIN `company_database`.`Job_position` j ON d.Dept_id = j.Dept_id
WHERE j.Posted_date NOT BETWEEN '2011-01-01' AND '2011-02-01' OR j.Posted_date IS NULL;

-- 8. Return the ID, Name, and Department ID of the existing employees who apply for job"12345".
SELECT e1.Personal_id, p.Fname, p.Lname, e1.Dept_id
FROM `company_database`.`Employee_1` e1
JOIN `company_database`.`People` p ON e1.Personal_id = p.Personal_id
JOIN `company_database`.`Applies_to` a ON e1.Personal_id = a.Personal_id
WHERE a.Job_id = 12345;

-- 9. Return the best seller's type in the company (sold the most items).
SELECT w3.Product AS Product_Type, COUNT(w3.Product) AS Items_Sold
FROM `company_database`.`Works_on_3` w3
GROUP BY w3.Product
ORDER BY Items_Sold DESC
LIMIT 1;

-- 10. Return the product type whose net profit is highest in the company (money earned minus the part cost).
-- Prduct A Price = 500, Part used cup = 40$ no. cups = 5
SELECT pr1.Product_type, 
       SUM(pr2.List_price) - SUM(p1.Price * p2.`No. of_part_type`) AS net_profit
FROM `Product_1` pr1
JOIN `Parts_1` p1 ON pr1.Product_id = p1.Product_id
JOIN `Parts_2` p2 ON p1.Part_type = p2.Part_type
JOIN `Product_2` pr2 ON pr1.Product_type = pr2.Product_type
GROUP BY pr1.Product_type
ORDER BY net_profit DESC
LIMIT 1;


-- 11. Return the name and id of the employees who have worked in all departments after being hired by the company.
SELECT e1.Personal_id, p.Fname, p.Lname
FROM `company_database`.`Employee_1` e1
JOIN `company_database`.`People` p ON e1.Personal_id = p.Personal_id
GROUP BY e1.Personal_id, p.Fname, p.Lname
HAVING COUNT(DISTINCT e1.Dept_id) = (SELECT COUNT(DISTINCT Dept_id) FROM `company_database`.`Department`);

-- 12. Return the name and  phone number of the interviewee who is selected.
SELECT p.Fname, p.Lname, p.Phone_number
FROM `company_database`.`People` p
JOIN `company_database`.`Potential_employee` pe ON p.Personal_id = pe.Personal_id
JOIN `company_database`.`Interviews_1` i1 ON pe.Personal_id = i1.Personal_id
WHERE i1.Candidates IS NOT NULL;


-- 13. Retrieve the names, and phone numbers of the interviewees selected for all the jobs they apply for.
SELECT p.Fname, p.Lname, p.Phone_number
FROM `company_database`.`People` p
JOIN `company_database`.`Interviews_1` i1 ON p.Personal_id = i1.Personal_id
JOIN `company_database`.`Interviews_3` i3 ON i1.Candidates = i3.Candidates
WHERE i3.Grades IN ('A', 'B', 'C') AND i1.Candidates = 'Hellen Cole';


-- 14. Return the employee's name and id whose average monthly salary is the highest in the company.
SELECT e1.Personal_id, p.Fname, p.Lname, AVG(e1.Amount) / COUNT(DISTINCT MONTH(e1.Pay_date)) AS Avg_Monthly_Salary
FROM `company_database`.`Employee_1` e1
JOIN `company_database`.`People` p ON e1.Personal_id = p.Personal_id
GROUP BY e1.Personal_id, p.Fname, p.Lname
ORDER BY Avg_Monthly_Salary DESC
LIMIT 1;

-- 15. Return the ID and Name of the vendor who supplies part whose name is "Cup" and weight is smaller than 4 pounds, and the price is lowest among all vendors.
SELECT v1.Vendor_id, v1.Vendor_name
FROM `Parts_1` p1
JOIN `Product_1` pr1 ON p1.Product_id = pr1.Product_id
JOIN `Product_2` pr2 ON pr1.Product_type = pr2.Product_type
JOIN `Vendor_1` v1 ON p1.Vendor_id = v1.Vendor_id
WHERE p1.Part_type = 'Cup'
  AND pr2.Weight < 4
  AND p1.Price = (
      SELECT MIN(p1_sub.Price)
      FROM `Parts_1` p1_sub
      WHERE p1_sub.Part_type = 'Cup'
  );

