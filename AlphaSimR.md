
Breeding Programme Modelling with AlphaSimR
===============================================
By  Gregor Gorjanc (Instructor)
---------------------------------------------------------
The HighlanderLab - Roslin Institute of The University of Edinburgh. 
---------------------------------------------------------
Class Notes and R Codes 
-----------------------
Student: Christopher Mujjabi
----------------------------
**Date: November 11, 2023**

What is a trait?

Any characteristic you can see or measure in these individuals is called a trait.
For example, the weight, height, or colour and so on. This is also called the phenotype of the individual. Phenotype is a function of the genetic value of that individual and the environment where the individual lives.
```
P = f(G, E)
```
## DNA

DNA is a long molecule that looks like a twisted ladder, shown here. The rungs of this ladder are smaller molecules called nucleotides or bases. If we unwind the DNA, we can see four bases. We have the adenine,cytosine, guanine, and thymine.
Adenine pairs with thymine and cytosine pairs with guanine.

A collection of DNA molecules in a cell is called a genome. For example, the human genome consists of about 3 billion base pairs, while the wheat genome consists of
about 17 billion base pairs. These long DNA molecules are packaged into chromosomes.

In a diploid organism such as us and cattle, Each cell carries two copies of each of these chromosomes. For example, cattle has 30 pairs of chromosomes, while maize has 10.

There are also polyploid species that carry more than two copies of each chromosome.
The sequence of bases in some parts of DNA is translated into amino acids, which are eventually assembled into proteins for bodily functions such as growth.

Variation at or around these translated sites drive genetic differences between individuals. If you look at one base pair, for example, this one, we can see four possible combinations of the bases. TA, GC, AT, and CG. We call these four possible combinations as alleles.

![Alt text](<WhatsApp Image 2023-11-11 at 13.18.36_28592a27-1.jpg>)

In this course, we will focus on DNA sites with just two alleles.For example, this allele and this allele.We will encode the alleles with a 0 and a 1,where 0 means that this allele is ancestral alleleand 1 means that this is a derived allele,that derived from the ancestral allele due to mutation.

In AlphaSimR, we will represent DNA as a series of zeros and ones in one row tables,like the short one here.We call these tables haplotypes. A diploid individual will have two haplotypes for each chromosome.The sum of the two haplotype alleles gives the genotype in the form of allele dosage.The values 0, 1,or 2 mean that we haveno, one or two derived alleles at a site.

![Alt text](<WhatsApp Image 2023-11-11 at 13.10.24_922e6ac1.jpg>)

In AlphasimR we use Fisher's Quantitative Genetics framework 1918 to relate DNA variation (SNPs) to phenotypic variation. 

    Phenotype value =  sum of the genetic value + envi. effect + GxE ( P = G + E + GxE)

    Genetic value (G) = the sum of the genetic values from the different DNA positions

![Alt text](<WhatsApp Image 2023-11-11 at 13.23.01_f3569800.jpg>)

## Computational Techniques

For our modelling purposes, we will simulate all these quantities with
a computational technique called **random number generation.**

We will use random number generators to:
- To simulate the DNA,
- To select which DNA sites affect the trait,
- To simulate genetic effects at these DNA sites, 
- To simulate environmental effects,possibly in interaction with the genotype.



