install.packages(c('igraph','network','sna'))
install.packages("MBCbook")


library(MBCbook)
data("PoliticalBlogs")

library(network)
plot(PoliticalBlogs)

# Density of the network
2864 / (196* (196-1))

G <- as.edgelist(PoliticalBlogs)
A <- as.matrix.network.adjacency(PoliticalBlogs)

library(igraph)
# Degree distribution
g = graph.adjacency(A)
barplot(degree_distribution(g))


# Cliques and stars
C = c()
for (l in 1:15) C[l] = length(cliques(g,min=l,max=l))
barplot(C)

# Let's move to the Sampson Monk network
library(VBLPCM)
data(sampson)

A <- as.matrix.network.adjacency(samplike)
g = graph.adjacency(A)
barplot(degree_distribution(g))

C = c()
for (l in 1:15) C[l] = length(cliques(g,min=l,max=l))
barplot(C)

deg = degree(g)
E(g)$color = "gray"
V(g)$color = "yellow"
V(g)$size = deg
plot(g)

  
  
  
