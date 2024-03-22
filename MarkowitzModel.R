# R Script for building two-asset Markowitz Portfolio Optimization Model. To learn more about the Markowitze 
# Portfolio Optimization Model, please see the README.md file

# Load Libraries
library(tidyverse)
library(readxl)
library(stats)
library(here)
library(ggplot2)
library(ggthemes)

# Load data
fpath = here("Stocks vs Bonds.xlsx")
stocks = read_xlsx(path = fpath,
                   sheet = "VOO")
bonds = read_xlsx(path = fpath,
                  sheet = "BLV")

# Create (monthly) returns column
stocks$return = (stocks$`Adj Close` - dplyr::lag(stocks$`Adj Close`, n=1)) / dplyr::lag(stocks$`Adj Close`, n=1)

bonds$return = (bonds$`Adj Close` - dplyr::lag(bonds$`Adj Close`, n=1)) / dplyr::lag(bonds$`Adj Close`, n=1)

# Calculating vars: Mean, Variance, Standard Deviation, Sharpe Ratio, Covariance, Correlation
stocks.mean = mean(stocks$return[-1])
bonds.mean = mean(bonds$return[-1])

stocks.variance = var(stocks$return[-1])
bonds.variance = var(bonds$return[-1])

stocks.stdev = sqrt(stocks.variance)
bonds.stdev = sqrt(stocks.variance)

risk.free.rate = .002

stocks.sharpe = (stocks.mean-risk.free.rate) / stocks.stdev
bonds.sharpe = (bonds.mean-risk.free.rate) / bonds.stdev

covar = cov(stocks$return[-1],bonds$return[-1])
correl = cor(stocks$return[-1],bonds$return[-1])

# Deveoping Markowitz Model
model = data.frame("VOO" = c(0:100), "BLV" = c(100:0))

for(row in 1:101){
  model$VOO[row] = model$VOO[row]*.01
  model$BLV[row] = model$BLV[row]*.01
}

model$mean = (model$VOO*stocks.mean) + (model$BLV * bonds.mean)
model$var = (model$VOO^2*stocks.variance) + (model$BLV^2*bonds.variance) + (2*model$VOO*model$BLV*covar)
model$stdev = sqrt(model$var)
model$sharpe = (model$mean-risk.free.rate) / model$stdev

sharpe.optimum = max(model$sharpe)
sharpe.optimum.stdev = model$stdev[model$sharpe == sharpe.optimum]
sharpe.optimum.mean = model$mean[model$sharpe == sharpe.optimum]
stock = model$VOO[model$sharpe == sharpe.optimum]
bond = model$BLV[model$sharpe == sharpe.optimum]

# Visualizing results
optimization.plot = ggplot(model, aes(x = stdev*100, y = mean*100, color = sharpe)) +
  geom_point() +
  scale_color_continuous() +
  geom_vline(xintercept = sharpe.optimum.stdev*100, linetype = 2, color = 2) +
  geom_hline(yintercept = sharpe.optimum.mean*100, linetype = 2, color = 2) +
  labs(title = "Two-Asset Markowitz Portfolio Optimization Model",
       subtitle = paste("Sharpe Ratio Maxing Portfolio: ",stock*100,"% VOO / ",bond*100,"% BLV",sep=""),
       caption = paste("Maximized Sharpe Ratio:",sharpe.optimum,sep=" ")) +
  xlab("Risk (Variation %)") +
  ylab("Reward (Return %)") +
  theme_stata()

optimization.plot
