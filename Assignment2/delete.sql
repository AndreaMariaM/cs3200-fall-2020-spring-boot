DELETE FROM  heroku_5c524a96c5678f3.addresses WHERE addresses.person_fk=12 AND addresses.primary=true;

DELETE FROM heroku_5c524a96c5678f3.widgets WHERE widgets.id=567;

DELETE FROM heroku_5c524a96c5678f3.pages WHERE pages.website_fk=345;

DELETE FROM heroku_5c524a96c5678f3.websites WHERE website.id=567;
DELETE FROM heroku_5c524a96c5678f3.website_roles WHERE website_roles.website_fk=567;