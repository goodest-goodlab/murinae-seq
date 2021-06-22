library(ggtree)
library(ggplot2)
library(dplyr)
library(phytools)
library(tidyr)

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)


tree_file = "../data/trees/full_coding_iqtree_astral.cf.rooted.tree"
#tree_file = "../data/trees/test.tre"
rodent_tree = read.tree(tree_file)

tree_info = treeToDF(rodent_tree)
tree_info = tree_info %>% separate(label, c("astral", "gcf", "scf"), sep="/", remove=F)
tree_info$astral[tree_info$node.type=="tip"] = NA
tree_info$gcf = as.numeric(tree_info$gcf)
tree_info$scf = as.numeric(tree_info$scf)

write.csv(tree_info, "../data/trees/full-coding-astral-cf-rooted.csv", row.names=F)


h = corecol(numcol=1, pal="wilke", offset=3)
l = corecol(numcol=1, offset=3)
# Colors

gcf_tree = ggtree(rodent_tree, ladderize=F, aes(color=tree_info$gcf)) +
  scale_color_continuous(name='gCF', low=l, high=h, limits=c(0,100)) +
  xlim(0, 31) +
  geom_tiplab(color="#333333", fontface='italic', size=2) +
  theme(legend.position=c(0.05,0.9))
#geom_text(aes(label=rodent_data$support), hjust=-.1, color="#006ddb") +
#geom_nodepoint(color="#666666", alpha=0.85, size=4)
print(gcf_tree)
ggsave("../data/trees/gcf-tree.pdf", gcf_tree, width=8, height=16, unit="in")
# gCF tree

scf_tree = ggtree(rodent_tree, ladderize=F, aes(color=tree_info$scf)) +
  scale_color_continuous(name='sCF', low=l, high=h, limits=c(0,100)) +
  xlim(0, 31) +
  geom_tiplab(color="#333333", fontface='italic', size=2) +
  theme(legend.position=c(0.05,0.9))
#geom_text(aes(label=rodent_data$support), hjust=-.1, color="#006ddb") +
#geom_nodepoint(color="#666666", alpha=0.85, size=4)
print(scf_tree)
ggsave("../data/trees/scf-tree.pdf", scf_tree, width=8, height=16, unit="in")
# sCF tree


p = ggplot(tree_info, aes(x=gcf, y=scf, color=astral)) + 
  geom_point() +
  bartheme()
print(p)
stop()


node_test = ggtree(rodent_tree, size=2, ladderize=F) +
  ggplot2::xlim(0, 40) +
  geom_tiplab(color="#333333", fontface='italic', size=5) +
  geom_text(aes(label=node), hjust=-.5, vjust=-.3, color="#ff6db6") +
  geom_text(aes(label=label), hjust=-.5, vjust=1.3, color="#333333") +
  geom_nodepoint(color="#666666", alpha=0.85, size=4)
#ggtitle("NODECHECK (if no tree is visible, try changing xmax from default of 1)")
print(node_test)
stop()



for(d in desc){
  print(d)
  if(d < length(rodent_tree[["tip.label"]])){
    print(rodent_tree[["tip.label"]][d])
  }
}


stop()


#nodecheck(rodent_tree, xmax=5)

node_test = ggtree(rodent_tree, size=2, ladderize=F) +
  ggplot2::xlim(0, 6) +
  geom_tiplab(color="#333333", fontface='italic', size=5) +
  geom_text(aes(label=node), hjust=-.3, vjust=-.3, color="#ff6db6") +
  geom_nodepoint(color="#666666", alpha=0.85, size=4)
  #ggtitle("NODECHECK (if no tree is visible, try changing xmax from default of 1)")
print(node_test)
stop()



tree_fig = ggtree(rodent_tree, layout="circular") +
  #ggplot2::xlim(NA, 40) +
  geom_tiplab2(fontface='italic', size=3) +
  xlim(NA, 6) +
  geom_text(aes(label=node), hjust=-.3, vjust=-.3, color="#ff6db6")
  #geom_nodepoint(color="#666666", alpha=0.85, size=4) +
  #ggtitle("NODECHECK (if no tree is visible, try changing xmax from default of 1)")
print(tree_fig)
