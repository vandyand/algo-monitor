
#include<Trade\Trade.mqh>

CTrade trade;

input datetime splitDate;

input int sig_period1_1 = 5;
input int sig_period1_2 = 10;
input int sig_period1_3 = 40;

input double nn_weight1_1_1 = 0.01;
input double nn_weight1_1_2 = 0.01;
input double nn_weight1_1_3 = 0.01;
input double nn_weight1_1_4 = 0.01;
input double nn_weight1_1_5 = 0.01;
input double nn_weight1_1_6 = 0.01;
input double nn_weight1_1_7 = 0.01;
input double nn_weight1_1_8 = 0.01;
input double nn_weight1_1_9 = 0.01;
input double nn_weight1_1_10 = 0.01;
input double nn_weight1_1_11 = 0.01;
input double nn_weight1_1_12 = 0.01;
input double nn_weight1_1_13 = 0.01;
input double nn_weight1_1_14 = 0.01;
input double nn_weight1_1_15 = 0.01;
input double nn_weight1_1_16 = 0.01;
input double nn_weight1_1_17 = 0.01;
input double nn_weight1_1_18 = 0.01;
input double nn_weight1_1_19 = 0.01;
input double nn_weight1_1_20 = 0.01;
input double nn_weight1_1_21 = 0.01;
input double nn_weight1_2_1 = 0.01;
input double nn_weight1_2_2 = 0.01;
input double nn_weight1_2_3 = 0.01;
input double nn_weight1_2_4 = 0.01;
input double nn_weight1_2_5 = 0.01;
input double nn_weight1_2_6 = 0.01;
input double nn_weight1_2_7 = 0.01;
input double nn_weight1_2_8 = 0.01;
input double nn_weight1_2_9 = 0.01;
input double nn_weight1_2_10 = 0.01;
input double nn_weight1_2_11 = 0.01;
input double nn_weight1_2_12 = 0.01;
input double nn_weight1_2_13 = 0.01;
input double nn_weight1_2_14 = 0.01;
input double nn_weight1_2_15 = 0.01;
input double nn_weight1_2_16 = 0.01;
input double nn_weight1_2_17 = 0.01;
input double nn_weight1_2_18 = 0.01;
input double nn_weight1_2_19 = 0.01;
input double nn_weight1_2_20 = 0.01;
input double nn_weight1_2_21 = 0.01;
input double nn_weight1_3_1 = 0.01;
input double nn_weight1_3_2 = 0.01;
input double nn_weight1_3_3 = 0.01;
input double nn_weight1_3_4 = 0.01;
input double nn_weight1_3_5 = 0.01;
input double nn_weight1_3_6 = 0.01;
input double nn_weight1_3_7 = 0.01;
input double nn_weight1_3_8 = 0.01;
input double nn_weight1_3_9 = 0.01;
input double nn_weight1_3_10 = 0.01;
input double nn_weight1_3_11 = 0.01;
input double nn_weight1_3_12 = 0.01;
input double nn_weight1_3_13 = 0.01;
input double nn_weight1_3_14 = 0.01;
input double nn_weight1_3_15 = 0.01;
input double nn_weight1_3_16 = 0.01;
input double nn_weight1_3_17 = 0.01;
input double nn_weight1_3_18 = 0.01;
input double nn_weight1_3_19 = 0.01;
input double nn_weight1_3_20 = 0.01;
input double nn_weight1_3_21 = 0.01;
input double nn_weight1_4_1 = 0.01;
input double nn_weight1_4_2 = 0.01;
input double nn_weight1_4_3 = 0.01;
input double nn_weight1_4_4 = 0.01;
input double nn_weight1_4_5 = 0.01;
input double nn_weight1_4_6 = 0.01;
input double nn_weight1_4_7 = 0.01;
input double nn_weight1_4_8 = 0.01;
input double nn_weight1_4_9 = 0.01;
input double nn_weight1_4_10 = 0.01;
input double nn_weight1_4_11 = 0.01;
input double nn_weight1_4_12 = 0.01;
input double nn_weight1_4_13 = 0.01;
input double nn_weight1_4_14 = 0.01;
input double nn_weight1_4_15 = 0.01;
input double nn_weight1_4_16 = 0.01;
input double nn_weight1_4_17 = 0.01;
input double nn_weight1_4_18 = 0.01;
input double nn_weight1_4_19 = 0.01;
input double nn_weight1_4_20 = 0.01;
input double nn_weight1_4_21 = 0.01;

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
input double nn_weight3_4_1 = 0.01;
input double nn_weight3_4_2 = 0.01;
input double nn_weight3_4_3 = 0.01;
input double nn_weight3_4_4 = 0.01;
input double nn_weight3_5_1 = 0.01;
input double nn_weight3_5_2 = 0.01;
input double nn_weight3_5_3 = 0.01;
input double nn_weight3_5_4 = 0.01;
input double nn_weight3_6_1 = 0.01;
input double nn_weight3_6_2 = 0.01;
input double nn_weight3_6_3 = 0.01;
input double nn_weight3_6_4 = 0.01;
input double nn_weight3_7_1 = 0.01;
input double nn_weight3_7_2 = 0.01;
input double nn_weight3_7_3 = 0.01;
input double nn_weight3_7_4 = 0.01;
input double nn_weight3_8_1 = 0.01;
input double nn_weight3_8_2 = 0.01;
input double nn_weight3_8_3 = 0.01;
input double nn_weight3_8_4 = 0.01;
input double nn_weight3_9_1 = 0.01;
input double nn_weight3_9_2 = 0.01;
input double nn_weight3_9_3 = 0.01;
input double nn_weight3_9_4 = 0.01;
input double nn_weight3_10_1 = 0.01;
input double nn_weight3_10_2 = 0.01;
input double nn_weight3_10_3 = 0.01;
input double nn_weight3_10_4 = 0.01;
input double nn_weight3_11_1 = 0.01;
input double nn_weight3_11_2 = 0.01;
input double nn_weight3_11_3 = 0.01;
input double nn_weight3_11_4 = 0.01;
input double nn_weight3_12_1 = 0.01;
input double nn_weight3_12_2 = 0.01;
input double nn_weight3_12_3 = 0.01;
input double nn_weight3_12_4 = 0.01;
input double nn_weight3_13_1 = 0.01;
input double nn_weight3_13_2 = 0.01;
input double nn_weight3_13_3 = 0.01;
input double nn_weight3_13_4 = 0.01;
input double nn_weight3_14_1 = 0.01;
input double nn_weight3_14_2 = 0.01;
input double nn_weight3_14_3 = 0.01;
input double nn_weight3_14_4 = 0.01;

input double SL = 0.0001;
input double TP = 0.0001;
input int timeHorizon = 1;


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
int barNum = 0;
int startBar1, startBar2, startBar3, startBar4, startBar5, startBar6, startBar7 = 0;

bool longPos1, shortPos1 = false;
int magic1_ = MagicNumber;
int magic2_ = MagicNumber+1;
int magic3_ = MagicNumber+2;
int magic4_ = MagicNumber+3;
int magic5_ = MagicNumber+4;
int magic6_ = MagicNumber+5;
int magic7_ = MagicNumber+6;




double cur_price[7];

bool _longEnter1, _longExit1, _shortEnter1, _shortExit1 = false;
bool _longEnter2, _longExit2, _shortEnter2, _shortExit2 = false;
bool _longEnter3, _longExit3, _shortEnter3, _shortExit3 = false;
bool _longEnter4, _longExit4, _shortEnter4, _shortExit4 = false;
bool _longEnter5, _longExit5, _shortEnter5, _shortExit5 = false;
bool _longEnter6, _longExit6, _shortEnter6, _shortExit6 = false;
bool _longEnter7, _longExit7, _shortEnter7, _shortExit7 = false;

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

int maHandle2_1;
int maHandle2_2;
int maHandle2_3;
int stdHandle2_1;
int stdHandle2_2;
int stdHandle2_3;
double mas2_1[1];
double mas2_2[1];
double mas2_3[1];
double stds2_1[1];
double stds2_2[1];
double stds2_3[1];

int maHandle3_1;
int maHandle3_2;
int maHandle3_3;
int stdHandle3_1;
int stdHandle3_2;
int stdHandle3_3;
double mas3_1[1];
double mas3_2[1];
double mas3_3[1];
double stds3_1[1];
double stds3_2[1];
double stds3_3[1];

int maHandle4_1;
int maHandle4_2;
int maHandle4_3;
int stdHandle4_1;
int stdHandle4_2;
int stdHandle4_3;
double mas4_1[1];
double mas4_2[1];
double mas4_3[1];
double stds4_1[1];
double stds4_2[1];
double stds4_3[1];

int maHandle5_1;
int maHandle5_2;
int maHandle5_3;
int stdHandle5_1;
int stdHandle5_2;
int stdHandle5_3;
double mas5_1[1];
double mas5_2[1];
double mas5_3[1];
double stds5_1[1];
double stds5_2[1];
double stds5_3[1];

int maHandle6_1;
int maHandle6_2;
int maHandle6_3;
int stdHandle6_1;
int stdHandle6_2;
int stdHandle6_3;
double mas6_1[1];
double mas6_2[1];
double mas6_3[1];
double stds6_1[1];
double stds6_2[1];
double stds6_3[1];

int maHandle7_1;
int maHandle7_2;
int maHandle7_3;
int stdHandle7_1;
int stdHandle7_2;
int stdHandle7_3;
double mas7_1[1];
double mas7_2[1];
double mas7_3[1];
double stds7_1[1];
double stds7_2[1];
double stds7_3[1];

double lot1;

double inputs[21] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,
                    0.0,0.0,0.0,0.0,0.0,0.0,0.0,
                    0.0,0.0,0.0,0.0,0.0,0.0,0.0};

// {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDCAD","NZDUSD",
// "EURJPY","EURGBP","AUDJPY","NZDJPY","CHFJPY","EURCHF","GBPJPY",
// "AUDCAD","EURCAD","AUDCHF","CADJPY","CADCHF","EURAUD","GBPCAD"}

string symbols[7] = {"EURJPY","EURGBP","AUDJPY","NZDJPY","CHFJPY","EURCHF","GBPJPY"};

int OnInit(){

   maHandle1_1 = iMA(symbols[0],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle1_2 = iMA(symbols[0],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle1_3 = iMA(symbols[0],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_1 = iStdDev(symbols[0],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_2 = iStdDev(symbols[0],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle1_3 = iStdDev(symbols[0],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle2_1 = iMA(symbols[1],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle2_2 = iMA(symbols[1],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle2_3 = iMA(symbols[1],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle2_1 = iStdDev(symbols[1],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle2_2 = iStdDev(symbols[1],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle2_3 = iStdDev(symbols[1],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle3_1 = iMA(symbols[2],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle3_2 = iMA(symbols[2],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle3_3 = iMA(symbols[2],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle3_1 = iStdDev(symbols[2],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle3_2 = iStdDev(symbols[2],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle3_3 = iStdDev(symbols[2],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle4_1 = iMA(symbols[3],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle4_2 = iMA(symbols[3],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle4_3 = iMA(symbols[3],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle4_1 = iStdDev(symbols[3],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle4_2 = iStdDev(symbols[3],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle4_3 = iStdDev(symbols[3],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle5_1 = iMA(symbols[4],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle5_2 = iMA(symbols[4],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle5_3 = iMA(symbols[4],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle5_1 = iStdDev(symbols[4],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle5_2 = iStdDev(symbols[4],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle5_3 = iStdDev(symbols[4],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle6_1 = iMA(symbols[5],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle6_2 = iMA(symbols[5],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle6_3 = iMA(symbols[5],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle6_1 = iStdDev(symbols[5],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle6_2 = iStdDev(symbols[5],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle6_3 = iStdDev(symbols[5],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

   maHandle7_1 = iMA(symbols[6],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle7_2 = iMA(symbols[6],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle7_3 = iMA(symbols[6],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);
   stdHandle7_1 = iStdDev(symbols[6],_Period,sig_period1_1,0,MODE_SMA,PRICE_OPEN);
   stdHandle7_2 = iStdDev(symbols[6],_Period,sig_period1_2,0,MODE_SMA,PRICE_OPEN);
   stdHandle7_3 = iStdDev(symbols[6],_Period,sig_period1_3,0,MODE_SMA,PRICE_OPEN);

/*
   Print("symbol info volume min: ");
   Print(symbols[0],", ",SymbolInfoDouble(symbols[0],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[0],SYMBOL_VOLUME_STEP));
   Print(symbols[1],", ",SymbolInfoDouble(symbols[1],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[1],SYMBOL_VOLUME_STEP));
   Print(symbols[2],", ",SymbolInfoDouble(symbols[2],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[2],SYMBOL_VOLUME_STEP));
   Print(symbols[3],", ",SymbolInfoDouble(symbols[3],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[3],SYMBOL_VOLUME_STEP));
   Print(symbols[4],", ",SymbolInfoDouble(symbols[4],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[4],SYMBOL_VOLUME_STEP));
   Print(symbols[5],", ",SymbolInfoDouble(symbols[5],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[5],SYMBOL_VOLUME_STEP));
   Print(symbols[6],", ",SymbolInfoDouble(symbols[6],SYMBOL_VOLUME_MIN),SymbolInfoDouble(symbols[6],SYMBOL_VOLUME_STEP));
*/
   return(INIT_SUCCEEDED);
}

double activate(string type, double val){
   if(type == "swiss"){
      return val / (1 + MathPow(MathExp(1),val*-1));
   }
   if(type == "binary"){
      if(val > 0){
         return 1.0;
      } else if(val == 0) {
         return 0.0;
      } else {
         return -1.0;
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

bool binary(double val){
   return val > 0 ? true : false;
}

void OnTick()
{
   if(Find_New_Bar()){
      barNum++;

      now = Get_Current_Time();
      MqlDateTime mqlNow;
      MqlDateTime mqlSplit;
     
      TimeToStruct(now,mqlNow);
      TimeToStruct(splitDate,mqlSplit);
      

      if((closeAllAtEOW && mqlNow.day_of_week == 5 && mqlNow.hour >= 23) || (closeAllAtEOD && mqlNow.hour >=23)) // close all positions at 4:00 pm on Fridays
      {
         CloseAllPositions();
         return;
      }
      
      if(mqlNow.day == mqlSplit.day && mqlNow.mon == mqlSplit.mon && mqlNow.year == mqlSplit.year && mqlNow.hour >=23){ // close all positions at eod on split date
         CloseAllPositions();
         return;
      }

      if(dontTradeAroundMarketOpenClose && ((mqlNow.hour == 23 && mqlNow.min >=30) || (mqlNow.hour == 0 && mqlNow.min <= 30))){
         //Don't trade between 4:30pm and 5:30 pm b/c spread gets huuge
         return;
      }

      cur_price[0] = SymbolInfoDouble(symbols[0],SYMBOL_LAST);
      cur_price[1] = SymbolInfoDouble(symbols[1],SYMBOL_LAST);
      cur_price[2] = SymbolInfoDouble(symbols[2],SYMBOL_LAST);
      cur_price[3] = SymbolInfoDouble(symbols[3],SYMBOL_LAST);
      cur_price[4] = SymbolInfoDouble(symbols[4],SYMBOL_LAST);
      cur_price[5] = SymbolInfoDouble(symbols[5],SYMBOL_LAST);
      cur_price[6] = SymbolInfoDouble(symbols[6],SYMBOL_LAST);

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

      inputs[0] = MathAbs(cur_price[0] - lower1_1) / (upper1_1 - lower1_1 + 0.000001);
      inputs[1] = MathAbs(cur_price[0] - lower1_2) / (upper1_2 - lower1_2 + 0.000001);
      inputs[2] = MathAbs(cur_price[0] - lower1_3) / (upper1_3 - lower1_3 + 0.000001);

      CopyBuffer(maHandle2_1,0,0,1,mas2_1);
      CopyBuffer(maHandle2_2,0,0,1,mas2_2);
      CopyBuffer(maHandle2_3,0,0,1,mas2_3);
      CopyBuffer(stdHandle2_1,0,0,1,stds2_1);
      CopyBuffer(stdHandle2_2,0,0,1,stds2_2);
      CopyBuffer(stdHandle2_3,0,0,1,stds2_3);

      double MA2_1 = mas2_1[0];
      double MA2_2 = mas2_2[0];
      double MA2_3 = mas2_3[0];
      double STD2_1 = stds2_1[0];
      double STD2_2 = stds2_2[0];
      double STD2_3 = stds2_3[0];

      double lower2_1 = MA2_1 - STD2_1 * 3;
      double lower2_2 = MA2_2 - STD2_2 * 3;
      double lower2_3 = MA2_3 - STD2_3 * 3;
      double upper2_1 = MA2_1 + STD2_1 * 3;
      double upper2_2 = MA2_2 + STD2_2 * 3;
      double upper2_3 = MA2_3 + STD2_3 * 3;


      inputs[3] = MathAbs(cur_price[1] - lower2_1) / (upper2_1 - lower2_1 + 0.000001);
      inputs[4] = MathAbs(cur_price[1] - lower2_2) / (upper2_2 - lower2_2 + 0.000001);
      inputs[5] = MathAbs(cur_price[1] - lower2_3) / (upper2_3 - lower2_3 + 0.000001);

      CopyBuffer(maHandle3_1,0,0,1,mas3_1);
      CopyBuffer(maHandle3_2,0,0,1,mas3_2);
      CopyBuffer(maHandle3_3,0,0,1,mas3_3);
      CopyBuffer(stdHandle3_1,0,0,1,stds3_1);
      CopyBuffer(stdHandle3_2,0,0,1,stds3_2);
      CopyBuffer(stdHandle3_3,0,0,1,stds3_3);

      double MA3_1 = mas3_1[0];
      double MA3_2 = mas3_2[0];
      double MA3_3 = mas3_3[0];
      double STD3_1 = stds3_1[0];
      double STD3_2 = stds3_2[0];
      double STD3_3 = stds3_3[0];

      double lower3_1 = MA3_1 - STD3_1 * 3;
      double lower3_2 = MA3_2 - STD3_2 * 3;
      double lower3_3 = MA3_3 - STD3_3 * 3;
      double upper3_1 = MA3_1 + STD3_1 * 3;
      double upper3_2 = MA3_2 + STD3_2 * 3;
      double upper3_3 = MA3_3 + STD3_3 * 3;

      inputs[6] = MathAbs(cur_price[2] - lower3_1) / (upper3_1 - lower3_1 + 0.000001);
      inputs[7] = MathAbs(cur_price[2] - lower3_2) / (upper3_2 - lower3_2 + 0.000001);
      inputs[8] = MathAbs(cur_price[2] - lower3_3) / (upper3_3 - lower3_3 + 0.000001);

      CopyBuffer(maHandle4_1,0,0,1,mas4_1);
      CopyBuffer(maHandle4_2,0,0,1,mas4_2);
      CopyBuffer(maHandle4_3,0,0,1,mas4_3);
      CopyBuffer(stdHandle4_1,0,0,1,stds4_1);
      CopyBuffer(stdHandle4_2,0,0,1,stds4_2);
      CopyBuffer(stdHandle4_3,0,0,1,stds4_3);

      double MA4_1 = mas4_1[0];
      double MA4_2 = mas4_2[0];
      double MA4_3 = mas4_3[0];
      double STD4_1 = stds4_1[0];
      double STD4_2 = stds4_2[0];
      double STD4_3 = stds4_3[0];

      double lower4_1 = MA4_1 - STD4_1 * 3;
      double lower4_2 = MA4_2 - STD4_2 * 3;
      double lower4_3 = MA4_3 - STD4_3 * 3;
      double upper4_1 = MA4_1 + STD4_1 * 3;
      double upper4_2 = MA4_2 + STD4_2 * 3;
      double upper4_3 = MA4_3 + STD4_3 * 3;


      inputs[9] = MathAbs(cur_price[3] - lower4_1) / (upper4_1 - lower4_1 + 0.000001);
      inputs[10] = MathAbs(cur_price[3] - lower4_2) / (upper4_2 - lower4_2 + 0.000001);
      inputs[11] = MathAbs(cur_price[3] - lower4_3) / (upper4_3 - lower4_3 + 0.000001);

      CopyBuffer(maHandle5_1,0,0,1,mas5_1);
      CopyBuffer(maHandle5_2,0,0,1,mas5_2);
      CopyBuffer(maHandle5_3,0,0,1,mas5_3);
      CopyBuffer(stdHandle5_1,0,0,1,stds5_1);
      CopyBuffer(stdHandle5_2,0,0,1,stds5_2);
      CopyBuffer(stdHandle5_3,0,0,1,stds5_3);

      double MA5_1 = mas5_1[0];
      double MA5_2 = mas5_2[0];
      double MA5_3 = mas5_3[0];
      double STD5_1 = stds5_1[0];
      double STD5_2 = stds5_2[0];
      double STD5_3 = stds5_3[0];

      double lower5_1 = MA5_1 - STD5_1 * 3;
      double lower5_2 = MA5_2 - STD5_2 * 3;
      double lower5_3 = MA5_3 - STD5_3 * 3;
      double upper5_1 = MA5_1 + STD5_1 * 3;
      double upper5_2 = MA5_2 + STD5_2 * 3;
      double upper5_3 = MA5_3 + STD5_3 * 3;


      inputs[12] = MathAbs(cur_price[4] - lower5_1) / (upper5_1 - lower5_1 + 0.000001);
      inputs[13] = MathAbs(cur_price[4] - lower5_2) / (upper5_2 - lower5_2 + 0.000001);
      inputs[14] = MathAbs(cur_price[4] - lower5_3) / (upper5_3 - lower5_3 + 0.000001);

      CopyBuffer(maHandle6_1,0,0,1,mas6_1);
      CopyBuffer(maHandle6_2,0,0,1,mas6_2);
      CopyBuffer(maHandle6_3,0,0,1,mas6_3);
      CopyBuffer(stdHandle6_1,0,0,1,stds6_1);
      CopyBuffer(stdHandle6_2,0,0,1,stds6_2);
      CopyBuffer(stdHandle6_3,0,0,1,stds6_3);

      double MA6_1 = mas6_1[0];
      double MA6_2 = mas6_2[0];
      double MA6_3 = mas6_3[0];
      double STD6_1 = stds6_1[0];
      double STD6_2 = stds6_2[0];
      double STD6_3 = stds6_3[0];

      double lower6_1 = MA6_1 - STD6_1 * 3;
      double lower6_2 = MA6_2 - STD6_2 * 3;
      double lower6_3 = MA6_3 - STD6_3 * 3;
      double upper6_1 = MA6_1 + STD6_1 * 3;
      double upper6_2 = MA6_2 + STD6_2 * 3;
      double upper6_3 = MA6_3 + STD6_3 * 3;


      inputs[15] = MathAbs(cur_price[5] - lower6_1) / (upper6_1 - lower6_1 + 0.000001);
      inputs[16] = MathAbs(cur_price[5] - lower6_2) / (upper6_2 - lower6_2 + 0.000001);
      inputs[17] = MathAbs(cur_price[5] - lower6_3) / (upper6_3 - lower6_3 + 0.000001);

      CopyBuffer(maHandle7_1,0,0,1,mas7_1);
      CopyBuffer(maHandle7_2,0,0,1,mas7_2);
      CopyBuffer(maHandle7_3,0,0,1,mas7_3);
      CopyBuffer(stdHandle7_1,0,0,1,stds7_1);
      CopyBuffer(stdHandle7_2,0,0,1,stds7_2);
      CopyBuffer(stdHandle7_3,0,0,1,stds7_3);

      double MA7_1 = mas7_1[0];
      double MA7_2 = mas7_2[0];
      double MA7_3 = mas7_3[0];
      double STD7_1 = stds7_1[0];
      double STD7_2 = stds7_2[0];
      double STD7_3 = stds7_3[0];

      double lower7_1 = MA7_1 - STD7_1 * 3;
      double lower7_2 = MA7_2 - STD7_2 * 3;
      double lower7_3 = MA7_3 - STD7_3 * 3;
      double upper7_1 = MA7_1 + STD7_1 * 3;
      double upper7_2 = MA7_2 + STD7_2 * 3;
      double upper7_3 = MA7_3 + STD7_3 * 3;


      inputs[18] = MathAbs(cur_price[6] - lower7_1) / (upper7_1 - lower7_1 + 0.000001);
      inputs[19] = MathAbs(cur_price[6] - lower7_2) / (upper7_2 - lower7_2 + 0.000001);
      inputs[20] = MathAbs(cur_price[6] - lower7_3) / (upper7_3 - lower7_3 + 0.000001);
      

      double node1_1 = activate("swiss",inputs[0] * nn_weight1_1_1 + inputs[1] * nn_weight1_1_2 + inputs[2] * nn_weight1_1_3 + inputs[3] * nn_weight1_1_4 + inputs[4] * nn_weight1_1_5 + inputs[5] * nn_weight1_1_6 + inputs[6] * nn_weight1_1_7 + inputs[7] * nn_weight1_1_8 + inputs[8] * nn_weight1_1_9 + inputs[9] * nn_weight1_1_10 + inputs[10] * nn_weight1_1_11 + inputs[11] * nn_weight1_1_12 + inputs[12] * nn_weight1_1_13 + inputs[13] * nn_weight1_1_14 + inputs[14] * nn_weight1_1_15 + inputs[15] * nn_weight1_1_16 + inputs[16] * nn_weight1_1_17 + inputs[17] * nn_weight1_1_18 + inputs[18] * nn_weight1_1_19 + inputs[19] * nn_weight1_1_20 + inputs[20] * nn_weight1_1_21);
      double node1_2 = activate("swiss",inputs[0] * nn_weight1_2_1 + inputs[1] * nn_weight1_2_2 + inputs[2] * nn_weight1_2_3 + inputs[3] * nn_weight1_2_4 + inputs[4] * nn_weight1_2_5 + inputs[5] * nn_weight1_2_6 + inputs[6] * nn_weight1_2_7 + inputs[7] * nn_weight1_2_8 + inputs[8] * nn_weight1_2_9 + inputs[9] * nn_weight1_2_10 + inputs[10] * nn_weight1_2_11 + inputs[11] * nn_weight1_2_12 + inputs[12] * nn_weight1_2_13 + inputs[13] * nn_weight1_2_14 + inputs[14] * nn_weight1_2_15 + inputs[15] * nn_weight1_2_16 + inputs[16] * nn_weight1_2_17 + inputs[17] * nn_weight1_2_18 + inputs[18] * nn_weight1_2_19 + inputs[19] * nn_weight1_2_20 + inputs[20] * nn_weight1_2_21);
      double node1_3 = activate("swiss",inputs[0] * nn_weight1_3_1 + inputs[1] * nn_weight1_3_2 + inputs[2] * nn_weight1_3_3 + inputs[3] * nn_weight1_3_4 + inputs[4] * nn_weight1_3_5 + inputs[5] * nn_weight1_3_6 + inputs[6] * nn_weight1_3_7 + inputs[7] * nn_weight1_3_8 + inputs[8] * nn_weight1_3_9 + inputs[9] * nn_weight1_3_10 + inputs[10] * nn_weight1_3_11 + inputs[11] * nn_weight1_3_12 + inputs[12] * nn_weight1_3_13 + inputs[13] * nn_weight1_3_14 + inputs[14] * nn_weight1_3_15 + inputs[15] * nn_weight1_3_16 + inputs[16] * nn_weight1_3_17 + inputs[17] * nn_weight1_3_18 + inputs[18] * nn_weight1_3_19 + inputs[19] * nn_weight1_3_20 + inputs[20] * nn_weight1_3_21);
      double node1_4 = activate("swiss",inputs[0] * nn_weight1_4_1 + inputs[1] * nn_weight1_4_2 + inputs[2] * nn_weight1_4_3 + inputs[3] * nn_weight1_4_4 + inputs[4] * nn_weight1_4_5 + inputs[5] * nn_weight1_4_6 + inputs[6] * nn_weight1_4_7 + inputs[7] * nn_weight1_4_8 + inputs[8] * nn_weight1_4_9 + inputs[9] * nn_weight1_4_10 + inputs[10] * nn_weight1_4_11 + inputs[11] * nn_weight1_4_12 + inputs[12] * nn_weight1_4_13 + inputs[13] * nn_weight1_4_14 + inputs[14] * nn_weight1_4_15 + inputs[15] * nn_weight1_4_16 + inputs[16] * nn_weight1_4_17 + inputs[17] * nn_weight1_4_18 + inputs[18] * nn_weight1_4_19 + inputs[19] * nn_weight1_4_20 + inputs[20] * nn_weight1_4_21);

      double node2_1 = activate("swiss",node1_1 * nn_weight2_1_1 + node1_2 * nn_weight2_1_2 + node1_3 * nn_weight2_1_3 + node1_4 * nn_weight2_1_4);
      double node2_2 = activate("swiss",node1_1 * nn_weight2_2_1 + node1_2 * nn_weight2_2_2 + node1_3 * nn_weight2_2_3 + node1_4 * nn_weight2_2_4);
      double node2_3 = activate("swiss",node1_1 * nn_weight2_3_1 + node1_2 * nn_weight2_3_2 + node1_3 * nn_weight2_3_3 + node1_4 * nn_weight2_3_4);
      double node2_4 = activate("swiss",node1_1 * nn_weight2_4_1 + node1_2 * nn_weight2_4_2 + node1_3 * nn_weight2_4_3 + node1_4 * nn_weight2_4_4);

      _longEnter1 = binary(node2_1 * nn_weight3_1_1 + node2_2 * nn_weight3_1_2 + node2_3 * nn_weight3_1_3 + node2_4 * nn_weight3_1_4);
      _longEnter2 = binary(node2_1 * nn_weight3_3_1 + node2_2 * nn_weight3_3_2 + node2_3 * nn_weight3_3_3 + node2_4 * nn_weight3_3_4);
      _longEnter3 = binary(node2_1 * nn_weight3_5_1 + node2_2 * nn_weight3_5_2 + node2_3 * nn_weight3_5_3 + node2_4 * nn_weight3_5_4);
      _longEnter4 = binary(node2_1 * nn_weight3_7_1 + node2_2 * nn_weight3_7_2 + node2_3 * nn_weight3_7_3 + node2_4 * nn_weight3_7_4);
      _longEnter5 = binary(node2_1 * nn_weight3_9_1 + node2_2 * nn_weight3_9_2 + node2_3 * nn_weight3_9_3 + node2_4 * nn_weight3_9_4);
      _longEnter6 = binary(node2_1 * nn_weight3_11_1 + node2_2 * nn_weight3_11_2 + node2_3 * nn_weight3_11_3 + node2_4 * nn_weight3_11_4);
      _longEnter7 = binary(node2_1 * nn_weight3_13_1 + node2_2 * nn_weight3_13_2 + node2_3 * nn_weight3_13_3 + node2_4 * nn_weight3_13_4);
      _shortEnter1 = binary(node2_1 * nn_weight3_2_1 + node2_2 * nn_weight3_2_2 + node2_3 * nn_weight3_2_3 + node2_4 * nn_weight3_2_4);
      _shortEnter2 = binary(node2_1 * nn_weight3_4_1 + node2_2 * nn_weight3_4_2 + node2_3 * nn_weight3_4_3 + node2_4 * nn_weight3_4_4);
      _shortEnter3 = binary(node2_1 * nn_weight3_6_1 + node2_2 * nn_weight3_6_2 + node2_3 * nn_weight3_6_3 + node2_4 * nn_weight3_6_4);
      _shortEnter4 = binary(node2_1 * nn_weight3_8_1 + node2_2 * nn_weight3_8_2 + node2_3 * nn_weight3_8_3 + node2_4 * nn_weight3_8_4);
      _shortEnter5 = binary(node2_1 * nn_weight3_10_1 + node2_2 * nn_weight3_10_2 + node2_3 * nn_weight3_10_3 + node2_4 * nn_weight3_10_4);
      _shortEnter6 = binary(node2_1 * nn_weight3_12_1 + node2_2 * nn_weight3_12_2 + node2_3 * nn_weight3_12_3 + node2_4 * nn_weight3_12_4);
      _shortEnter7 = binary(node2_1 * nn_weight3_14_1 + node2_2 * nn_weight3_14_2 + node2_3 * nn_weight3_14_3 + node2_4 * nn_weight3_14_4);



      //Print("nodes: ",node3_1, node3_2);
      //Print("enters: ",_longEnter,_shortEnter);
      int num_open1 = CurrentOpenPositions(magic1_);
      int num_open2 = CurrentOpenPositions(magic2_);
      int num_open3 = CurrentOpenPositions(magic3_);
      int num_open4 = CurrentOpenPositions(magic4_);
      int num_open5 = CurrentOpenPositions(magic5_);
      int num_open6 = CurrentOpenPositions(magic6_);
      int num_open7 = CurrentOpenPositions(magic7_);

      if(num_open1 > 0){
        if(barNum > startBar1 + timeHorizon){
            CloseRecentPosition(magic1_);
            //longPos1 = false;
            //shortPos1 = false;
        }
      } else {
        if(_longEnter1 && !_shortEnter1){
            if(!BuyAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos1 = true;
            startBar1 = barNum;
        }
        if(_shortEnter1 && !_longEnter1){
            if(!SellAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos1 = true;
            startBar1 = barNum;
        }
      }



      if(num_open2 > 0){
        if(barNum > startBar2 + timeHorizon){
            CloseRecentPosition(magic2_);
            //longPos1 = false;
            //shortPos1 = false;
        }
      } else {
        if(_longEnter2 && !_shortEnter2){
            if(!BuyAsync(getLotSize(symbols[1],KC_USD_bet_size),magic2_,symbols[1])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos1 = true;
            startBar2 = barNum;
        }
        if(_shortEnter2 && !_longEnter2){
            if(!SellAsync(getLotSize(symbols[1],KC_USD_bet_size),magic2_,symbols[1])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos1 = true;
            startBar2 = barNum;
        }
      }



      if(num_open3 > 0){
        if(barNum > startBar3 + timeHorizon){
            CloseRecentPosition(magic3_);
            //longPos3 = false;
            //shortPos3 = false;
        }
      } else {
        if(_longEnter3 && !_shortEnter3){
            if(!BuyAsync(getLotSize(symbols[2],KC_USD_bet_size),magic3_,symbols[2])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos3 = true;
            startBar3 = barNum;
        }
        if(_shortEnter3 && !_longEnter3){
            if(!SellAsync(getLotSize(symbols[2],KC_USD_bet_size),magic3_,symbols[2])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos3 = true;
            startBar3 = barNum;
        }
      }



      if(num_open4 > 0){
        if(barNum > startBar4 + timeHorizon){
            CloseRecentPosition(magic4_);
            //longPos4 = false;
            //shortPos4 = false;
        }
      } else {
        if(_longEnter4 && !_shortEnter4){
            if(!BuyAsync(getLotSize(symbols[3],KC_USD_bet_size),magic4_,symbols[3])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos4 = true;
            startBar4 = barNum;
        }
        if(_shortEnter4 && !_longEnter4){
            if(!SellAsync(getLotSize(symbols[3],KC_USD_bet_size),magic4_,symbols[3])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos4 = true;
            startBar4 = barNum;
        }
      }



      if(num_open5 > 0){
        if(barNum > startBar5 + timeHorizon){
            CloseRecentPosition(magic5_);
            //longPos5 = false;
            //shortPos5 = false;
        }
      } else {
        if(_longEnter5 && !_shortEnter5){
            if(!BuyAsync(getLotSize(symbols[4],KC_USD_bet_size),magic5_,symbols[4])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos5 = true;
            startBar5 = barNum;
        }
        if(_shortEnter5 && !_longEnter5){
            if(!SellAsync(getLotSize(symbols[4],KC_USD_bet_size),magic5_,symbols[4])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos5 = true;
            startBar5 = barNum;
        }
      }



      if(num_open6 > 0){
        if(barNum > startBar6 + timeHorizon){
            CloseRecentPosition(magic6_);
            //longPos6 = false;
            //shortPos6 = false;
        }
      } else {
        if(_longEnter6 && !_shortEnter6){
            if(!BuyAsync(getLotSize(symbols[5],KC_USD_bet_size),magic6_,symbols[5])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos6 = true;
            startBar6 = barNum;
        }
        if(_shortEnter6 && !_longEnter6){
            if(!SellAsync(getLotSize(symbols[5],KC_USD_bet_size),magic6_,symbols[5])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos6 = true;
            startBar6 = barNum;
        }
      }



      if(num_open7 > 0){
        if(barNum > startBar7 + timeHorizon){
            CloseRecentPosition(magic7_);
            //longPos7 = false;
            //shortPos7 = false;
        }
      } else {
        if(_longEnter7 && !_shortEnter7){
            if(!BuyAsync(getLotSize(symbols[6],KC_USD_bet_size),magic7_,symbols[6])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            //longPos7 = true;
            startBar7 = barNum;
        }
        if(_shortEnter7 && !_longEnter7){
            if(!SellAsync(getLotSize(symbols[6],KC_USD_bet_size),magic7_,symbols[6])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
            //shortPos7 = true;
            startBar7 = barNum;
        }
      }
    }
  }




bool BuyAsync(double volume, int magicNum, string symbol){

   // double tp = NormalizeDouble(0.1,4);
   // double sl = NormalizeDouble(0.1,4);
   double _tp = TP;
   double _sl = SL;
   string quote = StringSubstr(symbol,3,3);
   if(quote == "JPY"){
      _tp = NormalizeDouble(TP*100,2);
      _sl = NormalizeDouble(SL*100,2);
   }

   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.magic       =magicNum;
   req.symbol      =symbol;
   req.volume      =volume;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_ASK);
   req.sl          =req.price - _sl;
   req.tp          =req.price + _tp;
   req.deviation   =slippage;
   req.type        =ORDER_TYPE_BUY;
   req.type_filling=ORDER_FILLING_RETURN;
   req.type_time   =ORDER_TIME_GTC;
   req.comment     ="Buy using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool SellAsync(double volume, int magicNum, string symbol){

   // double tp = NormalizeDouble(0.1,4);
   // double sl = NormalizeDouble(0.1,4);
   double _tp = TP;
   double _sl = SL;
   string quote = StringSubstr(symbol,3,3);
   if(quote == "JPY"){
      _tp = NormalizeDouble(TP*100,2);
      _sl = NormalizeDouble(SL*100,2);
   }

   MqlTradeRequest req;
   ZeroMemory(req);
   req.action      =TRADE_ACTION_DEAL;
   req.symbol      =symbol;
   req.magic       =magicNum;
   req.volume      =volume;
   req.type        =ORDER_TYPE_SELL;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_BID);
   req.sl          =req.price + _sl;
   req.tp          =req.price - _tp;
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

   double minSize = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);

   double leverage = 50.0;
   double denom = 100000 / leverage; // 2000

   string base = StringSubstr(symbol,0,3);
   string quote = StringSubstr(symbol,3,3);

   if(base=="USD"){
      double target = NormalizeDouble(Target_USD_value / denom,2);
      return target > minSize ? target : minSize;
   }
   else {
      string conversion_symbol;
      double conversion_price;

      if(base=="EUR" || base=="GBP" || base=="AUD" || base=="NZD"){
         conversion_symbol = base;
         StringAdd(conversion_symbol,"USD"); //"XYZUSD"

         conversion_price = SymbolInfoDouble(conversion_symbol,SYMBOL_ASK);

         double target = NormalizeDouble(Target_USD_value * ((double)1.0 / conversion_price) / denom, 2);
         return target > minSize ? target : minSize;
      }

      if(base=="CHF" || base=="CAD"){
         conversion_symbol = "USD";
         StringAdd(conversion_symbol, base); //"USDXYZ"

         conversion_price = SymbolInfoDouble(conversion_symbol,SYMBOL_ASK);

         double target = NormalizeDouble(Target_USD_value * conversion_price / denom,2);
         return target > minSize ? target : minSize;
      }
   }
   return minSize;
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


    //double useful_loss = gross_loss < 0 ? gross_loss > -50 ? 50 + gross_loss : 0 : 0;

    double rtn = trades > 25 ? sharpe_ratio*100 : 0;
    //double rtn = useful_loss * expectancy * expected_payoff * sharpe_ratio * regression;
    //double rtn = 50 + profit;
    //double rtn = (initial_deposit + profit) * (10000 + trades) / 1e5;
    //double rtn = profit > 0 ? (1000 + profit) * (1000 + trades) * (100 + sharpe_ratio) / 1e6: 0;
    //double rtn = profit > 0 ? (initial_deposit + profit) * (10000 + trades) * (1000 + MathSqrt(sharpe_ratio)) * (1000000 + regression) / 1e18: 0;
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

   //int arg = (nn_weight1_1_1 + nn_weight1_1_2 + nn_weight1_4_10 + nn_weight1_1_4 + nn_weight1_3_1 + nn_weight1_2_1 + nn_weight1_1_7)*1000;

   //double _max = 0.9;
   //double _min = 0.1;
   //double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;

   //rtn *= rand_scaled;

   return(rtn);
}

double getSplitScore(){

   datetime fromDate = D'1970.01.01';
   datetime futureDate = D'2030.01.01';
   
   double backNumTrades = 0.0;
   double backProfit = 0.0;
   double backMean = 0.0;
   double backSumSquares = 0.0;
   double backStd = 0.0;
   double backSharpe = 0.0;
   double foreNumTrades = 0.0;
   double foreProfit = 0.0;
   double foreMean = 0.0;
   double foreSumSquares = 0.0;
   double foreStd = 0.0;
   double foreSharpe = 0.0;
      
   HistorySelect(fromDate,splitDate);
   Alert("Back HistoryDealsTotal(): ",HistoryDealsTotal(),"*********************************");
   
   for(int i = 1;i<HistoryDealsTotal(); i++) {
      backNumTrades += 0.5;
      backProfit += HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
   }   
   
   //backProfit -= TesterStatistics(STAT_INITIAL_DEPOSIT);
   
   //backNumTrades /= 2;
   backMean = backProfit != 0 ? backProfit / backNumTrades  : 0;

   for(int i = 1;i<HistoryDealsTotal(); i+=1) {
      double profit_ = HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
      if(profit_ != 0.0 && profit_ < 9999.9){
         backSumSquares += MathPow(profit_ - backMean,2);
         //Alert("profit: ",profit_," backSumSquares: ",backSumSquares);
      }
   }

   backStd = MathPow(backSumSquares,0.5);
   backSharpe = backStd != 0 ? backMean / backStd : 0;
   
   Alert("-----------------------Back Stats-----------------------");
   Alert("backNumTrades: ",backNumTrades);
   Alert("backProfit: ",backProfit);
   Alert("backMean: ",backMean);
   Alert("backSumSquares: ",backSumSquares);
   Alert("backStd: ",backStd);
   Alert("backSharpe: ",backSharpe);
         
   HistorySelect(splitDate, futureDate);
   Alert("Fore HistoryDealsTotal(): ",HistoryDealsTotal(),"*********************************");
   
   for(int i = 0;i<HistoryDealsTotal(); i+=1) {
      foreNumTrades += 0.5;
      foreProfit += HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
   }   
   
   foreMean = foreProfit != 0 ?  foreProfit / foreNumTrades : 0;

   for(int i = 0;i<HistoryDealsTotal(); i+=1) {
      double profit_ = HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
      foreSumSquares += MathPow(profit_ - foreMean,2);
   }

   foreStd = MathPow(foreSumSquares,0.5);
   foreSharpe = foreStd != 0 ? foreMean / foreStd : 0;
   
   
   Alert("-----------------------fore Stats-----------------------");
   Alert("foreNumTrades: ",foreNumTrades);
   Alert("foreProfit: ",foreProfit);
   Alert("foreMean: ",foreMean);
   Alert("foreSumSquares: ",foreSumSquares);
   Alert("foreStd: ",foreStd);
   Alert("foreSharpe: ",foreSharpe);
   
   double spaceBetween = backSharpe != 0 ? MathAbs((foreSharpe - backSharpe) / (foreSharpe + backSharpe)) : 0;
   
   double score = backNumTrades > 25 ? backSharpe / spaceBetween : 0;
   
   
   Alert("-----------------------score Stats-----------------------");
   Alert("spaceBetween: ",spaceBetween);
   Alert("score: ",score);
   
   return score;
}

double OnTester(){
   //return(get_score());
/*
   double trades = TesterStatistics(STAT_TRADES);
   double sharpe_ratio = TesterStatistics(STAT_SHARPE_RATIO);
   double rtn = trades > 25 ? sharpe_ratio*100 : 0;
   return rtn;
*/

   return getSplitScore();   
   
}