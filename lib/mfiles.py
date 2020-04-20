############################################################
# Functions for parsing files, species, and runs for rodent exoms, 04.2020
############################################################

import sys, os

############################################################

def getFiles(s, run, run_string, prev_dir, unmerged_flag=False):
    indir = os.path.join(prev_dir, s, run_string);

    if not os.path.isdir(indir):
        return False;

    seqfiles = [ f for f in os.listdir(indir) if ".fastq.gz" in f ];

    if run in [0,1]:
        seqfiles = [ os.path.join(indir, f) for f in seqfiles ];

    elif run in [2,3,4,5,6,7,8,9,10,11,12,13,14]:
        seqfiles = pairUp(seqfiles, indir, unmerged_flag);

    return seqfiles;

############################################################

def pairUp(sfiles, indir, unmerged_flag=False):
# Pairs up the paired end read files.
    paired_files = [];
    done = [];
    for f in sfiles:
        if unmerged_flag and ".unmerged." not in f:
            paired_files.append(os.path.join(indir, f));
        else:
            if "_R1_" in f:
                f2 = f.replace("_R1_", "_R2_");
            else:
                continue;

            f = os.path.join(indir, f);
            f2 = os.path.join(indir, f2);

            if not os.path.isfile(f) or not os.path.isfile(f2):
                sys.exit(" * File not found! " + "\n" + f + "\n" + f2 + "\n");

            if f in done or f2 in done:
                continue;

            done += f, f2;

            paired_files.append(f + ";" + f2);

    return paired_files;

############################################################

def getRef(spec):
    if spec not in ['mouse', 'rat']:
        sys.exit("* ERROR mfiles 1: -ref must be one of mouse or rat.");
    if spec == 'mouse':
        ref = "../Reference-genomes/mm10/mm10.fa";
    elif spec == 'rat':
        ref = "../Reference-genomes/Rnor6/rnor6.fa";
    return os.path.abspath(ref);

############################################################

def parseRuntypes(input_runtype, run_ids):
    if input_runtype == "all":
        runtype = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
    else:
        runtype = [];
        input_runtype = input_runtype.replace(", ", ",").split(",");
        for r in input_runtype:
            if r in run_ids:
                runtype.append(run_ids[r]);
            elif r in ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14"]:
                runtype.append(int(r));
            else:
                sys.exit(" * ERROR mfiles 2: Cannot find specified sequencing run: " + str(r));
    # Parse the input runtypes.

    runstrs = [];
    for r in runtype:
        for runstr, runind in run_ids.items():
            if runind == r:
                runstrs.append(runstr);
                input_runtype = runstr;
    # Get the string run type if int is given as input.

    return runtype, runstrs;

############################################################

def parseSpecs(input_spec, specs_ordered, spec_ids):
    if input_spec == "all":
        spec = specs_ordered;
    else:
        spec = input_spec.replace(", ", ",").split(",");
        for s in spec:
            if s not in spec_ids:
                sys.exit(" * ERROR mfiles 3: Cannot find specified species: " + s);
    # Parse the input species.

    return spec;

############################################################

def genSlurmSubmit(slurm_file, job_name, partition, tasks, cpus, mem, parallel_input):
    with open(slurm_file, "w") as sfile:
        submit = '''#!/bin/bash
#SBATCH --job-name={name}
#SBATCH --output={name}-%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gregg.thomas@umontana.edu
#SBATCH --partition={partition}
#SBATCH --nodes=1
#SBATCH --ntasks={tasks}
#SBATCH --cpus-per-task={cpus}
#SBATCH --mem={mem}

parallel -j {tasks} < {input_file}'''

        sfile.write(submit.format(name=job_name, partition=partition, tasks=tasks, cpus=cpus, mem=mem, input_file=parallel_input));

############################################################