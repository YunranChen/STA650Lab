
###algorithm 1 from Blitzstein and Diaconis

graph.deg.gen <- function(d){
	N <- length(d)
	if(graphical.check(d)!="graphical")return("not a graphical sequence")
	E <- matrix(ncol=2,nrow=0)
	prob_track <- 0
	equiv_track <- 0
	while(any(d>0)){
		wh <- which(d>0)
		i <- wh[which.min(d[wh])]
		equiv_track <- equiv_track + lfactorial(d[i])
		while(d[i]>0){
			i.edge.loc <- which(E==i,arr.ind=TRUE)
			i.edges <- NULL
			if(is.matrix(i.edge.loc))i.edges <- E[i.edge.loc[,1],][E[i.edge.loc[,1],]!=i]
			J <- (1:N)[-unique(c(which(d==0),i,i.edges))]
			dropJ <- NULL
			for(j in 1:length(J)){
				tmp <- d; tmp[c(i,J[j])] <- tmp[c(i,J[j])] - 1
				if(graphical.check(tmp)!="graphical")dropJ <- c(dropJ,j)
			}
			if(length(dropJ)>0)J <- J[-dropJ]
			j <- J
			if(length(J)>1){j <- sample(J,1,prob=d[J]); prob_track <- prob_track + log(d[j]/sum(d[J]))}
			E <- rbind(E,c(i,j))
			d[c(i,j)] <- d[c(i,j)]-1
		}
	}	
	list(E=E,prob=prob_track,equiv = equiv_track,unif.weight = -prob_track -equiv_track)
}


###function to check graphicality
graphical.check <- function(d){
  ##implementation of the Havel-Hakimi check  
  
  #write your own function here
}
