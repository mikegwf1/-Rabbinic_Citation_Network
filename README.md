# -Rabbinic_Citation_Network
Social Network Analysis of Rabbis quoting Rabbis in the Talmud

In this project we identify rabbinic citations in the Bavli Talmud and identify and analyze social networks based on these citations.  We synthesize a master list of rabbi names that exist in classic rabbinic literature of the late antiquity and use this list to tag rabbinic name references in the Talmudic text.  We then utilize  pattern matching technology to identify the various formulaic language constructs used by the Talmud to frame citations and create a MySql database of these citations.  Various subsets of these citations are imported into Gephi and UCINet for visualization and analysis.

### Data Files (in data folder)

AllNameReferences.xlsx - Spreadsheet of all rabbi name references found in Talmudic text. "Rabbi Name after Link" refers to the canonical form of the rabbi's name in the Rabbi Tagging Database.
Reference_Counts_By_Afterlinkid.xlsx - Spreadsheet of the count of references in the Talmudic text by canonical rabbi name.
Tractate Rabbi Reference Count.xlsx - Spreadsheet of the count of references in the Talmudic text by canonical rabbi name and tractate.
Rabbi Intervals.xlsx - Spreadsheet of all occurrences of 2 rabbi names within 5 tokens of each other in the Talmudic text.
rabbi_quote_with_ids.xlsx - Spreadsheet of all citations found in the Talmudic text.

### Code Files (in src folder)

SNA_Citation_Network_002.jar - Java code used in project.  Please contact mike.sperling@rocketmail.com for more information.

### RabbiQuotesGephi

This file can be downloaded and opened and manipulated in [Gephi](https://gephi.org/).  It contains our visualizations for the rabbinic citation network in the Bavli - each unique case of one rabbi citing another is noted in the relevant visualizations.  The following describes each of the Workspaces, which are keyed to the figures in a research article now under review:

- QuotesAllRabbis-Fig1: The entire citation network of rabbis as seen against all the rabbis mentioned in the Bavli
- Fig 2:  All the rabbis who cite or who are cited by other rabbis
- Top10-Fig5:  The network of the ten rabbis with the highest degree scores (i.e., number of links in any direction to other individual rabbis), using names in English
- WithoutTop10Fig6: Fig 2, with the rabbis in Fig5 removed
- Modularity-Fig 7:  The rabbis (of Fig2) sorted by the Modularity algorithm and filtered to exclude rabbis with very low degree and betweenness centrality scores
- UseCase1-Fig8: One of the Modularity classes, sorted by Modularity
- UseCase2-Fig9:  A different Modularity class from Fig7, sorted by Modularity
- RabbahbarbarHanna-Fig10:  The network of direct links to Rabbah bar bar Hana, with English names
- RabbiZeira-Fig11: All the rabbis (with English names) who appear in citation chains of more than a doublet that also contain Rabbi Zeira

### Figures

These are different versions of the figures produced by, and keyed to, the Gephi file.