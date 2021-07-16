
#include<Trade\Trade.mqh>

CTrade trade;
//input datetime splitDate;


input int sig_period1_1 = 5;
input int sig_period1_2 = 10;
input int sig_period1_3 = 40;

input double nn_weight1_1_1 = 0.01;
input double nn_weight1_1_2 = 0.01;
input double nn_weight1_1_3 = 0.01;
input double nn_weight1_2_1 = 0.01;
input double nn_weight1_2_2 = 0.01;
input double nn_weight1_2_3 = 0.01;
input double nn_weight1_3_1 = 0.01;
input double nn_weight1_3_2 = 0.01;
input double nn_weight1_3_3 = 0.01;
input double nn_weight1_4_1 = 0.01;
input double nn_weight1_4_2 = 0.01;
input double nn_weight1_4_3 = 0.01;

input double nn_weight2_1_1 = 0.01;
input double nn_weight2_1_2 = 0.01;
input double nn_weight2_1_3 = 0.01;
input double nn_weight2_1_4 = 0.01;
input double nn_weight2_2_1 = 0.01;
input double nn_weight2_2_2 = 0.01;
input double nn_weight2_2_3 = 0.01;
input double nn_weight2_2_4 = 0.01;
input double nn_weight2_3_1 = 0.01;
input double nn_weight2_3_2 = 0.01;
input double nn_weight2_3_3 = 0.01;
input double nn_weight2_3_4 = 0.01;
input double nn_weight2_4_1 = 0.01;
input double nn_weight2_4_2 = 0.01;
input double nn_weight2_4_3 = 0.01;
input double nn_weight2_4_4 = 0.01;

input double nn_weight3_1_1 = 0.01;
input double nn_weight3_1_2 = 0.01;
input double nn_weight3_1_3 = 0.01;
input double nn_weight3_1_4 = 0.01;
input double nn_weight3_2_1 = 0.01;
input double nn_weight3_2_2 = 0.01;
input double nn_weight3_2_3 = 0.01;
input double nn_weight3_2_4 = 0.01;
input double nn_weight3_3_1 = 0.01;
input double nn_weight3_3_2 = 0.01;
input double nn_weight3_3_3 = 0.01;
input double nn_weight3_3_4 = 0.01;




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

input int slippage = 200;
input bool closeAllAtEOW = false;
input bool closeAllAtEOD = false;
input bool dontTradeAroundMarketOpenClose = true;
double stat_values[100]; // Array for testing parameters
bool stopTrading = false;
datetime now;


bool longPos1_, shortPos1_ = false;
bool EnterLongSignal1_,ExitLongSignal1_, EnterShortSignal1_, ExitShortSignal1_ = false;
bool EntLRE1_0, EntLRE1_1, ExtLRE1_0, ExtLRE1_1, EntSRE1_0, EntSRE1_1, ExtSRE1_0, ExtSRE1_1 = false;
int magic1_ = MagicNumber;







int maHandle1_1;
int maHandle1_2;
int maHandle1_3;
int stdHandle1_1;
int stdHandle1_2;
int stdHandle1_3;
double mas1_1[1];
double mas1_2[1];
double mas1_3[1];
double stds1_1[1];
double stds1_2[1];
double stds1_3[1];

double lot1;


// {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD",
// "EURJPY","EURGBP","AUDJPY","NZDJPY","CHFJPY","EURCHF","GBPJPY",
// "AUDCAD","EURCAD","AUDCHF","CADJPY","CADCHF","EURAUD","GBPCAD"}

string symbols[7] = {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD"};

int OnInit(){

   maHandle1_1 = iMA(symbols[0],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle1_2 = iMA(symbols[0],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle1_3 = iMA(symbols[0],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_1 = iStdDev(symbols[0],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_2 = iStdDev(symbols[0],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_3 = iStdDev(symbols[0],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}

double activate(string type, double val){
   if(type == "swiss"){
      return val / (1 + MathPow(MathExp(1),val*-1));
   }
   if(type == "binary"){
      if(val > 0){
         return 1;
      } else if(val == 0) {
         return 0;
      } else {
         return -1;
      }
   }
   if(type == "tanh"){
      return (MathExp(val) - MathExp(val*-1)) / (MathExp(val) + MathExp(val*-1));
   }
   if(type == "relu"){
      if(val > 0){
         return val;
      } else {
         return val * 0.01;
      }
   }
   return 0;
}

void OnTick()
{
   if(Find_New_Bar()){
   
      now = Get_Current_Time();
      MqlDateTime mqlNow;
      TimeToStruct(now,mqlNow);
      
      if((closeAllAtEOW && mqlNow.day_of_week == 5 && mqlNow.hour >= 23) || (closeAllAtEOD && mqlNow.hour >=23)) // close all positions at 4:00 pm on Fridays
      {
         CloseAllPositions();
         longPos1_ = false;
         shortPos1_ = false;
         return;
      }
      
      if(dontTradeAroundMarketOpenClose && ((mqlNow.hour == 23 && mqlNow.min >=30) || (mqlNow.hour == 0 && mqlNow.min <= 30))){
         //Don't trade between 4:30pm and 5:30 pm b/c spread gets huuge
         return;
      }
      
      CopyBuffer(maHandle1_1,0,0,1,mas1_1);
      CopyBuffer(maHandle1_2,0,0,1,mas1_2);
      CopyBuffer(maHandle1_3,0,0,1,mas1_3);
      CopyBuffer(stdHandle1_1,0,0,1,stds1_1);
      CopyBuffer(stdHandle1_2,0,0,1,stds1_2);
      CopyBuffer(stdHandle1_3,0,0,1,stds1_3);
      
      double MA1_1 = mas1_1[0];
      double MA1_2 = mas1_2[0];
      double MA1_3 = mas1_3[0];
      double STD1_1 = stds1_1[0];
      double STD1_2 = stds1_2[0];
      double STD1_3 = stds1_3[0];
      
      double lower1_1 = MA1_1 - STD1_1 * 3;
      double lower1_2 = MA1_2 - STD1_2 * 3;
      double lower1_3 = MA1_3 - STD1_3 * 3;
      double upper1_1 = MA1_1 + STD1_1 * 3;
      double upper1_2 = MA1_2 + STD1_2 * 3;
      double upper1_3 = MA1_3 + STD1_3 * 3;

      double cur_price = SymbolInfoDouble(symbols[0],SYMBOL_LAST);

      double scaled1 = MathAbs(cur_price - lower1_1) / (upper1_1 - lower1_1);
      double scaled2 = MathAbs(cur_price - lower1_2) / (upper1_2 - lower1_2);
      double scaled3 = MathAbs(cur_price - lower1_3) / (upper1_3 - lower1_3);


      bool _long, _neutral, _short = false;

      double node1_1 = activate("swiss",scaled1 * nn_weight1_1_1 + scaled2 * nn_weight1_1_2 + scaled3 * nn_weight1_1_3);
      double node1_2 = activate("swiss",scaled1 * nn_weight1_2_1 + scaled2 * nn_weight1_2_2 + scaled3 * nn_weight1_2_3);
      double node1_3 = activate("swiss",scaled1 * nn_weight1_3_1 + scaled2 * nn_weight1_3_2 + scaled3 * nn_weight1_3_3);
      double node1_4 = activate("swiss",scaled1 * nn_weight1_4_1 + scaled2 * nn_weight1_4_2 + scaled3 * nn_weight1_4_3);

      

      double node2_1 = activate("swiss",node1_1 * nn_weight2_1_1 + node1_2 * nn_weight2_1_2 + node1_3 * nn_weight2_1_3 + node1_4 * nn_weight2_1_4);
      double node2_2 = activate("swiss",node1_1 * nn_weight2_2_1 + node1_2 * nn_weight2_2_2 + node1_3 * nn_weight2_2_3 + node1_4 * nn_weight2_2_4);
      double node2_3 = activate("swiss",node1_1 * nn_weight2_3_1 + node1_2 * nn_weight2_3_2 + node1_3 * nn_weight2_3_3 + node1_4 * nn_weight2_3_4);
      double node2_4 = activate("swiss",node1_1 * nn_weight2_4_1 + node1_2 * nn_weight2_4_2 + node1_3 * nn_weight2_4_3 + node1_4 * nn_weight2_4_4);


      double node3_1 = activate("swiss",node2_1 * nn_weight3_1_1 + node2_2 * nn_weight3_1_2 + node2_3 * nn_weight3_1_3 + node2_4 * nn_weight3_1_4);
      double node3_2 = activate("swiss",node2_1 * nn_weight3_2_1 + node2_2 * nn_weight3_2_2 + node2_3 * nn_weight3_2_3 + node2_4 * nn_weight3_2_4);
      double node3_3 = activate("swiss",node2_1 * nn_weight3_3_1 + node2_2 * nn_weight3_3_2 + node2_3 * nn_weight3_3_3 + node2_4 * nn_weight3_3_4);

      if(node3_1 > node3_2 && node3_1 > node3_3){
         _long = true;
         _neutral = false;
         _short = false;
      } else if(node3_3 > node3_2 && node3_3 > node3_1){
         _long = false;
         _neutral = false;
         _short = true;
      } else {
         _long = false;
         _neutral = true;
         _short = false;
      }

      int num_open = CurrentOpenPositions(magic1_);

      if(num_open >= 1){
         if(_neutral){
            CloseRecentPosition(magic1_);
            //while(!CloseRecentPosition(symbols[0])){Sleep(100);}
            // longPos1_ = false;
            // shortPos1_ = false;
         }
      } else {
         if(_long){
            if(!BuyAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[0])){Sleep(100);}
            // longPos1_ = true;
         }
         if(_short){
            if(!SellAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[0])){Sleep(100);}
            // shortPos1_ = true;
         }
      }
   }
}



bool BuyAsync(double volume, int magicNum, string symbol){

   double tp = NormalizeDouble(0.1,4);
   double sl = NormalizeDouble(0.1,4);
   
   string quote = StringSubstr(symbol,3,3);
   if(quote == "JPY"){
      tp = NormalizeDouble(tp*100,2);
      sl = NormalizeDouble(sl*100,2);
   }

   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.magic       =magicNum;
   req.symbol      =symbol;
   req.volume      =volume;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_ASK);
   req.sl          =req.price - sl;
   req.tp          =req.price + tp;
   req.deviation   =slippage;
   req.type        =ORDER_TYPE_BUY;
   req.type_filling=ORDER_FILLING_RETURN;
   req.type_time   =ORDER_TIME_GTC;
   req.comment     ="Buy using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool SellAsync(double volume, int magicNum, string symbol){
   
   double tp = NormalizeDouble(0.1,4);
   double sl = NormalizeDouble(0.1,4);
   
   string quote = StringSubstr(symbol,3,3);
   if(quote == "JPY"){
      tp = NormalizeDouble(tp*100,2);
      sl = NormalizeDouble(sl*100,2);
   }
   
   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.symbol      =symbol;
   req.magic       =magicNum;
   req.volume      =volume;
   req.type        =ORDER_TYPE_SELL;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_BID);
   req.sl          =req.price + sl;
   req.tp          =req.price - tp;
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

datetime Get_Current_Time(){
   static datetime Time[];
   static datetime New_Time = 0;
   
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,1,Time);

   return(Time[0]);
}

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