############################################################
# CORE functions for rodent exomes, 04.2020
############################################################

import sys, datetime, random, string

############################################################
# Prints basic info at runtime of a script.
def runTime(msg=False, writeout=False):
    if msg:
        if not msg.startswith("#"):
            msg = "# " + msg;
        PWS(msg, writeout);

    PWS("# PYTHON VERSION: " + ".".join(map(str, sys.version_info[:3])), writeout)
    PWS("# Script call:    " + " ".join(sys.argv), writeout)
    PWS("# Runtime:        " + datetime.datetime.now().strftime("%m/%d/%Y %H:%M:%S"), writeout);
    PWS("# ----------------", writeout);

############################################################
# Function to get the date and time in a certain format.
def getDateTime():
    return datetime.datetime.now().strftime("%m.%d.%Y | %H:%M:%S");

############################################################
# Writes over a file, header optional (if no header just pass "")
def filePrep(filename, header=""):
    f = open(filename, "w");
    f.write(header);
    f.close();

# Function to print a string AND write it to the file.
def PWS(o_line, o_stream=False, std_stream=True):
    if std_stream:
        print(o_line);
    if o_stream:
        o_stream.write(o_line + "\n");

############################################################

def spacedOut(string, totlen, sep=" "):
# Properly adds spaces to the end of a string to make it a given length
	spaces = sep * (totlen - len(string));
	return string + spaces;

############################################################
# This function generates a random string to add onto the end of tmp files to avoid possible overwrites.
def getRandStr(strlen=6):
	return ''.join(random.choice(string.ascii_letters) for m in range(strlen));

############################################################
# Splits a list l into even chunks of size n.
def chunks(l, n):
    n = max(1, n)
    return (l[i:i+n] for i in range(0, len(l), n))

############################################################