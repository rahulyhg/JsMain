use IMAGE_SERVER;
ALTER TABLE `LOG` CHANGE `STATUS` `STATUS` ENUM( 'Y', 'N', 'D', 'I', 'A') DEFAULT 'N';

