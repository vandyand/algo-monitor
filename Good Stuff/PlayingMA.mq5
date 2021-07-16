
#include<Trade\Trade.mqh>

CTrade trade;

input int ma_period1 = 0;
input int ma_period2 = 1;
input int ma_period3 = 0;
input int ma_period4 = 1;
//input int signalBars = 3;
//int openBars = signalBars;
input int openBars = 3;
//input double drawDown = 0.9995;
//input datetime splitDate;


bool EquityCrunch = false;
bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;
bool stopTrading = false;

int tickNum = 0;
int closeTick = 0;

double Lots = 0.01;

int maHandle1;
int maHandle2;
int maHandle3;
int maHandle4;
double mas1[1];
double mas2[1];
double mas3[1];
double mas4[1];

int OnInit(){

   maHandle1 = iMA(_Symbol,_Period,ma_period1,0,MODE_SMA,PRICE_OPEN);
   maHandle2 = iMA(_Symbol,_Period,ma_period2,0,MODE_SMA,PRICE_OPEN);
   maHandle3 = iMA(_Symbol,_Period,ma_period3,0,MODE_SMA,PRICE_OPEN);
   maHandle4 = iMA(_Symbol,_Period,ma_period4,0,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{   
   tickNum++;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   //Alert("TimeCurrent: ",TimeCurrent()," splitDate: ",splitDate," Past: ",TimeCurrent() > splitDate);
   
   /*
   if(!stopTrading && TimeCurrent() > splitDate && (Equity < 1000 * drawDown || Equity < Balance * drawDown)){
      Alert("***********************************************************************");
      stopTrading = true;
      Alert("Equity: ", Equity, " Balance: ", Balance, " stopTrading: ", stopTrading);
   }
   */
   
   
   //if(Equity < Balance * 0.8){
   //   EquityCrunch = true;
   //}
   
   //double MA = iMA(_Symbol,_Period,MA_Period,0,0,0);

   
   
   /*
   
   double Open3 = iOpen(_Symbol,_Period,3);
   double Open2 = iOpen(_Symbol,_Period,2);
   double Open1 = iOpen(_Symbol,_Period,1);
   double Open = iOpen(_Symbol,_Period,0);
   //Alert("MA: ", MA);
   Alert("Open: ", Open, " Open1: ", Open1, " Open2: ", Open2);
   
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   if(Open < Open1){// && Open1 < Open2 && Open2 < Open3){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   
   if(Open > Open1){// && Open1 > Open2 && Open2 > Open3){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   */
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   
   CopyBuffer(maHandle1,0,0,1,mas1);
   CopyBuffer(maHandle2,0,0,1,mas2);
   CopyBuffer(maHandle3,0,0,1,mas3);
   CopyBuffer(maHandle4,0,0,1,mas4);
   
   double MA1 = mas1[0];
   double MA2 = mas2[0];
   double MA3 = mas3[0];
   double MA4 = mas4[0];
   
   
   if(MA1 > MA2){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   if(MA3 < MA4){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   
   /*
   LRE0 = true;
   SRE0 = true;
   for(int i = 0; i < signalBars; i++){
      if(iOpen(_Symbol,_Period,i) > iOpen(_Symbol,_Period,i+1)){
         LRE0 = false;
      }
      if(iOpen(_Symbol,_Period,i) < iOpen(_Symbol,_Period,i+1)){
         SRE0 = false;
      }
   }
   */

   if(!LRE1 && LRE0){
      LongSignal = true;
   } else {
      LongSignal = false;
   }
   
   if(!SRE1 && SRE0){
      ShortSignal = true;
   } else {
      ShortSignal = false;
   }
   
   if(PositionsTotal() < 1 && !stopTrading){
      if(LongSignal && !ShortSignal){
         trade.Buy(Lots,NULL,Ask,0,0,NULL);
         closeTick = tickNum + openBars;
      }
      if(ShortSignal && !LongSignal){
         trade.Sell(Lots,NULL,Bid,0,0,NULL);
         closeTick = tickNum + openBars;
      }
   }
   
   if(tickNum == closeTick || stopTrading){
      CloseAllPositions();
      //trade.PositionClose(PositionGetTicket(0));
   }
}

void CloseAllPositions(){
   for(int i = PositionsTotal()-1; i >= 0; i--){
      ulong ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}






//double OnTester() {
//   if(TesterStatistics(STAT_PROFIT) > 0){return(1.0);}
//   return(0.0);
//}




//+------------------------------------------------------------------+
//| Get the array of profits/losses from deals                       |
//+------------------------------------------------------------------+
bool GetTradeResultsToArray(double &pl_results[],double &volume)
  {
//--- request the complete trading history
   if(!HistorySelect(0,TimeCurrent()))
      return (false);
   uint total_deals=HistoryDealsTotal();
   volume=0;
//--- set the initial size of the array with a margin - by the number of deals in history
   ArrayResize(pl_results,total_deals);
//--- counter of deals that fix the trading result - profit or loss
   int counter=0;
   ulong ticket_history_deal=0;
//--- go through all deals
   for(uint i=0;i<total_deals;i++)
     {
      //--- select a deal 
      if((ticket_history_deal=HistoryDealGetTicket(i))>0)
        {
         ENUM_DEAL_ENTRY deal_entry  =(ENUM_DEAL_ENTRY)HistoryDealGetInteger(ticket_history_deal,DEAL_ENTRY);
         long            deal_type   =HistoryDealGetInteger(ticket_history_deal,DEAL_TYPE);
         double          deal_profit =HistoryDealGetDouble(ticket_history_deal,DEAL_PROFIT);
         double          deal_volume =HistoryDealGetDouble(ticket_history_deal,DEAL_VOLUME);
         //--- we are only interested in trading operations        
         if((deal_type!=DEAL_TYPE_BUY) && (deal_type!=DEAL_TYPE_SELL))
            continue;
         //--- only deals that fix profits/losses
         if(deal_entry!=DEAL_ENTRY_IN)
           {
            //--- write the trading result to the array and increase the counter of deals
            pl_results[counter]=deal_profit;
            volume+=deal_volume;
            counter++;
           }
        }
     }
//--- set the final size of the array
   ArrayResize(pl_results,counter);
   return (true);
  }

//+------------------------------------------------------------------+
//| Calculate the linear regression y=a*x+b                          |
//+------------------------------------------------------------------+
bool CalculateLinearRegression(double  &change[],double &chartline[],
                               double  &a_coef,double  &b_coef)
  {
//--- check for data sufficiency
   if(ArraySize(change)<3)
      return (false);
//--- create a chart array with an accumulation
   int N=ArraySize(change);
   ArrayResize(chartline,N);
   chartline[0]=change[0];
   for(int i=1;i<N;i++)
      chartline[i]=chartline[i-1]+change[i];
//--- now, calculate regression ratios
   double x=0,y=0,x2=0,xy=0;
   for(int i=0;i<N;i++)
     {
      x=x+i;
      y=y+chartline[i];
      xy=xy+i*chartline[i];
      x2=x2+i*i;
     }
   a_coef=(N*xy-x*y)/(N*x2-x*x);
   b_coef=(y-a_coef*x)/N;
//---
   return (true);
  }
//+------------------------------------------------------------------+
//|  Calculate mean-square deviation error for specified a and b     |
//+------------------------------------------------------------------+
bool  CalculateStdError(double  &data[],double  a_coef,double  b_coef,double &std_err)
  {
//--- sum of error squares
   double error=0;
   int N=ArraySize(data);
   if(N==0)
      return (false);
   for(int i=0;i<N;i++)
      error=MathPow(a_coef*i+b_coef-data[i],2);
   std_err=MathSqrt(error/(N-2));
//--- 
   return (true);
  }



//+--------------------------------------------------------------------+
//| Filling the array with test results                                |
//+--------------------------------------------------------------------+
void GetTestStatistics(double &stat_array[])
  {
  
   stat_array[0] = TesterStatistics(STAT_INITIAL_DEPOSIT);
   
   stat_array[1] = TesterStatistics(STAT_PROFIT);
   
   stat_array[2] = TesterStatistics(STAT_GROSS_PROFIT);
   stat_array[3] = TesterStatistics(STAT_GROSS_LOSS);
   stat_array[4] = TesterStatistics(STAT_MAX_PROFITTRADE);
   stat_array[5] = TesterStatistics(STAT_MAX_LOSSTRADE);
   
   stat_array[6] = TesterStatistics(STAT_CONPROFITMAX);
   stat_array[7] = TesterStatistics(STAT_CONPROFITMAX_TRADES);//int
   stat_array[8] = TesterStatistics(STAT_MAX_CONWINS);
   stat_array[9] = TesterStatistics(STAT_MAX_CONPROFIT_TRADES);//int
   stat_array[10] = TesterStatistics(STAT_CONLOSSMAX);
   stat_array[11] = TesterStatistics(STAT_CONLOSSMAX_TRADES);//int
   stat_array[12] = TesterStatistics(STAT_MAX_CONLOSSES);
   stat_array[13] = TesterStatistics(STAT_MAX_CONLOSS_TRADES);//int

   stat_array[14] = TesterStatistics(STAT_BALANCEMIN);
   stat_array[15] = TesterStatistics(STAT_BALANCE_DD);
   stat_array[16] = TesterStatistics(STAT_BALANCEDD_PERCENT);
   stat_array[17] = TesterStatistics(STAT_BALANCE_DD_RELATIVE);
   stat_array[18] = TesterStatistics(STAT_BALANCE_DDREL_PERCENT);
   
   stat_array[19] = TesterStatistics(STAT_EQUITYMIN);
   stat_array[20] = TesterStatistics(STAT_EQUITY_DD);
   stat_array[21] = TesterStatistics(STAT_EQUITYDD_PERCENT);
   stat_array[22] = TesterStatistics(STAT_EQUITY_DD_RELATIVE);
   stat_array[23] = TesterStatistics(STAT_EQUITY_DDREL_PERCENT);
   
   stat_array[24] = TesterStatistics(STAT_EXPECTED_PAYOFF);
   stat_array[25] = TesterStatistics(STAT_PROFIT_FACTOR)==DBL_MAX ? 0 : TesterStatistics(STAT_PROFIT_FACTOR);
   stat_array[26] = TesterStatistics(STAT_RECOVERY_FACTOR);
   stat_array[27] = TesterStatistics(STAT_SHARPE_RATIO);
   stat_array[28] = TesterStatistics(STAT_MIN_MARGINLEVEL)==DBL_MAX ? 0 : TesterStatistics(STAT_MIN_MARGINLEVEL);
   stat_array[29] = TesterStatistics(STAT_CUSTOM_ONTESTER);
   
   stat_array[30] = TesterStatistics(STAT_DEALS);//int
   stat_array[31] = TesterStatistics(STAT_TRADES);//int
   stat_array[32] = TesterStatistics(STAT_PROFIT_TRADES);//int
   stat_array[33] = TesterStatistics(STAT_LOSS_TRADES);//int
   stat_array[34] = TesterStatistics(STAT_SHORT_TRADES);//int
   stat_array[35] = TesterStatistics(STAT_LONG_TRADES);//int
   stat_array[36] = TesterStatistics(STAT_PROFIT_SHORTTRADES);//int
   stat_array[37] = TesterStatistics(STAT_PROFIT_LONGTRADES);//int
   stat_array[38] = TesterStatistics(STAT_PROFITTRADES_AVGCON);//int
   stat_array[39] = TesterStatistics(STAT_LOSSTRADES_AVGCON);//int  
  }






double get_score(){

   double initial_deposit = TesterStatistics(STAT_INITIAL_DEPOSIT);
   
   double profit = TesterStatistics(STAT_PROFIT);
   //if(profit <= 0){return;}
   
   double gross_profit = TesterStatistics(STAT_GROSS_PROFIT);
   double gross_loss = TesterStatistics(STAT_GROSS_LOSS);
   double max_profit_trade = TesterStatistics(STAT_MAX_PROFITTRADE);
   double max_loss_trade = TesterStatistics(STAT_MAX_LOSSTRADE);
   
   double con_profit_max = TesterStatistics(STAT_CONPROFITMAX);
   double con_profit_max_trades = TesterStatistics(STAT_CONPROFITMAX_TRADES);
   double max_con_wins = TesterStatistics(STAT_MAX_CONWINS);
   double max_con_profit_trades = TesterStatistics(STAT_MAX_CONPROFIT_TRADES);
   double con_loss_max = TesterStatistics(STAT_CONLOSSMAX);
   double con_loss_max_trades = TesterStatistics(STAT_CONLOSSMAX_TRADES);
   double max_con_losses = TesterStatistics(STAT_MAX_CONLOSSES);
   double max_con_loss_trades = TesterStatistics(STAT_MAX_CONLOSS_TRADES);

   double balance_min = TesterStatistics(STAT_BALANCEMIN);
   double balance_dd = TesterStatistics(STAT_BALANCE_DD);
   double balance_dd_percent = TesterStatistics(STAT_BALANCEDD_PERCENT);
   double balance_dd_relative = TesterStatistics(STAT_BALANCE_DD_RELATIVE);
   double balance_drel_percent = TesterStatistics(STAT_BALANCE_DDREL_PERCENT);
   
   double equity_min = TesterStatistics(STAT_EQUITYMIN);
   double equity_dd = TesterStatistics(STAT_EQUITY_DD);
   double equity_dd_percent = TesterStatistics(STAT_EQUITYDD_PERCENT);
   double equity_dd_relative = TesterStatistics(STAT_EQUITY_DD_RELATIVE);
   double equity_drel_percent = TesterStatistics(STAT_EQUITY_DDREL_PERCENT);
   
   double expected_payoff = TesterStatistics(STAT_EXPECTED_PAYOFF);
   double profit_factor = TesterStatistics(STAT_PROFIT_FACTOR);
   double recovery_factor = TesterStatistics(STAT_RECOVERY_FACTOR);
   double sharpe_ratio = TesterStatistics(STAT_SHARPE_RATIO);
   double min_margin_level = TesterStatistics(STAT_MIN_MARGINLEVEL);
   double custom_on_tester = TesterStatistics(STAT_CUSTOM_ONTESTER);
   
   double deals = TesterStatistics(STAT_DEALS);
   double trades = TesterStatistics(STAT_TRADES);
   double profit_trades = TesterStatistics(STAT_PROFIT_TRADES);
   double loss_trades = TesterStatistics(STAT_LOSS_TRADES);
   double short_trades = TesterStatistics(STAT_SHORT_TRADES);
   double long_trades = TesterStatistics(STAT_LONG_TRADES);
   double profit_short_trades = TesterStatistics(STAT_PROFIT_SHORTTRADES);
   double profit_long_trades = TesterStatistics(STAT_PROFIT_LONGTRADES);
   double profit_trades_avg_con = TesterStatistics(STAT_PROFITTRADES_AVGCON);
   double loss_trades_avg_con = TesterStatistics(STAT_LOSSTRADES_AVGCON);


   //************************************************************************
   // GETTING REGRESSION SCORE regression, log_regression
   //************************************************************************
   

//--- custom criterion optimization value (the higher, the better)
   double regression=0.0;
//--- get trade results to the array
   double array[];
   double trades_volume;
   GetTradeResultsToArray(array,trades_volume);
   int trades_arr=ArraySize(array);
//--- if there are less than 10 trades, test yields no positive results
//   if(trades_arr<10)
//      return (0);
//--- average result per trade
   double average_pl=0;
   for(int i=0;i<ArraySize(array);i++)
      average_pl+=array[i];
   average_pl = trades_arr != 0 ? average_pl / trades_arr : 0;
//--- display the message for the single-test mode
   if(MQLInfoInteger(MQL_TESTER) && !MQLInfoInteger(MQL_OPTIMIZATION))
      PrintFormat("%s: Trades=%d, Average profit=%.2f",__FUNCTION__,trades_arr,average_pl);
//--- calculate linear regression ratios for the profit graph
   double a,b,std_error;
   double chart[];
   if(!CalculateLinearRegression(array,chart,a,b))
      Alert("Calculate Linear Regression function Faulted!!!******************************");
      //return (0);
//--- calculate the error of the chart deviation from the regression line
   if(!CalculateStdError(chart,a,b,std_error))
      Alert("Calculate Standard Error function Faulted!!!********************************");
      //return (0);
//--- calculate the ratio of trend profits to the standard deviation
   regression=std_error > 0 ? a*trades_arr/std_error : 0;


   //************************************************************************
   // GETTING SYSTEM QUALITY NUMBER sqn
   //************************************************************************

   double win_pct = trades > 0 ? profit_trades / trades : 0;
	double loss_pct = trades > 0 ? loss_trades / trades : 0;
	
	double avg_win = profit_trades > 0 ? gross_profit / profit_trades : 0;
	double avg_loss = loss_trades > 0 ? gross_loss / loss_trades : 0;
	
	double expectancy = (win_pct * avg_win) - (loss_pct * (-1 * avg_loss));
	
	double avg_trade = trades > 0 ? profit / trades : 0;
	
	double sumsqrs = 0.0;
	
   datetime from_date = D'1970.01.01';
   datetime to_date = D'2030.01.01';
   HistorySelect(from_date,to_date);
	Alert("HistoryDealsTotal(): ",HistoryDealsTotal(),"*********************************");
	
	for(int i = 2;i<HistoryDealsTotal(); i+=2) {
      double profit_ = HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
      sumsqrs += MathPow(profit_ - avg_trade,2);
      Alert("profit: ",profit_," sumsqrs: ",sumsqrs);
   }
   
   double st_dev = MathPow(sumsqrs,0.5);
		
	double sqn = st_dev > 0 ? sqrt(trades) * expectancy / st_dev : 0;
	
	sqn = sqn < 1000000 ? sqn : 0;
	
	regression = regression > 0 ? regression : 0;
	regression = regression < 1000000 ? regression : 0;
	
	//-------------------------------------------
	// ranges:
	// expectancy: +/- ~5 with profit
	// sqn:        +5/-100
	// regression: +exponential/0 Can be positive for negative profit if equity line is straightish
	// sharpe_ratio: +/- exponential with profit
	// profit_factor: +/- with profit
	// profit: +/-
	// gross_loss: 0/- lots
	// expected_payoff: +/- with profit
	// drawdown_pct: +/0
	//---------------------------------------------
	
	
	double scaled_drawdown = ((equity_dd_percent * -1.0) + 10.0) / 20.0;
	scaled_drawdown = scaled_drawdown > 0 ? scaled_drawdown < 1 ? scaled_drawdown : 1 : 0;
	
	double scaled_sharpe = (sharpe_ratio + 1.0)/2.0;
	scaled_sharpe = scaled_sharpe > 0 ? scaled_sharpe < 1 ? scaled_sharpe : 1 : 0;
	
	double scaled_expectancy = (expectancy + 5.0)/10.0;
	scaled_expectancy = scaled_expectancy > 0 ? scaled_expectancy < 1 ? scaled_expectancy : 1 : 0;
	
	double scaled_regression = (regression + 1000.0)/2000.0;
	scaled_regression = scaled_regression > 0 ? scaled_regression < 1 ? scaled_regression : 1 : 0;

	double scaled_gross_loss = (gross_loss + 100.0)/200.0;
	scaled_gross_loss = scaled_gross_loss > 0 ? scaled_gross_loss < 1 ? scaled_gross_loss : 1 : 0;
	
	double useful_loss = gross_loss < 0 ? gross_loss > -50 ? 50 + gross_loss : 0 : 0;
	
	double rtn = scaled_sharpe + scaled_expectancy + scaled_regression + scaled_drawdown;
	//double rtn = 1.0;
	//double rtn = useful_loss * expectancy * expected_payoff * sharpe_ratio * regression;
	//double rtn = 50 + profit;
	//double rtn = profit > 0 ? (initial_deposit + profit) * (10000 + trades) * (1000 + MathSqrt(sharpe_ratio)) * (1000000 + regression) / 1e16: 0;
	//double rtn = sqn;
   //double rtn = expectancy;
   //double rtn = (expectancy * sqn * regression * sharpe_ratio);
   //double rtn = regression;
   //double rtn = regression * sqn;
   //double rtn = regression * sqn;// * (profit+initial_deposit) * sharpe_ratio * trades;
   //double rtn = regression * sqn * sharpe_ratio;
   //double rtn = gross_loss > 0 ? regression * sqn / gross_loss: 0;
   //double rtn = gross_loss > 0 ? regression * sqn * sharpe_ratio * profit * profit_factor * expected_payoff * recovery_factor / gross_loss / loss_pct / loss_trades: 0;
   //double rtn = gross_loss > 0 ? regression * sqn * sharpe_ratio * profit * expected_payoff / gross_loss: 0;
   
   int arg = ma_period1 + ma_period2 + ma_period3 + ma_period4 + openBars;
   
   double _max = 1.0;
   double _min = 0.0;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;
   

   rtn += (1 * rand_scaled);
   
   //rtn *= (scaled_sharpe * scaled_expectancy * scaled_regression * scaled_gross_loss);
   
   if(trades < 2){return(rtn * 0.1);}
   
   return(rtn);
}

double OnTester(){
   return(get_score());
}