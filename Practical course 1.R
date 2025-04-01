library(readxl)
library(ggpmisc)

data <- read_excel("Data/Practical course 1.xlsx")

library(ggplot2)

colnames(data)

ggplot(data, aes(x = Total_cells, y = Dry_Weight, color = Sample)) + #In Excel, names should use _ instead of spaces
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  stat_poly_eq(
    aes(label = after_stat(paste(eq.label, rr.label, sep = "~~~~"))),
    formula = y ~ x,
    parse = TRUE,
    output.type = "expression", # Show regression equation and R² in math format (e.g. 5.23 × 10⁷)
    size = 4
  )+
  scale_x_continuous(labels = scales::label_scientific(digits = 2)) +
  labs(
    title = expression(
      "Linear regression of dry weight against total cell number for "
      *italic("Chlamydomonas reinhardtii")*" (K1) and "*italic("Thalassiosira pseudonana")*" (K9)"),
    x = "Total cells",
    y = "Dry weight (g)"
  ) 

ggsave("Practical course 1.png", width = 12, height = 6, dpi = 300, type = "cairo-png")
