CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `b6c452834ef04d`@`%` 
    SQL SECURITY DEFINER
VIEW `developer_roles_and_privileges` AS
    SELECT 
        `p`.`firstName` AS `firstName`,
        `p`.`lastName` AS `lastName`,
        `p`.`username` AS `username`,
        `p`.`email` AS `email`,
        `web`.`name` AS `name`,
        `web`.`visits` AS `visits`,
        `web`.`updated` AS `website_updated_at`,
        `wr`.`role` AS `website_role`,
        `wp`.`priviledge` AS `website_priviledge`,
        `pages`.`title` AS `title`,
        `pages`.`views` AS `page_views`,
        `pages`.`updated` AS `page_updated_at`,
        `pr`.`role` AS `page_role`,
        `pp`.`priviledge` AS `page_priviledge`
    FROM
        (((((((((((`persons` `p`
        JOIN `developers` `d`)
        JOIN `website_roles` `web_roles`)
        JOIN `website_priviledges` `web_priv`)
        JOIN `websites` `web`)
        JOIN `roles` `wr`)
        JOIN `priviledges` `wp`)
        JOIN `page_roles`)
        JOIN `page_priviledges` `page_priv`)
        JOIN `pages`)
        JOIN `roles` `pr`)
        JOIN `priviledges` `pp`)
    WHERE
        ((`p`.`id` = `d`.`id`)
            AND (`d`.`id` = `web_roles`.`developer_fk`)
            AND (`web_roles`.`website_fk` = `web`.`id`)
            AND (`wr`.`id` = `web_roles`.`role_fk`)
            AND (`wp`.`id` = `web_priv`.`priviledge_fk`)
            AND (`d`.`id` = `page_roles`.`developer_fk`)
            AND (`page_roles`.`page_fk` = `pages`.`id`)
            AND (`pr`.`id` = `page_roles`.`role_fk`)
            AND (`pp`.`id` = `page_priv`.`priviledge_fk`))