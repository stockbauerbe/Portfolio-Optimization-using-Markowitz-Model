# Portfolio Optimization using Markowitz Model
Optimizing a two-asset portfolio by finding optimum risk-to-return, which produces the maximum Sharpe ratio.

## Background
### Modern Portfolio Theory (MPT)
Modern Portfolio Theory is a method for allocating funds within a portfolio in a way which maximizes potential returns, 
and a reasonable level of risk. The Markowitz Model, developed by economist Harry Markowitz, outlines one approach to determining this optimum portfolio allocation.

### The Two-Asset Markowitz Model
The two-asset Markowitz Model adapts the Sharpe Ratio to determine the optimial allocation of resources between two assets in a portfolio.[^1] This is done by calculating an adjusted *mean*, *variance*, and *standard deviation* of the portfolios returns at various fund allocations, incorporating the individual assets returns mean, variance, and standard deviation. The calculations are as follows:

Portfolio Mean Returns: $(p_1 * R_1) + (p_2 * R_2)$

Portfolio Variance of Returns: $(p_1^2 * \sigma^2_1) + (p_2^2 * \sigma^2_2) + (2*\sigma^2_1*\sigma^2_s*\sigma^2_{1,2})$

Portfolio Standard Deviation of Returns: $\sqrt{Portfolio Variance of Returns}$

Portfolio Sharpe Ratio: $(Portfolio Mean Returns - R_f) / Portfolio Standard Deviation of Returns$

Where:

$p_1 =$ Asset 1 Share (%)  

$p_2 =$ Asset 2 Share (%)

$R_1 =$ Asset 1 Mean Return

$R_2 =$ Asset 2 Mean Return

$\sigma^2_1 =$ Asset 1 Variance of Returns

$\sigma^2_2 =$ Asset 2 Variance of Returns

$\sigma^2_{1,2} =$ Asset 1 and Asset 2 Covariance of Returns

$\sigma_1 =$ Asset 1 Standard Deviation of Returns

$\sigma_2 =$ Asset 2 Standard Deviation of Returns

$R_f =$ Risk Free Rate of Returns

## Model Parameters
**VOO**: Asset 1 in our model. Vanguard S&P 500 ETF.Represents a higher-risk-higher-reward option.

**BLV**: Asset 2 in our model. Vanguard Long-Term Bond Index Fund ETF. Represents a lower-risk-lower-reward option.

**Risk Free Rate**: The T-bill rate in 2011 (.2%) is used as our risk free rate of return.

[^1]: The Sharpe Ratio, developed by economist William F. Sharpe, is a way to represent the value of the return of a stock given its risk. The higher the Sharpe Ratio, the better the investment option.The formula for the 
Sharpe Ratio is $(\bar{x} - R_f)/\sigma_x$ where $\bar{x}$ is the mean return of the investment over a period of time, $R-f$ is the "risk free" rate of return using that same period of time (usually measured with the T-bill rate of return), and $\sigma_1$ is the standard deviation of the returns of that investment over the period of time.
