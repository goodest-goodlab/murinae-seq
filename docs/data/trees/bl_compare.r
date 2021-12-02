############################################################
# For phodopus, 08.21
# Figure ML1
# Gregg Thomas
############################################################

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

############################################################

library(ape)
library(ggplot2)
library(ggtree)

############################################################

all_tree_file = "full_coding_iqtree_astral.cf.bl.rooted.treefile"
all_tree = read.tree(all_tree_file)

nrf25_tree_file = "full_coding_iqtree_astral.cf.bl.nrf25.rooted.treefile"
nrf25_tree = read.tree(nrf25_tree_file)

#nodecheck(all_tree, xmax=0.15)
#nodecheck(nrf75_tree, xmax=0.15)


bls = data.frame("all.loci"=all_tree$edge.length, "nrf25.loci"=nrf25_tree$edge.length, "node.type"="tip")
bls[189:nrow(bls),]$node.type = "internal"

tip_bls = subset(bls, node.type=="tip")
internal_bls = subset(bls, node.type=="internal")

one = data.frame("x"=c(0,0.1), "y"=c(0,0.1))
p = ggplot(bls, aes(x=all.loci, y=nrf75.loci)) +
  geom_point(data=tip_bls, aes(x=all.loci, y=nrf25.loci, color="Tip"), size=2, alpha=0.5) +
  geom_smooth(data=tip_bls, aes(x=all.loci, y=nrf25.loci, color="Tip"), method="lm", se=F, linetype="dashed") +
  geom_point(data=internal_bls, aes(x=all.loci, y=nrf25.loci, color="Internal"), size=2, alpha=0.5) +
  geom_smooth(data=internal_bls, aes(x=all.loci, y=nrf25.loci, color="Internal"), method="lm", se=F, linetype="dashed") +
  #geom_smooth(method="lm", se=F, linetype="dashed", aes(color="Fit")) +
  #geom_abline(aes(slope=1, intercept=0, color="1:1"), size=1.5, show.legend=F) +
  xlab("Branch lengths estimated from all loci") +
  ylab("Branch length estimated form loci with nRF<=0.25") +
  #scale_color_manual(values=c("1:1"="#333333", "Fit"="#920000", "Tip"=corecol(numcol=1, pal="wilke"), "Internal"=corecol(numcol=1, pal="wilke", offset=1))) +
  scale_color_manual(values=c("Tip"=corecol(numcol=1, pal="wilke"), "Internal"=corecol(numcol=1, pal="wilke", offset=1))) +
  bartheme()
print(p)

tip_fit = lm(tip_bls$nrf25.loci ~ tip_bls$all)

internal_fit = lm(internal_bls$nrf25.loci ~ internal_bls$all)




# one = data.frame("x"=c(0,0.1), "y"=c(0,0.1))
# p = ggplot(bls, aes(x=all.loci, y=nrf75.loci, color=node.type)) +
#   geom_point(aes(color=node.type), size=2, alpha=0.5) +
#   geom_smooth(method="lm", se=F, linetype="dashed", aes(color="Fit")) +
#   geom_abline(aes(slope=1, intercept=0, color="1:1"), size=1, linetype="dashed", show.legend=F) +
#   xlab("Branch lengths estimated from all loci") +
#   ylab("Branch length estimated form loci with nRF>=0.75") +
#   scale_color_manual(values=c("1:1"="#920000", "Fit"=corecol(numcol=1, offset=2))) +
#   bartheme()
# print(p)
