#!/bin/bash
awk -F',' '{ printf("INSERT INTO location (Region,Subregion,StudyArea, Latitude, Longitude, management) VALUES(\"'%s'\",\"'%s'\",\"'%s'\",'%f','%f',\"'%s'\");\n ", $1, $2, $3, $8, $9, $10); }' 1.csv > location.sql
sort -u location.sql > locations.sql
sed -i '1s/^/use\ reef-survey;\n/' locations.sql
awk -F',' '{ printf("Insert into fish (family, scientificname, commonname, trophic) values(\"'%s'\",\"'%s'\", \"'%s'\", \" '%s' \");\n ", $12, $13, $14,$15); }' 1.csv > fish.sql
sort -u fish.sql > fishs.sql
sed -i '1s/^/use\ reef-survey;\n/' fishs.sql
awk -F',' '{ printf("Insert into survey (batchcode, surveyindex, surveydate, structuretype) values(\"'%s'\",\"'%s'\",\(select str_to_date\(\"'%s'\",\%m \,\%D\,\%Y \)\), \"'%s'\");\n ", $5,$6 ,$7,$11); }' 1.csv > survey.sql
sort -u survey.sql > surveys.sql
sed -i '1s/^/use\ reef-survey;\n/' surveys.sql
sed -i 's/\//,/g' surveys.sql
sed -i 's/%D/%d/g' surveys.sql
sed -i 's/%m/'"'"'%m/g' surveys.sql
sed -i 's/%Y/%Y'"'"'/g' surveys.sql
awk -F',' '{ printf("Insert into fishinfo (fishid, locationid, surveyindex, count, length) values((select fishid from fish where commonname = \"'%s'\"), (select locationid from location where latitude = \"'%s'\" and longitude = \"'%s'\"), \"'%s'\",\"'%s'\",\"'%s'\");\n ",$14,$8,$9,$6,$17,$16); }' 1.csv > fishinfo.sql
sed -i '1s/^/use\ reef-survey;\n/' fishinfo.sql
