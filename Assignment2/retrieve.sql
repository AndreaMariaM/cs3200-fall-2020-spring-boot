SELECT * FROM heroku_5c524a96c5678f3.developers;

SELECT * FROM heroku_5c524a96c5678f3.developers WHERE id=34;

SELECT p.firstName, p.lastName FROM heroku_5c524a96c5678f3.persons p, heroku_5c524a96c5678f3.developers d, heroku_5c524a96c5678f3.website_roles WHERE p.id=d.id AND d.id=website_roles.developer_fk AND website_roles.website_fk=234 AND website_roles.role_fk>10;

SELECT p.firstName, p.lastName FROM heroku_5c524a96c5678f3.persons p, heroku_5c524a96c5678f3.developers d, heroku_5c524a96c5678f3.page_roles, heroku_5c524a96c5678f3.pages WHERE p.id=d.id AND d.id=page_roles.developer_fk AND page_roles.role_fk>40 AND page_roles.page_fk=pages.id AND pages.views<300000;

SELECT p.firstName, p.lastName FROM heroku_5c524a96c5678f3.persons p, heroku_5c524a96c5678f3.developers d, heroku_5c524a96c5678f3.page_roles, heroku_5c524a96c5678f3.pages WHERE p.id=d.id AND d.id=page_roles.developer_fk AND page_roles.role_fk=21 AND pages.id=123; 

SELECT * FROM heroku_5c524a96c5678f3.websites;

SELECT * FROM heroku_5c524a96c5678f3.websites ORDER BY visits LIMIT 1;

SELECT name FROM heroku_5c524a96c5678f3.websites  WHERE id=678;

SELECT websites.name FROM heroku_5c524a96c5678f3.websites, heroku_5c524a96c5678f3.developers, heroku_5c524a96c5678f3.page_roles, heroku_5c524a96c5678f3.pages, heroku_5c524a96c5678f3.widgets WHERE page_roles.developer_fk=23 AND page_roles.page_fk=pages.id AND pages.website_fk=websites.id AND widgets.page_fk=pages.id AND widgets.dtype="youtube";

SELECT web.name FROM heroku_5c524a96c5678f3.websites web, heroku_5c524a96c5678f3.developers, heroku_5c524a96c5678f3.website_roles WHERE website_roles.developer_fk=12 AND website_roles.role_fk=1 AND developers.id=12;

SELECT * FROM heroku_5c524a96c5678f3.pages;

SELECT * FROM heroku_5c524a96c5678f3.pages ORDER BY views  DESC LIMIT 1;

SELECT title FROM heroku_5c524a96c5678f3.pages WHERE id=234;

SELECT pages.* FROM heroku_5c524a96c5678f3.pages, heroku_5c524a96c5678f3.developers, heroku_5c524a96c5678f3.page_roles WHERE developers.id=12 AND page_roles.developer_fk=12 AND page_roles.role_fk=31;

SELECT SUM(views) FROM heroku_5c524a96c5678f3.pages WHERE pages.website_fk=567;

SELECT AVG(views) FROM heroku_5c524a96c5678f3.pages WHERE pages.website_fk=345;


SELECT * FROM heroku_5c524a96c5678f3.widgets;

SELECT widgets.* FROM  heroku_5c524a96c5678f3.widgets, heroku_5c524a96c5678f3.pages WHERE pages.id=123; 

SELECT widgets.* FROM heroku_5c524a96c5678f3.widgets, heroku_5c524a96c5678f3.pages, heroku_5c524a96c5678f3.developers, heroku_5c524a96c5678f3.page_roles WHERE developers.id=12 AND page_roles.developer_fk=12 AND page_roles.role_fk=31;

SELECT SUM(widgets) FROM heroku_5c524a96c5678f3.widgets, heroku_5c524a96c5678f3.pages WHERE widgets.page_fk=pages.id AND pages.website_fk=345;

SELECT name FROM heroku_5c524a96c5678f3.websites  WHERE id=678;

SELECT websites.name FROM heroku_5c524a96c5678f3.websites, heroku_5c524a96c5678f3.developers, heroku_5c524a96c5678f3.page_roles, heroku_5c524a96c5678f3.pages, heroku_5c524a96c5678f3.widgets WHERE page_roles.developer_fk=23 AND page_roles.page_fk=pages.id AND pages.website_fk=websites.id AND widgets.page_fk=pages.id AND widgets.dtype="youtube";
