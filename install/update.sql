USE pufferpanel;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `_meta` (
  `metaId` INT(11) NOT NULL AUTO_INCREMENT,
  `metaKey` VARCHAR(20) NOT NULL,
  `metaValue` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`metaId`),
  UNIQUE INDEX `UK_metaKey` (`metaKey`)
);

INSERT IGNORE INTO _meta (metaKey, metaValue) VALUES
  ('originalVersion', 'v1.1.3'),
  ('installDate', CURRENT_TIMESTAMP);

INSERT INTO _meta (metaKey, metaValue) VALUES
  ('version', 'v1.1.3'),
  ('updateDate', CURRENT_TIMESTAMP)
  ON DUPLICATE KEY UPDATE
  metaKey=VALUES(metaKey),
  metaValue=VALUES(metaValue);

UPDATE IGNORE acp_settings
SET setting_val='en_US'
WHERE setting_ref='default_language';

SET FOREIGN_KEY_CHECKS = 1;