-- View 1
CREATE VIEW `company_database`.`View1` AS
    SELECT 
        e1.Personal_id,
        p.Fname,
        p.Lname,
        e1.Dept_id,
        d.Dept_name,
        AVG(e1.Amount) / COUNT(DISTINCT MONTH(e1.Pay_date)) AS Avg_Monthly_Salary
    FROM
        `company_database`.`Employee_1` e1
            JOIN
        `company_database`.`People` p ON e1.Personal_id = p.Personal_id
            JOIN
        `company_database`.`Department` d ON e1.Dept_id = d.Dept_id
    GROUP BY e1.Personal_id , p.Fname , p.Lname , e1.Dept_id , d.Dept_name;
 
 -- View 2
CREATE VIEW `company_database`.`View2` AS
    SELECT 
        i1.Personal_id,
        p.Fname,
        p.Lname,
        i1.Job_id,
        j.Job_description,
        COUNT(i4.Interviews) AS Interview_Rounds_Passed
    FROM
        `company_database`.`Interviews_1` i1
            JOIN
        `company_database`.`People` p ON i1.Personal_id = p.Personal_id
            JOIN
        `company_database`.`Job_position` j ON i1.Job_id = j.Job_id
            JOIN
        `company_database`.`Interviews_4` i4 ON i1.Interviews = i4.Interviews
    GROUP BY i1.Personal_id , p.Fname , p.Lname , i1.Job_id , j.Job_description;
    
-- View 3
CREATE VIEW `company_database`.`View3` AS
    SELECT 
        w3.Product AS Product_Type, COUNT(w3.Product) AS Items_Sold
    FROM
        `company_database`.`Works_on_3` w3
    GROUP BY w3.Product;
    

-- View 4
CREATE VIEW `company_database`.`View4` AS
SELECT 
    p1.Product_id,
    p1.Part_type AS Part_Name,
    SUM(p1.Price * p2.`No. of_part_type`) AS Total_Cost_Price
FROM
    `company_database`.`Parts_1` p1
        JOIN
    `company_database`.`Parts_2` p2 ON p1.Part_type = p2.Part_type
GROUP BY 
    p1.Product_id, 
    p1.Part_type;


SELECT * FROM View1;
SELECT * FROM View2;
SELECT * FROM View3;
SELECT * FROM View4;