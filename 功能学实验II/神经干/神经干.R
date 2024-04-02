library(ggplot2)
library(readxl)
# Sample data
dat=read_excel('~/OneDrive/课程/2024春/功能学实验/神经干/不应期数据.xlsx',col_names = T)
dat=as.data.frame(dat)
dat$`刺激间隔（ms）`=factor(dat$`刺激间隔（ms）`,levels = dat$`刺激间隔（ms）`)
#figure1 B
p1=ggplot(dat,aes(x=`刺激间隔（ms）`,y=`第2对电极动作电位幅度（mV）`,group=1))+
  geom_line(color='grey',size=1)+
  geom_point(color='blue',size=2)+
  geom_hline(yintercept = 2,color='red',size=1)+
  theme_minimal()
ggsave(filename = 'OneDrive/课程/2024春/功能学实验/功能学实验II/神经干/refractory.png',plot = p1,width = 10,height = 10)
#figure1 C
dat2=read_excel('~/OneDrive/课程/2024春/功能学实验/神经干/刺激强度数据.xlsx',col_names = T)
dat2=as.data.frame(dat2)
dat2$`刺激时长（ms）`=factor(dat2$`刺激时长（ms）`,levels = dat2$`刺激时长（ms）`)
p2=ggplot(dat2,aes(x=`刺激时长（ms）`,y=`刺激电压（V）`,group=1))+
  geom_smooth(color='black',method = 'loess',size=2)+
  scale_y_continuous(limits = c(0.1,0.6))+
  geom_point(color='red',size=3)+
  ggtitle("刺激强度-时间曲线") +  # Add title
  theme(plot.title = element_text(hjust = 0.5)) 
ggsave(filename = 'OneDrive/课程/2024春/功能学实验/功能学实验II/神经干/刺激强度-时间曲线.png',plot = p2,width = 10,height = 10)
