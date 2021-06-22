#!/usr/bin/python
############################################################
# Computes branch averages for rates
############################################################

import sys, os, core, argparse, gzip

############################################################

tree_info_file = "../trees/full-coding-astral-cf-rooted.csv";
#rates_file = "full-coding-mg94-local.csv.gz";
rates_dir = "full-coding-mg94-local-csv/";
outfilename = "full-coding-astral-cf-rooted-rates.csv";


branches = {};
clade_index = 1;
first = True;
for line in open(tree_info_file):
    line = line.strip().replace("\"", "").split(",");
    if first:
        headers = line;        
        first = False;
        continue;

    clade = line[clade_index]
    branches[clade] = {};

    for i in range(len(headers)):
        if i == clade_index:
            continue;

        branches[clade][headers[i]] = line[i];

new_headers = ["avg.ds", "avg.dn", "avg.dn.ds", "avg.synonymous.bl", "avg.nonsynonymous.bl", "num.genes.full", "num.genes.partial", "num.genes.no.clade"];
for clade in branches:
    for nh in new_headers:
        if branches[clade]["node.type"] == "ROOT":
            branches[clade][nh] = "NA";
        else:
            branches[clade][nh] = 0;

headers = headers + new_headers;

first = True;
for branch in branches:
    if branches[branch]["node.type"] == "ROOT":
        continue;

    branch_list = branch.split(";");



    # if len(branch_list) < 5 or len(branch_list) > 7:
    #     continue;

    # print(branch_list);
    # print(len(branch_list));

    for f in os.listdir(rates_dir):
        # print(f);
        infile = os.path.join(rates_dir, f);
        first = True;
        max_split1 = [];
        max_split2 = [];
        max_line = [];
        for line in open(infile):
            if first:
                first = False;
                continue;
            line = line.strip().split(",");
            split1 = line[2].split(";");
            split2 = line[3].split(";");
            splits = [split1, split2];

            #print(split1);

            for s in range(len(splits)):
                if set(splits[s]) == set(branch_list) or set(splits[s]) <= set(branch_list):
                    if len(splits[s]) > len(max_split1):
                        max_split1 = splits[s];
                        max_line = line;
                        if s == 0:
                            max_split2 = splits[1];
                        else:
                            max_split2 = splits[0];

        # print(max_split1);
        # print(len(max_split1));
        # print(max_split2);
        # print(len(max_split2));

        if len(branch_list) == len(max_split1):
            branches[branch]['num.genes.full'] += 1;
            branches[branch]['avg.dn'] += float(line[4]);
            branches[branch]['avg.ds'] += float(line[5]);
            branches[branch]['avg.dn.ds'] += float(line[6]);
            branches[branch]['avg.nonsynonymous.bl'] += float(line[7]);
            branches[branch]['avg.synonymous.bl'] += float(line[8]);

        elif any(spec in max_split2 for spec in branch_list):
            branches[branch]['num.genes.no.clade'] += 1;
        
        else:
            branches[branch]['num.genes.partial'] += 1;

with open(outfilename, "w") as outfile:
    outfile.write(",".join(headers) + "\n")
    for branch in branches:
        # if branches[branch]['num.genes.full'] == 0:
        #     continue;

        if branches[branch]["node.type"] != "ROOT" and branches[branch]['num.genes.full'] != 0:
            branches[branch]['avg.dn'] = branches[branch]['avg.dn']  / branches[branch]['num.genes.full'];

        outline = [];
        for header in headers:
            if header == 'clade':
                outline.append(branch);
            else:
                outline.append(str(branches[branch][header]));

        outline = ",".join(outline);
        print(outline);
        outfile.write(outline + "\n");



sys.exit();

        


