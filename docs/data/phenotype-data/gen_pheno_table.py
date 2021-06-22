import sys, treeparse as tp, csv

treefile = "../trees/full-coding-astral-rooted.tre";

lhfile = "Supplemental_Appendix_II.csv";
reprofile = "murine_repro_pheno_data.csv";
regionfile = "Murinae Locomotory Checklist - Murinae Locomotory Checklist.csv";

outfilename = "combined-phenotype-data.csv";
in_tree = open(treefile, "r").read().strip();

tinfo, tree, root = tp.treeParse(in_tree);
print(tree);

specs = {};
for node in tinfo:
    if tinfo[node][2] != 'tip':
        continue;
    print(node);
    if node == "rnor6":
        spec = "Rattus_norvegicus";
    elif node == "mm10":
        spec = "Mus_musculus";
    else:
        spec = node.split("_");
        spec = "_".join([spec[0], spec[1]]);
    
    print(spec);

    specs[spec] = { 'sample' : node };


# headers = ['spec', 'sample', 'adult mass (g)', 'total length', 'head body length', 'tail length', 'hind foot length', 'relative tail length', 'relative hind foot length'];
# headers += ['RTM (%)', 'head length', 'head width', 'head area', 'apical hook length', 'apical hook angle', 'ventral process length', 'ventral process angle', 'midpiece length', 'principal and end piece length', 'tail length', 'hooks/ventral processes'];
# headers += ['region'];
    
headers = [];

#########################################
cols_to_get = [1,2,3,4,5,6,7,8];
first = True;
with open(lhfile, "r") as csv_file:
    csv_lines = csv.reader(csv_file, delimiter=',');

    for line in csv_lines:
        #line = line.strip().split(",");
        if first:
            cur_headers = line;
            for i in range(len(cur_headers)):
                if i in cols_to_get:
                    headers.append(cur_headers[i]);
                    for spec in specs:
                        specs[spec][cur_headers[i]] = "NA";

            #print(cur_headers);
            first = False;
            continue;

        # print(line);
        # print(len(line));

        spec = line[0];
        if spec in specs:
            for col in cols_to_get:
                head = cur_headers[col];
                val = line[col];
                specs[spec][head] = val;
# Life history file: Supplemental_Appendix_II.csv
#########################################

#########################################
cols_to_get = [5,6,7,8,9,10,11,12,13,14,15,16];
first = True;
with open(reprofile, "r") as csv_file:
    csv_lines = csv.reader(csv_file, delimiter=',');
    for line in csv_lines:
        if first:
            cur_headers = line;
            for i in range(len(cur_headers)):
                if i in cols_to_get:
                    headers.append(cur_headers[i]);
                    for spec in specs:
                        specs[spec][cur_headers[i]] = "NA";

            #print(cur_headers);
            first = False;
            continue;

        # print(line);
        # print(len(line));

        spec = line[2] + "_" + line[3];
        if spec in specs:
            for col in cols_to_get:
                head = cur_headers[col];
                val = line[col];
                specs[spec][head] = val;
# Reproductive file: murine_repro_pheno_data.csv
#########################################

#########################################
cols_to_get = [8];
first = True;
with open(regionfile, "r") as csv_file:
    csv_lines = csv.reader(csv_file, delimiter=',');
    for line in csv_lines:
        if first:
            cur_headers = line;
            for i in range(len(cur_headers)):
                if i in cols_to_get:
                    headers.append(cur_headers[i]);
                    for spec in specs:
                        specs[spec][cur_headers[i]] = "NA";

            #print(cur_headers);
            first = False;
            continue;

        # print(line);
        # print(len(line));

        spec = line[0];
        if spec in specs:
            for col in cols_to_get:
                head = cur_headers[col];
                val = line[col];
                val = val.replace("/ ", ";").replace(", ", ";");
                specs[spec][head] = val;
# Reproductive file: Murinae Locomotory Checklist - Murinae Locomotory Checklist.csv
#########################################

with open(outfilename, "w") as outfile:
    outfile.write("# sources: Supplemental_Appendix_II.csv; murine_repro_pheno_data.csv; Murinae Locomotory Checklist - Murinae Locomotory Checklist.csv\n");
    headers = ["species", "sample"] + headers;
    outfile.write(",".join(headers) + "\n");
    for spec in specs:
        #spec = "Berylmys_bowersi"
        # print(spec)
        # print(specs[spec]);
        outline = [spec, specs[spec]['sample']];
        for h in headers:
            if h in ["species", "sample"]:
                continue;
            # print(h);
            # print(specs[spec][h])
            outline += [specs[spec][h]];

        outline = [ o if o != "" else "NA" for o in outline ];

        print(",".join(outline));
        outfile.write(",".join(outline) + "\n");
# Write combined phenotype table: combined-phenotype-data.csv
#########################################
