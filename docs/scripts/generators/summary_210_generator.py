############################################################
# For murinae website, 04.2020
# This generates the file "summary_210.html"
############################################################

import sys, os
sys.path.append('..')
import lib.read_chunks as RC

######################
# HTML template
######################

html_template = """
<!doctype html>
    {head}

<body>
    {nav}

	<div class="pure-g" id="main_row">
        <div class="pure-u-1-24" id="margin"></div>
		<div class="pure-u-22-24" id="main_col">
			<div id="main_content">

                <div id="node_links_cont">
                    <h1>{page_title}</h1>

                    <p><h4><a href="../data/multiqc/multiqc-full.html", target="_blank">MultiQC report after Fastp</a></h4></p>
                    <!-- <p><h4><a href="filter_stats.html">Read filtering stats</a></h4></p> -->
                    <p><h4><a href="assembly_stats.html">Assembly with Spades</a></h4></p>
                    <!-- <p><h4><a href="full_mapping_stats.html">Mapping with BWA to Mouse and Rat reference genomes</a></h4></p> -->
                    <p><h4><a href="mouse_rat_transcripts.html">Transcript selection from mouse and rat references</a></h4></p>
                    <p><h4><a href="aln_stats.html">CDS alignment stats</a></h4></p>

                    <h2>Sample summary table</h2>
                    
                    <center>
                    <table id="node_links_table">
                        <tr><td id="node_link_btn"><a href="{csvdatafile}">Download CSV table</a></td></tr>
                    </table>
                    </center>
                </div>

                <center>
                <div id="node_table_cont">
                    <table id="node_table">
                        {node_table}
                    </table>
                </div>
                </center>
                
			</div>
		</div>
		<div class="pure-u-1-24" id="margin"></div>
	</div>

    {footer}
</body>
"""

######################
# Main block
######################
pagefile = "summary_210.html";
print("Generating " + pagefile + "...");
title = "210 exome summary"

head = RC.readHead(title);
nav = RC.readNav(pagefile);
footer = RC.readFooter();

page_title = "Summary of 210 exome samples"

infilename = "../../data/exome-stats.csv";
outfilename = "../../" + pagefile;
csvdatafile = "data/exome-stats.csv"

to_include = ['Species', 'Sequencing platform', 'Batch']#, 'Total reads', 'Avg read len', 'Total bases']

first = True;
node_table = "";
for line in open(infilename):
    #print line;
    if "pos_ctrl" in line:
        continue;
    line = line.strip().split(",");
    if first:
        node_table += "\t\t\t\t<thead>\n\t\t\t\t\t";
        ind_include = [ x for x in range(len(line)) if line[x] in to_include ];
    else:
        node_table += "\t\t\t<tr>";

    for x in range(len(line)):
        #if x <= 8:
        if x in ind_include:
            if first:
                node_table += "<th>" + line[x] + "</th>";
            else:
                if line[x] != "NA":
                    if x == 2:
                        line[x] = "<em>" + line[1] + " " + line[2] + "</em>";

                    node_table += "<td>" + line[x] + "</td>";
                else:
                    node_table += "<td></td>";

    if first:
        node_table += "\t\t\t\t</thead>\n";
        first = False;
    else:
        node_table += "</tr>\n";
node_table += "\t\t</table>\n";1
with open(outfilename, "w") as outfile:
    outfile.write(html_template.format(head=head, nav=nav, node_table=node_table, page_title=page_title, csvdatafile=csvdatafile, footer=footer));