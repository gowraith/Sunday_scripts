#This is a script to explore the gapminder dataset using R
#Ernest Alba
#ealba@alum.mit.edu
#April 19th, 2015

#read in data as tab delimited

install.packages("dplyr",dependencies=TRUE)
#Load dplyr library into working environment
library("dplyr")


gap.in<-read.table("output/combined_gapMinder.tsv", sep = "\t", header = TRUE)

for (row.number in 1:10){
  for (col.number in 1:5){
    print(gap.in[row.number, col.number])
  }
}
#comment

gap.in[1:10,1:5]

add.me<-function(x,y){
  x+y*8
}

add.me(3,4)

gap.in %>%
  filter(country == "China") %>%
  select(country, year, pop) %>%
  group_by(country) %>%
  summarize(min=min(pop))

# Challenge
# Calculate mean population per continent per year across all years prior to 1998 but not including 1990

gap.in %>%
  filter(year<"1990")%>%
  select(pop,continent,year)%>%
  group_by(continent,year)%>%
  summarize(mean(pop)) -> data.out
  
  attach(iris)
  
# install.packages('tidyr', dependencies =TRUE)
library("tidyr")

# gather iris
iris.long<-gather(iris,"Measurement","Value",1:4)