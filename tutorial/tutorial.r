# ceci est un commentaire (grâce au "#")
# 
# pour exécuter le script, tu dois sélectionner tout le texte et appuyer sur ctrl+enter
# tu peux exécuter une seule ligne du script en séléctionnant celle souhaitée et en appuyant sur ctrl+enter
#
# fais attention à ton environnement, vérifie que toutes les données sont chargées
# si ce n'est pas le cas, ça signifie que la ligne qui charge ces données n'a pas été exécutée
# tu peux supprimer les données de l'environnement en utilisant le petit pinceau


# --- LES BASES ---
x <- 2      # création d'un objet en lui donnant la valeur 2
X = 4       # X reçoit la valeur 4
b = x       # b reçoit la valeur de x, c'est-à-dire 2
3 -> y      # y reçoit la valeur 3
data(iris)  # charge la table de données "iris"
print(x)    # print la valeur x, c'est-à-dire 2
ls()        # affiche tous les objets de l'environnement
objects()   # idem
rm(b, x)    # supprime les objets de l'environnement
rm(X)       # supprime l'objet de l'environnement



# --- LES MODES ---
# il y a plusieurs types d'objet
# - null        : l'objet est vide, il n'y aucune valeur à l'intérieur
# - logical     : 1 or 0, TRUE or FALSE, ON or OFF, VRAI ou FAUX  
# - numeric     : toutes les valeurs numériques (1, 34.32, pi, 1e-10)
# - complex     : tous les nombres complexes (2+0i, 2i)
# - character   : toutes les chaînes de caractères ("hello", 'world', "Pirlouit")

nothing = NULL
temperature = 23.5
isAGoodBreakfast = TRUE
goodMorning = "Good morning!"   # tu peux utiliser "..." ou '...' pour stocker le texte 
goodNight = 'Good Night...'

mode(temperature)               # tu peux vérifier le mode de l'objet (null, logical, numeric, complex, character...)

is.null(temperature)            # tu peux vérifier si un objet correspond au type souhaité (retourne TRUE ou FALSE)
is.logical(temperature)
is.numeric(temperature)
is.complex(temperature)
is.character(temperature)

as.logical(temperature)         # tu peux convertir les objets d'un type à un autre
as.numeric(temperature)
as.complex(temperature)
as.character(temperature)

x <- NA                         # parfois, il y a des valeurs manquante dans un tableau de données => NA (Not Available)
is.na(x)                        # tu peux vérifier si l'objet possède une valeur NA (retourne TRUE ou FALSE)



# --- LES VECTEURS ---
# ça correspond à une liste d'objets, tu peux la créer de différentes façons
# par exemple, tu pourrais avoir un palette de couleur, un panier de fruit/légumes, une liste d'étudiant,...

1:6                   # 1,2,3,4,5,6
seq(1, 3, by=0.5)     # pas de 0.5 (0.0, 0.5, 1.0, 1.5)
seq(1, 6, length=5)   # 5 éléments entre 1 et 6 répartis équitablement
x<-c(1, 4, 10)        # vecteur de 3 objets numériques, c() pour collector
x
y<-seq(1, 10, by=2)   # pas de 2 (0.0, 2.0, 4.0, 6.0)
y
z<-c(x, y)            # fusion des vecteurs x et y
z
rep(1, 4)             # répète l'objet 1 4 fois
rep(c(1, 2), each=3)  # répète tous les éléments du vecteur 3 fois

x <- c("hey","hello","hep")                   # vecteur avec des chaînes de caractères
x
x <- rep(c("rouge","jaune","bleu"),times=2)   # répéter le vecteur 2x
x

rep(c("red","jaune","bleu"),each=2)           # répéter chaque élément 2x
rep(c("red","jaune","bleu"),times=c(1,4,2))   # répéter le 1er élément 1x, le 2ème 4x et le 3ème 2x

nom <- paste("ind",1:13,sep=".")              # d'abord répéter "ind" 13x avec comme séparateur un "."
nom
paste(c("X","Y"),1:5,sep=".",collapse="+")    # concatène les élément du vecteur avec le caractère "+"

substr("freerider",5,9)                       # reprend seulement les caractères allant de 5 à 9



# --- LES VECTEURS LOGIQUES ---
1>0             # est-ce que 1 est strictement plus grand que 0 ? 
x<-c(-1,0,2)    # création d'un vecteur [-1, 0, 2]
x
test<-x>1       # vérifie pour chaque objet du vecteur s'il est strictement plus grand que 1
test
all(x>1)        # est-ce que tous les objets du vecteur sont strictement plus grands que 1 ?
any(x>1)        # est-ce qu'au moins un des objets du vecteur est strictement plus grand que 1 ?



# --- LES FACTEURS ---
y<-c("M","F","F","M","F")       # création d'un vecteur d'objets de chaînes de caractères
y
yf<-factor(y)                   # supprime les doublons et liste les différents éléments présents dans le vecteur
yf
attributes(yf)                  # plus de description de l'objet
levels(yf)                      # liste les éléments du vecteur (enlève les doublons)
nlevels(yf)                     # liste le nombre d'éléments différents dans ce vecteur
levels(yf)<-c("Homme","Femme")  # renomme les éléments
yf

salto<-c(1:5,5:1)               # création d'un vecteur [1,...,5,5,...,1]
salto
salto.f<-as.factor(salto)
salto.f

niveau <- ordered(c("débutant","débutant","champion","champion","moyen","moyen","moyen","champion"), levels=c("débutant","moyen","champion"))
niveau

# données qualitatives ou quantitatives ?
is.factor(x)
is.numeric(x)
# s'il y a un minimum (Min.), un maximum (Max.), les quartiles (1st Qu., 3rd Qu.) et la moyenne (Median, Mean),
# c'est que ce sont des données quantitatives
summary(x)

# pour afficher les différentes valeurs existantes dans le vecteur ainsi que le nombres de fois qu'elles sont répétées
X<-rep(c(10:13), times=c(1,4,10, 2))    # 10, 11, 12, 13 dont 10 est répété 1x, 11 est répété 4x,...
X
X.factor<-factor(X)                     # factorisation du vecteur et affichage des différents objets
X.factor
summary(X.factor)                       # comptage des récurrences des différents objets du vecteur

# conversion en valeur numérique
X<-rep(c(10:13), times=c(1,4,10, 2))
as.numeric(X)
X.tmp<-as.character(X)                  # conversion des numériques en chaînes de caractères
X.tmp
as.numeric(X.tmp)                       # conversion des chaînes de caractères en numériques



# --- LES MATRICES ---
# la matrice est un tableau à double entrée (lignes x colonnes)
# la matrice est un objet monotype (tous les objets sont du même type)
# le nombre total d'objets doit correspondre aux lignes x colonnes, sinon il reprend le premier élément

x<-matrix(c(1:6), nrow=2, ncol=3, byrow=TRUE)       # matrix(données, nombre_lignes, nombres_colonnes, rangement_par_ligne)
x
y<-matrix(1:2, ncol=1)
y
z<-matrix(3:1, ncol=3)
z
m<-matrix(1:4, nrow=3, ncol=3)                # reprend le cycle 2x
m

un<-matrix(1, nrow=2, ncol=4)                 # matrice unique
un

x<-seq(1, 10, by=2)
x
as.matrix(x)                                  # conversion d'un vecteur en matrice

cmat<-matrix(c("a", "b", "c", "a"), ncol=2)   # matrice de chaînes de caractères
cmat

m<-matrix(1:4, ncol=2)
m
n<-matrix(3:6, ncol=2, byrow=T)
n
o<-matrix(4:1, ncol=2)
o

m+n               # addition
m*n               # multiplication
sin(m)            # sin pour chaque objet
exp(m)            # exponentielle pour chaque objet
m%*%o             # produit matriciel
t(m)              # transposée
diag(5)           # matrice identité d'ordre 5
diag(c(1:4))      # matrice diagonale avec le vecteur dans la diagonale
crossprod(m,o)    # produit croisé
det(m)            # déterminant
svd(m)            # décomposition en valeurs singulières
eigen(m)          # diagonalisation
solve(m)          # inversion
solve(m,n)        # résolution d'un système linéaire
chol(n)           # décomposition de cholesky
qr(m)             # décomposition qr

ncol(m)                 # nombre de colonnes
nrow(m)                 # nombre de lignes
dim(m)                  # dimensions de la matrice

cbind(c(1,2), c(3,4))   # concaténation des vecteurs
apply(m, MARGIN=2, sum) # somme par colonne
apply(m, 1, mean)       # moyenne par ligne



# --- LES LISTES ---
# c'est comme un vecteur mais qui peut stocker des objets de différents types
# c'est un ensemble ordonné d'objets
# les objets dans une liste s'appellents des composantes et peuvent être associés à un nom spécifique

myList<-list(c("a", "b", "c", "a"), matrix(1:4, 2, 2))  # création de la liste avec list(comp01, comp02, comp03, ...)
myList
length(myList)    # longueur de la liste 
mode(myList)      # mode de l'objet myList
is.list(myList)   # est-ce que myList est du mode list ?

names(myList)<-c("vec", "mat")  # nommage des composantes de la liste
names(myList)                   # affichage des noms des composantes de la liste

li<-list()                      # création d'une liste vide
li[[2]]<-1:4                    # placer un vecteur comme composantes en deuxième position de la liste
li$new<-matrix(1:4, nrow=2)     # place une matrice comme composante avec le nom "new" dans la liste
names(li)                       # affichage des noms des composantes
li$new
li[[2]]
unlist(li)                      # création d'un seul vecteur avec tous les éléments de la liste
c(li, myList)                   # concaténation de 2 listes



# --- LES DATAFRAMES ---
# ce sont des listes dont les composantes sont de mêmes longueurs mais leurs modes peuvent être différents
# objet privilégié en analyse statistique :)

x<-c("a", "b", "c", "a")
y<-1:4

df<-data.frame(x,y)       # création d'un datafram de 2 composantes de longueur=4
df
length(df)                # nombre de composantes
attributes(df)            # description du dataframe
str(df)                   # résumé de chaque composante du datafram  
View(df)                  # visualisation des composantes dans un tableau (TROP TROP COOL)



# --- LES SELECTIONS ---
x<-c(-2:5)
x > 0       # x est strictement plus grand que 0
x >= 0      # x est plus grand que 0
x == 0      # x est égal à 0
x <= 0      # x est plus petit ou égal à 0
x < 0       # x est strictement plus petit que 0

x>0 & x<5   # x est plus grand que 0 (exclu) ET plus petit que 5 (exclu)
x>0 | x<5   # x est plus grand que 0 (exclu) OU plus petit que 5 (exclu)

x != 0      # x est différent de 0



# --- LES SELECTIONS PAR POSITION ---
x<-c(2,-1,15)
x[2]            # donne le deuxième élément de x
x[c(1,3)]       # donne les premier et troisième éléments de x
x[-2]           # ne donne pas le deuxième élément de x



# --- LES SELECTIONS PAR CONDITION ---
x<-c(2,-1,15)
x[x>0]              # affiche tous les éléments positifs
x[!(x<0)]           # affiche tous les éléments (qui ne sont pas (strictement plus petit que 0))
x[(x<5) & (x>=12)]  # affiche tous les éléments (qui sont strictement plus petit que 5) et (plus grand ou égal à 12)

T <- c(23, 28, 24, 32)
O3 <- c(80, 102, 87, 124)
O3[T>25]



# --- LES SELECTIONS DANS UNE MATRICE ---
m<-matrix(1:12, nrow=3, ncol=4)

m[2,3]              # affiche l'élément de la ligne 2, colonne 3
m[1,]               # affiche tous les éléments de la ligne 1
m[,3,drop=FALSE]    # affiche tous les éléments de la colonne 3 en gardant la structure de la matrice (drop=FALSE)
m[,c(2,2,1,3)]      # affiche les colonnes 2, 2, 1 et 3
m[-1,]              # sans la première ligne
m[1:2,-1]           # première et deuxième ligne sans la première colonne

# m[1,]         prend tous les éléments de la première ligne
# m[1,]>2       filtre ceux qui sont strictement plus grand que 2
# m[,m[1,]>2]   reprend le résultat de la ligne du dessus
m[,m[1,]>2]

m[m>2]      # reprend tous les éléments de la matrice qui sont strictement plus grand que 2 et les affiche dans un vecteur
m[x<5]      # assigne la valeur NA à tous les éléments qui sont strictement plus petits que 5



# --- LES SELECTIONS PAR POSITION/NOM DANS UNE LISTE ---
x<-c("a", "b", "c", "a")
X<-matrix(1:8, ncol=4)
y<-c(TRUE, TRUE, TRUE, FALSE)
z<-matrix(c("a", "b", "c", "d"), ncol=2)

myList<-list(comp1=x, comp2=X, comp3=y, comp4=z)    # création de la liste à partir des 4 éléments du dessus et nommage
myList[2]           # affiche le deuxième élément de la liste (avec son nom)
length(myList[2])   # affiche sa longueur (1 puisqu'il n'y a qu'un vecteur dans cette composante)
myList[[2]]         # extrait le deuxième élément
length(myList[[2]]) # affiche la longueur de ce qui se trouve dans la composante (la longueur du vecteur)

myList["comp2"]     # affiche l'élément "comp2" de la liste
myList[["comp2"]]   # extrait l'élément "comp2"
myList$comp2        # idem

myList[c(1,3)]      # affiche les deuxième et troisième éléments de la liste



# --- LES SELECTIONS DANS UNE DATAFRAME ---
x <- c("A","B","C",rep("D",3))
y <- 1:6
z <- c(seq(10,45,length=5),-10)
df <- data.frame(x,y,z)           # création de la dataframe

df[1:4,2:3]               # sélection des lignes 1,2,3,4 et colonnes 2,3
df$z
df["z"]
df$x[2:4]

df[(df$y>4) | (df$z>17),] # affiche les lignes où y est strictement plus grand que 4 OU z est strictement plus grand que 17
df[(df$y>4) & (df$z>17),] # affiche les lignes où y est strictement plus grand que 4 ET z est strictement plus grand que 17

df[df$y>4, 1:2]           # affiche les colonnes 1 et 2 où y est strictement plus grand que 4
df[df$y>4, c("x", "y")]   # affiche les colonnes "x" et "y" où y est strictement plus grand que 4



# --- IMPORTER UN FICHIER ---
# un fichier de données sépare les individus par ligne et les paramètres par colonnes
# les lignes sont séparées par un retour de ligne (enter) et les colonnes par un ";"
# si tu n'arrive pas à importer le fichier, c'est que le projet n'est pas ouvert au bon endroit
# utilise getwd() pour voir où est ouvert le projet
# tu dois soit changer le fichier de place, soit adapter le chemin
# attention, ta dernière ligne de données doit bien avoir un retour à la fin (un "enter")
# il faut qu'il y ait une ligne vide à la fin de ton fichier, sinon ça génère une erreur

students<-read.table("students.txt", sep=";", row.names=1, header=TRUE)   # chargement du fichier dans un dataframe
ozone<-read.table("ozone.csv", sep=";", header=TRUE, dec=",", row.names=1)
dim(students)             # affiche les lignes x colonnes
dim(ozone)
students
ozone[1:10,]
summary(ozone)

# tu peux aussi importer les fichiers avec l'interface graphique via "import dataset"



# --- ECRIRE DANS UN FICHIER ---
x<-1:10
write.table(x, "output.csv", sep=";", row.names=FALSE)  # écrit dans le fichier output.csv avec comme séparateur un ";"
ozoneR<-ozone[1:4, c("maxO3", "T9", "vent")]
# écrit dans le fichier "output.csv" l'objet ozoneR, ne mentionne pas le nom des lignes, mentionne le nom des colonnes et sépare les colonnes par un ";" 
write.table(ozoneR, "output.csv", row.names=FALSE, col.names=TRUE, quote=FALSE, sep=';')



# --- EXPORTER EN FORMAT RDS ---
x <- c("a","a","b","c")
X <- matrix(1:8,ncol=4)
y <- c(T,T,T,F,F)
z <- matrix(c("A","B","C","D"),ncol=2)
myList <- list(comp1=x,comp2=X,comp3=y,element4=z)

saveRDS(myList, "output.rds")       # stocke l'objet entier dans un fichier .rds
readMyList<-readRDS("output.rds")   # importe l'objet du fichier .rds
readMyList



# --- CONCATÉNATION DE TABLEAUX ---
# c'est possible de concaténer des tableaux de 2 façons: verticalement et horizontalement
# vertical  : juxtaposition de lignes
# horizontal: juxtaposition de colonnes

# concaténation verticale
# il faut que les matrices aient le même nombre de colonnes

X<-matrix(c(1,2,3,4), 2, 2)                 # création d'une matrice 2x2
rownames(X)<-paste("ligne", 1:2, sep="")    # modification des noms de ligne
colnames(X)<-paste("X", 1:2, sep="")        # modification des noms de colonne
X
Y<-matrix(11:16, 3, 2)                      # création d'une matrice 2x2
colnames(Y)<-paste("Y", 1:2, sep="")        # modification des noms de colonne
Y
Z<-rbind(X, Y)                              # concaténation des lignes de X et Y
Z

x <- c("A","B","C","A")
y <- 1:4
df <- data.frame(x,y)
df2 <- data.frame("C",1)
df
df2
rbind(df, df2)                              # une erreur se produit car il faut changer les noms des variables pour les distinguer dans le résultat
rbind(df, df2)                              # une erreur se produit car il faut changer les noms des variables pour les distinguer dans le résultat
df2 <- data.frame(x="C",y=1)
rbind(df, df2)

# concaténation horizontale
# il faut que les matrices aient le même nombre de lignes

df3 <- data.frame(taille=c(182,170,172,194),age=c(22,18,33,25))
cbind(df,df3)
cbind(df3,df3)

df4 <- data.frame(x=c("A","A","D"),taille=seq(180,190,by=5))
df4
merge(df, df4)
merge(df,df4,all=TRUE)


# --- GENERER DES NOMBRES ALEATOIRES ---
x<-5
rnorm(x)
dnorm(x)
set.seed(1213)



# --- IDENTIFIER LES NA ---
ozoneNA<-readRDS("ozoneNA.rds")
ozoneNA
ozR<-ozoneNA[1:4,1:7]
is.na(ozR)
which(is.na(ozR), arr.ind=TRUE)

indligneNA <- which(is.na(ozR),arr.ind=TRUE)[,1]
indligneNA
ozRsansNa <- ozR[-indligneNA,]
ozRsansNa


















