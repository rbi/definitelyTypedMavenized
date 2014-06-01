# DefinitelyTyped Mavenized

This repository contains scripts to generate and install Maven artifacts for each Typescript library definition in the [DefinitelyTyped][] repository.
The scripts need [Bash][] to be executed.

# Usage

To include the Typescript definition for a library in your Maven project you can use something like this:

    <dependency>
        <groupId>de.voidnode</groupId>
        <artifactId>definitelyTypedMavenized</artifactId>
        <version>SOME_VERSION</version>
        <classifier>jquery</classifier>
        <type>zip</type>
        <scope>provided</scope>
    </dependency>

Where `SOME_VERSION` must be replaced with some real version of this artifact (e.g. `0.1.0`)
and the content of `<classifier>` with the actual library thats definition should be depend on.

The dependency could than be unpacked with the [maven-dependency-plugin][] and than be used for the Typescript compiler, e.g with the [typescript-maven-plugin][].

Currently the artifacts are not available in any public Maven repository so they have to be installed manually to the local Maven repository. 

# Building and Installing

* Clone the Git repository and change into it.
    * `git clone https://github.com/rbi/definitelyTypedMavenized`
    * `cd definitelyTypedMavenized`
* _Optional_: Change to a stable release of the artifact. This way a non-SNAPSHOT version will be build and installed.
    * `git checkout v0.1.0`
* Clone the official DefinitelyTyped repository which is referenced as as Git submodule.
    * `git submodule init`
    * `git submodule update`
* Generate the Maven pom.xml and the assembly descriptors for each library.
    * `./generateMavenXml.sh`
* Build or install the Maven artifacts as usual.
    * `mvn package` or `mvn install`

[DefinitelyTyped]: http://definitelytyped.org/
[Bash]: http://www.gnu.org/software/bash/
[maven-dependency-plugin]: http://maven.apache.org/plugins/maven-dependency-plugin/
[typescript-maven-plugin]: https://github.com/ppedregal/typescript-maven-plugin