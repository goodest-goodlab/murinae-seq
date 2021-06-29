############################################################
# Plots lengths of sequences for non-coding alignments
# with empahsis on diffs between mouse rat refs and
# others, 06.20
#############################################################

library(ggplot2)
library(dplyr)

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#############################################################

a = read.table("alignment_lengths_500.txt", header=T)
a = subset(a, withRef_len<=20000 & noRef_len<=20000)
one = data.frame("x"=seq(from=1,to=20000, by=1000), "y"=seq(from=1,to=20000, by=1000))

p = ggplot(a, aes(x=withRef_len, y=noRef_len)) +
  geom_point(alpha=0.3) +
  geom_smooth(method="lm", se=F) +
  geom_line(data=one, aes(x=x, y=y), size=2, linetype="dashed", color="#920000") +
  xlab("Align length with mouse and rat") +
  ylab("Align length without mouse and rat") +
  bartheme()
print(p)
# Alignment lengths with and without mouse references (500bp flank for refs)

####################

s = read.csv("reproductive-all-seqlens-500.csv", header=F)
names(s) = c("seq","spec","len")

s1 = subset(s, spec==">mm10" | spec==">rnor6")
s1 = s1 %>% group_by(seq) %>% summarize(avg.ref.len=mean(len))

s2 = subset(s, spec!=">mm10" & spec!=">rnor6")
s2 = s2 %>% group_by(seq) %>% summarize(avg.nonref.len=mean(len))

sf = merge(s1, s2, by="seq")
one = data.frame("x"=seq(from=1,to=10000, by=1000), "y"=seq(from=1,to=10000, by=1000))

p2 = ggplot(sf, aes(x=avg.nonref.len, y=avg.ref.len)) +
  geom_point(alpha=0.3) +
  geom_smooth(method="lm", se=F) +
  geom_line(data=one, aes(x=x, y=y), size=2, linetype="dashed", color="#920000") +
  xlab("Avg. length of non-ref samples") +
  ylab("Avg. length of mouse and rat") +
  bartheme()
print(p2)
# Average unaligned sequence lengths for mouse+rat vs all other samples
