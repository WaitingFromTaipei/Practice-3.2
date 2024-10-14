plants <- c("plant1", "plant2", "plant3", "plant4", "plant5")
start_experiment <- c(4, 5, 3, 6, 7)
end_experiment <- c(9, 6, 5, 4, 7)
dat    <- data.frame(plants, start_experiment, end_experiment)
dat

library(tidyr)
dat.reformat <- dat %>% pivot_longer(cols = -1, 
                                     names_to = "time", values_to = "height")
as.factor(dat.reformat$time) 
# I'm not sure the way to transform characters in a single column of a data frame into factors...
dat.reformat

growth <- list(a = dat[,1],
               b = ((end_experiment-start_experiment)/start_experiment),
               c = data.frame(plant = dat[,1], 
                              growth = ((end_experiment-start_experiment)/start_experiment)))
growth

my.experiment <- list(x = dat.reformat, y = growth)
my.experiment