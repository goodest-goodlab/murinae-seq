import sys, re

newids = {};
for line in open("ids-lists.txt"):
    if line.startswith("#"):
        continue;
    line = line.strip().split(" : ");
    #print(line);

    spec = line[0];
    #idlist = line[1].replace("[ ", "").replace("[", "").replace(" ],", "").replace(" ]", "").replace("\"", "").replace("'", "").split(", ");
    #idlist = [ i for i in idlist if i != "'" ];
    idlist = line[1][:-1].split(",");
    idlist = [ re.sub("[\"',\[\] ]", "", i) for i in idlist ]

    assert len(idlist) == 15, "\nNot enough IDs:\n" + spec + " " + str(idlist);

    newids[spec] = { i : idlist[i] for i in range(len(idlist)) if idlist[i] != "NA" };

    print(spec + " : " + str(newids[spec]) + ",");

    #print(spec, idlist);
    #sys.exit();
