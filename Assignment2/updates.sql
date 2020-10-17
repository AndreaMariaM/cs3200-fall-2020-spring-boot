UPDATE heroku_5c524a96c5678f3.phones
SET phone=3334445555
WHERE phones.person_fk=34;

UPDATE heroku_5c524a96c5678f3.pages SET title=concat('CNET', title)
WHERE pages.website_fk=657;

UPDATE heroku_5c524a96c5678f3.page_roles SET page_roles.role_fk=1
WHERE page_roles.developer_fk=34;

UPDATE heroku_5c524a96c5678f3.page_roles SET page_roles.role_fk=23
WHERE page_roles.developer_fk=34;