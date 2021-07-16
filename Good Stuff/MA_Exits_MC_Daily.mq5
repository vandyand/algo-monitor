
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

int slippage = 100;
bool closeAll = false;


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
   maHandle1_2 = iMA(symbols[0],_Period,ma_period1_2,0,MODE_SMA,PRICE_OPEN);
   maHandle1_3 = iMA(symbols[0],_Period,ma_period1_3,0,MODE_SMA,PRICE_OPEN);
   maHandle1_4 = iMA(symbols[0],_Period,ma_period1_4,0,MODE_SMA,PRICE_OPEN);
   maHandle1_5 = iMA(symbols[0],_Period,ma_period1_5,0,MODE_SMA,PRICE_OPEN);
   maHandle1_6 = iMA(symbols[0],_Period,ma_period1_6,0,MODE_SMA,PRICE_OPEN);
   maHandle1_7 = iMA(symbols[0],_Period,ma_period1_7,0,MODE_SMA,PRICE_OPEN);
   maHandle1_8 = iMA(symbols[0],_Period,ma_period1_8,0,MODE_SMA,PRICE_OPEN);
   
   maHandle2_1 = iMA(symbols[1],_Period,ma_period2_1,0,MODE_SMA,PRICE_OPEN);
   maHandle2_2 = iMA(symbols[1],_Period,ma_period2_2,0,MODE_SMA,PRICE_OPEN);
   maHandle2_3 = iMA(symbols[1],_Period,ma_period2_3,0,MODE_SMA,PRICE_OPEN);
   maHandle2_4 = iMA(symbols[1],_Period,ma_period2_4,0,MODE_SMA,PRICE_OPEN);
   maHandle2_5 = iMA(symbols[1],_Period,ma_period2_5,0,MODE_SMA,PRICE_OPEN);
   maHandle2_6 = iMA(symbols[1],_Period,ma_period2_6,0,MODE_SMA,PRICE_OPEN);
   maHandle2_7 = iMA(symbols[1],_Period,ma_period2_7,0,MODE_SMA,PRICE_OPEN);
   maHandle2_8 = iMA(symbols[1],_Period,ma_period2_8,0,MODE_SMA,PRICE_OPEN);

   maHandle3_1 = iMA(symbols[2],_Period,ma_period3_1,0,MODE_SMA,PRICE_OPEN);
   maHandle3_2 = iMA(symbols[2],_Period,ma_period3_2,0,MODE_SMA,PRICE_OPEN);
   maHandle3_3 = iMA(symbols[2],_Period,ma_period3_3,0,MODE_SMA,PRICE_OPEN);
   maHandle3_4 = iMA(symbols[2],_Period,ma_period3_4,0,MODE_SMA,PRICE_OPEN);
   maHandle3_5 = iMA(symbols[2],_Period,ma_period3_5,0,MODE_SMA,PRICE_OPEN);
   maHandle3_6 = iMA(symbols[2],_Period,ma_period3_6,0,MODE_SMA,PRICE_OPEN);
   maHandle3_7 = iMA(symbols[2],_Period,ma_period3_7,0,MODE_SMA,PRICE_OPEN);
   maHandle3_8 = iMA(symbols[2],_Period,ma_period3_8,0,MODE_SMA,PRICE_OPEN);

   maHandle4_1 = iMA(symbols[3],_Period,ma_period4_1,0,MODE_SMA,PRICE_OPEN);
   maHandle4_2 = iMA(symbols[3],_Period,ma_period4_2,0,MODE_SMA,PRICE_OPEN);
   maHandle4_3 = iMA(symbols[3],_Period,ma_period4_3,0,MODE_SMA,PRICE_OPEN);
   maHandle4_4 = iMA(symbols[3],_Period,ma_period4_4,0,MODE_SMA,PRICE_OPEN);
   maHandle4_5 = iMA(symbols[3],_Period,ma_period4_5,0,MODE_SMA,PRICE_OPEN);
   maHandle4_6 = iMA(symbols[3],_Period,ma_period4_6,0,MODE_SMA,PRICE_OPEN);
   maHandle4_7 = iMA(symbols[3],_Period,ma_period4_7,0,MODE_SMA,PRICE_OPEN);
   maHandle4_8 = iMA(symbols[3],_Period,ma_period4_8,0,MODE_SMA,PRICE_OPEN);

   maHandle5_1 = iMA(symbols[4],_Period,ma_period5_1,0,MODE_SMA,PRICE_OPEN);
   maHandle5_2 = iMA(symbols[4],_Period,ma_period5_2,0,MODE_SMA,PRICE_OPEN);
   maHandle5_3 = iMA(symbols[4],_Period,ma_period5_3,0,MODE_SMA,PRICE_OPEN);
   maHandle5_4 = iMA(symbols[4],_Period,ma_period5_4,0,MODE_SMA,PRICE_OPEN);
   maHandle5_5 = iMA(symbols[4],_Period,ma_period5_5,0,MODE_SMA,PRICE_OPEN);
   maHandle5_6 = iMA(symbols[4],_Period,ma_period5_6,0,MODE_SMA,PRICE_OPEN);
   maHandle5_7 = iMA(symbols[4],_Period,ma_period5_7,0,MODE_SMA,PRICE_OPEN);
   maHandle5_8 = iMA(symbols[4],_Period,ma_period5_8,0,MODE_SMA,PRICE_OPEN);

   maHandle6_1 = iMA(symbols[5],_Period,ma_period6_1,0,MODE_SMA,PRICE_OPEN);
   maHandle6_2 = iMA(symbols[5],_Period,ma_period6_2,0,MODE_SMA,PRICE_OPEN);
   maHandle6_3 = iMA(symbols[5],_Period,ma_period6_3,0,MODE_SMA,PRICE_OPEN);
   maHandle6_4 = iMA(symbols[5],_Period,ma_period6_4,0,MODE_SMA,PRICE_OPEN);
   maHandle6_5 = iMA(symbols[5],_Period,ma_period6_5,0,MODE_SMA,PRICE_OPEN);
   maHandle6_6 = iMA(symbols[5],_Period,ma_period6_6,0,MODE_SMA,PRICE_OPEN);
   maHandle6_7 = iMA(symbols[5],_Period,ma_period6_7,0,MODE_SMA,PRICE_OPEN);
   maHandle6_8 = iMA(symbols[5],_Period,ma_period6_8,0,MODE_SMA,PRICE_OPEN);

   maHandle7_1 = iMA(symbols[6],_Period,ma_period7_1,0,MODE_SMA,PRICE_OPEN);
   maHandle7_2 = iMA(symbols[6],_Period,ma_period7_2,0,MODE_SMA,PRICE_OPEN);
   maHandle7_3 = iMA(symbols[6],_Period,ma_period7_3,0,MODE_SMA,PRICE_OPEN);
   maHandle7_4 = iMA(symbols[6],_Period,ma_period7_4,0,MODE_SMA,PRICE_OPEN);
   maHandle7_5 = iMA(symbols[6],_Period,ma_period7_5,0,MODE_SMA,PRICE_OPEN);
   maHandle7_6 = iMA(symbols[6],_Period,ma_period7_6,0,MODE_SMA,PRICE_OPEN);
   maHandle7_7 = iMA(symbols[6],_Period,ma_period7_7,0,MODE_SMA,PRICE_OPEN);
   maHandle7_8 = iMA(symbols[6],_Period,ma_period7_8,0,MODE_SMA,PRICE_OPEN);
   
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{
   if(Find_New_Bar()){
      
      now = Get_Current_Time();
      MqlDateTime mqlNow;
      TimeToStruct(now,mqlNow);
      if((mqlNow.hour == 23 && mqlNow.min >=30) || (mqlNow.hour == 0 && mqlNow.min <= 30)){
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
         shortPos1_ = false;
         shortPos2_ = false;
         shortPos3_ = false;
         shortPos4_ = false;
         shortPos5_ = false;
         shortPos6_ = false;
         shortPos7_ = false;
         return;
      }
      
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
         longPos1_ = false;
         shortPos1_ = false;
      }
      
      if(CurrentOpenPositions(magic1_) < 1){
         if(EnterLongSignal1_ && !EnterShortSignal1_ && !ExitLongSignal1_){
            if(!BuyAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering long ",symbols[0],". Last error: ",GetLastError());}
            longPos1_ = true;
         }
         if(EnterShortSignal1_ && !EnterLongSignal1_ && !ExitShortSignal1_){
            if(!SellAsync(getLotSize(symbols[0],KC_USD_bet_size),magic1_,symbols[0])){Alert("Error entering short ",symbols[0],". Last error: ",GetLastError());}
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
         longPos2_ = false;
         shortPos2_ = false;
      }
      
      if(CurrentOpenPositions(magic2_) < 1){
         if(EnterLongSignal2_ && !EnterShortSignal2_ && !ExitLongSignal2_){
            if(!BuyAsync(getLotSize(symbols[1],KC_USD_bet_size),magic2_,symbols[1])){Alert("Error entering long ",symbols[1],". Last error: ",GetLastError());}
            longPos2_ = true;
         }
         if(EnterShortSignal2_ && !EnterLongSignal2_ && !ExitShortSignal2_){
            if(!SellAsync(getLotSize(symbols[1],KC_USD_bet_size),magic2_,symbols[1])){Alert("Error entering short ",symbols[1],". Last error: ",GetLastError());}
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
         longPos3_ = false;
         shortPos3_ = false;
      }
      
      if(CurrentOpenPositions(magic3_) < 1){
         if(EnterLongSignal3_ && !EnterShortSignal3_ && !ExitLongSignal3_){
            if(!BuyAsync(getLotSize(symbols[2],KC_USD_bet_size),magic3_,symbols[2])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos3_ = true;
         }
         if(EnterShortSignal3_ && !EnterLongSignal3_ && !ExitShortSignal3_){
            if(!SellAsync(getLotSize(symbols[2],KC_USD_bet_size),magic3_,symbols[2])){Alert("Error entering short ",symbols[2],". Last error: ",GetLastError());}
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
         longPos4_ = false;
         shortPos4_ = false;
      }
      
      if(CurrentOpenPositions(magic4_) < 1){
         if(EnterLongSignal4_ && !EnterShortSignal4_ && !ExitLongSignal4_){
            if(!BuyAsync(getLotSize(symbols[3],KC_USD_bet_size),magic4_,symbols[3])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos4_ = true;
         }
         if(EnterShortSignal4_ && !EnterLongSignal4_ && !ExitShortSignal4_){
            if(!SellAsync(getLotSize(symbols[3],KC_USD_bet_size),magic4_,symbols[3])){Alert("Error entering short ",symbols[2],". Last error: ",GetLastError());}
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
         longPos5_ = false;
         shortPos5_ = false;
      }
      
      if(CurrentOpenPositions(magic5_) < 1){
         if(EnterLongSignal5_ && !EnterShortSignal5_ && !ExitLongSignal5_){
            if(!BuyAsync(getLotSize(symbols[4],KC_USD_bet_size),magic5_,symbols[4])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos5_ = true;
         }
         if(EnterShortSignal5_ && !EnterLongSignal5_ && !ExitShortSignal5_){
            if(!SellAsync(getLotSize(symbols[4],KC_USD_bet_size),magic5_,symbols[4])){Alert("Error entering short ",symbols[2],". Last error: ",GetLastError());}
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
         longPos6_ = false;
         shortPos6_ = false;
      }
      
      if(CurrentOpenPositions(magic6_) < 1){
         if(EnterLongSignal6_ && !EnterShortSignal6_ && !ExitLongSignal6_){
            if(!BuyAsync(getLotSize(symbols[5],KC_USD_bet_size),magic6_,symbols[5])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos6_ = true;
         }
         if(EnterShortSignal6_ && !EnterLongSignal6_ && !ExitShortSignal6_){
            if(!SellAsync(getLotSize(symbols[5],KC_USD_bet_size),magic6_,symbols[5])){Alert("Error entering short ",symbols[2],". Last error: ",GetLastError());}
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
         longPos7_ = false;
         shortPos7_ = false;
      }
      
      if(CurrentOpenPositions(magic7_) < 1){
         if(EnterLongSignal7_ && !EnterShortSignal7_ && !ExitLongSignal7_){
            if(!BuyAsync(getLotSize(symbols[6],KC_USD_bet_size),magic7_,symbols[6])){Alert("Error entering long ",symbols[2],". Last error: ",GetLastError());}
            longPos7_ = true;
         }
         if(EnterShortSignal7_ && !EnterLongSignal7_ && !ExitShortSignal7_){
            if(!SellAsync(getLotSize(symbols[6],KC_USD_bet_size),magic7_,symbols[6])){Alert("Error entering short ",symbols[2],". Last error: ",GetLastError());}
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