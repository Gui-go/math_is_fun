




library(ggplot2)

options(repr.plot.width = 4, repr.plot.height = 4)


#1
# Create circle data to plot
t <- seq(0, 2*pi, length.out = 50)
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Make a scatter plot of points in a circle
p <- ggplot(df, aes(x, y))
p + geom_point()

#2
points <- 500
angle <- pi*(3-sqrt(5))
t <- (1:points) * angle
x <- sin(t)
y <-cos(t)
df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))
p + geom_point()+theme_minimal()

#3
p <- ggplot(df, aes(x*t, y*t))
p + geom_point() +
  geom_point()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        axis.line = element_blank(), 
        plot.title = element_blank(),
        legend.position = "none")

#4
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size=8, alpha=0.5, color="darkgreen") +
  theme_void()

#5
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=0.5, shape=8) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        axis.line = element_blank(), 
        plot.title = element_blank(),
        legend.position = "none")


#6
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=0.5, shape=17, color="yellow") +
  theme(axis.title = element_blank(),
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        axis.line = element_blank(), 
        plot.title = element_blank(),
        legend.position = "none",
        panel.background = element_rect(fill="darkmagenta"))

#7
# Change the value of the angle
angle <- 2
points <- 1000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

p <- ggplot(df, aes(x*t, y*t))
p + geom_point(aes(size=t), alpha=0.5, shape=17, color="yellow") +
  theme(axis.title = element_blank(),
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        axis.line = element_blank(), 
        plot.title = element_blank(),
        legend.position = "none",
        panel.background = element_rect(fill="darkmagenta"))

#8
# Change the values of angle and points
angle <- 13*pi/180
points <- 2000

t <- (1:points)*angle
x <- sin(t)
y <- cos(t)
df <- data.frame(t, x, y)

# Adjust the plot parameters to create the magenta flower
p <- ggplot(df, aes(x*t, y*t))
p + geom_point(size = 80, alpha = 0.1, shape = 1, color = "magenta4")+
  theme(legend.position="none",
        panel.background = element_rect(fill = "white"),
        panel.grid=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        axis.text=element_blank())

