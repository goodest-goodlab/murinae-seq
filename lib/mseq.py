############################################################
# Sequence handling functions for rodent exomes, 04.2020
############################################################

############################################################
#fastaGetLists reads a file and parses (separates) each FASTA sequence in the file into two corresponding lists:
#one containing the title line of the sequence and another containing the sequence itself.

def fastaGetLists(i_name):
    seqs, titles = [], [];
    first = True;
    for line in open(i_name):
        line = line.strip();
        if line[0] == ">":
            if not first:
                seqs.append(cur_seq);
                titles.append(cur_title);

            cur_seq = ""
            cur_title = line;
            first = False;

        else:
            cur_seq += line;

    seqs.append(cur_seq);
    titles.append(cur_title);

    return titles, seqs;

############################################################
#A function to write the sequences to the output file in FASTA format. The
#sequences will be written 60 characters to a line.

def writeSeq(o_name, seq, title):
    seq = seq.replace(" ", "");
    outfile = open(o_name, "a");
    outfile.write(title);
    outfile.write("\n");
    a = 1;
    for base in seq:
        outfile.write(base);
        if a % 60 == 0:
            outfile.write("\n");
        a = a + 1;
    outfile.write("\n");
    outfile.close();

############################################################

def fastaGetDict(i_name):
#fastaGetDict reads a FASTA file and returns a dictionary containing all sequences in the file with 
#the key:value format as title:sequence.

	seqdict = {};
	for line in open(i_name, "r"):
		if line == "\n":
			continue;
		line = line.replace("\n", "");
		if line[0] == '>':
			curkey = line;
			seqdict[curkey] = "";
		else:
			seqdict[curkey] = seqdict[curkey] + line;

	return seqdict;

############################################################