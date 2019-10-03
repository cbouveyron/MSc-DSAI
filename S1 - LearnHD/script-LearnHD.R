# Day 2: PCA on Decathlon data
##########################################################

X = read.table("Downloads/AnaDo_JeuDonnees_Decathlon.csv",
               header=T, sep=";")
X = as.matrix(X[,2:11])

Xbar = scale(X,scale=FALSE)
S = t(Xbar) %*% Xbar
dec = eigen(S)

lambda = dec$values
barplot(lambda)

d = 2
Q = dec$vectors[,1:d]

Y = Xbar %*% Q
plot(Y,type='n')
text(Y,labels = 1:41)

pc = princomp(X)
biplot(pc)

# Exercice: Implement the use of BIC for selecting d in PPCA
????

# Day 3: Coding a basic version of t-SNE
##########################################################