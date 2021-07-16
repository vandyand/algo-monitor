
#include<Trade\Trade.mqh>

CTrade trade;

input int ma_period1 = 1;
input int ma_period2 = 2;
input int ma_period3 = 1;
input int ma_period4 = 2;
//input double drawDown = 0.9995;
//input datetime splitDate;


bool EquityCrunch = false;
bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;
bool stopTrading = false;
bool longPos = false;
bool shortPos = false;

int tickNum = 0;
int closeTick = 0;

double Lots = 0.01;

int maHandle1;
int maHandle2;
int maHandle3;
int maHandle4;
double mas1[1];
double mas2[1];
double mas3[1];
double mas4[1];

int OnInit(){

   maHandle1 = iMA(_Symbol,_Period,ma_period1,0,MODE_SMA,PRICE_OPEN);
   maHandle2 = iMA(_Symbol,_Period,ma_period2,0,MODE_SMA,PRICE_OPEN);
   maHandle3 = iMA(_Symbol,_Period,ma_period3,0,MODE_SMA,PRICE_OPEN);
   maHandle4 = iMA(_Symbol,_Period,ma_period4,0,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{   
   tickNum++;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   //Alert("TimeCurrent: ",TimeCurrent()," splitDate: ",splitDate," Past: ",TimeCurrent() > splitDate);
   
   /*
   if(!stopTrading && TimeCurrent() > splitDate && (Equity < 1000 * drawDown || Equity < Balance * drawDown)){
      Alert("***********************************************************************");
      stopTrading = true;
      Alert("Equity: ", Equity, " Balance: ", Balance, " stopTrading: ", stopTrading);
   }
   */
   
   
   //if(Equity < Balance * 0.8){
   //   EquityCrunch = true;
   //}
   
   //double MA = iMA(_Symbol,_Period,MA_Period,0,0,0);

   
   
   /*
   
   double Open3 = iOpen(_Symbol,_Period,3);
   double Open2 = iOpen(_Symbol,_Period,2);
   double Open1 = iOpen(_Symbol,_Period,1);
   double Open = iOpen(_Symbol,_Period,0);
   //Alert("MA: ", MA);
   Alert("Open: ", Open, " Open1: ", Open1, " Open2: ", Open2);
   
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   if(Open < Open1){// && Open1 < Open2 && Open2 < Open3){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   
   if(Open > Open1){// && Open1 > Open2 && Open2 > Open3){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   */
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   
   CopyBuffer(maHandle1,0,0,1,mas1);
   CopyBuffer(maHandle2,0,0,1,mas2);
   CopyBuffer(maHandle3,0,0,1,mas3);
   CopyBuffer(maHandle4,0,0,1,mas4);
   
   double MA1 = mas1[0];
   double MA2 = mas2[0];
   double MA3 = mas3[0];
   double MA4 = mas4[0];
   
   
   if(MA1 > MA2){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   if(MA3 > MA4){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   
   /*
   LRE0 = true;
   SRE0 = true;
   for(int i = 0; i < signalBars; i++){
      if(iOpen(_Symbol,_Period,i) > iOpen(_Symbol,_Period,i+1)){
         LRE0 = false;
      }
      if(iOpen(_Symbol,_Period,i) < iOpen(_Symbol,_Period,i+1)){
         SRE0 = false;
      }
   }
   */

   if(!LRE1 && LRE0){
      LongSignal = true;
   } else {
      LongSignal = false;
   }
   
   if(!SRE1 && SRE0){
      ShortSignal = true;
   } else {
      ShortSignal = false;
   }
   
   
   if(LongSignal && !ShortSignal){
      if(PositionsTotal() == 0){
         trade.Buy(Lots,NULL,Ask,0,0,NULL);
      } else {
         long type = PositionGetInteger(POSITION_TYPE);
         if(type == 0){
            trade.Buy(Lots,NULL,Ask,0,0,NULL);
         }
         else if(type == 1){
            ulong ticket = PositionGetTicket(PositionsTotal() - 1);
            trade.PositionClose(ticket);
         }
      }
   }
   if(ShortSignal && !LongSignal){
      if(PositionsTotal() == 0){
         trade.Sell(Lots,NULL,Bid,0,0,NULL);
      } else {
         long type = PositionGetInteger(POSITION_TYPE);
         if(type == 1){
            trade.Sell(Lots,NULL,Bid,0,0,NULL);
         }
         else if(type == 0){
            ulong ticket = PositionGetTicket(PositionsTotal() - 1);
            trade.PositionClose(ticket);
         }
         
      }
   }
   
   /*
   if(stopTrading || (longPos && ExitLongSignal) || (shortPos && ExitShortSignal)){
      CloseAllPositions();
      longPos = false;
      shortPos = false;
   }
   */
}

void CloseAllPositions(){
   long type = PositionGetInteger(POSITION_TYPE);
   Alert("Position Type: ", type,"********************************");
   for(int i = PositionsTotal()-1; i >= 0; i--){
      ulong ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}





