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
  
# Exercice: apply t-SNE on the Decathlon data and compare

# Day 3: GMM for Classification
##########################################################

library(MASS)
data(iris)
plot(iris[,-5],col=iris$Species)


Y = iris$Species
X = iris[,-5]

learn = sample(1:150,100)
qda.clf = qda(X[learn,],Y[learn])

plot(iris[learn,1:2],col=Y[learn])
points(qda.clf$means,col=1:3,pch=19,cex=3)

pred = predict(qda.clf,X[-learn,])
points(X[128,],col=4,pch=17,cex=5)
sum(pred$class != Y[-learn])

lda.clf = lda(X[learn,],Y[learn])
pred = predict(lda.clf,X[-learn,])
sum(pred$class != Y[-learn])








