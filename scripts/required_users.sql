

CREATE USER if not exists 'samuelsegars'@'%'
  IDENTIFIED BY 'new_password ';
CREATE USER if not exists 'garrypeffer'@'%'
  IDENTIFIED BY 'new_password';
CREATE USER if not exists 'leonardobenitez'@'%'
  IDENTIFIED BY 'new_password';
CREATE USER if not exists 'lillianmead'@'%'
  IDENTIFIED BY 'new_password';
use `reef-survey`;
GRANT ALL ON `reef-survey`.* TO 'samuelsegars','garrypeffer','leonardobenitez','lillianmead'@'%'
