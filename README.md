# -Rabbinic_Citation_Network
Social Network Analysis of Rabbis quoting Rabbis in the Talmud

In this project we identify rabbinic citations in the Bavli Talmud and identify and analyze social networks based on these citations.  We synthesize a master list of rabbi names that exist in classic rabbinic literature of the late antiquity and use this list to tag rabbinic name references in the Talmudic text.  We then utilize  pattern matching technology to identify the various formulaic language constructs used by the Talmud to frame citations and create a MySql database of these citations.  Various subsets of these citations are imported into Gephi and UCINet for visualization and analysis.

This Github project contains the code and source data necessary to produce the output files used for analysis.  The results of the analysis can be seen at http://www.rabbiniccitations.jewishstudies.digitalscholarship.brown.edu/blog  That site also has links to several of the output datasets that are archived in ResearchGate.

There are 3 major steps in creating the output files.

1.

The first step involves expanding the Github file /data/talmud.json, which is a json file containing all of the standard text of the Babylonian Talmud, to individual, cleaned up text files for each tractate.  This file is provided courtesy of Sefaria and is licensed CC-BY-NC from The William Davidson digital edition of the Koren Noé Talmud, with commentary by Rabbi Adin Even-Israel Steinsaltz.  Download /data/talmud.json .

The Java code for expansion is in /src/ExpandSefaria.zip .  Download and expand that file.  In /src/globals/Parameters.java , set 2 parameters (ignore the rest):
inputSefariaDavidsonTalmudPath - complete path to file system folder where talmud.json is located
outputSefariaDavidsonTalmud - complete path to file system folder that will contain the individual tractate files

Run /src/mains/ProcessDavidsonSefariaMain to accomplish the expansion.

This program requires the libraries gson-2.8.2.jar and commons-io-2.5.jar which are located in the Github /lib/ folder

2.

The second step generates the files for analysis from the expanded tractate files.  It is implemented by the code in the Github folder /src/FindQuotes.zip and executed by running /src/mains/GetRabbiCountsMain. This program requires a number of inputs as follows:

a) A set of lists which will be located in the file system.  Edit topFolder and subFolder in /src/globals/Parameters.java to point to a folder which will contain these lists. As you can see in Parameters, topFolder and subFolder are concatenated into activeFolder.  Under activeFolder create a folder called "lists_sefaria". Copy the files contained in the Github /lists/ folder to your "lists_sefaria" folder.  These files are as follows:

prefixMap.txt - located in /lists/ - accounts for prefixed Rabbi names
linkMap.txt - located in /lists/ - links variant forms of Rabbi names to canonical Rabbi names
The rest of the files are entity file inputs to the Gate natural language package (https://gate.ac.uk/) which we use for pattern matching. 

b) A set of jape files which will be located in the file system. Jape files are pattern file inputs to Gate, which define the patterns that we expect denote quotes in the text.  Create a folder called "jape" under activeFolder and copy the files in the Github /jape/ folder into it.

c) GetRabbiCountsMain also utilizes a local MySql database (https://www.mysql.com/), reading a Rabbis table containing all rabbis in our database of rabbis and writing 1) a Citations table which contains all instances GetRabbiCountsMain located of rabbi names in the Talmudic text and 2) a Rabbi_intervals table which contains all instances where rabbi instances were located within 5 words of one another.  Create a MySql schema and import the populated rabbis table and the empty Citations and Rabbi_intervals tables from the Github /db/ folder.  Edit dbName in /src/globals/Parameters.java to contain the name of the schema.

d) The tractate level files created in step 1.  Edit taCorporaFolder in /src/globals/Parameters.java to point to the location of these files

GetRabbiCountsMain will also create a number of output files.  Create a folder called "output_sefaria" under activeFolder to hold these outputs. 

Finally, GetRabbiCountsMain requires the following libraries which are located in the Github /lib/ folder:
common-io-2.5.jar
gate.jar
commons-codec-1.11.jar
jheatchart-0.6.jar

Run GetRabbiCountsMain to generate the analysis files and populate the two MySql tables.

3.

Extract rabbinic interactions types from the Rabbi_interval table by running the create_statements_questions_quotes_StatementsAndQuestions.sql script located in the Github /scripts/ folder.  This creates the tables:

rabbi_statement - statements made by one rabbi to another
rabbi_question - questions posed by one rabbi to another
rabbi_quote - all instances of one rabbi quoting annother
rabbi_statement_and_question - statements and questions posed by one rabbi to another

"totals" tables are also created that summarize each category of interaction by pair of rabbis

Create tables with the appropriate data for gephi by running the tables_for_gephi.sql script located in the Github /scripts/ folder.  This creates the tables:

rabbi_statement_directed_edges
rabbi_statement_directed_edges_rabbi_nodes
rabbi_question_directed_edges
abbi_question_directed_edges_rabbi_nodes
rabbi_quote_directed_edges
rabbi_quote_directed_edges_rabbi_nodes
rabbi_statement_and_question_directed_edges
rabbi_statement_and_question_directed_edges_rabbi_nodes

As can be seen, a nodes and edges table is created for each category of interaction. These tables can be exported from MySql to produce nodes and edges files for Gephi.  If using the MySql Workbench for export, use the options of "no quote characters" and "comma separators".











