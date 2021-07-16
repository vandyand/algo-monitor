# MetaTrader 5 EAs

This is a hobby project for creating a profitable currencies trading system. EAs (expert advisers) are used with the popular [MetaTrader 5](https://www.metatrader5.com/en) program. The eas generally use different period (sometimes shifted) moving averages for enter conditions. Some eas use moving averages for exiting conditions as well while others simply hold a position open for a set amount of time. 

The jupyter notebooks are for analyzing the backtest data to find profitable patterns among the backtested expert advisers. For example, one ea could be backtested over weekly periods going back a year or more and the jupyter notebook will analyze the data and try to predict profitabe strategies for one week based on the four previous weeks rolling through all the weeks. It finds profitable patterns by randomly searching over the parameter space and updating itself at each improvement. A genetic algorithm was also tried but it required too much compute power to be feasible. This system has yielded promising results but needs to be live tested further.

The AutoHotKey files are used to automate the data collection process.

In general it's very easy to find profitable strategies when backtesting but these usually don't perform well live because they've been overfitted - that is they fit themselves to the noise of the price action instead of the signal. There are several ways of minimizing this but no panacea.
