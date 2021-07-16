
#include<Trade\Trade.mqh>

CTrade trade;
//input datetime splitDate;

input int ma_period1_1 = 2;

input int ma_period2_1 = 2;

input int ma_period3_1 = 2;

input int ma_period4_1 = 2;

input int ma_period5_1 = 2;

input int ma_period6_1 = 2;

input int ma_period7_1 = 2;


//input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
//input string file_name = "temp";
//int symbol_set = 1;
int input MagicNumber = 1000;
//double input default_Lot_size = 0.01;
//bool input KC_useKC = false;
//double input KC_percent = 0.33;
double input KC_USD_bet_size = 100.0;
datetime now;

int slippage = 200;
bool closeAll = false;


bool longPos1_ = false;
bool EnterLongSignal1_ = false;
bool EntLRE1_0, EntLRE1_1 = false;
int magic1_ = MagicNumber;

bool longPos2_ = false;
bool EnterLongSignal2_ = false;
bool EntLRE2_0, EntLRE2_1 = false;
int magic2_ = MagicNumber + 1;

bool longPos3_ = false;
bool EnterLongSignal3_ = false;
bool EntLRE3_0, EntLRE3_1 = false;
int magic3_ = MagicNumber + 2;

bool longPos4_ = false;
bool EnterLongSignal4_ = false;
bool EntLRE4_0, EntLRE4_1 = false;
int magic4_ = MagicNumber + 3;

bool longPos5_ = false;
bool EnterLongSignal5_ = false;
bool EntLRE5_0, EntLRE5_1 = false;
int magic5_ = MagicNumber + 4;

bool longPos6_ = false;
bool EnterLongSignal6_ = false;
bool EntLRE6_0, EntLRE6_1 = false;
int magic6_ = MagicNumber + 5;

bool longPos7_ = false;
bool EnterLongSignal7_ = false;
bool EntLRE7_0, EntLRE7_1 = false;
int magic7_ = MagicNumber + 6;






int maHandle1_1;
double mas1_1[1];

int maHandle2_1;
double mas2_1[1];

int maHandle3_1;
double mas3_1[1];

int maHandle4_1;
double mas4_1[1];

int maHandle5_1;
double mas5_1[1];

int maHandle6_1;
double mas6_1[1];

int maHandle7_1;
double mas7_1[1];

double lot1;
double lot2;
double lot3;
double lot4;
double lot5;
double lot6;
double lot7;

string symbols[7] = {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD"};

int OnInit(){

   maHandle1_1 = iMA(symbols[0],_Period,ma_period1_1,0,MODE_SMA,PRICE_OPEN);
   
   maHandle2_1 = iMA(symbols[1],_Period,ma_period2_1,0,MODE_SMA,PRICE_OPEN);

   maHandle3_1 = iMA(symbols[2],_Period,ma_period3_1,0,MODE_SMA,PRICE_OPEN);

   maHandle4_1 = iMA(symbols[3],_Period,ma_period4_1,0,MODE_SMA,PRICE_OPEN);

   maHandle5_1 = iMA(symbols[4],_Period,ma_period5_1,0,MODE_SMA,PRICE_OPEN);

   maHandle6_1 = iMA(symbols[5],_Period,ma_period6_1,0,MODE_SMA,PRICE_OPEN);

   maHandle7_1 = iMA(symbols[6],_Period,ma_period7_1,0,MODE_SMA,PRICE_OPEN);
   
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{
   if(Find_New_Bar()){
      
      now = Get_Current_Time();
      MqlDateTime mqlNow;
      TimeToStruct(now,mqlNow);
      if(mqlNow.hour == 23){
         closeAll = true;
      } else {
         closeAll = false;
      }
      
      if(closeAll){
         CloseAllPositions();
         longPos1_ = false;
         longPos2_ = false;
         longPos3_ = false;
         longPos4_ = false;
         longPos5_ = false;
         longPos6_ = false;
         longPos7_ = false;
         return;
      }
      
      if(mqlNow.hour != 1){return;}
      
      EntLRE1_1 = EntLRE1_0;
      
      CopyBuffer(maHandle1_1,0,0,1,mas1_1);
      
      double MA1_1 = mas1_1[0];
      
      if(MA1_1 < SymbolInfoDouble(symbols[0],SYMBOL_ASK)){EntLRE1_0 = true;} else {EntLRE1_0 = false;}
      
      if(!EntLRE1_1 && EntLRE1_0){EnterLongSignal1_ = true;} else {EnterLongSignal1_ = false;}
      
      if(CurrentOpenPositions(magic1_) < 1){
         if(EnterLongSignal1_){
            if(!BuyAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            longPos1_ = true;
         }
      }
      
      
      
      
      
      
      
      
      
      EntLRE2_1 = EntLRE2_0;
      
      CopyBuffer(maHandle2_1,0,0,1,mas2_1);
      
      double MA2_1 = mas2_1[0];
      
      if(MA2_1 < SymbolInfoDouble(symbols[1],SYMBOL_ASK)){EntLRE2_0 = true;} else {EntLRE2_0 = false;}
      
      if(!EntLRE2_1 && EntLRE2_0){EnterLongSignal2_ = true;} else {EnterLongSignal2_ = false;}
      
      if(CurrentOpenPositions(magic2_) < 1){
         if(EnterLongSignal2_){
            if(!BuyAsync(getLotSize(symbols[1],KC_USD_bet_size),magic2_,symbols[1])){Alert("Error entering long ",symbols[1],". Last error: ",GetLastError());}
            longPos2_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE3_1 = EntLRE3_0;
      
      CopyBuffer(maHandle3_1,0,0,1,mas3_1);
      
      double MA3_1 = mas3_1[0];
      
      if(MA3_1 < SymbolInfoDouble(symbols[2],SYMBOL_ASK)){EntLRE3_0 = true;} else {EntLRE3_0 = false;}
      
      if(!EntLRE3_1 && EntLRE3_0){EnterLongSignal3_ = true;} else {EnterLongSignal3_ = false;}
      
      if(CurrentOpenPositions(magic3_) < 1){
         if(EnterLongSignal3_){
            if(!BuyAsync(getLotSize(symbols[2],KC_USD_bet_size),magic3_,symbols[2])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos3_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE4_1 = EntLRE4_0;
      
      CopyBuffer(maHandle4_1,0,0,1,mas4_1);
      
      double MA4_1 = mas4_1[0];
      
      if(MA4_1 < SymbolInfoDouble(symbols[3],SYMBOL_ASK)){EntLRE4_0 = true;} else {EntLRE4_0 = false;}
      
      if(!EntLRE4_1 && EntLRE4_0){EnterLongSignal4_ = true;} else {EnterLongSignal4_ = false;}
      
      if(CurrentOpenPositions(magic4_) < 1){
         if(EnterLongSignal4_){
            if(!BuyAsync(getLotSize(symbols[3],KC_USD_bet_size),magic4_,symbols[3])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos4_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE5_1 = EntLRE5_0;
      
      CopyBuffer(maHandle5_1,0,0,1,mas5_1);
      
      double MA5_1 = mas5_1[0];
      
      if(MA5_1 < SymbolInfoDouble(symbols[4],SYMBOL_ASK)){EntLRE5_0 = true;} else {EntLRE5_0 = false;}
      
      if(!EntLRE5_1 && EntLRE5_0){EnterLongSignal5_ = true;} else {EnterLongSignal5_ = false;}
      
      if(CurrentOpenPositions(magic5_) < 1){
         if(EnterLongSignal5_){
            if(!BuyAsync(getLotSize(symbols[4],KC_USD_bet_size),magic5_,symbols[4])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos5_ = true;
         }
      }
      
      
      
      
      
      
      EntLRE6_1 = EntLRE6_0;
      
      CopyBuffer(maHandle6_1,0,0,1,mas6_1);
      
      double MA6_1 = mas6_1[0];
      
      if(MA6_1 < SymbolInfoDouble(symbols[5],SYMBOL_ASK)){EntLRE6_0 = true;} else {EntLRE6_0 = false;}
      
      if(!EntLRE6_1 && EntLRE6_0){EnterLongSignal6_ = true;} else {EnterLongSignal6_ = false;}
      
      if(CurrentOpenPositions(magic6_) < 1){
         if(EnterLongSignal6_){
            if(!BuyAsync(getLotSize(symbols[5],KC_USD_bet_size),magic6_,symbols[5])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos6_ = true;
         }
      }
      
      
      EntLRE7_1 = EntLRE7_0;
      
      CopyBuffer(maHandle7_1,0,0,1,mas7_1);
      
      double MA7_1 = mas7_1[0];
      
      if(MA7_1 < SymbolInfoDouble(symbols[6],SYMBOL_ASK)){EntLRE7_0 = true;} else {EntLRE7_0 = false;}
      
      if(!EntLRE7_1 && EntLRE7_0){EnterLongSignal7_ = true;} else {EnterLongSignal7_ = false;}
      
      if(CurrentOpenPositions(magic7_) < 1){
         if(EnterLongSignal7_){
            if(!BuyAsync(getLotSize(symbols[6],KC_USD_bet_size),magic7_,symbols[6])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos7_ = true;
         }
      }
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

bool CloseAllPositions() 
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
      if(!OrderSendAsync(req,res)){
         return false;
      }
   }
   return(true);
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
   static datetime New_Time = 0;
   
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,1,Time);

   if (New_Time != Time[0]){
      return(true);
      }
   return(false);
}

datetime Get_Current_Time(){
   static datetime Time[];
   static datetime New_Time = 0;
   
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,1,Time);

   return(Time[0]);
}


// {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD",
// "EURJPY","EURGBP","AUDJPY","NZDJPY","CHFJPY","EURCHF","GBPJPY",
// "AUDCAD","EURCAD","AUDCHF","CADJPY","CADCHF","EURAUD","GBPCAD"}

double getLotSize(string symbol, double Target_USD_value){
   //All you need to calculate Lot Size is usd value of base currency

   double leverage = 50.0;
   double denom = 100000 / leverage; // 2000

   string base = StringSubstr(symbol,0,3);
   string quote = StringSubstr(symbol,3,3);
   
   if(base=="USD"){
      return NormalizeDouble(Target_USD_value / denom,2);
   }
   else {
      string conversion_symbol;
      double conversion_price; 
      
      if(base=="EUR" || base=="GBP" || base=="AUD" || base=="NZD"){
         conversion_symbol = base;
         StringAdd(conversion_symbol,"USD"); //"XYZUSD"
         
         conversion_price = SymbolInfoDouble(conversion_symbol,SYMBOL_ASK);
         
         return NormalizeDouble(Target_USD_value * ((double)1.0 / conversion_price) / denom, 2);
      }
      
      if(base=="CHF" || base=="CAD"){
         conversion_symbol = "USD";
         StringAdd(conversion_symbol, base); //"USDXYZ"
         
         conversion_price = SymbolInfoDouble(conversion_symbol,SYMBOL_ASK);
         
         return NormalizeDouble(Target_USD_value * conversion_price / denom,2);
      }      
   }
   return 0.01;
}