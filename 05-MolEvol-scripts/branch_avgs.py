#!/usr/bin/python
############################################################
# Computes branch averages for rates from a directory of
# hyphy results as csv files.
############################################################

import sys, os, core, multiprocessing as mp

############################################################
# Functions

def branchSum(branches_dict, cur_branch, rates_dir, num_branches, filtered):
# Retrieve rates for each branch in the species tree for each gene, if that branch exists
# in the gene

    # print(cur_branch);
    #core.PWS("# " + core.getDateTime() + " Starting branch " + cur_branch);

    if branches[cur_branch]["node.type"] == "ROOT":
            return [cur_branch, branches_dict[cur_branch]];
    # Skip the root node because it doesn't have an associated branch

    branch_list = cur_branch.split(";");
    # Make a list of the species descendant from the current branch

    # if len(branch_list) < 5 or len(branch_list) > 7:
    #     continue;
    # For testing

    num_genes = len(os.listdir(rates_dir));
    num_genes_str = str(num_genes);
    # The number of branches and genes, for progress updates, str here to minimize calls to str

    gene_counter = 1;
    # The gene counter for progress updates, the branch counter is also converted to string here to 
    # minimize calls to str

    for f in os.listdir(rates_dir):
    # For the current branch, go through every gene and get the maximal subset clade

        if f in filtered:
            continue;
        # Skip the genes filtered based on dS

        # if gene_counter == 1 or gene_counter % 100 == 0:
        #     print("# Branch : " + str(cur_branch_num) + " / " + num_branches + " -> gene: " + str(gene_counter) + " / " + num_genes_str);
        gene_counter += 1;
        # Progress updates

        # if gene_counter > 10:
        #     continue;

        infile = os.path.join(rates_dir, f);
        # Compile path to current file

        max_split1 = [];
        max_split2 = [];
        max_line = [];
        # Variables to store the information for the maximal subset clade

        first = True;
        for line in open(infile):
            if first:
                first = False;
                continue;
            # Skip the header line in the file

            line = line.strip().split(",");
            split1 = line[2].split(";");
            split2 = line[3].split(";");
            splits = [split1, split2];
            # Get the splits from the current branch in the gene's gene tree

            for s in range(len(splits)):
            # For each split, we want to check whether it is a subset of the current branch

                if set(splits[s]) == set(branch_list) or set(splits[s]) <= set(branch_list):
                # Check if the current split is an equivalent set or subset of the current branch

                    if len(splits[s]) > len(max_split1):
                    # Check if the current split that is a subset of the branch contains more species
                    # than the current maximal subset. If so, it becomes the maximal subset.

                        max_split1 = splits[s];
                        max_line = line;
                        if s == 0:
                            max_split2 = splits[1];
                        else:
                            max_split2 = splits[0];
                        # Assign the maximal subset to max_split1 and the other split to max_split2

        if max_split1 == [] or any(spec in max_split2 for spec in branch_list):
            branches_dict[cur_branch]['num.genes.no.clade'] += 1;
        # If no species from the current branch are found then this clade doesn't exist in this gene OR
        # If species from the branch are present in the second split (not the maximal subset), then this is a case of
        # discordance and the clade truly doesn't exist in this gene as a monophyly. Do not increment sums.

        elif len(branch_list) == len(max_split1):
            cur_dn = float(max_line[4]);
            cur_ds = float(max_line[5]);
            cur_dnds = float(max_line[6]);
            cur_dn_bl = float(max_line[7]);
            cur_ds_bl = float(max_line[8]);
            # Parse the rates from the line corresponding to the maximal split

            if cur_ds_bl == 1e-10:
                branches_dict[cur_branch]['num.genes.no.ds'] += 1;
                cur_ds, cur_ds_bl, cur_dnds = 0, 0, 0;
            elif cur_dn_bl == 1e-10:
                branches_dict[cur_branch]['num.genes.no.dn'] += 1;
                cur_dn, cur_dn_bl, cur_dnds = 0, 0, 0;

            branches_dict[cur_branch]['num.genes.full'] += 1;
            branches_dict[cur_branch]['dn.sum'] += cur_dn;
            branches_dict[cur_branch]['ds.sum'] += cur_ds;
            branches_dict[cur_branch]['dn.ds.sum'] += cur_dnds;
            branches_dict[cur_branch]['nonsynonymous.bl.sum'] += cur_dn_bl;
            branches_dict[cur_branch]['synonymous.bl.sum'] += cur_ds_bl;
        # If the maximal subset of the current branch is equal to the current branch, increment sums for each new column.

        else:
            cur_dn = float(max_line[4]);
            cur_ds = float(max_line[5]);
            cur_dnds = float(max_line[6]);
            cur_dn_bl = float(max_line[7]);
            cur_ds_bl = float(max_line[8]);
            # Parse the rates from the line corresponding to the maximal split

            if len(branch_list) == 1:
                print(cur_branch);
                print(max_split1);
                print(len(max_split1));
                print(max_split2);
                print(len(max_split2));
                sys.exit();
            # This shouldn't happen ... it would mean a tip was found in the opposite split of the maximal clade (which should just be the tip)

            if cur_ds_bl == 1e-10:
                branches_dict[cur_branch]['num.genes.no.ds'] += 1;
                cur_ds, cur_ds_bl, cur_dnds = 0, 0, 0;
            elif cur_dn_bl == 1e-10:
                branches_dict[cur_branch]['num.genes.no.dn'] += 1;
                cur_dn, cur_dn_bl, cur_dnds = 0, 0, 0;
            # If there are no substitutions of a given type, the branch length will be 0, which I think Hyphy represents as 1e-10
            # Count these here and set appropriate rates to 0

            branches_dict[cur_branch]['num.genes.partial'] += 1;
            branches_dict[cur_branch]['dn.sum'] += cur_dn;
            branches_dict[cur_branch]['ds.sum'] += cur_ds;
            branches_dict[cur_branch]['dn.ds.sum'] += cur_dnds;
            branches_dict[cur_branch]['nonsynonymous.bl.sum'] += cur_dn_bl;
            branches_dict[cur_branch]['synonymous.bl.sum'] += cur_ds_bl;
        # If there are no species from the current branch in the second split (not the maximal subset), then this 
        # is a case of missing data and we can still count the branch as existing in this gene tree. Increment
        # the sums for each new column.

    #core.PWS("# " + core.getDateTime() + " Finishing branch " + cur_branch);
    #print(branches_dict[cur_branch])

    return [cur_branch, branches_dict[cur_branch]];

############################################################
# Options

tree_type = "concat"
# astral or concat

num_cores = 64;

tree_info_file = "../docs/data/trees/full-coding-" + tree_type + "-cf-rooted.csv";
# csv file with species tree info, including clades for each node

#rates_file = "full-coding-mg94-local.csv.gz";
ratesdir = "../05-MolEvol/full-coding-mg94-local/csv/";
# The directory of csv files for the hyphy run.

filter_file = "../05-MolEvol/full-coding-mg94-local-ds-filter-0.95quant.csv";
# The file with the genes to filter based on dS.

outfilename = "../05-MolEvol/full-coding-" + tree_type + "-cf-rooted-rates.csv";
# The output csv file with average rates per branch
# io options
##########################

core.PWS("# " + core.getDateTime() + " Reading dS filter genes: " + filter_file);
filter_files = [ line.replace(".json", ".csv") for line in open(filter_file) ];
core.PWS("# " + core.getDateTime() + " Read " + str(len(filter_files)) + " genes to filter based on dS.");

# Read the dS filtered genes to skip them for averaging
##########################

core.PWS("# " + core.getDateTime() + " Reading tree information: " + tree_info_file);

branches = {};
# The main dictionary for the tree info

clade_index = 1;
# The index for the clade column in the input tree csv.

first = True;
branch_num = 1;
for line in open(tree_info_file):
    line = line.strip().replace("\"", "").split(",");
    # Parse the line of the file

    if first:
        headers = line;        
        first = False;
        continue;
    # If it's the first line, get the headers and skip

    clade = line[clade_index]
    branches[clade] = {};
    # Get the clade and add it as a key to the main dictionary

    for i in range(len(headers)):
    # Add each header value into the dictionary for the current clade
        if i == clade_index:
            continue;
        # The clade will actually be the key, so we don't need to add it into the dictionary

        branches[clade][headers[i]] = line[i];
        # Add the value

    branches[clade]['branch.num'] = str(branch_num);
    branch_num += 1;

# Read in the tree info
##########################

core.PWS("# " + core.getDateTime() + " Adding new headers.");

new_headers = ["ds.sum", "dn.sum", "dn.ds.sum", "synonymous.bl.sum", "nonsynonymous.bl.sum", "num.genes.full", "num.genes.partial", "num.genes.no.clade", "num.genes.no.ds", "num.genes.no.dn"];
# The purpose of this script is to add some new columns to the tre csv, as defined here

for clade in branches:
# For every clade in branches, add the new headers into the branches dictionary

    for nh in new_headers:
        if branches[clade]["node.type"] == "ROOT":
            branches[clade][nh] = "NA";
        else:
            branches[clade][nh] = 0;
    # Add in the new headers and initialize at 0, except for the root node

headers = headers + new_headers;
# Combine the original and new headers for the output
# Compile the headers for the new columns
##########################

core.PWS("# " + core.getDateTime() + " Counting branches from each gene: " + ratesdir);
branch_num = str(branch_num);

counter = 1;
# for branch in branches:
#     result = branchSum(branches, branch, ratesdir, branch_num);
#     counter += 1;
#     if counter > 5:
#         break;
new_branches = {}
with mp.Pool(processes=num_cores) as pool:
    for result in pool.starmap(branchSum, ((branches, branch, ratesdir, branch_num, filter_files) for branch in branches)):
        core.PWS("# " + core.getDateTime() + " Finished branch " + str(counter) + " / " + branch_num);
        #print(result[0], result[1]);
        
        new_branches[result[0]] = result[1];
        #branches.update(result);
        counter += 1;
        # if counter > 5:
        #     break;

##########################

core.PWS("# " + core.getDateTime() + " Writing out new tree table: " + outfilename);

avg_headers = ["avg.ds", "avg.dn", "avg.dn.ds", "avg.synonymous.bl", "avg.nonsynonymous.bl"];
headers += avg_headers;

for clade in new_branches:
# For every clade in branches, add the new headers into the branches dictionary

    for nh in avg_headers:
        if new_branches[clade]["node.type"] == "ROOT":
            new_branches[clade][nh] = "NA";
        else:
            new_branches[clade][nh] = 0;
    # Add in the new headers and initialize at 0, except for the root node

with open(outfilename, "w") as outfile:
    outfile.write(",".join(headers) + "\n")
    # Open the output file and write the headers, which now contain the new columns

    for branch in new_branches:
        if new_branches[branch]["node.type"] != "ROOT" and (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']) != 0:
            new_branches[branch]['avg.ds'] = new_branches[branch]['ds.sum']  / (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']);
            new_branches[branch]['avg.dn'] = new_branches[branch]['dn.sum']  / (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']);
            new_branches[branch]['avg.dn.ds'] = new_branches[branch]['dn.ds.sum']  / (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']);
            new_branches[branch]['avg.synonymous.bl'] = new_branches[branch]['synonymous.bl.sum']  / (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']);
            new_branches[branch]['avg.nonsynonymous.bl'] = new_branches[branch]['nonsynonymous.bl.sum']  / (new_branches[branch]['num.genes.full'] + new_branches[branch]['num.genes.partial']);
        # If the branch is not the root and appears in some genes, then compute the averages.

        outline = [];
        for header in headers:
            if header == 'clade':
                outline.append(branch);
            else:
                outline.append(str(new_branches[branch][header]));
        
        outline = ",".join(outline);
        outfile.write(outline + "\n");
        # Compile the output line and write it out to the file.

# Output the tree table with the new columns
##########################



