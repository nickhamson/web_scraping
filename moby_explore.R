library(tidyverse)
library(ggplot2)
library(dplyr)

df = read_csv("msd2.csv")
df <- df %>% rename(index = 1)

dfr <- df[nrow(df):1,]

dfr$Album <- as_factor(dfr$Album)


ggplot(data = dfr, aes(x=Album, y=Danceability, fill=Category)) +
  stat_boxplot(geom = "errorbar", width=0.3)+
  geom_boxplot(outlier.size=.7) +
  
  #fill colors
  scale_fill_manual(values=c("darkorange2", "red3", "dodgerblue3")) + 
  
  #sobriety line
  geom_vline(xintercept = 13.5, linetype="dashed", color = "red", size=1.1) +
  annotate(geom="text", x=13.8, y=.85,
           label="Sobriety",
           color="red",
           angle = 90) + 
  #legend formatting
  theme(legend.position = c(0.8, 0.85),
        legend.key.width = unit(.5,'cm'),
        legend.key.height = unit(.6,'cm')) +
  #modify album names
  theme(axis.text.x = element_text(angle = 30, vjust = 1.0, hjust=1)) +
  
  #axis labels
  xlab("Moby's Albums Chronologically")+
  theme(axis.title = element_text(size=12,face='bold')) + 
  
  ggtitle("Danceability in Moby's Songs by Album Category") +
  theme(plot.title = element_text(size=15,face='bold',hjust=0.5))
  
#save as a png
ggsave("plot.png", width = 12, height = 7.5)



























