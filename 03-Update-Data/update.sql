Use startersql;
-- Select * from users where gender='female';
-- Select * from users where date_of_birth<'1999-09-09';
-- Select * from users where id>10;
-- Select * from users where id is not null;

-- Select * from users where date_of_birth between '1990-01-01' and '2000-01-01';

-- Select * from users where gender in ('male','female');
-- Select * from users where gender='male' and salary<'70000';

-- Select * from users where gender='male' and salary<'70000' Order by date_of_birth ASC;

-- Select * from users where gender='male' or salary>'65000';
-- Select * from users where gender='male' and salary<'70000' Order by date_of_birth DESC limit 5;

-- SELECT * FROM users WHERE salary > 60000 ORDER BY created_at DESC LIMIT 5;

-- SELECT * FROM users ORDER BY salary DESC;
-- SELECT * FROM users WHERE salary BETWEEN 50000 AND 70000;
