#!/bin/bash
rm fishinfo.sql
for f in CSV/*.csv ; do
awk -F',' '{ printf("INSERT INTO location (Region,Subregion,StudyArea, Latitude, Longitude, management) VALUES(\"'%s'\",\"'%s'\",\"'%s'\",'%f','%f',\"'%s'\");\n ", $1, $2, $3, $8, $9, $10); }' $f | sed '/"","",/d'  > location.sql
sed 1d location.sql | sort -u  >> locations.sql

awk -F',' '{ printf("Insert into fish (family, scientificname, commonname, trophic) values(\"'%s'\",\"'%s'\", \"'%s'\", \" '%s' \");\n ", $12, $13, $14,$15); }' $f | sed '/"","",/d' > fish.sql
sed 1d fish.sql |sort -u >> fishs.sql

awk -F',' '{ printf("Insert into survey (batchcode, surveyindex, surveydate, structuretype) values(\"'%s'\",\"'%s'\",\(select str_to_date\(\"'%s'\",\%m \,\%D\,\%Y \)\), \"'%s'\");\n ", $5,$6 ,$7,$11); }' $f | sed '/"","",/d' > survey.sql
sed 1d survey.sql | sort -u >> surveys.sql

awk -F',' '{ printf("Insert into fishinfo (fishid, locationid, surveyindex, count, length) values((select fishid from fish where commonname = \"'%s'\"), (select locationid from location where latitude = \"'%f'\" and longitude = \"'%f'\"), \"'%s'\",\"'%s'\",\"'%s'\");\n ",$14,$8,$9,$6,$17,$16); }' $f | sed '/0.000000/d' >> fishinfo.sql
done
sed -i '1s/^/use\ reef-survey;\n/' fishinfo.sql
sort -u surveys.sql > msurveys.sql
sort -u fishs.sql > mfishs.sql
sort -u locations.sql > mlocations.sql
sed -i '1s/^/use\ reef-survey;\n/' msurveys.sql
sed -i '/08\//d' msurveys.sql
sed -i '/01\//d' msurveys.sql
sed -i 's/\//,/g' msurveys.sql
sed -i 's/%D/%d/g' msurveys.sql
sed -i 's/%m/'"'"'%m/g' msurveys.sql
sed -i 's/%Y/%Y'"'"'/g' msurveys.sql
sed -i '1s/^/use\ reef-survey;\n/' mfishs.sql
sed -i '1s/^/use\ reef-survey;\n/' mlocations.sql
sed -i '/DiseasedCover/d' fishinfo.sql
sed -i 's/NOT ENTERED/null/g' msurveys.sql

rm fishs.sql
rm surveys.sql
rm locations.sql
