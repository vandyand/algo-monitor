
#include<Trade\Trade.mqh>

CTrade trade;

input int ma_period1 = 0;
input int ma_period2 = 1;
input int ma_period3 = 0;
input int ma_period4 = 1;
input int ma_period5 = 0;
input int ma_period6 = 1;
input int ma_shift1 = 0;
input int ma_shift2 = 1;
input int ma_shift3 = 0;
input int ma_shift4 = 1;
input int ma_shift5 = 0;
input int ma_shift6 = 1;
input int sym1 = 0;
input int sym2 = 0;
input int sym3 = 0;
input int sym4 = 0;
input int sym5 = 0;
input int sym6 = 0;

int MagicNumber = 200;

int slippage = 100;

bool EquityCrunch = false;
bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;
bool stopTrading = false;

bool longCond = false;
bool shortCond = false;
bool exit = false;

int barNum = 0;

double Lots = 0.01;

static datetime prevTime=0;
datetime lastTime[1];

string symbols[8] = {"EURUSD","AUDUSD","USDJPY","GBPUSD","EURGBP","USDCHF","NZDUSD","USDCAD"};


int maHandle1;
int maHandle2;
int maHandle3;
int maHandle4;
int maHandle5;
int maHandle6;
double mas1[1];
double mas2[1];
double mas3[1];
double mas4[1];
double mas5[1];
double mas6[1];


int OnInit(){

   maHandle1 = iMA(symbols[sym1],_Period,ma_period1,ma_shift1,MODE_SMA,PRICE_OPEN);
   maHandle2 = iMA(symbols[sym2],_Period,ma_period2,ma_shift2,MODE_SMA,PRICE_OPEN);
   maHandle3 = iMA(symbols[sym3],_Period,ma_period3,ma_shift3,MODE_SMA,PRICE_OPEN);
   maHandle4 = iMA(symbols[sym4],_Period,ma_period4,ma_shift4,MODE_SMA,PRICE_OPEN);
   maHandle5 = iMA(symbols[sym5],_Period,ma_period5,ma_shift5,MODE_SMA,PRICE_OPEN);
   maHandle6 = iMA(symbols[sym6],_Period,ma_period6,ma_shift6,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}


void OnTick()
{  
   //Alert(TimeLocal(), ", ", TimeCurrent(), ", ", TimeToString(TimeCurrent()));

   MqlDateTime tm;
   TimeCurrent(tm);
   //Alert(tm.day_of_week, ", ", tm.hour, ", ", tm.min);

   if(tm.day_of_week == 5 && tm.hour == 23 && tm.min > 45 && PositionsTotal() > 0){
      while(!CloseRecentPosition()){
         Sleep(10);
      }
   }
   
   
   CopyBuffer(maHandle1,0,0,1,mas1);
   CopyBuffer(maHandle2,0,0,1,mas2);
   CopyBuffer(maHandle3,0,0,1,mas3);
   CopyBuffer(maHandle4,0,0,1,mas4);
   CopyBuffer(maHandle5,0,0,1,mas5);
   CopyBuffer(maHandle6,0,0,1,mas6);
   
   double MA1 = mas1[0];
   double MA2 = mas2[0];
   double MA3 = mas3[0];
   double MA4 = mas4[0];
   double MA5 = mas5[0];
   double MA6 = mas6[0];
   
   double Price1 = NormalizeDouble(SymbolInfoDouble(symbols[sym1],SYMBOL_ASK),_Digits);
   double Price2 = NormalizeDouble(SymbolInfoDouble(symbols[sym2],SYMBOL_ASK),_Digits);
   double Price3 = NormalizeDouble(SymbolInfoDouble(symbols[sym3],SYMBOL_ASK),_Digits);
   double Price4 = NormalizeDouble(SymbolInfoDouble(symbols[sym4],SYMBOL_ASK),_Digits);
   double Price5 = NormalizeDouble(SymbolInfoDouble(symbols[sym5],SYMBOL_ASK),_Digits);
   double Price6 = NormalizeDouble(SymbolInfoDouble(symbols[sym6],SYMBOL_ASK),_Digits);
   
   double Rel1 = MA1 / Price1;
   double Rel2 = MA2 / Price2;
   double Rel3 = MA3 / Price3;
   double Rel4 = MA4 / Price4;
   double Rel5 = MA5 / Price5;
   double Rel6 = MA6 / Price6;
   
   Alert(symbols[0],MA1,symbols[1],MA2,symbols[2],MA3,symbols[3],MA4,symbols[4],MA5,symbols[5],MA6);
   
   if(Find_New_Bar()){
      barNum++;
      //Alert("New Bar Found!!******************");
      
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
      double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
      
      double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
      
      
      if(Rel1 > Rel2){
         longCond = true;
      } else {
         longCond = false;
      }

      if(Rel3 > Rel4){
         shortCond = true;
      } else {
         shortCond = false;
      }

      if(Rel5 > Rel6){
         exit = true;
      } else {
         exit = false;
      }
      
      if(longCond && shortCond){
         longCond = false;
         shortCond = false;
      }
      
      
      if(exit){
         CloseRecentPosition();
         //while(!CloseRecentPosition()){
         //   Sleep(10);
         //}
      }
         
      if(longCond){
         BuyAsync(Lots);
         //while(!BuyAsync(Lots)){
            //Sleep(10);
         //}
      }
      
      if(shortCond){
         SellAsync(Lots);
      }
   }
}

bool BuyAsync(double volume){
   MqlTradeRequest req={0};
   req.action      =TRADE_ACTION_DEAL;
   req.magic       =MagicNumber;
   req.symbol      =_Symbol;
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

bool SellAsync(double volume){
   MqlTradeRequest req={0};
   req.action      =TRADE_ACTION_DEAL;
   req.symbol      =_Symbol;
   req.magic       =MagicNumber;
   req.volume      =volume;
   req.type        =ORDER_TYPE_SELL;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_BID);
   req.deviation   =slippage;
   req.comment     ="Sell using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool CloseRecentPosition()
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
      if(magic==MagicNumber)
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





