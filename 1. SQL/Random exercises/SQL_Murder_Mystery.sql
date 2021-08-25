/* 
 -- https://mystery.knightlab.com/ --
 
There's been a Murder in SQL City! 
The SQL Murder Mystery is designed to be both a self-directed lesson to learn SQL concepts and commands and a fun game for experienced SQL users to solve an intriguing crime.

A crime has taken place and the detective needs your help. 
The detective gave you the crime scene report, but you somehow lost it.
You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. 
Start by retrieving the corresponding crime scene report from the police department’s database.

*/


SELECT
	*
FROM
	crime_scene_report
WHERE
	type = 'murder'
		and date = 20180115;
/* 
	Output 
date	type	description	city
20180115	murder	Life? Dont talk to me about life.	Albany
20180115	murder	Mama, I killed a man, put a gun against his head...	Reno
20180115	murder	Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".	SQL City

*/


SELECT 
	*
FROM	
	person
WHERE
	address_street_name = 'Franklin Ave'
	AND name LIKE ('%Annabel%');
/* 
	Output
id	name	license_id	address_number	address_street_name	ssn
16371	Annabel Miller	490173	103	Franklin Ave	318771143

*/



SELECT
	*
FROM
	interview
WHERE
	person_id IN ('14887', '16371');
/* 
	Output
person_id	transcript
14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

*/


SELECT
	*
FROM
	get_fit_now_member mem
		JOIN
	get_fit_now_check_in che ON mem.id = che.membership_id
		JOIN
	person per ON mem.person_id = per.id
		JOIN
	drivers_license driv ON per.license_id = driv.id
WHERE
	mem.id LIKE ('48Z%')
		AND mem.membership_status = 'gold'
		AND plate_number LIKE ('%H42W%');

/*
	Output
id	person_id	name	membership_start_date	membership_status	membership_id	check_in_date	check_in_time	check_out_time	id	name	license_id	address_number	address_street_name	ssn	id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
48Z55	67318	Jeremy Bowers	20160101	gold	48Z55	20180109	1530	1700	67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279	423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS

*/



SELECT
	*
FROM
	interview
WHERE
	person_id = 67318
/*
	Output
person_id	transcript
67318	I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

*/





SELECT
	*,
	COUNT(f.event_id) AS attendances
FROM
	facebook_event_checkin f
		JOIN
	person p ON f.person_id = p.id
		JOIN
	drivers_license d ON p.license_id = d.id
WHERE
	date LIKE ('201712%')
		AND f.event_name = 'SQL Symphony Concert'
GROUP BY f.person_id
HAVING attendances >= 3;

/*
	Output
person_id	event_id	event_name	date	id	name	license_id	address_number	address_street_name	ssn	id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	attendances
99716	1143	SQL Symphony Concert	20171229	99716	Miranda Priestly	202298	1883	Golden Ave	987756388	202298	68	66	green	red	female	500123	Tesla	Model S	3

*/


INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;

/*
	Output

value
Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!

*/
              