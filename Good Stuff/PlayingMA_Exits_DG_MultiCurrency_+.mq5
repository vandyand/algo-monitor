
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

input int ma_symbol1 = 0;
input int ma_symbol2 = 0;
input int ma_symbol3 = 0;
input int ma_symbol4 = 0;
input int ma_symbol5 = 0;
input int ma_symbol6 = 0;
input int ma_symbol7 = 0;

//input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
//input string file_name = "temp";
input int symbol_set = 1;
int input MagicNumber = 200;
double input Lots = 0.01;

int slippage = 100;
int barNum = 0;
double stat_values[100]; // Array for testing parameters
bool stopTrading = false;


bool longPos1_, shortPos1_ = false;
bool EnterLongSignal1_,ExitLongSignal1_, EnterShortSignal1_, ExitShortSignal1_ = false;
bool EntLRE1_0, EntLRE1_1, ExtLRE1_0, ExtLRE1_1, EntSRE1_0, EntSRE1_1, ExtSRE1_0, ExtSRE1_1 = false;
int magic1_ = MagicNumber;

bool longPos2_, shortPos2_ = false;
bool EnterLongSignal2_,ExitLongSignal2_, EnterShortSignal2_, ExitShortSignal2_ = false;
bool EntLRE2_0, EntLRE2_1, ExtLRE2_0, ExtLRE2_1, EntSRE2_0, EntSRE2_1, ExtSRE2_0, ExtSRE2_1 = false;
int magic2_ = MagicNumber + 1;

bool longPos3_, shortPos3_ = false;
bool EnterLongSignal3_,ExitLongSignal3_, EnterShortSignal3_, ExitShortSignal3_ = false;
bool EntLRE3_0, EntLRE3_1, ExtLRE3_0, ExtLRE3_1, EntSRE3_0, EntSRE3_1, ExtSRE3_0, ExtSRE3_1 = false;
int magic3_ = MagicNumber + 2;

bool longPos4_, shortPos4_ = false;
bool EnterLongSignal4_,ExitLongSignal4_, EnterShortSignal4_, ExitShortSignal4_ = false;
bool EntLRE4_0, EntLRE4_1, ExtLRE4_0, ExtLRE4_1, EntSRE4_0, EntSRE4_1, ExtSRE4_0, ExtSRE4_1 = false;
int magic4_ = MagicNumber + 3;

bool longPos5_, shortPos5_ = false;
bool EnterLongSignal5_,ExitLongSignal5_, EnterShortSignal5_, ExitShortSignal5_ = false;
bool EntLRE5_0, EntLRE5_1, ExtLRE5_0, ExtLRE5_1, EntSRE5_0, EntSRE5_1, ExtSRE5_0, ExtSRE5_1 = false;
int magic5_ = MagicNumber + 4;

bool longPos6_, shortPos6_ = false;
bool EnterLongSignal6_,ExitLongSignal6_, EnterShortSignal6_, ExitShortSignal6_ = false;
bool EntLRE6_0, EntLRE6_1, ExtLRE6_0, ExtLRE6_1, EntSRE6_0, EntSRE6_1, ExtSRE6_0, ExtSRE6_1 = false;
int magic6_ = MagicNumber + 5;

bool longPos7_, shortPos7_ = false;
bool EnterLongSignal7_,ExitLongSignal7_, EnterShortSignal7_, ExitShortSignal7_ = false;
bool EntLRE7_0, EntLRE7_1, ExtLRE7_0, ExtLRE7_1, EntSRE7_0, EntSRE7_1, ExtSRE7_0, ExtSRE7_1 = false;
int magic7_ = MagicNumber + 6;






int maHandle1_1;
int maHandle1_2;
int maHandle1_3;
int maHandle1_4;
int maHandle1_5;
int maHandle1_6;
int maHandle1_7;
int maHandle1_8;
double mas1_1[1];
double mas1_2[1];
double mas1_3[1];
double mas1_4[1];
double mas1_5[1];
double mas1_6[1];
double mas1_7[1];
double mas1_8[1];

int maHandle2_1;
int maHandle2_2;
int maHandle2_3;
int maHandle2_4;
int maHandle2_5;
int maHandle2_6;
int maHandle2_7;
int maHandle2_8;
double mas2_1[1];
double mas2_2[1];
double mas2_3[1];
double mas2_4[1];
double mas2_5[1];
double mas2_6[1];
double mas2_7[1];
double mas2_8[1];

int maHandle3_1;
int maHandle3_2;
int maHandle3_3;
int maHandle3_4;
int maHandle3_5;
int maHandle3_6;
int maHandle3_7;
int maHandle3_8;
double mas3_1[1];
double mas3_2[1];
double mas3_3[1];
double mas3_4[1];
double mas3_5[1];
double mas3_6[1];
double mas3_7[1];
double mas3_8[1];

int maHandle4_1;
int maHandle4_2;
int maHandle4_3;
int maHandle4_4;
int maHandle4_5;
int maHandle4_6;
int maHandle4_7;
int maHandle4_8;
double mas4_1[1];
double mas4_2[1];
double mas4_3[1];
double mas4_4[1];
double mas4_5[1];
double mas4_6[1];
double mas4_7[1];
double mas4_8[1];

int maHandle5_1;
int maHandle5_2;
int maHandle5_3;
int maHandle5_4;
int maHandle5_5;
int maHandle5_6;
int maHandle5_7;
int maHandle5_8;
double mas5_1[1];
double mas5_2[1];
double mas5_3[1];
double mas5_4[1];
double mas5_5[1];
double mas5_6[1];
double mas5_7[1];
double mas5_8[1];

int maHandle6_1;
int maHandle6_2;
int maHandle6_3;
int maHandle6_4;
int maHandle6_5;
int maHandle6_6;
int maHandle6_7;
int maHandle6_8;
double mas6_1[1];
double mas6_2[1];
double mas6_3[1];
double mas6_4[1];
double mas6_5[1];
double mas6_6[1];
double mas6_7[1];
double mas6_8[1];

int maHandle7_1;
int maHandle7_2;
int maHandle7_3;
int maHandle7_4;
int maHandle7_5;
int maHandle7_6;
int maHandle7_7;
int maHandle7_8;
double mas7_1[1];
double mas7_2[1];
double mas7_3[1];
double mas7_4[1];
double mas7_5[1];
double mas7_6[1];
double mas7_7[1];
double mas7_8[1];


string symbols[21] = {"EURUSD","AUDUSD","USDJPY","GBPUSD","USDCHF","USDSGD","USDCAD",
                     "EURGBP","EURJPY","AUDJPY","AUDCAD","CHFJPY","EURCHF","GBPJPY",
                     "NZDUSD","EURCAD","NZDJPY","AUDCHF","CADJPY","CADCHF","GBPCHF"};
int n = 7*(symbol_set-1);

int OnInit(){

   int ma_init1 = iMA(symbols[0],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init2 = iMA(symbols[1],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init3 = iMA(symbols[2],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init4 = iMA(symbols[3],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init5 = iMA(symbols[4],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init6 = iMA(symbols[5],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init7 = iMA(symbols[6],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init8 = iMA(symbols[7],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init9 = iMA(symbols[8],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init10 = iMA(symbols[9],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init11 = iMA(symbols[10],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init12 = iMA(symbols[11],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init13 = iMA(symbols[12],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init14 = iMA(symbols[13],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init15 = iMA(symbols[14],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init16 = iMA(symbols[15],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init17 = iMA(symbols[16],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init18 = iMA(symbols[17],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init19 = iMA(symbols[18],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init20 = iMA(symbols[19],_Period,40,0,MODE_SMA,PRICE_OPEN);
   int ma_init21 = iMA(symbols[20],_Period,40,0,MODE_SMA,PRICE_OPEN);

   maHandle1_1 = iMA(symbols[ma_symbol1],_Period,ma_period1_1,0,MODE_SMA,PRICE_OPEN);
   maHandle1_2 = iMA(symbols[ma_symbol1],_Period,ma_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle1_3 = iMA(symbols[ma_symbol1],_Period,ma_period1_3,0,MODE_SMA,PRICE_OPEN);
   maHandle1_4 = iMA(symbols[ma_symbol1],_Period,ma_period1_4,0,MODE_SMA,PRICE_OPEN);
   maHandle1_5 = iMA(symbols[ma_symbol1],_Period,ma_period1_5,0,MODE_SMA,PRICE_OPEN);
   maHandle1_6 = iMA(symbols[ma_symbol1],_Period,ma_period1_6,0,MODE_SMA,PRICE_OPEN);
   maHandle1_7 = iMA(symbols[ma_symbol1],_Period,ma_period1_7,0,MODE_SMA,PRICE_OPEN);
   maHandle1_8 = iMA(symbols[ma_symbol1],_Period,ma_period1_8,0,MODE_SMA,PRICE_OPEN);
   
   maHandle2_1 = iMA(symbols[ma_symbol2],_Period,ma_period2_1,0,MODE_SMA,PRICE_OPEN);
   maHandle2_2 = iMA(symbols[ma_symbol2],_Period,ma_period2_2,0,MODE_SMA,PRICE_OPEN);
   maHandle2_3 = iMA(symbols[ma_symbol2],_Period,ma_period2_3,0,MODE_SMA,PRICE_OPEN);
   maHandle2_4 = iMA(symbols[ma_symbol2],_Period,ma_period2_4,0,MODE_SMA,PRICE_OPEN);
   maHandle2_5 = iMA(symbols[ma_symbol2],_Period,ma_period2_5,0,MODE_SMA,PRICE_OPEN);
   maHandle2_6 = iMA(symbols[ma_symbol2],_Period,ma_period2_6,0,MODE_SMA,PRICE_OPEN);
   maHandle2_7 = iMA(symbols[ma_symbol2],_Period,ma_period2_7,0,MODE_SMA,PRICE_OPEN);
   maHandle2_8 = iMA(symbols[ma_symbol2],_Period,ma_period2_8,0,MODE_SMA,PRICE_OPEN);

   maHandle3_1 = iMA(symbols[ma_symbol3],_Period,ma_period3_1,0,MODE_SMA,PRICE_OPEN);
   maHandle3_2 = iMA(symbols[ma_symbol3],_Period,ma_period3_2,0,MODE_SMA,PRICE_OPEN);
   maHandle3_3 = iMA(symbols[ma_symbol3],_Period,ma_period3_3,0,MODE_SMA,PRICE_OPEN);
   maHandle3_4 = iMA(symbols[ma_symbol3],_Period,ma_period3_4,0,MODE_SMA,PRICE_OPEN);
   maHandle3_5 = iMA(symbols[ma_symbol3],_Period,ma_period3_5,0,MODE_SMA,PRICE_OPEN);
   maHandle3_6 = iMA(symbols[ma_symbol3],_Period,ma_period3_6,0,MODE_SMA,PRICE_OPEN);
   maHandle3_7 = iMA(symbols[ma_symbol3],_Period,ma_period3_7,0,MODE_SMA,PRICE_OPEN);
   maHandle3_8 = iMA(symbols[ma_symbol3],_Period,ma_period3_8,0,MODE_SMA,PRICE_OPEN);

   maHandle4_1 = iMA(symbols[ma_symbol4],_Period,ma_period4_1,0,MODE_SMA,PRICE_OPEN);
   maHandle4_2 = iMA(symbols[ma_symbol4],_Period,ma_period4_2,0,MODE_SMA,PRICE_OPEN);
   maHandle4_3 = iMA(symbols[ma_symbol4],_Period,ma_period4_3,0,MODE_SMA,PRICE_OPEN);
   maHandle4_4 = iMA(symbols[ma_symbol4],_Period,ma_period4_4,0,MODE_SMA,PRICE_OPEN);
   maHandle4_5 = iMA(symbols[ma_symbol4],_Period,ma_period4_5,0,MODE_SMA,PRICE_OPEN);
   maHandle4_6 = iMA(symbols[ma_symbol4],_Period,ma_period4_6,0,MODE_SMA,PRICE_OPEN);
   maHandle4_7 = iMA(symbols[ma_symbol4],_Period,ma_period4_7,0,MODE_SMA,PRICE_OPEN);
   maHandle4_8 = iMA(symbols[ma_symbol4],_Period,ma_period4_8,0,MODE_SMA,PRICE_OPEN);

   maHandle5_1 = iMA(symbols[ma_symbol5],_Period,ma_period5_1,0,MODE_SMA,PRICE_OPEN);
   maHandle5_2 = iMA(symbols[ma_symbol5],_Period,ma_period5_2,0,MODE_SMA,PRICE_OPEN);
   maHandle5_3 = iMA(symbols[ma_symbol5],_Period,ma_period5_3,0,MODE_SMA,PRICE_OPEN);
   maHandle5_4 = iMA(symbols[ma_symbol5],_Period,ma_period5_4,0,MODE_SMA,PRICE_OPEN);
   maHandle5_5 = iMA(symbols[ma_symbol5],_Period,ma_period5_5,0,MODE_SMA,PRICE_OPEN);
   maHandle5_6 = iMA(symbols[ma_symbol5],_Period,ma_period5_6,0,MODE_SMA,PRICE_OPEN);
   maHandle5_7 = iMA(symbols[ma_symbol5],_Period,ma_period5_7,0,MODE_SMA,PRICE_OPEN);
   maHandle5_8 = iMA(symbols[ma_symbol5],_Period,ma_period5_8,0,MODE_SMA,PRICE_OPEN);

   maHandle6_1 = iMA(symbols[ma_symbol6],_Period,ma_period6_1,0,MODE_SMA,PRICE_OPEN);
   maHandle6_2 = iMA(symbols[ma_symbol6],_Period,ma_period6_2,0,MODE_SMA,PRICE_OPEN);
   maHandle6_3 = iMA(symbols[ma_symbol6],_Period,ma_period6_3,0,MODE_SMA,PRICE_OPEN);
   maHandle6_4 = iMA(symbols[ma_symbol6],_Period,ma_period6_4,0,MODE_SMA,PRICE_OPEN);
   maHandle6_5 = iMA(symbols[ma_symbol6],_Period,ma_period6_5,0,MODE_SMA,PRICE_OPEN);
   maHandle6_6 = iMA(symbols[ma_symbol6],_Period,ma_period6_6,0,MODE_SMA,PRICE_OPEN);
   maHandle6_7 = iMA(symbols[ma_symbol6],_Period,ma_period6_7,0,MODE_SMA,PRICE_OPEN);
   maHandle6_8 = iMA(symbols[ma_symbol6],_Period,ma_period6_8,0,MODE_SMA,PRICE_OPEN);

   maHandle7_1 = iMA(symbols[ma_symbol7],_Period,ma_period7_1,0,MODE_SMA,PRICE_OPEN);
   maHandle7_2 = iMA(symbols[ma_symbol7],_Period,ma_period7_2,0,MODE_SMA,PRICE_OPEN);
   maHandle7_3 = iMA(symbols[ma_symbol7],_Period,ma_period7_3,0,MODE_SMA,PRICE_OPEN);
   maHandle7_4 = iMA(symbols[ma_symbol7],_Period,ma_period7_4,0,MODE_SMA,PRICE_OPEN);
   maHandle7_5 = iMA(symbols[ma_symbol7],_Period,ma_period7_5,0,MODE_SMA,PRICE_OPEN);
   maHandle7_6 = iMA(symbols[ma_symbol7],_Period,ma_period7_6,0,MODE_SMA,PRICE_OPEN);
   maHandle7_7 = iMA(symbols[ma_symbol7],_Period,ma_period7_7,0,MODE_SMA,PRICE_OPEN);
   maHandle7_8 = iMA(symbols[ma_symbol7],_Period,ma_period7_8,0,MODE_SMA,PRICE_OPEN);
   
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{

   if(false){BuyAsync(Lots,magic1_,symbols[0]);}
   if(false){BuyAsync(Lots,magic1_,symbols[1]);}
   if(false){BuyAsync(Lots,magic1_,symbols[2]);}
   if(false){BuyAsync(Lots,magic1_,symbols[3]);}
   if(false){BuyAsync(Lots,magic1_,symbols[4]);}
   if(false){BuyAsync(Lots,magic1_,symbols[5]);}
   if(false){BuyAsync(Lots,magic1_,symbols[6]);}
   if(false){BuyAsync(Lots,magic1_,symbols[7]);}
   if(false){BuyAsync(Lots,magic1_,symbols[8]);}
   if(false){BuyAsync(Lots,magic1_,symbols[9]);}
   if(false){BuyAsync(Lots,magic1_,symbols[10]);}
   if(false){BuyAsync(Lots,magic1_,symbols[11]);}
   if(false){BuyAsync(Lots,magic1_,symbols[12]);}
   if(false){BuyAsync(Lots,magic1_,symbols[13]);}
   if(false){BuyAsync(Lots,magic1_,symbols[14]);}
   if(false){BuyAsync(Lots,magic1_,symbols[15]);}
   if(false){BuyAsync(Lots,magic1_,symbols[16]);}
   if(false){BuyAsync(Lots,magic1_,symbols[17]);}
   if(false){BuyAsync(Lots,magic1_,symbols[18]);}
   if(false){BuyAsync(Lots,magic1_,symbols[19]);}
   if(false){BuyAsync(Lots,magic1_,symbols[20]);}
   
   //Alert("TimeCurrent: ",TimeCurrent()," splitDate: ",splitDate," Past: ",TimeCurrent() > splitDate);
   
   //
   //if(!stopTrading && TimeCurrent() > splitDate){
   //   stopTrading = true;
   //}



   if(Find_New_Bar()){
      barNum++;
      
      EntLRE1_1 = EntLRE1_0;
      ExtLRE1_1 = ExtLRE1_0;
      EntSRE1_1 = EntSRE1_0;
      ExtSRE1_1 = ExtSRE1_0;
      
      CopyBuffer(maHandle1_1,0,0,1,mas1_1);
      CopyBuffer(maHandle1_2,0,0,1,mas1_2);
      CopyBuffer(maHandle1_3,0,0,1,mas1_3);
      CopyBuffer(maHandle1_4,0,0,1,mas1_4);
      CopyBuffer(maHandle1_5,0,0,1,mas1_5);
      CopyBuffer(maHandle1_6,0,0,1,mas1_6);
      CopyBuffer(maHandle1_7,0,0,1,mas1_7);
      CopyBuffer(maHandle1_8,0,0,1,mas1_8);
      
      double MA1_1 = mas1_1[0];
      double MA1_2 = mas1_2[0];
      double MA1_3 = mas1_3[0];
      double MA1_4 = mas1_4[0];
      double MA1_5 = mas1_5[0];
      double MA1_6 = mas1_6[0];
      double MA1_7 = mas1_7[0];
      double MA1_8 = mas1_8[0];
      
      if(MA1_1 > MA1_2){EntLRE1_0 = true;} else {EntLRE1_0 = false;}
      if(MA1_3 < MA1_4){ExtLRE1_0 = true;} else {ExtLRE1_0 = false;}
      if(MA1_5 > MA1_6){EntSRE1_0 = true;} else {EntSRE1_0 = false;}
      if(MA1_7 < MA1_8){ExtSRE1_0 = true;} else {ExtSRE1_0 = false;}
      
      if(!EntLRE1_1 && EntLRE1_0){EnterLongSignal1_ = true;} else {EnterLongSignal1_ = false;}
      if(!ExtLRE1_1 && ExtLRE1_0){ExitLongSignal1_ = true;} else {ExitLongSignal1_ = false;}
      if(!EntSRE1_1 && EntSRE1_0){EnterShortSignal1_ = true;} else {EnterShortSignal1_ = false;}
      if(!ExtSRE1_1 && ExtSRE1_0){ExitShortSignal1_ = true;} else {ExitShortSignal1_ = false;}
      
      if((longPos1_ && ExitLongSignal1_) || (shortPos1_ && ExitShortSignal1_)){
         CloseRecentPosition(magic1_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos1_ = false;
         shortPos1_ = false;
      }
      
      if(CurrentOpenPositions(magic1_) < 1){
         if(EnterLongSignal1_ && !EnterShortSignal1_ && !ExitLongSignal1_){
            if(!BuyAsync(Lots,magic1_,symbols[n])){Alert("Error entering long ",symbols[n],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos1_ = true;
         }
         if(EnterShortSignal1_ && !EnterLongSignal1_ && !ExitShortSignal1_){
            if(!SellAsync(Lots,magic1_,symbols[n])){Alert("Error entering short ",symbols[n],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos1_ = true;
         }
      }
      
      
      
      
      
      
      
      
      
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
         //while(!CloseRecentPosition(symbols[n+1])){Sleep(100);}
         longPos2_ = false;
         shortPos2_ = false;
      }
      
      if(CurrentOpenPositions(magic2_) < 1){
         if(EnterLongSignal2_ && !EnterShortSignal2_ && !ExitLongSignal2_){
            if(!BuyAsync(Lots,magic2_,symbols[n+1])){Alert("Error entering long ",symbols[n+1],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n+1])){Sleep(100);}
            longPos2_ = true;
         }
         if(EnterShortSignal2_ && !EnterLongSignal2_ && !ExitShortSignal2_){
            if(!SellAsync(Lots,magic2_,symbols[n+1])){Alert("Error entering short ",symbols[n+1],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n+1])){Sleep(100);}
            shortPos2_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE3_1 = EntLRE3_0;
      ExtLRE3_1 = ExtLRE3_0;
      EntSRE3_1 = EntSRE3_0;
      ExtSRE3_1 = ExtSRE3_0;
      
      CopyBuffer(maHandle3_1,0,0,1,mas3_1);
      CopyBuffer(maHandle3_2,0,0,1,mas3_2);
      CopyBuffer(maHandle3_3,0,0,1,mas3_3);
      CopyBuffer(maHandle3_4,0,0,1,mas3_4);
      CopyBuffer(maHandle3_5,0,0,1,mas3_5);
      CopyBuffer(maHandle3_6,0,0,1,mas3_6);
      CopyBuffer(maHandle3_7,0,0,1,mas3_7);
      CopyBuffer(maHandle3_8,0,0,1,mas3_8);
      
      double MA3_1 = mas3_1[0];
      double MA3_2 = mas3_2[0];
      double MA3_3 = mas3_3[0];
      double MA3_4 = mas3_4[0];
      double MA3_5 = mas3_5[0];
      double MA3_6 = mas3_6[0];
      double MA3_7 = mas3_7[0];
      double MA3_8 = mas3_8[0];
      
      if(MA3_1 > MA3_2){EntLRE3_0 = true;} else {EntLRE3_0 = false;}
      if(MA3_3 < MA3_4){ExtLRE3_0 = true;} else {ExtLRE3_0 = false;}
      if(MA3_5 > MA3_6){EntSRE3_0 = true;} else {EntSRE3_0 = false;}
      if(MA3_7 < MA3_8){ExtSRE3_0 = true;} else {ExtSRE3_0 = false;}
      
      if(!EntLRE3_1 && EntLRE3_0){EnterLongSignal3_ = true;} else {EnterLongSignal3_ = false;}
      if(!ExtLRE3_1 && ExtLRE3_0){ExitLongSignal3_ = true;} else {ExitLongSignal3_ = false;}
      if(!EntSRE3_1 && EntSRE3_0){EnterShortSignal3_ = true;} else {EnterShortSignal3_ = false;}
      if(!ExtSRE3_1 && ExtSRE3_0){ExitShortSignal3_ = true;} else {ExitShortSignal3_ = false;}
      
      if((longPos3_ && ExitLongSignal3_) || (shortPos3_ && ExitShortSignal3_)){
         CloseRecentPosition(magic3_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos3_ = false;
         shortPos3_ = false;
      }
      
      if(CurrentOpenPositions(magic3_) < 1){
         if(EnterLongSignal3_ && !EnterShortSignal3_ && !ExitLongSignal3_){
            if(!BuyAsync(Lots,magic3_,symbols[n+2])){Alert("Error entering long ",symbols[n+2],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos3_ = true;
         }
         if(EnterShortSignal3_ && !EnterLongSignal3_ && !ExitShortSignal3_){
            if(!SellAsync(Lots,magic3_,symbols[n+2])){Alert("Error entering short ",symbols[n+2],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos3_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE4_1 = EntLRE4_0;
      ExtLRE4_1 = ExtLRE4_0;
      EntSRE4_1 = EntSRE4_0;
      ExtSRE4_1 = ExtSRE4_0;
      
      CopyBuffer(maHandle4_1,0,0,1,mas4_1);
      CopyBuffer(maHandle4_2,0,0,1,mas4_2);
      CopyBuffer(maHandle4_3,0,0,1,mas4_3);
      CopyBuffer(maHandle4_4,0,0,1,mas4_4);
      CopyBuffer(maHandle4_5,0,0,1,mas4_5);
      CopyBuffer(maHandle4_6,0,0,1,mas4_6);
      CopyBuffer(maHandle4_7,0,0,1,mas4_7);
      CopyBuffer(maHandle4_8,0,0,1,mas4_8);
      
      double MA4_1 = mas4_1[0];
      double MA4_2 = mas4_2[0];
      double MA4_3 = mas4_3[0];
      double MA4_4 = mas4_4[0];
      double MA4_5 = mas4_5[0];
      double MA4_6 = mas4_6[0];
      double MA4_7 = mas4_7[0];
      double MA4_8 = mas4_8[0];
      
      if(MA4_1 > MA4_2){EntLRE4_0 = true;} else {EntLRE4_0 = false;}
      if(MA4_3 < MA4_4){ExtLRE4_0 = true;} else {ExtLRE4_0 = false;}
      if(MA4_5 > MA4_6){EntSRE4_0 = true;} else {EntSRE4_0 = false;}
      if(MA4_7 < MA4_8){ExtSRE4_0 = true;} else {ExtSRE4_0 = false;}
      
      if(!EntLRE4_1 && EntLRE4_0){EnterLongSignal4_ = true;} else {EnterLongSignal4_ = false;}
      if(!ExtLRE4_1 && ExtLRE4_0){ExitLongSignal4_ = true;} else {ExitLongSignal4_ = false;}
      if(!EntSRE4_1 && EntSRE4_0){EnterShortSignal4_ = true;} else {EnterShortSignal4_ = false;}
      if(!ExtSRE4_1 && ExtSRE4_0){ExitShortSignal4_ = true;} else {ExitShortSignal4_ = false;}
      
      if((longPos4_ && ExitLongSignal4_) || (shortPos4_ && ExitShortSignal4_)){
         CloseRecentPosition(magic4_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos4_ = false;
         shortPos4_ = false;
      }
      
      if(CurrentOpenPositions(magic4_) < 1){
         if(EnterLongSignal4_ && !EnterShortSignal4_ && !ExitLongSignal4_){
            if(!BuyAsync(Lots,magic4_,symbols[n+3])){Alert("Error entering long ",symbols[n+3],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos4_ = true;
         }
         if(EnterShortSignal4_ && !EnterLongSignal4_ && !ExitShortSignal4_){
            if(!SellAsync(Lots,magic4_,symbols[n+3])){Alert("Error entering short ",symbols[n+3],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos4_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE5_1 = EntLRE5_0;
      ExtLRE5_1 = ExtLRE5_0;
      EntSRE5_1 = EntSRE5_0;
      ExtSRE5_1 = ExtSRE5_0;
      
      CopyBuffer(maHandle5_1,0,0,1,mas5_1);
      CopyBuffer(maHandle5_2,0,0,1,mas5_2);
      CopyBuffer(maHandle5_3,0,0,1,mas5_3);
      CopyBuffer(maHandle5_4,0,0,1,mas5_4);
      CopyBuffer(maHandle5_5,0,0,1,mas5_5);
      CopyBuffer(maHandle5_6,0,0,1,mas5_6);
      CopyBuffer(maHandle5_7,0,0,1,mas5_7);
      CopyBuffer(maHandle5_8,0,0,1,mas5_8);
      
      double MA5_1 = mas5_1[0];
      double MA5_2 = mas5_2[0];
      double MA5_3 = mas5_3[0];
      double MA5_4 = mas5_4[0];
      double MA5_5 = mas5_5[0];
      double MA5_6 = mas5_6[0];
      double MA5_7 = mas5_7[0];
      double MA5_8 = mas5_8[0];
      
      if(MA5_1 > MA5_2){EntLRE5_0 = true;} else {EntLRE5_0 = false;}
      if(MA5_3 < MA5_4){ExtLRE5_0 = true;} else {ExtLRE5_0 = false;}
      if(MA5_5 > MA5_6){EntSRE5_0 = true;} else {EntSRE5_0 = false;}
      if(MA5_7 < MA5_8){ExtSRE5_0 = true;} else {ExtSRE5_0 = false;}
      
      if(!EntLRE5_1 && EntLRE5_0){EnterLongSignal5_ = true;} else {EnterLongSignal5_ = false;}
      if(!ExtLRE5_1 && ExtLRE5_0){ExitLongSignal5_ = true;} else {ExitLongSignal5_ = false;}
      if(!EntSRE5_1 && EntSRE5_0){EnterShortSignal5_ = true;} else {EnterShortSignal5_ = false;}
      if(!ExtSRE5_1 && ExtSRE5_0){ExitShortSignal5_ = true;} else {ExitShortSignal5_ = false;}
      
      if((longPos5_ && ExitLongSignal5_) || (shortPos5_ && ExitShortSignal5_)){
         CloseRecentPosition(magic5_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos5_ = false;
         shortPos5_ = false;
      }
      
      if(CurrentOpenPositions(magic5_) < 1){
         if(EnterLongSignal5_ && !EnterShortSignal5_ && !ExitLongSignal5_){
            if(!BuyAsync(Lots,magic5_,symbols[n+4])){Alert("Error entering long ",symbols[n+4],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos5_ = true;
         }
         if(EnterShortSignal5_ && !EnterLongSignal5_ && !ExitShortSignal5_){
            if(!SellAsync(Lots,magic5_,symbols[n+4])){Alert("Error entering short ",symbols[n+4],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos5_ = true;
         }
      
      }
      
      
      
      
      
      
      EntLRE6_1 = EntLRE6_0;
      ExtLRE6_1 = ExtLRE6_0;
      EntSRE6_1 = EntSRE6_0;
      ExtSRE6_1 = ExtSRE6_0;
      
      CopyBuffer(maHandle6_1,0,0,1,mas6_1);
      CopyBuffer(maHandle6_2,0,0,1,mas6_2);
      CopyBuffer(maHandle6_3,0,0,1,mas6_3);
      CopyBuffer(maHandle6_4,0,0,1,mas6_4);
      CopyBuffer(maHandle6_5,0,0,1,mas6_5);
      CopyBuffer(maHandle6_6,0,0,1,mas6_6);
      CopyBuffer(maHandle6_7,0,0,1,mas6_7);
      CopyBuffer(maHandle6_8,0,0,1,mas6_8);
      
      double MA6_1 = mas6_1[0];
      double MA6_2 = mas6_2[0];
      double MA6_3 = mas6_3[0];
      double MA6_4 = mas6_4[0];
      double MA6_5 = mas6_5[0];
      double MA6_6 = mas6_6[0];
      double MA6_7 = mas6_7[0];
      double MA6_8 = mas6_8[0];
      
      if(MA6_1 > MA6_2){EntLRE6_0 = true;} else {EntLRE6_0 = false;}
      if(MA6_3 < MA6_4){ExtLRE6_0 = true;} else {ExtLRE6_0 = false;}
      if(MA6_5 > MA6_6){EntSRE6_0 = true;} else {EntSRE6_0 = false;}
      if(MA6_7 < MA6_8){ExtSRE6_0 = true;} else {ExtSRE6_0 = false;}
      
      if(!EntLRE6_1 && EntLRE6_0){EnterLongSignal6_ = true;} else {EnterLongSignal6_ = false;}
      if(!ExtLRE6_1 && ExtLRE6_0){ExitLongSignal6_ = true;} else {ExitLongSignal6_ = false;}
      if(!EntSRE6_1 && EntSRE6_0){EnterShortSignal6_ = true;} else {EnterShortSignal6_ = false;}
      if(!ExtSRE6_1 && ExtSRE6_0){ExitShortSignal6_ = true;} else {ExitShortSignal6_ = false;}
      
      if((longPos6_ && ExitLongSignal6_) || (shortPos6_ && ExitShortSignal6_)){
         CloseRecentPosition(magic6_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos6_ = false;
         shortPos6_ = false;
      }
      
      if(CurrentOpenPositions(magic6_) < 1){
         if(EnterLongSignal6_ && !EnterShortSignal6_ && !ExitLongSignal6_){
            if(!BuyAsync(Lots,magic6_,symbols[n+5])){Alert("Error entering long ",symbols[n+5],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos6_ = true;
         }
         if(EnterShortSignal6_ && !EnterLongSignal6_ && !ExitShortSignal6_){
            if(!SellAsync(Lots,magic6_,symbols[n+5])){Alert("Error entering short ",symbols[n+5],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos6_ = true;
         }
      }
      
      
      
      
      
      
      
      EntLRE7_1 = EntLRE7_0;
      ExtLRE7_1 = ExtLRE7_0;
      EntSRE7_1 = EntSRE7_0;
      ExtSRE7_1 = ExtSRE7_0;
      
      CopyBuffer(maHandle7_1,0,0,1,mas7_1);
      CopyBuffer(maHandle7_2,0,0,1,mas7_2);
      CopyBuffer(maHandle7_3,0,0,1,mas7_3);
      CopyBuffer(maHandle7_4,0,0,1,mas7_4);
      CopyBuffer(maHandle7_5,0,0,1,mas7_5);
      CopyBuffer(maHandle7_6,0,0,1,mas7_6);
      CopyBuffer(maHandle7_7,0,0,1,mas7_7);
      CopyBuffer(maHandle7_8,0,0,1,mas7_8);
      
      double MA7_1 = mas7_1[0];
      double MA7_2 = mas7_2[0];
      double MA7_3 = mas7_3[0];
      double MA7_4 = mas7_4[0];
      double MA7_5 = mas7_5[0];
      double MA7_6 = mas7_6[0];
      double MA7_7 = mas7_7[0];
      double MA7_8 = mas7_8[0];
      
      if(MA7_1 > MA7_2){EntLRE7_0 = true;} else {EntLRE7_0 = false;}
      if(MA7_3 < MA7_4){ExtLRE7_0 = true;} else {ExtLRE7_0 = false;}
      if(MA7_5 > MA7_6){EntSRE7_0 = true;} else {EntSRE7_0 = false;}
      if(MA7_7 < MA7_8){ExtSRE7_0 = true;} else {ExtSRE7_0 = false;}
      
      if(!EntLRE7_1 && EntLRE7_0){EnterLongSignal7_ = true;} else {EnterLongSignal7_ = false;}
      if(!ExtLRE7_1 && ExtLRE7_0){ExitLongSignal7_ = true;} else {ExitLongSignal7_ = false;}
      if(!EntSRE7_1 && EntSRE7_0){EnterShortSignal7_ = true;} else {EnterShortSignal7_ = false;}
      if(!ExtSRE7_1 && ExtSRE7_0){ExitShortSignal7_ = true;} else {ExitShortSignal7_ = false;}
      
      if((longPos7_ && ExitLongSignal7_) || (shortPos7_ && ExitShortSignal7_)){
         CloseRecentPosition(magic7_);
         //while(!CloseRecentPosition(symbols[n])){Sleep(100);}
         longPos7_ = false;
         shortPos7_ = false;
      }
      
      if(CurrentOpenPositions(magic7_) < 1){
         if(EnterLongSignal7_ && !EnterShortSignal7_ && !ExitLongSignal7_){
            if(!BuyAsync(Lots,magic7_,symbols[n+6])){Alert("Error entering long ",symbols[n+6],". Last error: ",GetLastError());}
            //while(!BuyAsync(Lots,symbols[n])){Sleep(100);}
            longPos7_ = true;
         }
         if(EnterShortSignal7_ && !EnterLongSignal7_ && !ExitShortSignal7_){
            if(!SellAsync(Lots,magic7_,symbols[n+6])){Alert("Error entering short ",symbols[n+6],". Last error: ",GetLastError());}
            //while(!SellAsync(Lots,symbols[n])){Sleep(100);}
            shortPos7_ = true;
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
    ma_period7_1 + ma_period7_2 + ma_period7_3 + ma_period7_4;
   
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