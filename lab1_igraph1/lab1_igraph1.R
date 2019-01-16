####iGraph tutorial####

## preparation
install.packages("igraph")
install.packages("igraphdata")

library(igraph)
library(igraphdata)

# rm(list = ls()) # remove all the objects in the environment


## 1. Simple networks
## 1.1 create simple networks

g1 <- graph( edges=c(1,2, 2,3, 3,1), n=3, directed=F ) # an undirected graph with 3 edges

plot(g1) # will have special session for visualization


set.seed(1) 
plot(g1)
plot(g1) # visualization differs



g2 <- graph( edges=c(1,2, 2,3, 3,1), n=10 ) # now with 10 vertices, and directed by default
plot(g2)   

g2.undirected <- graph( edges=c(1,2, 2,3, 3,1), n=10, directed=FALSE) # now with 10 vertices, and undirected

g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
# When the edge list has vertex names, the number of nodes is not needed
plot(g3)

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  
# In named graphs we can specify isolates by providing a list of their names.
set.seed(1)
plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     vertex.frame.color="gray", vertex.label.color="black", 
     vertex.label.cex=1.5, vertex.label.dist=2, edge.curved=0.2) 

##1.2

# Small graphs can also be generated with a description of this kind:
# '-' for undirected tie, "+-' or "-+" for directed ties pointing left & right, 
# "++" for a symmetric tie, and ":" for sets of vertices

plot(graph_from_literal(a---b, b---c)) # the number of dashes doesn't matter
plot(graph_from_literal(a--+b, b+--c))
plot(graph_from_literal(a+-+b, b+-+c)) 
plot(graph_from_literal(a:b:c---c:d:e))

## 2. Creating specific graphs and graph models

### 2.1 Specific graphs -- predefined graph structures
# Empty graph
eg <- make_empty_graph(40)
plot(eg, vertex.size=10, vertex.label=NA)

# Full graph
fg <- make_full_graph(40)
plot(fg, vertex.size=10, vertex.label=NA)

# Tree graph
tr <- make_tree(40, children = 3, mode = "undirected")

plot(tr, vertex.size=10, vertex.label=NA) 

# Star graph 
st <- make_star(40)
plot(st, vertex.size=10, vertex.label=NA) 

# Ring graph
rn <- make_ring(40)
plot(rn, vertex.size=10, vertex.label=NA)


### 2.2 Graph models -- random graph models

# Erdos-Renyi random graph 
# ('n' is number of nodes, 'm' is the number of edges)
er <- sample_gnm(n=100, m=40) ####can also use erdos.renyi.game
## options include directed= and loops=
plot(er, vertex.size=6, vertex.label=NA)  

##alternatively
# Erdos-Renyi with G(n,p) specification
er <- sample_gnp(n=100, p=.02) ####can also use erdos.renyi.game
plot(er, vertex.size=6, vertex.label=NA)  


#Watts-Strogatz small-world model
#Barabasi-Albert preferential attachment model for scale-free graphs
#Zachary karate club zach <- graph("Zachary")

# 3. Adjustments on graphs

## 3.1 layer
kite <- make_empty_graph(directed = FALSE) + vertices(LETTERS[1:10]) +
  edges('A','B', 'B','D', 'C','D', 'D','E', 'E','G', 'F','G', 'G','H', 'H','I', 'I','J')

## 3.2 matrix

# can add edge
kite['A','F']=1

kite[]
kite[-1,1]
kite[-1,1]=1
kite[] # add multiple edges or using from and to
kite[from=LETTERS[1:3],to=LETTERS[4:6]]=1
kite[]
kite[-1,2]=0


### 3.3 rewiring a graph

# 'each_edge()' is a rewiring method that changes the edge endpoints
# uniformly randomly with a probability 'prob'.
rn.rewired <- rewire(rn, each_edge(prob=0.1))
plot(rn.rewired, vertex.size=10, vertex.label=NA)

# Rewire to connect vertices to other vertices at a certain distance. 
rn.neigh = connect.neighborhood(rn, 5)
plot(rn.neigh, vertex.size=8, vertex.label=NA) 

# combine graphs
plot(rn %du% tr, vertex.size=10, vertex.label=NA)


## 4. Edge, vertex and network attributes

# 4.1 consider edge, vertex as sequences

E(g4) #edge list
V(g4) #vertex list
ecount(g4)
vcount(g4)

# refer vertex and edges
V(g4)[c("John","Jim")]
E(g4)[c("John|Jim","Jim|Jack")]
E(g4,path = c("John","Jim","Jack"),)
V(g4)[nei("Jim")]
E(g4)[ "John" %--% "Jack" ]
E(g4)[ "Jim" %--% "Jack" ]
E(g4)[ "Jim" %->% "Jack" ]
E(g4)[ from("Jim") ]
E(g4)[ to("Jim") ]

# 4.2 consider the network as matrix

g4[] #"adjacency matrix"
class(g4)
g4[1,] # consider as a matrix to select 
get.adjacency(g4) ##explicitly getting adjacency matrix (as a sparse matrix)
get.adjacency(g4,sparse=FALSE) ##explicitly getting adjacency matrix  --- not sparse, lets you manipulate it better
g4[1:2,2:3]
g4[from=c("Jack","Jim","John"),to=c("Jim","Jack","John")]

# 4.3 neighbors
neighbors(g4,"Jim")
g4[["Jim"]]
g4[[c("Jim","John")]] #works for multiple vertices

g4[["Jim",]]
g4[[,"Jim"]]
g4[[,"Jim",edges=TRUE]]


# 4.4 Attributes: vertex attributes, edge attributes, graph attributes
# use $ to get attribute
V(g4)$name # automatically generated when we created the network.
V(g4)$gender <- c("male", "male", "male", "male", "female", "female", "male")
neighbors(g4,"Jim",mode = "all")$gender
E(g4)$type <- "email" # Edge attribute, assign "email" to all edges
E(g4)$weight <- 10    # Edge weight, setting all existing edges to 10
g4 <- set_graph_attr(g4, "name", "Email Network")

# see the attributes
edge_attr(g4)
vertex_attr(g4)
graph_attr(g4)
graph_attr_names(g4)
graph_attr(g4, "name")

#can remove the attribute
g4 <- set_graph_attr(g4, "something", "A thing")
g4 <- delete_graph_attr(g4, "something")
graph_attr(g4)

# Make use of these attributes
plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     vertex.color=as.factor(V(g4)$gender) )
plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     vertex.color=c( "pink", "skyblue")[1+(V(g4)$gender=="male")] ) 

# special attributes: make sure to avoid using these
#color(e/v), layout(g), name(v),shape(v),type(v),weight(e)
# Combination of attributes
g4s <- simplify( g4, remove.multiple = T, remove.loops = F, 
                 edge.attr.comb=c(weight="sum", type="ignore") )

plot(g4s, vertex.label.dist=1.5)

# 5. learn to read the description of igraph object
g4s

data(package="igraphdata")
data(macaque)
macaque

#The description of an igraph object starts with up to four letters:
#  
#D or U, for a directed or undirected graph
#N for a named graph (where nodes have a name attribute)
#W for a weighted graph (where edges have a weight attribute)
#B for a bipartite (two-mode) graph (where nodes have a type attribute)
#The two numbers that follow (7 5) refer to the number of nodes and edges in the graph. The description also lists node & edge attributes, for example:
#  
#(g/c) - graph-level character attribute
#(v/c) - vertex-level character attribute
#(e/n) - edge-level numeric attribute
# g:graph; v: vertex; e: edge
#n:numeric; c:character;l:logical; x:complex 


## 6. Network and node descriptions

# Density
# The proportion of present edges from all possible ties.
edge_density(er, loops=F)
ecount(er)/(vcount(er)*(vcount(er)-1))*2 #for a undirected network

# reciprocity,transitivity,diameter,...

# Node degrees
# 'degree' has a mode of 'in' for in-degree, 'out' for out-degree,
# and 'all' or 'total' for total degree. 
deg <- degree(er, mode="all")
plot(er, vertex.size=deg*3)
hist(deg, breaks=1:vcount(er)-1, main="Histogram of node degree")

#### centrality and centralization
# Degree (number of ties)
degree(er, mode="in")
centr_degree(er, mode="in", normalized=T)

###is there a mistake here?
##normalization should be
99*98
## but it is 
centr_degree(er, mode="in", normalized=T)$theoretical_max


# Closeness (centrality based on distance to others in the graph)
# Inverse of the node's average geodesic distance to others in the network
closeness(er, mode="all", weights=NA) 
centr_clo(er, mode="all", normalized=T) 

# Eigenvector (centrality proportional to the sum of connection centralities)
# Values of the first eigenvector of the graph adjacency matrix
eigen_centrality(er, directed=T, weights=NA)
centr_eigen(er, directed=T, normalized=T) 

# Betweenness (centrality based on a broker position connecting others)
# (Number of geodesics that pass through the node or the edge)
betweenness(er, directed=T, weights=NA)
edge_betweenness(er, directed=T, weights=NA)
centr_betw(er, directed=T, normalized=T)

# Exercise

# Compute the degree, closeness, eigenvector, and betweenness centrality of
# the actors in the Zachary karate club network. Plot the network, sizing the
# nodes based on the different centrality types.
