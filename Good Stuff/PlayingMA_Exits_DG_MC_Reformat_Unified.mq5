
#include<Trade\Trade.mqh>

CTrade trade;
//input datetime splitDate;

input int ma_period1_1 = 2;
input int ma_period1_2 = 4;
input int ma_period1_3 = 2;
input int ma_period1_4 = 4;
input int ma_period1_5 = 2;
input int ma_period1_6 = 4;
input int ma_period1_7 = 2;
input int ma_period1_8 = 4;
//input int lead_symbol_num = 0;


//input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
//input string file_name = "temp";
int input MagicNumber = 400;
double input Lots = 0.01;

int slippage = 100;
int barNum = 0;
double stat_values[100]; // Array for testing parameters
bool stopTrading = false;

#define N 21
string symbols[N] = {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD",
                     "EURJPY","EURGBP","AUDJPY","NZDJPY","CHFJPY","EURCHF","GBPJPY",
                     "AUDCAD","EURCAD","AUDCHF","CADJPY","CADCHF","EURAUD","GBPCAD"};

bool longPosX_[N], shortPosX_[N], 
   EnterLongSignalX_[N],ExitLongSignalX_[N], EnterShortSignalX_[N], ExitShortSignalX_[N],
   EntLREX_0[N], EntLREX_1[N], ExtLREX_0[N], ExtLREX_1[N],
   EntSREX_0[N], EntSREX_1[N], ExtSREX_0[N], ExtSREX_1[N];

int magicX_[];


int maHandleX_1[N];
int maHandleX_2[N];
int maHandleX_3[N];
int maHandleX_4[N];
int maHandleX_5[N];
int maHandleX_6[N];
int maHandleX_7[N];
int maHandleX_8[N];
double maBufferX_1[N][1];
double maBufferX_2[N][1];
double maBufferX_3[N][1];
double maBufferX_4[N][1];
double maBufferX_5[N][1];
double maBufferX_6[N][1];
double maBufferX_7[N][1];
double maBufferX_8[N][1];
/*
int ma_periodX_1[N] = {ma_period1_1,ma_period2_1,ma_period3_1,ma_period4_1,ma_period5_1,ma_period6_1,ma_period7_1,ma_period8_1,ma_period9_1,ma_period10_1,
ma_period11_1,ma_period12_1,ma_period13_1,ma_period14_1,ma_period15_1,ma_period16_1,ma_period17_1,ma_period18_1,ma_period19_1,ma_period20_1};
int ma_periodX_2[N] = {ma_period1_2,ma_period2_2,ma_period3_2,ma_period4_2,ma_period5_2,ma_period6_2,ma_period7_2,ma_period8_2,ma_period9_2,ma_period10_2,
ma_period11_2,ma_period12_2,ma_period13_2,ma_period14_2,ma_period15_2,ma_period16_2,ma_period17_2,ma_period18_2,ma_period19_2,ma_period20_2};
int ma_periodX_3[N] = {ma_period1_3,ma_period2_3,ma_period3_3,ma_period4_3,ma_period5_3,ma_period6_3,ma_period7_3,ma_period8_3,ma_period9_3,ma_period10_3,
ma_period11_3,ma_period12_3,ma_period13_3,ma_period14_3,ma_period15_3,ma_period16_3,ma_period17_3,ma_period18_3,ma_period19_3,ma_period20_3};
int ma_periodX_4[N] = {ma_period1_4,ma_period2_4,ma_period3_4,ma_period4_4,ma_period5_4,ma_period6_4,ma_period7_4,ma_period8_4,ma_period9_4,ma_period10_4,
ma_period11_4,ma_period12_4,ma_period13_4,ma_period14_4,ma_period15_4,ma_period16_4,ma_period17_4,ma_period18_4,ma_period19_4,ma_period20_4};
int ma_periodX_5[N] = {ma_period1_5,ma_period2_5,ma_period3_5,ma_period4_5,ma_period5_5,ma_period6_5,ma_period7_5,ma_period8_5,ma_period9_5,ma_period10_5,
ma_period11_5,ma_period12_5,ma_period13_5,ma_period14_5,ma_period15_5,ma_period16_5,ma_period17_5,ma_period18_5,ma_period19_5,ma_period20_5};
int ma_periodX_6[N] = {ma_period1_6,ma_period2_6,ma_period3_6,ma_period4_6,ma_period5_6,ma_period6_6,ma_period7_6,ma_period8_6,ma_period9_6,ma_period10_6,
ma_period11_6,ma_period12_6,ma_period13_6,ma_period14_6,ma_period15_6,ma_period16_6,ma_period17_6,ma_period18_6,ma_period19_6,ma_period20_6};
int ma_periodX_7[N] = {ma_period1_7,ma_period2_7,ma_period3_7,ma_period4_7,ma_period5_7,ma_period6_7,ma_period7_7,ma_period8_7,ma_period9_7,ma_period10_7,
ma_period11_7,ma_period12_7,ma_period13_7,ma_period14_7,ma_period15_7,ma_period16_7,ma_period17_7,ma_period18_7,ma_period19_7,ma_period20_7};
int ma_periodX_8[N] = {ma_period1_8,ma_period2_8,ma_period3_8,ma_period4_8,ma_period5_8,ma_period6_8,ma_period7_8,ma_period8_8,ma_period9_8,ma_period10_8,
ma_period11_8,ma_period12_8,ma_period13_8,ma_period14_8,ma_period15_8,ma_period16_8,ma_period17_8,ma_period18_8,ma_period19_8,ma_period20_8};
*/
int OnInit(){

   for(int i = 0; i<N; i++){
      ArrayResize(magicX_,i+1);
      magicX_[i] = int(MagicNumber * (i+1));
   }
   
   for(int i = 0; i < N; i++){
   maHandleX_1[i] = iMA(symbols[i],_Period,ma_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandleX_2[i] = iMA(symbols[i],_Period,ma_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandleX_3[i] = iMA(symbols[i],_Period,ma_period1_3,0,MODE_SMA,PRICE_OPEN);
   maHandleX_4[i] = iMA(symbols[i],_Period,ma_period1_4,0,MODE_SMA,PRICE_OPEN);
   maHandleX_5[i] = iMA(symbols[i],_Period,ma_period1_5,0,MODE_SMA,PRICE_OPEN);
   maHandleX_6[i] = iMA(symbols[i],_Period,ma_period1_6,0,MODE_SMA,PRICE_OPEN);
   maHandleX_7[i] = iMA(symbols[i],_Period,ma_period1_7,0,MODE_SMA,PRICE_OPEN);
   maHandleX_8[i] = iMA(symbols[i],_Period,ma_period1_8,0,MODE_SMA,PRICE_OPEN);
   }
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{  

   if(Find_New_Bar()){
      barNum++;
      
      for(int i = 0; i < N; i++){
      
         EntLREX_1[i] = EntLREX_0[i];
         ExtLREX_1[i] = ExtLREX_0[i];
         EntSREX_1[i] = EntSREX_0[i];
         ExtSREX_1[i] = ExtSREX_0[i];
         
         double maBuffer1[1] = {maBufferX_1[i][0]};
         double maBuffer2[1] = {maBufferX_2[i][0]};
         double maBuffer3[1] = {maBufferX_3[i][0]};
         double maBuffer4[1] = {maBufferX_4[i][0]};
         double maBuffer5[1] = {maBufferX_5[i][0]};
         double maBuffer6[1] = {maBufferX_6[i][0]};
         double maBuffer7[1] = {maBufferX_7[i][0]};
         double maBuffer8[1] = {maBufferX_8[i][0]};
         
         CopyBuffer(maHandleX_1[i],0,0,1,maBuffer1);
         CopyBuffer(maHandleX_2[i],0,0,1,maBuffer2);
         CopyBuffer(maHandleX_3[i],0,0,1,maBuffer3);
         CopyBuffer(maHandleX_4[i],0,0,1,maBuffer4);
         CopyBuffer(maHandleX_5[i],0,0,1,maBuffer5);
         CopyBuffer(maHandleX_6[i],0,0,1,maBuffer6);
         CopyBuffer(maHandleX_7[i],0,0,1,maBuffer7);
         CopyBuffer(maHandleX_8[i],0,0,1,maBuffer8);
         
         double MA1 = maBuffer1[0];
         double MA2 = maBuffer2[0];
         double MA3 = maBuffer3[0];
         double MA4 = maBuffer4[0];
         double MA5 = maBuffer5[0];
         double MA6 = maBuffer6[0];
         double MA7 = maBuffer7[0];
         double MA8 = maBuffer8[0];
         
         if(MA1 > MA2){EntLREX_0[i] = true;} else {EntLREX_0[i] = false;}
         if(MA3 < MA4){ExtLREX_0[i] = true;} else {ExtLREX_0[i] = false;}
         if(MA5 > MA6){EntSREX_0[i] = true;} else {EntSREX_0[i] = false;}
         if(MA7 < MA8){ExtSREX_0[i] = true;} else {ExtSREX_0[i] = false;}
         
         if(!EntLREX_1[i] && EntLREX_0[i]){EnterLongSignalX_[i] = true;} else {EnterLongSignalX_[i] = false;}
         if(!ExtLREX_1[i] && ExtLREX_0[i]){ExitLongSignalX_[i] = true;} else {ExitLongSignalX_[i] = false;}
         if(!EntSREX_1[i] && EntSREX_0[i]){EnterShortSignalX_[i] = true;} else {EnterShortSignalX_[i] = false;}
         if(!ExtSREX_1[i] && ExtSREX_0[i]){ExitShortSignalX_[i] = true;} else {ExitShortSignalX_[i] = false;}
         
         if((longPosX_[i] && ExitLongSignalX_[i]) || (shortPosX_[i] && ExitShortSignalX_[i])){
            CloseRecentPosition(magicX_[i]);
            //while(!CloseRecentPosition(symbols[0])){Sleep(100);}
            longPosX_[i] = false;
            shortPosX_[i] = false;
         }
         
         if(CurrentOpenPositions(magicX_[i]) < 1){
            if(EnterLongSignalX_[i] && !EnterShortSignalX_[i] && !ExitLongSignalX_[i]){
               if(!BuyAsync(Lots,magicX_[i],symbols[i])){Alert("Error entering long ",symbols[i],". Last error: ",GetLastError());}
               //while(!BuyAsync(Lots,symbols[0])){Sleep(100);}
               longPosX_[i] = true;
            }
            if(EnterShortSignalX_[i] && !EnterLongSignalX_[i] && !ExitShortSignalX_[i]){
               if(!SellAsync(Lots,magicX_[i],symbols[i])){Alert("Error entering short ",symbols[i],". Last error: ",GetLastError());}
               //while(!SellAsync(Lots,symbols[0])){Sleep(100);}
               shortPosX_[i] = true;
            }
         }
      }
      
      
      
      
      
      
      
      
/* 
      EntLRE2_1 = EntLRE2_0;
      ExtLRE2_1 = ExtLRE2_0;
      EntSRE2_1 = EntSRE2_0;
      ExtSRE2_1 = ExtSRE2_0;
      
      CopyBuffer(maHandle2_1,0,0,1,mas2_1);
      CopyBuffer(maHandle2_2,0,0,1,mas2_2);
      CopyBuffer(maHandle2_3,0,0,1,mas2_3);
      CopyBuffer(maHandle2_4,0,0,1,mas2_4);
      CopyBuffer(maHandle2_5,0,0,1,mas2_5);
      CopyBuffer(maHandle2_6,0,0,1,mas2_6);
      CopyBuffer(maHandle2_7,0,0,1,mas2_7);
      CopyBuffer(maHandle2_8,0,0,1,mas2_8);
      
      double MA2_1 = mas2_1[0];
      double MA2_2 = mas2_2[0];
      double MA2_3 = mas2_3[0];
      double MA2_4 = mas2_4[0];
      double MA2_5 = mas2_5[0];
      double MA2_6 = mas2_6[0];
      double MA2_7 = mas2_7[0];
      double MA2_8 = mas2_8[0];
      
      if(MA2_1 > MA2_2){EntLRE2_0 = true;} else {EntLRE2_0 = false;}
      if(MA2_3 < MA2_4){ExtLRE2_0 = true;} else {ExtLRE2_0 = false;}
      if(MA2_5 > MA2_6){EntSRE2_0 = true;} else {EntSRE2_0 = false;}
      if(MA2_7 < MA2_8){ExtSRE2_0 = true;} else {ExtSRE2_0 = false;}
      
      if(!EntLRE2_1 && EntLRE2_0){EnterLongSignal2_ = true;} else {EnterLongSignal2_ = false;}
      if(!ExtLRE2_1 && ExtLRE2_0){ExitLongSignal2_ = true;} else {ExitLongSignal2_ = false;}
      if(!EntSRE2_1 && EntSRE2_0){EnterShortSignal2_ = true;} else {EnterShortSignal2_ = false;}
      if(!ExtSRE2_1 && ExtSRE2_0){ExitShortSignal2_ = true;} else {ExitShortSignal2_ = false;}
      
      if((longPos2_ && ExitLongSignal2_) || (shortPos2_ && ExitShortSignal2_)){
         CloseRecentPosition(magic2_);
         //while(!CloseRecentPosition(symbols[1])){Sleep(100);}
         longPos2_ = false;
         shortPos2_ = false;
      }
      
      if(CurrentOpenPositions(magic2_) < 1){
         if(EnterLongSignal2_ && !EnterShortSignal2_ && !ExitLongSignal2_){
            if(!BuyAsync(Lots,magic2_,symbols[1])){Alert("Error entering long ",symbols[1],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[1])){Sleep(100);}
            longPos2_ = true;
         }
         if(EnterShortSignal2_ && !EnterLongSignal2_ && !ExitShortSignal2_){
            if(!SellAsync(Lots,magic2_,symbols[1])){Alert("Error entering short ",symbols[1],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[1])){Sleep(100);}
            shortPos2_ = true;
         }
      }
*/     
   }
}








bool BuyAsync(double volume, int magicNum, string symbol){
   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.magic       =magicNum;
   req.symbol      =symbol;
   req.volume      =volume;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_ASK);
   req.deviation   =slippage;
   req.type        =ORDER_TYPE_BUY;
   req.type_filling=ORDER_FILLING_RETURN;
   req.type_time   =ORDER_TIME_GTC;
   req.comment     ="Buy using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool SellAsync(double volume, int magicNum, string symbol){
   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.symbol      =symbol;
   req.magic       =magicNum;
   req.volume      =volume;
   req.type        =ORDER_TYPE_SELL;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_BID);
   req.deviation   =slippage;
   req.comment     ="Sell using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool CloseRecentPosition(int magicNum)
  {
   MqlTradeRequest req;
   MqlTradeResult  res;
   int total=PositionsTotal(); // number of open positions
   for(int i=total-1; i>=0; i--)
     {
      ulong  position_ticket=PositionGetTicket(i);                                      // ticket of the position
      string position_symbol=PositionGetString(POSITION_SYMBOL);                        // symbol 
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS);              // number of decimal places
      ulong  magic=PositionGetInteger(POSITION_MAGIC);                                  // MagicNumber of the position
      double volume=PositionGetDouble(POSITION_VOLUME);                                 // volume of the position
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);    // type of the position
      if(magic==magicNum)
        {
         ZeroMemory(req);
         ZeroMemory(res);
         req.action   =TRADE_ACTION_DEAL;        // type of trade operation
         req.position =position_ticket;          // ticket of the position
         req.symbol   =position_symbol;          // symbol 
         req.volume   =volume;                   // volume of the position
         req.deviation=slippage;                        // allowed deviation from the price
         req.magic    =MagicNumber;             // MagicNumber of the position
         if(type==POSITION_TYPE_BUY)
           {
            req.price=SymbolInfoDouble(position_symbol,SYMBOL_BID);
            req.type =ORDER_TYPE_SELL;
           }
         else
           {
            req.price=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
            req.type =ORDER_TYPE_BUY;
           }
         return(OrderSendAsync(req,res));
      }
   }
   return(false);
}


int CurrentOpenPositions(int magic_number)
  {
   int count = 0;
   int total=PositionsTotal(); // number of open positions
   for(int i=total-1; i>=0; i--)
     {
      ulong  position_ticket=PositionGetTicket(i);                                      // ticket of the position
      string position_symbol=PositionGetString(POSITION_SYMBOL);                        // symbol 
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS);              // number of decimal places
      ulong  magic=PositionGetInteger(POSITION_MAGIC);                                  // MagicNumber of the position
      double volume=PositionGetDouble(POSITION_VOLUME);                                 // volume of the position
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);    // type of the position
      if(magic==magic_number)
        {
         count++;
      }
   }
   return(count);
}

// Identify new bars
bool Find_New_Bar(){
   static datetime Time[];
   int count = 1;   // number of elements to copy
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,count,Time);

   static datetime New_Time = 0;
   bool New_Bar_local = false;
   if (New_Time != Time[0]){
      New_Time = Time[0];
      New_Bar_local = true;
      }
   return(New_Bar_local);
}




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
   int S=ArraySize(change);
   ArrayResize(chartline,S);
   chartline[0]=change[0];
   for(int i=1;i<S;i++)
      chartline[i]=chartline[i-1]+change[i];
//--- now, calculate regression ratios
   double x=0,y=0,x2=0,xy=0;
   for(int i=0;i<S;i++)
     {
      x=x+i;
      y=y+chartline[i];
      xy=xy+i*chartline[i];
      x2=x2+i*i;
     }
   a_coef=(S*xy-x*y)/(S*x2-x*x);
   b_coef=(y-a_coef*x)/S;
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
   int S=ArraySize(data);
   if(S==0)
      return (false);
   for(int i=0;i<S;i++)
      error=MathPow(a_coef*i+b_coef-data[i],2);
   std_err=MathSqrt(error/(S-2));
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
	
	
	double useful_loss = gross_loss < 0 ? gross_loss > -50 ? 50 + gross_loss : 0 : 0;
	
	double rtn = useful_loss * expectancy * expected_payoff * sharpe_ratio * regression;
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
   
   int arg = ma_period1_1 + ma_period1_2 + ma_period1_3 + ma_period1_4;
   
   double _max = 0.9;
   double _min = 0.1;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;

   rtn *= rand_scaled;
   
   return(rtn);
}

double OnTester(){
   //return(1.0);
   return(get_score());
}