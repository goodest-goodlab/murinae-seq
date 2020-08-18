#!/usr/bin/python
############################################################
# Compares a couple of exome assemblies
############################################################

import sys, os, core, coreseq, argparse

############################################################

a1 = sys.argv[1];
a2 = sys.argv[2];

print("Reading assembly: " + a1);
a1seq = core.fastaGetDict(a1);
print("Read " + str(len(a1seq)) + " contigs.");

print("Reading assembly: " + a2);
a2seq = core.fastaGetDict(a2);
print("Read " + str(len(a2seq)) + " contigs.");
print("------------");

print("Counting identical contigs...");
ident = [];
for t1 in a1seq:
    s1 = a1seq[t1];
    for t2 in a2seq:
        s2 = a2seq[t2];

        if s1 == s2:
            ident.append(t1 + "-" + t2);

print("Identical scaffolds: " + str(len(ident)));
print("------------");
