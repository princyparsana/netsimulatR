library(Matrix)
library(igraph)

convert_psd <- function(thisgraph){
  thisgraph <- as.matrix(thisgraph)
  rowsum_graph = rowSums(abs(as.matrix(thisgraph))) * 1.5
  for(i in 1:length(rowsum_graph)){
    thisgraph[i,] <- thisgraph[i,]/rowsum_graph[i]
  }
  #   if(sum(abs(x))!=0){
  #     scaled_val = x/(1.5*sum(abs(x)))
  #   }else{
  #     x
  #   }
  # })
  thisgraph[is.nan(thisgraph)]<-0

  diag(thisgraph) <- 1.00
  thisgraph = (thisgraph + t(thisgraph))/2

  thisgraph
}