#! /usr/bin/env Rscript
d<-scan("stdin", quiet=TRUE)
cat(mean(d), sep="\n")