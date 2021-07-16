//+------------------------------------------------------------------+
//This is a test to see how this mt5 stuff actually works... The
//examples are unneccesarily complex even for simple stuff. What the
//heck?
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"


extern int MA_Period_Long = 50;
extern int MA_Period_Short = 20;

int magic = 200;
bool Long;

void OnTick(){
   
   double ma_long = iMA(Symbol(),Period(),MA_Period_Long,0,0,0);
   double ma_short = iMA(Symbol(),Period(),MA_Period_Short,0,0,0);
   
   if(ma_long > ma_short)
   {
      /*if(!Long){
         OrderClose();
      }
      Long = true;
      */
      OrderOpen(1,"long");
   }
   else
   {
   /*
      if(Long){
         OrderClose();
      }
      Long = false;
     */
      OrderOpen(1,"short");
   }

}


bool OrderOpen(double vol,string long_short)
{
   MqlTradeRequest request={0};
   MqlTradeResult  result={0};
   
   request.action = TRADE_ACTION_DEAL;
   request.symbol = Symbol();
   request.volume = vol;
   request.type = ORDER_TYPE_BUY; //long_short=="long" ? ORDER_TYPE_BUY: long_short=="short" ? ORDER_TYPE_SELL: "";
   request.price = long_short=="long" ? SymbolInfoDouble(Symbol(),SYMBOL_ASK): long_short=="short" ? SymbolInfoDouble(Symbol(),SYMBOL_BID): 0.0;
   request.deviation=5;
   request.magic = magic;
   
   if(!OrderSend(request,result))
      PrintFormat("OrderSend error %d",GetLastError());
      
   PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order);
   
   return true;
}



//+------------------------------------------------------------------+
//| Closing all positions                                            |
//+------------------------------------------------------------------+
/*void OrderClose()
{
   
}
*/

