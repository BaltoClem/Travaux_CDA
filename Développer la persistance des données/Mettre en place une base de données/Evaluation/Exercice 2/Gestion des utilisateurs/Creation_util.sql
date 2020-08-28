CREATE USER 'util1'@'%' IDENTIFIED BY 'test1';
CREATE USER 'util2'@'%' IDENTIFIED BY 'test2';
CREATE USER 'util3'@'%' IDENTIFIED BY 'test3';

GRANT ALL PRIVILEGES
ON papyruseval.*
TO 'util1'@'%';

GRANT SELECT
ON papyruseval.*
TO 'util2'@'%';

GRANT SELECT
ON papyruseval.fournis
TO 'util3'@'%';
