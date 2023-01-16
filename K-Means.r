# install.packages('ggplot2')
# install.packages()
library('ggplot2')
library('factoextra')

df <- data.frame(x=c(2,2,3,4,5,6,7,5,4,3), y=c(7,8,9,8,7,5,2,3,1,2))
elbow_function <- function(data,nc,seed){
    set.seed(seed)
    wss <- c()
    for(i in 2:nc){
        km <- kmeans(data,centers=i)
        wss[i] <- km$tot.withinss   #total within sum of clusters
    }
    plot(1:nc, wss,type='b')
}

dim(df)

# nc should be 1 - number of rows in data
# seed is to make sure that we get the same results for randomization
elbow_function(df,9,100)

# from elbow curve we can infer that 3 is best k
km <- kmeans(df,centers=3)
fviz_cluster(km,data=df)

# for prettier visualisation
fviz_cluster(km,df,geom=c('point'),ellipse.type='euclid')

# to view final centers
kmwithinss
km$size