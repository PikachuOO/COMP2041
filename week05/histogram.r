#!/usr/bin/env Rscript

n <- scan(file="commOutput.txt")
t <- table(n)
barplot(t)
