# -Rabbinic_Citation_Network
Social Network Analysis of Rabbis quoting Rabbis in the Talmud

In this project we identify rabbinic citations in the Bavli Talmud and identify and analyze social networks based on these citations.  We synthesize a master list of rabbi names that exist in classic rabbinic literature of the late antiquity and use this list to tag rabbinic name references in the Talmudic text.  We then utilize  pattern matching technology to identify the various formulaic language constructs used by the Talmud to frame citations and create a MySql database of these citations.  Various subsets of these citations are imported into Gephi and UCINet for visualization and analysis.

This Github project contains the code and source data necessary to produce the output files used for analysis.  The results of the analysis can be seen at http://www.rabbiniccitations.jewishstudies.digitalscholarship.brown.edu/blog  That site also has links to several of the output datasets that are archived in ResearchGate.

### Data Files (in data folder)

talmud.json - a json file containing all of the standard text of the Babylonian Talmud.  This file is provided courtesy of Sefaria and is licensed CC-BY-NC from The William Davidson digital edition of the Koren Noé Talmud, with commentary by Rabbi Adin Even-Israel Steinsaltz.

### Code Files (in src folder)

SNA_Citation_Network_002.jar - Java code used in project.  Please contact mike.sperling@rocketmail.com for more information.

