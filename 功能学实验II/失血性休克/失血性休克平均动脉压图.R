#家兔失血性休克平均动脉血压图标绘制
library(ggplot2)
library(readxl)
# Sample data
dat=read_excel('~/OneDrive/课程/2024春/功能学实验/休克/休克血压数据.xlsx',col_names = T)
dat=as.data.frame(dat)
dat$操作=factor(dat$操作,levels = dat$操作)
# Plot mean pressure curve with top indicating systolic and bottom indicating diastolic pressure
p1=ggplot(dat, aes(x = 操作, y = 平均动脉压)) +
  geom_line(aes(group = 1),color = "grey") + # Mean pressure curve
  geom_ribbon(aes(ymin = 舒张压, ymax = 收缩压,group=1), alpha = 0.3, fill = "green") + 
  geom_point(color = "black",size=3) + # Mean pressure curve
  # Area indicating systolic pressure
  labs(x = "操作", y = "平均动脉压(mmHg)", title = "家兔平均动脉压变化曲线") +
  theme_minimal()
ggsave(filename = 'Desktop/BP.png',plot = p1,width = 10,height = 10)
