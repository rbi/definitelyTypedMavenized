#!/bin/bash

ASSEMBLY_DEST_FOLDER="src/main/assembly"

mkdir -p $ASSEMBLY_DEST_FOLDER

cp pom_template.xml pom.xml

for lib in `find definitelyTyped/ -maxdepth 1 -type d | grep -v _infrastructure | sed 's/definitelyTyped\///g'`; do
  echo "<assembly
	xmlns=\"http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.2\"
	xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
	xsi:schemaLocation=\"http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.2 http://maven.apache.org/xsd/assembly-1.1.2.xsd\">
	<id>$lib</id>

	<formats>
		<format>zip</format>
	</formats>
	
	<baseDirectory>$lib</baseDirectory>

	<fileSets>
		<fileSet>
			<outputDirectory>/</outputDirectory>
			<directory>definitelyTyped/$lib</directory>
			<includes>
				<include>*.d.ts</include>
			</includes>
		</fileSet>
	</fileSets>
</assembly>
" > $ASSEMBLY_DEST_FOLDER/${lib}.xml

  echo -e "\t\t\t\t\t\t<descriptor>src/main/assembly/${lib}.xml</descriptor>" >> pom.xml

done

echo "					</descriptors>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>" >> pom.xml
