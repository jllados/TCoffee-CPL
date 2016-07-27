myArgs <- commandArgs(trailingOnly = TRUE)

#***** GENERATE FROM EXTERNAL TREE
#library(ape)
#library(phangorn)

#phylo <- read.tree(myArgs[4])
#rphylo = midpoint(phylo) #root
#rphylo$edge.length[which(rphylo$edge.length <= 0)] <- 0.0000001
#dendrogram <- chronos(rphylo) #ultrametric
#hr <- as.hclust(dendrogram)
#***** GENERATE FROM DM
m <- read.table(myArgs[1], sep="\t", header=TRUE)
#"ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC)
hr <- hclust(dist(m), method = "average", members=NULL)
#***** SAVE HR TO NEWICK
library(ctc)
output_tree = paste(myArgs[3], sep="")
output_tree = paste(output_tree, ".newick", sep="")
write(hc2Newick(hr),file=output_tree)
#*****

myhcl <- cutree(hr, k=myArgs[2])
print(myhcl)

# function to find medoid in cluster i
clust.medoid = function(i, distmat, clusters) {
	ind = (clusters == i)
	## edit by md, check it out: ##
	if (sum(ind) <= 1)
	   return (rownames(mydist)[ind]) ## medoid of a single object is the object
	else
	   return(names(which.min(rowSums( distmat[ind, ind] ))))
	## end edit ##
}

mydist = as.matrix(dist(m))
cluster_centers_indices = sapply(unique(myhcl), clust.medoid, m, myhcl)

output_clusters = paste(myArgs[3], sep="")
output_clusters = paste(output_clusters, ".clusters", sep="")

output_medoid = paste(myArgs[3], sep="")
output_medoid = paste(output_medoid, ".medoid", sep="")

write(length(myhcl),file=output_clusters)
write.table(myhcl, file = output_clusters, col.names = FALSE, append = TRUE)

write(length(cluster_centers_indices),file=output_medoid)
write.table(cluster_centers_indices, file = output_medoid, row.names = FALSE, col.names = FALSE, append = TRUE)
