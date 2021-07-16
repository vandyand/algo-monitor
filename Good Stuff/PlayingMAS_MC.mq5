
//#include<Trade\Trade.mqh>

//CTrade trade;

input int ma_period1_1 = 2;
input int ma_period1_2 = 4;
input int ma_period1_3 = 2;
input int ma_period1_4 = 4;

input int ma_period2_1 = 2;
input int ma_period2_2 = 4;
input int ma_period2_3 = 2;
input int ma_period2_4 = 4;

input int ma_period3_1 = 2;
input int ma_period3_2 = 4;
input int ma_period3_3 = 2;
input int ma_period3_4 = 4;

input int ma_period4_1 = 2;
input int ma_period4_2 = 4;
input int ma_period4_3 = 2;
input int ma_period4_4 = 4;

input int ma_period5_1 = 2;
input int ma_period5_2 = 4;
input int ma_period5_3 = 2;
input int ma_period5_4 = 4;

input int ma_period6_1 = 2;
input int ma_period6_2 = 4;
input int ma_period6_3 = 2;
input int ma_period6_4 = 4;

input int ma_period7_1 = 2;
input int ma_period7_2 = 4;
input int ma_period7_3 = 2;
input int ma_period7_4 = 4;

input int ma_period8_1 = 2;
input int ma_period8_2 = 4;
input int ma_period8_3 = 2;
input int ma_period8_4 = 4;

input int ma_period9_1 = 2;
input int ma_period9_2 = 4;
input int ma_period9_3 = 2;
input int ma_period9_4 = 4;

input int ma_period10_1 = 2;
input int ma_period10_2 = 4;
input int ma_period10_3 = 2;
input int ma_period10_4 = 4;

input int ma_period11_1 = 2;
input int ma_period11_2 = 4;
input int ma_period11_3 = 2;
input int ma_period11_4 = 4;

input int ma_period12_1 = 2;
input int ma_period12_2 = 4;
input int ma_period12_3 = 2;
input int ma_period12_4 = 4;

input int ma_period13_1 = 2;
input int ma_period13_2 = 4;
input int ma_period13_3 = 2;
input int ma_period13_4 = 4;

input int ma_period14_1 = 2;
input int ma_period14_2 = 4;
input int ma_period14_3 = 2;
input int ma_period14_4 = 4;

input int ma_period15_1 = 2;
input int ma_period15_2 = 4;
input int ma_period15_3 = 2;
input int ma_period15_4 = 4;

input int ma_period16_1 = 2;
input int ma_period16_2 = 4;
input int ma_period16_3 = 2;
input int ma_period16_4 = 4;

input int ma_shift1_1 = 0;
input int ma_shift1_2 = 0;
input int ma_shift1_3 = 0;
input int ma_shift1_4 = 0;
input int ma_shift2_1 = 0;
input int ma_shift2_2 = 0;
input int ma_shift2_3 = 0;
input int ma_shift2_4 = 0;
input int ma_shift3_1 = 0;
input int ma_shift3_2 = 0;
input int ma_shift3_3 = 0;
input int ma_shift3_4 = 0;
input int ma_shift4_1 = 0;
input int ma_shift4_2 = 0;
input int ma_shift4_3 = 0;
input int ma_shift4_4 = 0;
input int ma_shift5_1 = 0;
input int ma_shift5_2 = 0;
input int ma_shift5_3 = 0;
input int ma_shift5_4 = 0;
input int ma_shift6_1 = 0;
input int ma_shift6_2 = 0;
input int ma_shift6_3 = 0;
input int ma_shift6_4 = 0;
input int ma_shift7_1 = 0;
input int ma_shift7_2 = 0;
input int ma_shift7_3 = 0;
input int ma_shift7_4 = 0;
input int ma_shift8_1 = 0;
input int ma_shift8_2 = 0;
input int ma_shift8_3 = 0;
input int ma_shift8_4 = 0;
input int ma_shift9_1 = 0;
input int ma_shift9_2 = 0;
input int ma_shift9_3 = 0;
input int ma_shift9_4 = 0;
input int ma_shift10_1 = 0;
input int ma_shift10_2 = 0;
input int ma_shift10_3 = 0;
input int ma_shift10_4 = 0;
input int ma_shift11_1 = 0;
input int ma_shift11_2 = 0;
input int ma_shift11_3 = 0;
input int ma_shift11_4 = 0;
input int ma_shift12_1 = 0;
input int ma_shift12_2 = 0;
input int ma_shift12_3 = 0;
input int ma_shift12_4 = 0;
input int ma_shift13_1 = 0;
input int ma_shift13_2 = 0;
input int ma_shift13_3 = 0;
input int ma_shift13_4 = 0;
input int ma_shift14_1 = 0;
input int ma_shift14_2 = 0;
input int ma_shift14_3 = 0;
input int ma_shift14_4 = 0;
input int ma_shift15_1 = 0;
input int ma_shift15_2 = 0;
input int ma_shift15_3 = 0;
input int ma_shift15_4 = 0;
input int ma_shift16_1 = 0;
input int ma_shift16_2 = 0;
input int ma_shift16_3 = 0;
input int ma_shift16_4 = 0;
   
input int open_bars1 = 5;
input int open_bars2 = 5;
input int open_bars3 = 5;
input int open_bars4 = 5;
input int open_bars5 = 5;
input int open_bars6 = 5;
input int open_bars7 = 5;
input int open_bars8 = 5;
input int open_bars9 = 5;
input int open_bars10 = 5;
input int open_bars11 = 5;
input int open_bars12 = 5;
input int open_bars13 = 5;
input int open_bars14 = 5;
input int open_bars15 = 5;
input int open_bars16 = 5;


input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
input string file_name = "temp";
int input MagicNumber = 200;
double input Lots = 0.01;
bool input scaleLots = false;

int slippage = 100;
int barNum = 0;
double stat_values[100]; // Array for testing parameters
bool stopTrading = false;


string symbols[16] = {"EURUSD",
                     "AUDUSD",
                     "USDJPY",
                     "GBPUSD",
                     "USDCHF",
                     "NZDUSD",
                     "USDCAD",
                     "EURJPY",
                     "EURGBP",
                     "EURAUD",
                     "AUDJPY",
                     "EURCHF",
                     "NZDJPY",
                     "CADJPY",
                     "NZDCAD",
                     "AUDCAD"};


bool longPos[16],shortPos[16],
     EnterLongSignal[16],ExitLongSignal[16], EnterShortSignal[16], ExitShortSignal[16],
     EntLRE0[16], EntLRE1[16], ExtLRE0[16], ExtLRE1[16], EntSRE0[16], EntSRE1[16], ExtSRE0[16], ExtSRE1[16]
     = {false,false,false,false,false,false,false,false,false};
int Magic[16];
int ma_period[16][4];
int ma_shift[16][4];
int open_bars[16];
int close_times[16];



int maHandle[16][4];
double mas[16][4][1];
double MA[16][4];
double price[16][4];
double rel[16][4];


int OnInit(){


   // Assign input values to arrays
   ma_period[0][0] = ma_period1_1;
   ma_period[0][1] = ma_period1_2;
   ma_period[0][2] = ma_period1_3;
   ma_period[0][3] = ma_period1_4;
   ma_shift[0][0] = ma_shift1_1;
   ma_shift[0][1] = ma_shift1_2;
   ma_shift[0][2] = ma_shift1_3;
   ma_shift[0][3] = ma_shift1_4;
   open_bars[0] = open_bars1;
   
   ma_period[1][0] = ma_period2_1;
   ma_period[1][1] = ma_period2_2;
   ma_period[1][2] = ma_period2_3;
   ma_period[1][3] = ma_period2_4;
   ma_shift[1][0] = ma_shift2_1;
   ma_shift[1][1] = ma_shift2_2;
   ma_shift[1][2] = ma_shift2_3;
   ma_shift[1][3] = ma_shift2_4;
   open_bars[1] = open_bars2;
   
   ma_period[2][0] = ma_period3_1;
   ma_period[2][1] = ma_period3_2;
   ma_period[2][2] = ma_period3_3;
   ma_period[2][3] = ma_period3_4;
   ma_shift[2][0] = ma_shift3_1;
   ma_shift[2][1] = ma_shift3_2;
   ma_shift[2][2] = ma_shift3_3;
   ma_shift[2][3] = ma_shift3_4;
   open_bars[2] = open_bars3;
   
   ma_period[3][0] = ma_period4_1;
   ma_period[3][1] = ma_period4_2;
   ma_period[3][2] = ma_period4_3;
   ma_period[3][3] = ma_period4_4;
   ma_shift[3][0] = ma_shift4_1;
   ma_shift[3][1] = ma_shift4_2;
   ma_shift[3][2] = ma_shift4_3;
   ma_shift[3][3] = ma_shift4_4;
   open_bars[3] = open_bars4;
   
   ma_period[4][0] = ma_period5_1;
   ma_period[4][1] = ma_period5_2;
   ma_period[4][2] = ma_period5_3;
   ma_period[4][3] = ma_period5_4;
   ma_shift[4][0] = ma_shift5_1;
   ma_shift[4][1] = ma_shift5_2;
   ma_shift[4][2] = ma_shift5_3;
   ma_shift[4][3] = ma_shift5_4;
   open_bars[4] = open_bars5;
   
   ma_period[5][0] = ma_period6_1;
   ma_period[5][1] = ma_period6_2;
   ma_period[5][2] = ma_period6_3;
   ma_period[5][3] = ma_period6_4;
   ma_shift[5][0] = ma_shift6_1;
   ma_shift[5][1] = ma_shift6_2;
   ma_shift[5][2] = ma_shift6_3;
   ma_shift[5][3] = ma_shift6_4;
   open_bars[5] = open_bars6;
   
   ma_period[6][0] = ma_period7_1;
   ma_period[6][1] = ma_period7_2;
   ma_period[6][2] = ma_period7_3;
   ma_period[6][3] = ma_period7_4;
   ma_shift[6][0] = ma_shift7_1;
   ma_shift[6][1] = ma_shift7_2;
   ma_shift[6][2] = ma_shift7_3;
   ma_shift[6][3] = ma_shift7_4;
   open_bars[6] = open_bars7;
   
   ma_period[7][0] = ma_period8_1;   
   ma_period[7][1] = ma_period8_2;   
   ma_period[7][2] = ma_period8_3;   
   ma_period[7][3] = ma_period8_4;
   ma_shift[7][0] = ma_shift8_1;
   ma_shift[7][1] = ma_shift8_2;
   ma_shift[7][2] = ma_shift8_3;
   ma_shift[7][3] = ma_shift8_4;
   open_bars[7] = open_bars8;
   
   ma_period[8][0] = ma_period9_1;   
   ma_period[8][1] = ma_period9_2;   
   ma_period[8][2] = ma_period9_3;   
   ma_period[8][3] = ma_period9_4; 
   ma_shift[8][0] = ma_shift9_1;
   ma_shift[8][1] = ma_shift9_2;
   ma_shift[8][2] = ma_shift9_3;
   ma_shift[8][3] = ma_shift9_4;
   open_bars[8] = open_bars9;
   
   ma_period[9][0] = ma_period10_1;
   ma_period[9][1] = ma_period10_2;
   ma_period[9][2] = ma_period10_3;
   ma_period[9][3] = ma_period10_4;
   ma_shift[9][0] = ma_shift10_1;
   ma_shift[9][1] = ma_shift10_2;
   ma_shift[9][2] = ma_shift10_3;
   ma_shift[9][3] = ma_shift10_4;
   open_bars[9] = open_bars10;

   ma_period[10][0] = ma_period11_1;
   ma_period[10][1] = ma_period11_2;
   ma_period[10][2] = ma_period11_3;
   ma_period[10][3] = ma_period11_4;
   ma_shift[10][0] = ma_shift11_1;
   ma_shift[10][1] = ma_shift11_2;
   ma_shift[10][2] = ma_shift11_3;
   ma_shift[10][3] = ma_shift11_4;
   open_bars[10] = open_bars11;
   
   ma_period[11][0] = ma_period12_1;
   ma_period[11][1] = ma_period12_2;
   ma_period[11][2] = ma_period12_3;
   ma_period[11][3] = ma_period12_4;
   ma_shift[11][0] = ma_shift12_1;
   ma_shift[11][1] = ma_shift12_2;
   ma_shift[11][2] = ma_shift12_3;
   ma_shift[11][3] = ma_shift12_4;
   open_bars[11] = open_bars12;
   
   ma_period[12][0] = ma_period13_1;
   ma_period[12][1] = ma_period13_2;
   ma_period[12][2] = ma_period13_3;
   ma_period[12][3] = ma_period13_4;
   ma_shift[12][0] = ma_shift13_1;
   ma_shift[12][1] = ma_shift13_2;
   ma_shift[12][2] = ma_shift13_3;
   ma_shift[12][3] = ma_shift13_4;
   open_bars[12] = open_bars13;
   
   ma_period[13][0] = ma_period14_1;
   ma_period[13][1] = ma_period14_2;
   ma_period[13][2] = ma_period14_3;
   ma_period[13][3] = ma_period14_4;
   ma_shift[13][0] = ma_shift14_1;
   ma_shift[13][1] = ma_shift14_2;
   ma_shift[13][2] = ma_shift14_3;
   ma_shift[13][3] = ma_shift14_4;
   open_bars[13] = open_bars14;
   
   ma_period[14][0] = ma_period15_1;
   ma_period[14][1] = ma_period15_2;
   ma_period[14][2] = ma_period15_3;
   ma_period[14][3] = ma_period15_4;
   ma_shift[14][0] = ma_shift15_1;
   ma_shift[14][1] = ma_shift15_2;
   ma_shift[14][2] = ma_shift15_3;
   ma_shift[14][3] = ma_shift15_4;
   open_bars[14] = open_bars15;
   
   ma_period[15][0] = ma_period16_1;
   ma_period[15][1] = ma_period16_2;
   ma_period[15][2] = ma_period16_3;
   ma_period[15][3] = ma_period16_4;
   ma_shift[15][0] = ma_shift16_1;
   ma_shift[15][1] = ma_shift16_2;
   ma_shift[15][2] = ma_shift16_3;
   ma_shift[15][3] = ma_shift16_4;
   open_bars[15] = open_bars16;   
   
   
   
   for(int i = 0; i < 16; i++){
      Magic[i] = MagicNumber + i;
      close_times[i] = 0;
   }
   
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 4; j++){
         maHandle[i][j] = iMA(symbols[i],_Period,ma_period[i][j],ma_shift[i][j],MODE_SMA,PRICE_OPEN);
      }
   }
   
   return(INIT_SUCCEEDED);
}

double lots = 0;

void OnTick(){
   
 

   if(Find_New_Bar()){
      barNum++;
      
      if(scaleLots){
         lots = NormalizeDouble(AccountInfoDouble(ACCOUNT_BALANCE) / 10000.0,2);
      } else {
         lots = Lots;
      }
      
      for(int i = 0; i < 16; i++){
         EntLRE1[i] = EntLRE0[i];
         ExtLRE1[i] = ExtLRE0[i];
         EntSRE1[i] = EntSRE0[i];
         ExtSRE1[i] = ExtSRE0[i];
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 4; j++){
            double holder[1];
            CopyBuffer(maHandle[i][j],0,0,1,holder);
            mas[i][j][0] = holder[0];
         }
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 4; j++){
            MA[i][j] = mas[i][j][0];
            price[i][j] = NormalizeDouble(SymbolInfoDouble(symbols[i],SYMBOL_ASK),SymbolInfoInteger(symbols[i],SYMBOL_DIGITS));
            rel[i][j] = MA[i][j] / price[i][j];
         }
      }
      
      for(int i = 0; i < 16; i++){
         if(rel[i][0] > rel[i][1]){EntLRE0[i] = true;} else {EntLRE0[i] = false;}
         if(barNum == close_times[i]){ExtLRE0[i] = true;ExtSRE0[i] = true;} else {ExtLRE0[i] = false;ExtSRE0[i] = false;}
         if(rel[i][2] > rel[i][3]){EntSRE0[i] = true;} else {EntSRE0[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if(!EntLRE1[i] && EntLRE0[i]){EnterLongSignal[i] = true;} else {EnterLongSignal[i] = false;}
         if(!ExtLRE1[i] && ExtLRE0[i]){ExitLongSignal[i] = true;} else {ExitLongSignal[i] = false;}
         if(!EntSRE1[i] && EntSRE0[i]){EnterShortSignal[i] = true;} else {EnterShortSignal[i] = false;}
         if(!ExtSRE1[i] && ExtSRE0[i]){ExitShortSignal[i] = true;} else {ExitShortSignal[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if((longPos[i] && ExitLongSignal[i]) || (shortPos[i] && ExitShortSignal[i])){
            Alert("Exiting Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ----------------------------------------------------------");
            CloseRecentPosition(Magic[i]);
            //while(!CloseRecentPosition(symbols[0])){Sleep(100);}
            longPos[i] = false;
            shortPos[i] = false;
         }
      }
      
      for(int i = 0; i < 16; i++){
         if(CurrentOpenPositions(Magic[i]) < 1){
            if(EnterLongSignal[i] && !EnterShortSignal[i] && !ExitLongSignal[i]){
               Alert("Entering Long Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," *************************************************");
               if(!BuyAsync(lots,Magic[i],symbols[i])){Alert("Error entering long ",symbols[i],". Last error: ",GetLastError());}
               //while(!BuyAsync(Lots,symbols[0])){Sleep(100);}
               longPos[i] = true;
               close_times[i] = barNum + open_bars[i];
            }
            if(EnterShortSignal[i] && !EnterLongSignal[i] && !ExitShortSignal[i]){
               Alert("Entering Short Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ************************************************");
               if(!SellAsync(lots,Magic[i],symbols[i])){Alert("Error entering short ",symbols[i],". Last error: ",GetLastError());}
               //while(!SellAsync(Lots,symbols[0])){Sleep(100);}
               shortPos[i] = true;
               close_times[i] = barNum + open_bars[i];
            }
         }
      }
      
   }
}




/*
double OnTester()  {
   
   double rtn = 1.0;
   
   int arg = 0;
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 4; j++){
         arg += ma_period[i][j] + ma_shift[i][j];
      }
   }
   
   double _max = 1.0;
   double _min = 0;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;
   
   rtn *= TesterStatistics(STAT_PROFIT) * MathAbs(TesterStatistics(STAT_SHARPE_RATIO));

   rtn *= rand_scaled;
   
   return(rtn);
}
*/


bool BuyAsync(double volume, int magicNum, string symbol){
   MqlTradeRequest req={0};
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
   MqlTradeRequest req={0};
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
   
   int arg = ma_period1_1 + ma_period1_2 + ma_period1_3 + ma_period1_4 +
    ma_period2_1 + ma_period2_2 + ma_period2_3 + ma_period2_4 +
    ma_period3_1 + ma_period3_2 + ma_period3_3 + ma_period3_4 +
    ma_period4_1 + ma_period4_2 + ma_period4_3 + ma_period4_4 +
    ma_period5_1 + ma_period5_2 + ma_period5_3 + ma_period5_4 +
    ma_period6_1 + ma_period6_2 + ma_period6_3 + ma_period6_4 +
    ma_period7_1 + ma_period7_2 + ma_period7_3 + ma_period7_4 +
    ma_period8_1 + ma_period8_2 + ma_period8_3 + ma_period8_4 +
    ma_period9_1 + ma_period9_2 + ma_period9_3 + ma_period9_4 +
    ma_period10_1 + ma_period10_2 + ma_period10_3 + ma_period10_4 +
    ma_period11_1 + ma_period11_2 + ma_period11_3 + ma_period11_4 +
    ma_period12_1 + ma_period12_2 + ma_period12_3 + ma_period12_4 +
    ma_period13_1 + ma_period13_2 + ma_period13_3 + ma_period13_4 +
    ma_period14_1 + ma_period14_2 + ma_period14_3 + ma_period14_4 +
    ma_period15_1 + ma_period15_2 + ma_period15_3 + ma_period15_4 +
    ma_period16_1 + ma_period16_2 + ma_period16_3 + ma_period16_4;
   
   double _max = 0.9;
   double _min = 0.1;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;

   rtn *= rand_scaled;
   
   return(rtn);
}

double OnTester(){
   return(get_score());
}
