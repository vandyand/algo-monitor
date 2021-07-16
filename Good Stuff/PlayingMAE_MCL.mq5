
//#include<Trade\Trade.mqh>

//CTrade trade;
input datetime splitDate;
input datetime splitDate2;
input double timeMultiplier = 1;

input int ma_period1_1 = 2;
input int ma_period1_2 = 4;
input int ma_period1_3 = 2;
input int ma_period1_4 = 4;
input int ma_period1_5 = 2;
input int ma_period1_6 = 4;
input int ma_period1_7 = 2;
input int ma_period1_8 = 4;

input int ma_period2_1 = 2;
input int ma_period2_2 = 4;
input int ma_period2_3 = 2;
input int ma_period2_4 = 4;
input int ma_period2_5 = 2;
input int ma_period2_6 = 4;
input int ma_period2_7 = 2;
input int ma_period2_8 = 4;

input int ma_period3_1 = 2;
input int ma_period3_2 = 4;
input int ma_period3_3 = 2;
input int ma_period3_4 = 4;
input int ma_period3_5 = 2;
input int ma_period3_6 = 4;
input int ma_period3_7 = 2;
input int ma_period3_8 = 4;

input int ma_period4_1 = 2;
input int ma_period4_2 = 4;
input int ma_period4_3 = 2;
input int ma_period4_4 = 4;
input int ma_period4_5 = 2;
input int ma_period4_6 = 4;
input int ma_period4_7 = 2;
input int ma_period4_8 = 4;

input int ma_period5_1 = 2;
input int ma_period5_2 = 4;
input int ma_period5_3 = 2;
input int ma_period5_4 = 4;
input int ma_period5_5 = 2;
input int ma_period5_6 = 4;
input int ma_period5_7 = 2;
input int ma_period5_8 = 4;

input int ma_period6_1 = 2;
input int ma_period6_2 = 4;
input int ma_period6_3 = 2;
input int ma_period6_4 = 4;
input int ma_period6_5 = 2;
input int ma_period6_6 = 4;
input int ma_period6_7 = 2;
input int ma_period6_8 = 4;

input int ma_period7_1 = 2;
input int ma_period7_2 = 4;
input int ma_period7_3 = 2;
input int ma_period7_4 = 4;
input int ma_period7_5 = 2;
input int ma_period7_6 = 4;
input int ma_period7_7 = 2;
input int ma_period7_8 = 4;

input int ma_period8_1 = 2;
input int ma_period8_2 = 4;
input int ma_period8_3 = 2;
input int ma_period8_4 = 4;
input int ma_period8_5 = 2;
input int ma_period8_6 = 4;
input int ma_period8_7 = 2;
input int ma_period8_8 = 4;

input int ma_period9_1 = 2;
input int ma_period9_2 = 4;
input int ma_period9_3 = 2;
input int ma_period9_4 = 4;
input int ma_period9_5 = 2;
input int ma_period9_6 = 4;
input int ma_period9_7 = 2;
input int ma_period9_8 = 4;

input int ma_period10_1 = 2;
input int ma_period10_2 = 4;
input int ma_period10_3 = 2;
input int ma_period10_4 = 4;
input int ma_period10_5 = 2;
input int ma_period10_6 = 4;
input int ma_period10_7 = 2;
input int ma_period10_8 = 4;

input int ma_period11_1 = 2;
input int ma_period11_2 = 4;
input int ma_period11_3 = 2;
input int ma_period11_4 = 4;
input int ma_period11_5 = 2;
input int ma_period11_6 = 4;
input int ma_period11_7 = 2;
input int ma_period11_8 = 4;

input int ma_period12_1 = 2;
input int ma_period12_2 = 4;
input int ma_period12_3 = 2;
input int ma_period12_4 = 4;
input int ma_period12_5 = 2;
input int ma_period12_6 = 4;
input int ma_period12_7 = 2;
input int ma_period12_8 = 4;

input int ma_period13_1 = 2;
input int ma_period13_2 = 4;
input int ma_period13_3 = 2;
input int ma_period13_4 = 4;
input int ma_period13_5 = 2;
input int ma_period13_6 = 4;
input int ma_period13_7 = 2;
input int ma_period13_8 = 4;

input int ma_period14_1 = 2;
input int ma_period14_2 = 4;
input int ma_period14_3 = 2;
input int ma_period14_4 = 4;
input int ma_period14_5 = 2;
input int ma_period14_6 = 4;
input int ma_period14_7 = 2;
input int ma_period14_8 = 4;

input int ma_period15_1 = 2;
input int ma_period15_2 = 4;
input int ma_period15_3 = 2;
input int ma_period15_4 = 4;
input int ma_period15_5 = 2;
input int ma_period15_6 = 4;
input int ma_period15_7 = 2;
input int ma_period15_8 = 4;

input int ma_period16_1 = 2;
input int ma_period16_2 = 4;
input int ma_period16_3 = 2;
input int ma_period16_4 = 4;
input int ma_period16_5 = 2;
input int ma_period16_6 = 4;
input int ma_period16_7 = 2;
input int ma_period16_8 = 4;


input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
input string file_name = "temp";
int input MagicNumber = 200;
double input Lots = 0.01;

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
int ma_period[16][8];




int maHandle[16][8];
double mas[16][8][1];
double MA[16][8];
double price[16][8];
double rel[16][8];


int OnInit(){


   // Assign input values to arrays
   ma_period[0][0] = ma_period1_1;ma_period[0][1] = ma_period1_2;ma_period[0][2] = ma_period1_3;ma_period[0][3] = ma_period1_4;ma_period[0][4] = ma_period1_5;ma_period[0][5] = ma_period1_6;ma_period[0][6] = ma_period1_7;ma_period[0][7] = ma_period1_8;   ma_period[1][0] = ma_period2_1;ma_period[1][1] = ma_period2_2;ma_period[1][2] = ma_period2_3;ma_period[1][3] = ma_period2_4;ma_period[1][4] = ma_period2_5;ma_period[1][5] = ma_period2_6;ma_period[1][6] = ma_period2_7;ma_period[1][7] = ma_period2_8;  ma_period[2][0] = ma_period3_1;ma_period[2][1] = ma_period3_2;ma_period[2][2] = ma_period3_3;ma_period[2][3] = ma_period3_4;ma_period[2][4] = ma_period3_5;ma_period[2][5] = ma_period3_6;ma_period[2][6] = ma_period3_7;ma_period[2][7] = ma_period3_8;   ma_period[3][0] = ma_period4_1;ma_period[3][1] = ma_period4_2;ma_period[3][2] = ma_period4_3;ma_period[3][3] = ma_period4_4;ma_period[3][4] = ma_period4_5;ma_period[3][5] = ma_period4_6;ma_period[3][6] = ma_period4_7;ma_period[3][7] = ma_period4_8;   ma_period[4][0] = ma_period5_1;ma_period[4][1] = ma_period5_2;ma_period[4][2] = ma_period5_3;ma_period[4][3] = ma_period5_4;ma_period[4][4] = ma_period5_5;ma_period[4][5] = ma_period5_6;ma_period[4][6] = ma_period5_7;ma_period[4][7] = ma_period5_8;   ma_period[5][0] = ma_period6_1;ma_period[5][1] = ma_period6_2;ma_period[5][2] = ma_period6_3;ma_period[5][3] = ma_period6_4;ma_period[5][4] = ma_period6_5;ma_period[5][5] = ma_period6_6;ma_period[5][6] = ma_period6_7;ma_period[5][7] = ma_period6_8;   ma_period[6][0] = ma_period7_1;ma_period[6][1] = ma_period7_2;ma_period[6][2] = ma_period7_3;ma_period[6][3] = ma_period7_4;ma_period[6][4] = ma_period7_5;ma_period[6][5] = ma_period7_6;ma_period[6][6] = ma_period7_7;ma_period[6][7] = ma_period7_8;   ma_period[7][0] = ma_period8_1;   ma_period[7][1] = ma_period8_2;   ma_period[7][2] = ma_period8_3;   ma_period[7][3] = ma_period8_4;   ma_period[7][4] = ma_period8_5;   ma_period[7][5] = ma_period8_6;   ma_period[7][6] = ma_period8_7;   ma_period[7][7] = ma_period8_8;   ma_period[8][0] = ma_period9_1;   ma_period[8][1] = ma_period9_2;   ma_period[8][2] = ma_period9_3;   ma_period[8][3] = ma_period9_4;   ma_period[8][4] = ma_period9_5;   ma_period[8][5] = ma_period9_6;   ma_period[8][6] = ma_period9_7;   ma_period[8][7] = ma_period9_8;

      
   ma_period[9][0] = ma_period10_1;
   ma_period[9][1] = ma_period10_2;
   ma_period[9][2] = ma_period10_3;
   ma_period[9][3] = ma_period10_4;
   ma_period[9][4] = ma_period10_5;
   ma_period[9][5] = ma_period10_6;
   ma_period[9][6] = ma_period10_7;
   ma_period[9][7] = ma_period10_8;   
   
   
   ma_period[10][0] = ma_period11_1;
   ma_period[10][1] = ma_period11_2;
   ma_period[10][2] = ma_period11_3;
   ma_period[10][3] = ma_period11_4;
   ma_period[10][4] = ma_period11_5;
   ma_period[10][5] = ma_period11_6;
   ma_period[10][6] = ma_period11_7;
   ma_period[10][7] = ma_period11_8;   
   
   
   ma_period[11][0] = ma_period12_1;
   ma_period[11][1] = ma_period12_2;
   ma_period[11][2] = ma_period12_3;
   ma_period[11][3] = ma_period12_4;
   ma_period[11][4] = ma_period12_5;
   ma_period[11][5] = ma_period12_6;
   ma_period[11][6] = ma_period12_7;
   ma_period[11][7] = ma_period12_8;   
   
   
   ma_period[12][0] = ma_period13_1;
   ma_period[12][1] = ma_period13_2;
   ma_period[12][2] = ma_period13_3;
   ma_period[12][3] = ma_period13_4;
   ma_period[12][4] = ma_period13_5;
   ma_period[12][5] = ma_period13_6;
   ma_period[12][6] = ma_period13_7;
   ma_period[12][7] = ma_period13_8;   
   
   
   ma_period[13][0] = ma_period14_1;
   ma_period[13][1] = ma_period14_2;
   ma_period[13][2] = ma_period14_3;
   ma_period[13][3] = ma_period14_4;
   ma_period[13][4] = ma_period14_5;
   ma_period[13][5] = ma_period14_6;
   ma_period[13][6] = ma_period14_7;
   ma_period[13][7] = ma_period14_8;   
   
   
   ma_period[14][0] = ma_period15_1;
   ma_period[14][1] = ma_period15_2;
   ma_period[14][2] = ma_period15_3;
   ma_period[14][3] = ma_period15_4;
   ma_period[14][4] = ma_period15_5;
   ma_period[14][5] = ma_period15_6;
   ma_period[14][6] = ma_period15_7;
   ma_period[14][7] = ma_period15_8;   
   
   
   ma_period[15][0] = ma_period16_1;
   ma_period[15][1] = ma_period16_2;
   ma_period[15][2] = ma_period16_3;
   ma_period[15][3] = ma_period16_4;
   ma_period[15][4] = ma_period16_5;
   ma_period[15][5] = ma_period16_6;
   ma_period[15][6] = ma_period16_7;
   ma_period[15][7] = ma_period16_8;   
   
   
   
   for(int i = 0; i < 16; i++){
      Magic[i] = MagicNumber + i;
   }
   
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 8; j++){
         maHandle[i][j] = iMA(symbols[i],_Period,ma_period[i][j],0,MODE_SMA,PRICE_OPEN);
      }
   }
   
   return(INIT_SUCCEEDED);
}

bool STRE0,STRE1,TransitionONS = false;
void OnTick(){
   
   Alert("TimeCurrent: ",TimeCurrent()," splitDate: ",splitDate," Past: ",TimeCurrent() > splitDate);
   
   STRE0 = STRE1;
   
   if(TimeCurrent() >= splitDate){
      STRE1 = true;
   } else {
      STRE1 = false;
   }

   if(!STRE0 && STRE1){
      TransitionONS = true;
   } else {
      TransitionONS = false;
   }  

   if(Find_New_Bar()){
      barNum++;
      
      for(int i = 0; i < 16; i++){
         EntLRE1[i] = EntLRE0[i];
         ExtLRE1[i] = ExtLRE0[i];
         EntSRE1[i] = EntSRE0[i];
         ExtSRE1[i] = ExtSRE0[i];
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 8; j++){
            double holder[1];
            CopyBuffer(maHandle[i][j],0,0,1,holder);
            mas[i][j][0] = holder[0];
         }
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 8; j++){
            MA[i][j] = mas[i][j][0];
            price[i][j] = NormalizeDouble(SymbolInfoDouble(symbols[i],SYMBOL_ASK),SymbolInfoInteger(symbols[i],SYMBOL_DIGITS));
            rel[i][j] = MA[i][j] / price[i][j];
         }
      }
      
      for(int i = 0; i < 16; i++){
         if(rel[i][0] > rel[i][1]){EntLRE0[i] = true;} else {EntLRE0[i] = false;}
         if(rel[i][2] > rel[i][3]){ExtLRE0[i] = true;} else {ExtLRE0[i] = false;}
         if(rel[i][4] > rel[i][5]){EntSRE0[i] = true;} else {EntSRE0[i] = false;}
         if(rel[i][6] > rel[i][7]){ExtSRE0[i] = true;} else {ExtSRE0[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if(!EntLRE1[i] && EntLRE0[i]){EnterLongSignal[i] = true;} else {EnterLongSignal[i] = false;}
         if(!ExtLRE1[i] && ExtLRE0[i]){ExitLongSignal[i] = true;} else {ExitLongSignal[i] = false;}
         if(!EntSRE1[i] && EntSRE0[i]){EnterShortSignal[i] = true;} else {EnterShortSignal[i] = false;}
         if(!ExtSRE1[i] && ExtSRE0[i]){ExitShortSignal[i] = true;} else {ExitShortSignal[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if((longPos[i] && ExitLongSignal[i]) || (shortPos[i] && ExitShortSignal[i]) || TransitionONS){
            Alert("Exiting Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ----------------------------------------------------------");
            CloseRecentPosition(Magic[i]);
            //while(!CloseRecentPosition(symbols[0])){Sleep(100);}
            longPos[i] = false;
            shortPos[i] = false;
         }
      }
      
      if(TransitionONS){
         Alert("************************* Magic Updating!!! **********************************************");
         for(int i = 0; i < 16; i++){
            Alert("Original Magic: ",Magic[i]);
            Magic[i] = Magic[i] + 100;
            Alert("Updated Magic: ",Magic[i]);
         }
         Alert("************************* Magic Updated!!! **********************************************");
      }
      
      for(int i = 0; i < 16; i++){
         if(CurrentOpenPositions(Magic[i]) < 1){
            if(EnterLongSignal[i] && !EnterShortSignal[i] && !ExitLongSignal[i]){
               Alert("Entering Long Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," *************************************************");
               if(!BuyAsync(Lots,Magic[i],symbols[i])){Alert("Error entering long ",symbols[i],". Last error: ",GetLastError());}
               //while(!BuyAsync(Lots,symbols[0])){Sleep(100);}
               longPos[i] = true;
            }
            if(EnterShortSignal[i] && !EnterLongSignal[i] && !ExitShortSignal[i]){
               Alert("Entering Short Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ************************************************");
               if(!SellAsync(Lots,Magic[i],symbols[i])){Alert("Error entering short ",symbols[i],". Last error: ",GetLastError());}
               //while(!SellAsync(Lots,symbols[0])){Sleep(100);}
               shortPos[i] = true;
            }
         }
      }
      
   }
}





double OnTester()  {
   
   double rtn = 0.0;
   
   double backProf = backProfit();
   double foreProf = foreProfit() - backProf;
   double totalProf = TesterStatistics(STAT_PROFIT);
   double verifyProf = totalProf - backProf - foreProf;
   double threshold_upper = totalProf / 3.0 + 5;
   double threshold_lower = totalProf / 3.0 - 5;

   
   if(backProf > 0 && totalProf > backProf){
      rtn = backProf;
      //rtn = backProf > 0 ? 1 : -1;
   }
   
   /*
   if(backProf > threshold_lower && foreProf > threshold_lower && verifyProf > threshold_lower
   && backProf < threshold_upper && foreProf < threshold_upper && verifyProf < threshold_upper){
      rtn = backProf;
      //rtn = backProf > 0 ? 1 : -1;      
   }
   */
   
   int arg = 0;
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 8; j++){
         arg += ma_period[i][j];
      }
   }
   
   double _max = 1.0;
   double _min = 0;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;
   
   //rtn = totalProf;

   rtn *= rand_scaled;
   
   return(rtn);
}

double backProfit(){
   double Res = 0;

   if(HistorySelect(0, INT_MAX)){
      for (int i = HistoryDealsTotal() - 1; i > 0; i--){
         
         ulong Ticket = HistoryDealGetTicket(i);
         datetime openTime = HistoryDealGetInteger(Ticket,DEAL_TIME);
         bool cond = openTime < splitDate;
         
         if(cond){
            Res += HistoryDealGetDouble(Ticket, DEAL_PROFIT);
         }
      }
   }
   
   return(Res);
}

double foreProfit(){
   double Res = 0;

   if(HistorySelect(0, INT_MAX)){
      for (int i = HistoryDealsTotal() - 1; i > 0; i--){
         
         ulong Ticket = HistoryDealGetTicket(i);
         datetime openTime = HistoryDealGetInteger(Ticket,DEAL_TIME);
         bool cond = openTime < splitDate2;
         
         if(cond){
            Res += HistoryDealGetDouble(Ticket, DEAL_PROFIT);
         }
      }
   }
   
   return(Res);
}


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


