############################################################
# For rodent web, 11.19
# This generates the file "notes.html"
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
		<div class="pure-u-3-24" id="margin"></div>
		<div class="pure-u-18-24" id="main_col">
			<div id="main_content">
                <div class="banner">Conference call, 04.02.2020</div>

                <h4>Updates from Jeff:</h4>
                    <ul>
                        <li>Due to labs closing because of the coronavirus pandemic, sequencing of the additional samples has been put on hold.</li>
                    </ul>

                <h4>Updates from Carl:</h4>
                    <ul>
                        <li>First pass of molecular evolution analyses complete for Australian sample.</li>
                    </ul>

                <h4>Updates from Gregg:</h4>
                    <ul>
                        <li>Assembly and mapping complete on full 176 species sample.</li>
                    </ul>

                <h4>Moving forward</h4>
                    <ul>
                        <li>Discussed annotation of exomes via aligning targets to assembled scaffolds.</li>
                        <li>Selected transcripts should maximize presence in both mouse and rat genomes.</li>
                        <li>Alignment step can be very error-prone. Many steps were discussed to mitigate this, including frameshift aware alignment with MACSE,
                            checking for premature stop codons in initial alignments, and generating an initial dS distribution of alignments to check for
                            abnormalities.</li>
                        <li>Molecular evolution analyses will have to account for discordance and multi-nucleotide mutations. Using gene trees and an MNM model
                            implemented in HyPhy were brought up ways to do so.</li>
                        <li>Pairwise and relative rate tests were discussed as other ways to detect shifts in selective pressues on branches of interest.</li>
                    </ul>

                <h4>Logistics</h4>
                    <ul>
                        <li>A Google doc has been set up to coordinate and plan workflows. The link will be distributed as requested.</li>
                        <li>A github repository will be set up to compile scripts and data.</li>
                    </ul>
                </br></br>
                
                <div class="banner">Meeting at LSU, 11.12.2019</div>

                <h4><a href="notes/11.12.2019-je-kcr.docx" download>Download raw notes</a></h4>

                <h4><a href="samples.html">Sampling</a> was discussed in detail.</h4>
                <h4>The plan:</h4>
                <ol>
                    <li>
                        Carl and Gregg will combine exome data and work on the best assembly/mapping method. Carl will focus on assembly with Spades,
                        while Gregg will develop an iterative mapping approach. We will need to figure out a way to assess and compare approaches. 
                        Gregg will set up a Box folder.
                    </li>
                    </br>
                    <li>
                        Gregg wants to set up a single, unified location for all raw sequence data (Box folder?), with the top directory being the three
                        folders <em>exon-capture</em>, <em>exomes</em>, and <em>genomes</em>, and sub-folders for each species that would contain reads,
                        mappings, assemblies, etc.
                        </br>
                        Jake points out that there are some restrictions to Box, such as a 15GB single file size limit and only 4 nested folders. If these
                        aren't a problem then it should be ok. Gregg will keep this in mind while compiling the data.
                    </li>
                    </br>
                    <li>
                        For exomes, we are freezing the sampling at what was discussed today. Kevin will send libraries of all the Bunomys clade members to
                        Montana for sequencing.
                    </li>
                    </br>
                    <li>
                        Gregg will use only a few of the Pseudomys exomes from the 48 Carl is using so the sampling is not too heavy from that single division.
                        Carl and Gregg can discuss which ones would be best to use.
                    </li>
                    </br>
                    <li>
                        For whole genome sequencing, we are proposing to sequence:
                        <ul>
                            <li>Phloeomys, Musseromys, Papagomys, and Komodomys for body size/longevity contrasts</li>
                            <li>Crossomys and Waiomys for amphibiousness convergence along with Pseudohydromys and Gracilimus for non-convergent sister species. Kevin notes that
                                Hydromys chrysogaster would be another interesting sample to compare montane and amphbiousness.
                            </li>
                            <li>Paucidentomys for worm-sucking convergence (Rhyncomys already sequenced) along with Gracilimus and Apomys for non-convergent sister species.</li>
                        </ul>

                        Sequencing of Notomys was also mentioned, and Kevin notes that there is draft sequence data, possibly from HiSeq 2000.
                    </li>
                    </br>
                    <li>
                        Whole genome sequencing will be simple shotgun sequencing.
                    </li>
                    </br>
                    <li>
                        Gregg will write an NIH NRSA to support the whole genome sequencing. The aims of this grant will focus on phylogenetic discordance, molecular evolution/rate variation,
                        and molecular convergence. For all of these aims, both exomes and genomes will be used to compare these sequencing strategies.
                    </li>
                    </br>
                    <li>
                        <b>We will have a Skype call on Tuesday, November 26 to follow up.</b>
                    </li>
                </ol>
                </br></br>

                <img class="pure-img" id="logo_main" src="img/5oldworldmice.jpg">
                <center><a href="http://dailymammal.com/murines-five-ways/">http://dailymammal.com/murines-five-ways/</a></center>
			</div>
		</div>
		<div class="pure-u-3-24" id="margin"></div>
	</div>

    {footer}
</body>
"""

######################
# Main block
######################
pagefile = "notes.html";
print("Generating " + pagefile + "...");
title = "Notes"

head = RC.readHead(title);
nav = RC.readNav(pagefile);
footer = RC.readFooter();

outfilename = "../../" + pagefile;

with open(outfilename, "w") as outfile:
    outfile.write(html_template.format(head=head, nav=nav, footer=footer));