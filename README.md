# -Rabbinic_Citation_Network
Social Network Analysis of Rabbis quoting Rabbis in the Talmud

In this project we identify rabbinic citations in the Bavli Talmud and identify and analyze social networks based on these citations.  We synthesize a master list of rabbi names that exist in classic rabbinic literature of the late antiquity and use this list to tag rabbinic name references in the Talmudic text.  We then utilize  pattern matching technology to identify the various formulaic language constructs used by the Talmud to frame citations and create a MySql database of these citations.  Various subsets of these citations are imported into Gephi and UCINet for visualization and analysis.

This Github project contains the code and source data necessary to produce the output files used for analysis.  The results of the analysis can be seen at http://www.rabbiniccitations.jewishstudies.digitalscholarship.brown.edu/blog  That site also has links to several of the output datasets that are archived in ResearchGate.

There are 2 major steps in creating the output files.

1.

The first step involves expanding /data/talmud.json, which is a json file containing all of the standard text of the Babylonian Talmud, to individual, cleaned up text files for each tractate.  This file is provided courtesy of Sefaria and is licensed CC-BY-NC from The William Davidson digital edition of the Koren Noé Talmud, with commentary by Rabbi Adin Even-Israel Steinsaltz.  Download talmud.json .

The code for expanding is in /src/ExpandSefaria.zip .  Download and expand that file.  In /globals/Parameters.java , set 2 parameters (ignore the rest):
inputSefariaDavidsonTalmudPath - complete path to folder where talmud.json is located
outputSefariaDavidsonTalmud - complete path to folder that will contain the individual tractate files

Run /mains/ProcessDavidsonSefariaMain to accomplish the expansion.

This program requires the libraries gson-2.8.2.jar and commons-io-2.5.jar which are located in the /lib folder




