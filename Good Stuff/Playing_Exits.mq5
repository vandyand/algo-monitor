
#include<Trade\Trade.mqh>

CTrade trade;

input int enterLongBack0 = 0;
input int enterLongBack1 = 1;
input int exitLongBack0 = 0;
input int exitLongBack1 = 1;
input int enterShortBack0 = 0;
input int enterShortBack1 = 1;
input int exitShortBack0 = 0;
input int exitShortBack1 = 1;
//input double drawDown = 0.9995;
//input datetime splitDate;
//input int signalBars = 3;
//int openBars = signalBars;
//input int openBars = 3;
//input int drawDown = 500;


bool EquityCrunch = false;
bool EnterLongSignal = false;
bool ExitLongSignal = false;
bool EnterShortSignal = false;
bool ExitShortSignal = false;
bool EntLRE0, EntLRE1, ExtLRE0, ExtLRE1, EntSRE0, EntSRE1, ExtSRE0, ExtSRE1 = false;
bool stopTrading = false;
bool longPos = false;
bool shortPos = false;

int tickNum = 0;
int closeTick = 0;

double Lots = 0.01;

void OnTick()
{   
   tickNum++;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
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
   
   EntLRE1 = EntLRE0;
   ExtLRE1 = ExtLRE0;
   EntSRE1 = EntSRE0;
   ExtSRE1 = ExtSRE0;
   
   if(iOpen(_Symbol,_Period,enterLongBack0) > iOpen(_Symbol,_Period,enterLongBack1)){
      EntLRE0 = true;
   } else {
      EntLRE0 = false;
   }
   if(iOpen(_Symbol,_Period,exitLongBack0) > iOpen(_Symbol,_Period,exitLongBack1)){
      ExtLRE0 = true;
   } else {
      ExtLRE0 = false;
   }
   if(iOpen(_Symbol,_Period,enterShortBack0) < iOpen(_Symbol,_Period,enterShortBack1)){
      EntSRE0 = true;
   } else {
      EntSRE0 = false;
   }
   if(iOpen(_Symbol,_Period,exitShortBack0) < iOpen(_Symbol,_Period,exitShortBack1)){
      ExtSRE0 = true;
   } else {
      ExtSRE0 = false;
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
   
   if(PositionsTotal() < 1 && !stopTrading){
      if(EnterLongSignal && !EnterShortSignal && !ExitLongSignal){
         trade.Buy(Lots,NULL,Ask,0,0,NULL);
         longPos = true;
      }
      if(EnterShortSignal && !EnterLongSignal && !ExitShortSignal){
         trade.Sell(Lots,NULL,Bid,0,0,NULL);
         shortPos = true;
      }
   }
   
   if(stopTrading || (longPos && ExitLongSignal) || (shortPos && ExitShortSignal)){
      CloseAllPositions();
      longPos = false;
      shortPos = false;
   }
}

void CloseAllPositions(){
   for(int i = PositionsTotal()-1; i >= 0; i--){
      int ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}





