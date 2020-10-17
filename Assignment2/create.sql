CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `developers` (
  `id` int(11) NOT NULL,
  `developerKey` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_is_person` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userAgreement` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_is_person` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `websites` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `website_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_belongs_to_website` (`website_fk`),
  CONSTRAINT `page_belongs_to_website` FOREIGN KEY (`website_fk`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `cssClass` varchar(45) DEFAULT NULL,
  `cssStyle` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dtype` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `shareable` tinyint(4) DEFAULT NULL,
  `expandable` tinyint(4) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT '2',
  `html` varchar(45) DEFAULT NULL,
  `page_fk` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `belongs_to_page_idx` (`page_fk`),
  CONSTRAINT `belongs_to_page` FOREIGN KEY (`page_fk`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;

CREATE TABLE `priviledges` (
  `id` int(11) NOT NULL,
  `priviledge` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `website_roles` (
  `id` int(11) NOT NULL,
  `website_fk` int(11) DEFAULT NULL,
  `developer_fk` int(11) DEFAULT NULL,
  `role_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `developer_with_role_idx` (`developer_fk`),
  KEY `website_with_role_idx` (`website_fk`),
  KEY `role_for_developer_idx` (`role_fk`),
  CONSTRAINT `website_with_role` FOREIGN KEY (`website_fk`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `developer_for_role` FOREIGN KEY (`developer_fk`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_name` FOREIGN KEY (`role_fk`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `website_priviledges` (
  `id` int(11) NOT NULL,
  `developer_fk` int(11) DEFAULT NULL,
  `priviledge_fk` int(11) DEFAULT NULL,
  `website_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priviledge` (`priviledge_fk`),
  KEY `developer_with_priviledge` (`developer_fk`),
  KEY `website_for_priviledge` (`website_fk`),
  CONSTRAINT `priviledge` FOREIGN KEY (`priviledge_fk`) REFERENCES `priviledges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `developer_with_priviledge` FOREIGN KEY (`developer_fk`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `website_for_priviledge` FOREIGN KEY (`website_fk`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `page_roles` (
  `id` int(11) NOT NULL,
  `page_fk` int(11) DEFAULT NULL,
  `developer_fk` int(11) DEFAULT NULL,
  `role_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_with_role_idx` (`page_fk`),
  KEY `developer_with_role` (`developer_fk`),
  KEY `page_role` (`role_fk`),
  CONSTRAINT `developer_with_role` FOREIGN KEY (`developer_fk`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_role` FOREIGN KEY (`role_fk`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_with_role` FOREIGN KEY (`page_fk`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `page_priviledges` (
  `id` int(11) NOT NULL,
  `page_fk` int(11) DEFAULT NULL,
  `developer_fk` int(11) DEFAULT NULL,
  `priviledge_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `developer_with_page_priviledge` (`developer_fk`),
  KEY `page_for_priviledge` (`page_fk`),
  KEY `page_priviledge` (`priviledge_fk`),
  CONSTRAINT `developer_with_page_priviledge` FOREIGN KEY (`developer_fk`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_for_priviledge` FOREIGN KEY (`page_fk`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_priviledge` FOREIGN KEY (`priviledge_fk`) REFERENCES `priviledges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `street1` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `primary` tinyint(4) DEFAULT NULL,
  `person_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_with_address_idx` (`person_fk`),
  CONSTRAINT `person_with_address` FOREIGN KEY (`person_fk`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `primary` tinyint(4) DEFAULT NULL,
  `person_fk` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `phone_belongs_to_person` (`person_fk`),
  CONSTRAINT `phone_belongs_to_person` FOREIGN KEY (`person_fk`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
