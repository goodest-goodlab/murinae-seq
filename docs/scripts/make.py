import sys, os, argparse

print()
print("###### Build site pages ######");
print("# PYTHON VERSION: " + ".".join(map(str, sys.version_info[:3])))
print("# Script call: " + " ".join(sys.argv) + "\n----------");

parser = argparse.ArgumentParser(description="Gets stats from a bunch of abyss assemblies.");
parser.add_argument("--all", dest="all", help="Build all pages", action="store_true", default=False);
parser.add_argument("--index", dest="index", help="Without --all: build index.html. With --all: exlude index.html", action="store_true", default=False);
parser.add_argument("--notes", dest="notes", help="Without --all: build notes.html. With --all: exlude notes.html", action="store_true", default=False);
parser.add_argument("--people", dest="people", help="Without --all: build people.html. With --all: exlude people.html", action="store_true", default=False);
parser.add_argument("--samples", dest="samples", help="Without --all: build samples.html. With --all: exlude samples.html", action="store_true", default=False);
parser.add_argument("--summary", dest="summary", help="Without --all: build summary.html. With --all: exlude summary.html", action="store_true", default=False);
parser.add_argument("--summary210", dest="summary210", help="Without --all: build summary_210.html. With --all: exlude summary_210.html", action="store_true", default=False);
parser.add_argument("--workflows", dest="workflows", help="Without --all: build workflows.html. With --all: exlude workflows.html", action="store_true", default=False);
parser.add_argument("--wgs", dest="wgs", help="Without --all: build wgs.html. With --all: exlude wgs.html", action="store_true", default=False);
parser.add_argument("--assembly", dest="assembly", help="Without --all: build assembly_stats.html. With --all: exlude assembly_stats.html", action="store_true", default=False);
parser.add_argument("--aln", dest="aln", help="Without --all: build aln_stats.html. With --all: exlude aln_stats.html", action="store_true", default=False);
parser.add_argument("--trees", dest="trees", help="Without --all: build trees.html. With --all: exlude trees.html", action="store_true", default=False);
parser.add_argument("--convergence", dest="convergence", help="Without --all: build convergence.html. With --all: exlude convergence.html", action="store_true", default=False);
parser.add_argument("--mns", dest="mns", help="Without --all: build mns.html. With --all: exlude mns.html", action="store_true", default=False);
parser.add_argument("--prune", dest="prune", help="Without --all: build prune.html. With --all: exlude prune.html", action="store_true", default=False);
parser.add_argument("--ps", dest="ps", help="Without --all: build ps.html. With --all: exlude ps.html", action="store_true", default=False);
parser.add_argument("--wgsps", dest="wgsps", help="Without --all: build wgs_ps_comps.html. With --all: exlude wgs_ps_comps.html", action="store_true", default=False);
# parser.add_argument("--fullassemblystats", dest="fullassemblystats", help="Without --all: build assembly_stats_2.html. With --all: exlude assembly_stats_2.html", action="store_true", default=False);
# parser.add_argument("--fullmappingstats", dest="fullmappingstats", help="Without --all: build full_mapping_stats.html. With --all: exlude full_mapping_stats.html", action="store_true", default=False);
parser.add_argument("--filterstats", dest="filterstats", help="Without --all: build filter_stats.html. With --all: exlude filter_stats.html", action="store_true", default=False);
parser.add_argument("--mouserat", dest="mouserat", help="Without --all: build mouse_rat_transcripts.html. With --all: exlude mouse_rat_transcripts.html", action="store_true", default=False);
args = parser.parse_args();
# Input options.

#cwd = os.getcwd();
os.chdir("generators");

pages = {
    'index' : args.index,
    'notes' : args.notes,
    'people' : args.people,
    'samples' : args.samples,
    'summary' : args.summary,
    'summary210' : args.summary210,
    'workflows' : args.workflows,
    'wgs' : args.wgs,
    'assembly' : args.assembly,
    'aln' : args.aln,
    'trees' : args.trees,
    'convergence' : args.convergence,
    'mns' : args.mns,
    'prune' : args.prune,
    'ps' : args.ps,
    'wgsps' : args.wgsps,
    # 'fullassemblystats' : args.fullassemblystats,
    # 'fullmappingstats' : args.fullmappingstats,
    'filterstats' : args.filterstats,
    'mouserat' : args.mouserat
}

if args.all:
    pages = { page : False if pages[page] == True else True for page in pages };

if pages['index']:
    os.system("python index_generator.py");

if pages['notes']:
    os.system("python notes_generator.py");

if pages['people']:
    os.system("python people_generator.py");

if pages['samples']:
    os.system("python sample_generator.py");

if pages['summary']:
    os.system("python sample_summary_generator.py");

if pages['summary210']:
    os.system("python summary_210_generator.py");    

if pages['workflows']:
    os.system("python workflows_generator.py");

if pages['wgs']:
    os.system("python wgs_generator.py");

if pages['assembly']:
    os.system("Rscript assembly_stats_generator.r");

if pages['aln']:
    os.system("Rscript aln_stats_generator.r");

if pages['trees']:
    os.system("Rscript trees_generator.r");
    
if pages['convergence']:
    os.system("Rscript convergence_generator.r");
    
if pages['mns']:
    os.system("Rscript mns_generator.r");

if pages['prune']:
    os.system("Rscript prune_generator.r");

if pages['ps']:
    os.system("Rscript ps_generator.r");

if pages['wgsps']:
    os.system("Rscript wgs_ps_comps_generator.r");

# if pages['fullassemblystats']:
#     os.system("Rscript assembly_stats_generator.r");

# if pages['fullmappingstats']:
#     os.system("Rscript full_mapping_stats_generator.r");

if pages['filterstats']:
    os.system("Rscript filter_stats_generator.r");

if pages['mouserat']:
    os.system("Rscript mouse_rat_generator.r");

print("----------\nDone!");


