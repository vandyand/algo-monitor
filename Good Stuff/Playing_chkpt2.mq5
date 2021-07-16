
#include<Trade\Trade.mqh>

CTrade trade;

input int longBack0 = 0;
input int longBack1 = 1;
input int shortBack0 = 0;
input int shortBack1 = 1;
//input int signalBars = 3;
//int openBars = signalBars;
input int openBars = 3;


bool EquityCrunch = false;
bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;

int tickNum = 0;
int closeTick = 0;

int MA_Period = 10;

void OnTick()
{   
   tickNum++;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   if(Equity < Balance * 0.95){
      EquityCrunch = true;
   }
   
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
   
   if(iOpen(_Symbol,_Period,longBack0) > iOpen(_Symbol,_Period,longBack1)){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   if(iOpen(_Symbol,_Period,shortBack0) < iOpen(_Symbol,_Period,shortBack1)){
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
   
   if(PositionsTotal() < 1){
      if(LongSignal && !ShortSignal){
         trade.Buy(0.01,NULL,Ask,0,0,NULL);
         closeTick = tickNum + openBars;
      }
      if(ShortSignal && !LongSignal){
         trade.Sell(0.01,NULL,Bid,0,0,NULL);
         closeTick = tickNum + openBars;
      }
   }
   
   if(tickNum == closeTick){
      CloseAllPositions();
      //trade.PositionClose(PositionGetTicket(0));
   }
}

void CloseAllPositions(){
   for(int i = PositionsTotal()-1; i >= 0; i--){
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}





