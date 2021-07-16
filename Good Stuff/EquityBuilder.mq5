
#include<Trade\Trade.mqh>

CTrade trade;

extern int MA_Period = 10;
extern int openBars = 10;

bool EquityCrunch = false;
int tickNum = 0;
int closeTick = 0;

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
   
   double MA = iMA(_Symbol,_Period,MA_Period,0,0,0);
   double Open = iOpen(_Symbol,_Period,0);
   
   if(PositionsTotal() < 10000 && Equity <= Balance * 1.01 && !EquityCrunch){
      //trade.Buy(0.01,NULL,Ask,0,0,NULL);
      trade.Sell(0.01,NULL,Bid,0,0,NULL);
      closeTick = tickNum + openBars;
   }
   
   if(EquityCrunch || (PositionsTotal() > 0 && Equity > Balance * 1.01)){
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





