
#include<Trade\Trade.mqh>

CTrade trade;

input int ma_period1 = 1;
input int ma_period2 = 2;
input int ma_period3 = 1;
input int ma_period4 = 2;
input int ma_period5 = 1;
input int ma_period6 = 2;
input int ma_period7 = 1;
input int ma_period8 = 2;
input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
input bool write_to_file = true;
input string file_name = "temp";
input string file_dir_distinguish = "SetA";
int input MagicNumber = 200;
double input Lots = 0.01;
input bool close_at_end_of_week = true;

int slippage = 100;

double stat_values[100]; // Array for testing parameters



bool EquityCrunch = false;
bool EnterLongSignal = false;
bool ExitLongSignal = false;
bool EnterShortSignal = false;
bool ExitShortSignal = false;
bool EntLRE0, EntLRE1, ExtLRE0, ExtLRE1, EntSRE0, EntSRE1, ExtSRE0, ExtSRE1 = false;
bool stopTrading = false;
bool longPos = false;
bool shortPos = false;

int barNum = 0;
int closeBar = 0;

double startingBalance = 0.0;

int maHandle1;
int maHandle2;
int maHandle3;
int maHandle4;
int maHandle5;
int maHandle6;
int maHandle7;
int maHandle8;
double mas1[1];
double mas2[1];
double mas3[1];
double mas4[1];
double mas5[1];
double mas6[1];
double mas7[1];
double mas8[1];

int OnInit(){

   maHandle1 = iMA(_Symbol,_Period,ma_period1,0,MODE_SMA,PRICE_OPEN);
   maHandle2 = iMA(_Symbol,_Period,ma_period2,0,MODE_SMA,PRICE_OPEN);
   maHandle3 = iMA(_Symbol,_Period,ma_period3,0,MODE_SMA,PRICE_OPEN);
   maHandle4 = iMA(_Symbol,_Period,ma_period4,0,MODE_SMA,PRICE_OPEN);
   maHandle5 = iMA(_Symbol,_Period,ma_period5,0,MODE_SMA,PRICE_OPEN);
   maHandle6 = iMA(_Symbol,_Period,ma_period6,0,MODE_SMA,PRICE_OPEN);
   maHandle7 = iMA(_Symbol,_Period,ma_period7,0,MODE_SMA,PRICE_OPEN);
   maHandle8 = iMA(_Symbol,_Period,ma_period8,0,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{

   // End of week exit stuff
   MqlDateTime tm;
   TimeCurrent(tm);
   
   if(close_at_end_of_week == true && tm.day_of_week == 5 && tm.hour == 23 && tm.min > 47 && PositionsTotal() > 0){
      stopTrading = true;
   }


   if(Find_New_Bar()){
      barNum++;
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
      double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
      
      double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
      
      if(barNum == 1){
         startingBalance = Balance;
      }
      
      //Lots = NormalizeDouble(0.11 * (Balance / startingBalance),2);
   
      
      EntLRE1 = EntLRE0;
      ExtLRE1 = ExtLRE0;
      EntSRE1 = EntSRE0;
      ExtSRE1 = ExtSRE0;
      
      
      CopyBuffer(maHandle1,0,0,1,mas1);
      CopyBuffer(maHandle2,0,0,1,mas2);
      CopyBuffer(maHandle3,0,0,1,mas3);
      CopyBuffer(maHandle4,0,0,1,mas4);
      CopyBuffer(maHandle5,0,0,1,mas5);
      CopyBuffer(maHandle6,0,0,1,mas6);
      CopyBuffer(maHandle7,0,0,1,mas7);
      CopyBuffer(maHandle8,0,0,1,mas8);
      
      double MA1 = mas1[0];
      double MA2 = mas2[0];
      double MA3 = mas3[0];
      double MA4 = mas4[0];
      double MA5 = mas5[0];
      double MA6 = mas6[0];
      double MA7 = mas7[0];
      double MA8 = mas8[0];
      
      
      if(MA1 > MA2){
         EntLRE0 = true;
      } else {
         EntLRE0 = false;
      }
      if(MA3 < MA4){
         ExtLRE0 = true;
      } else {
         ExtLRE0 = false;
      }
      
      if(MA5 > MA6){
         EntSRE0 = true;
      } else {
         EntSRE0 = false;
      }
      if(MA7 < MA8){
         ExtSRE0 = true;
      } else {
         ExtSRE0 = false;
      }
   
      if(!EntLRE1 && EntLRE0){
         EnterLongSignal = true;
      } else {
         EnterLongSignal = false;
      }
      if(!ExtLRE1 && ExtLRE0){
         ExitLongSignal = true;
      } else {
         ExitLongSignal = false;
      }
      
      if(!EntSRE1 && EntSRE0){
         EnterShortSignal = true;
      } else {
         EnterShortSignal = false;
      }
      if(!ExtSRE1 && ExtSRE0){
         ExitShortSignal = true;
      } else {
         ExitShortSignal = false;
      }
      
      
      if(stopTrading || (longPos && ExitLongSignal) || (shortPos && ExitShortSignal)){
         while(!CloseRecentPosition()){Sleep(100);}
         longPos = false;
         shortPos = false;
      }
      
      
      if(CurrentOpenPositions(MagicNumber) < 1 && !stopTrading){
         if(EnterLongSignal && !EnterShortSignal && !ExitLongSignal){
            while(!BuyAsync(Lots)){Sleep(100);}
            longPos = true;
         }
         if(EnterShortSignal && !EnterLongSignal && !ExitShortSignal){
            while(!SellAsync(Lots)){Sleep(100);}
            shortPos = true;
         }
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























int fileHandle = 0;



string name1="ma_period1";
bool enable1;
long par1,par1_start,par1_step,par1_stop;

string name2="ma_period2";
bool enable2;
long par2,par2_start,par2_step,par2_stop;

string name3="ma_period3";
bool enable3;
long par3,par3_start,par3_step,par3_stop;

string name4="ma_period4";
bool enable4;
long par4,par4_start,par4_step,par4_stop;

//+--------------------------------------------------------------------+
//| Optimization start                                                 |
//+--------------------------------------------------------------------+
void OnTesterInit(){

   if(write_to_file){
      string file_dir = MQLInfoString(MQL_PROGRAM_NAME) + "-" + Symbol() + "-" + tf() + "-" + file_dir_distinguish + "\\";
      fileHandle=FileOpen(file_dir+file_name+".csv",FILE_READ|FILE_WRITE|FILE_CSV|FILE_COMMON,',');
      bool seek = FileSeek(fileHandle, 0, SEEK_END);

      Print(__FUNCTION__,"(): Start Optimization \n-----------");

      ParameterGetRange(name1,enable1,par1,par1_start,par1_step,par1_stop);
      ParameterGetRange(name2,enable2,par2,par2_start,par2_step,par2_stop);
      ParameterGetRange(name3,enable3,par3,par3_start,par3_step,par3_stop);
      ParameterGetRange(name4,enable4,par4,par4_start,par4_step,par4_stop);
   }
}

//+--------------------------------------------------------------------+
//| Test completion event handler                                      |
//+--------------------------------------------------------------------+
double OnTester()
  {
//--- If writing of optimization results is enabled
   if(write_to_file)
     {
      //--- Fill the array with test values
      GetTestStatistics(stat_values);
      //--- Create a frame
      FrameAdd("Statistics",1,0,stat_values);
     }
//---
   return(0.0);
  }

//+--------------------------------------------------------------------+
//| Next optimization pass                                             |
//+--------------------------------------------------------------------+
void OnTesterPass(){
   

//--- If writing of optimization results is enabled
   if(write_to_file){
      string name ="";  // Public name/frame label
      ulong  pass =0;   // Number of the optimization pass at which the frame is added
      long   id   =0;   // Public id of the frame
      double val  =0.0; // Single numerical value of the frame
      //---
      
      while(FrameNext(pass,name,id,val,stat_values)){
      //---
      //Print(__FUNCTION__,"(): pass: "+IntegerToString(pass)+"; STAT_PROFIT: ",DoubleToString(stat_values[0],2));
      
      ulong bytes = FileWrite(fileHandle,
         DoubleToString(stat_values[0],4),DoubleToString(stat_values[1],4),
         DoubleToString(stat_values[2],4),DoubleToString(stat_values[3],4),
         DoubleToString(stat_values[4],4),DoubleToString(stat_values[5],4),
         DoubleToString(stat_values[6],4),DoubleToString(stat_values[7],0),
         DoubleToString(stat_values[8],4),DoubleToString(stat_values[9],0),
         DoubleToString(stat_values[10],4),DoubleToString(stat_values[11],0),
         DoubleToString(stat_values[12],4),DoubleToString(stat_values[13],0),
         DoubleToString(stat_values[14],4),DoubleToString(stat_values[15],4),
         DoubleToString(stat_values[16],4),DoubleToString(stat_values[17],4),
         DoubleToString(stat_values[18],4),DoubleToString(stat_values[19],4),
         DoubleToString(stat_values[20],4),DoubleToString(stat_values[21],4),
         DoubleToString(stat_values[22],4),DoubleToString(stat_values[23],4),
         DoubleToString(stat_values[24],4),DoubleToString(stat_values[25],4),
         DoubleToString(stat_values[26],4),DoubleToString(stat_values[27],4),
         DoubleToString(stat_values[28],4),DoubleToString(stat_values[29],4),
         DoubleToString(stat_values[30],0),DoubleToString(stat_values[31],0),
         DoubleToString(stat_values[32],0),DoubleToString(stat_values[33],0),
         DoubleToString(stat_values[34],0),DoubleToString(stat_values[35],0),
         DoubleToString(stat_values[36],0),DoubleToString(stat_values[37],0),
         DoubleToString(stat_values[38],0),DoubleToString(stat_values[39],0),
         DoubleToString(stat_values[40],0),DoubleToString(stat_values[41],0),
         DoubleToString(stat_values[42],0),DoubleToString(stat_values[43],0),
         DoubleToString(stat_values[44],0),DoubleToString(stat_values[45],0),
         DoubleToString(stat_values[46],0),DoubleToString(stat_values[47],0),
         DoubleToString(stat_values[48],0));
      }
   }
}

//+--------------------------------------------------------------------+
//| End of optimization                                                |
//+--------------------------------------------------------------------+
void OnTesterDeinit()
  {
   Print("-----------\n",__FUNCTION__,"(): End Optimization");
//--- If writing of optimization results is enabled
   if(write_to_file){
      FileClose(fileHandle);
   }
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

   stat_array[40]=iter;//int
   stat_array[41]=ma_period1;//int
   stat_array[42]=ma_period2;//int
   stat_array[43]=ma_period3;//int
   stat_array[44]=ma_period4;//int
   stat_array[45]=ma_period5;//int
   stat_array[46]=ma_period6;//int
   stat_array[47]=ma_period7;//int
   stat_array[48]=ma_period8;//int
  
  }




string tf(){
   switch(Period()){
      case PERIOD_M1: return("M1");
      case PERIOD_M2: return("M2");
      case PERIOD_M3: return("M3");
      case PERIOD_M4: return("M4");
      case PERIOD_M5: return("M5");
      case PERIOD_M6: return("M6");
      case PERIOD_M10: return("M10");
      case PERIOD_M15: return("M15");
      case PERIOD_M20: return("M20");
      case PERIOD_M30: return("M30");
      case PERIOD_H1: return("H1");
      case PERIOD_H2: return("H2");
      case PERIOD_H3: return("H3");
      case PERIOD_H4: return("H4");
      case PERIOD_H6: return("H6");
      case PERIOD_H8: return("H8");
      case PERIOD_H12: return("H12");
      case PERIOD_D1: return("D1");
      case PERIOD_W1: return("W1");
      case PERIOD_MN1: return("MN1");
      default:return("Unknown timeframe");
   }
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


