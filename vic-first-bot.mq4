//+------------------------------------------------------------------+
//|                                                vic-first-bot.mq4 |
//|                                                        Victor E. |
//|                                             https://teknixco.net |
//+------------------------------------------------------------------+
#property copyright "Victor E."
#property link      "https://teknixco.net"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---,

//---
   return(INIT_SUCCEEDED);

  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//--Data structure for tick function and methods/
   struct MqlTick2
     {
      datetime       time;          // Time of the last prices update
      double         bid;           // Current Bid price
      double         ask;           // Current Ask price
      double         last;          // Price of the last deal (Last)
      ulong          volume;        // Volume for the current Last price
     };
   MqlTick last_tick;

//---Logic: Check for 2 prices between x seconds and continue to check for trend in the direction of the trade, up to 4 prices.
   if(SymbolInfoTick(Symbol(),last_tick))
     {
      double firstPrice = Ask;
      Sleep(5000);
      RefreshRates();
      double secondPrice = Ask;
//---Check how second price compares to first price (1st trend check).
      if(secondPrice < firstPrice)
        {
         Sleep(5000);
         RefreshRates();
         double thirdPrice = Ask;
//---Check how third price compares to second price (2nd trend check).
         if(thirdPrice < secondPrice)
           {
            Sleep(10000);
            RefreshRates();
            double fourthPrice = Ask;
//--Check how fourth price compares to third price (3rd trend check).
            if(fourthPrice < thirdPrice) 
            {
//--If the 4th price is still in the same direction as the trade, then there is a positive trend happening. (After 15 seconds)
            string msg = "Welcome to the million dollar life. Thank you God.";
            Print(msg);
            Print(last_tick.time,": Bid = ",last_tick.bid, " Ask = ",
                  last_tick.ask," Volume = ",last_tick.volume);
            Print("First Price: ",firstPrice);
            Print("Second Price: ",secondPrice);
            SendNotification(msg);
            }
           }
        }

      if(secondPrice > firstPrice)
        {
         string msg = "Let's try again. The price is below the threshold. Price: ";
         Print(msg, Ask);
        }

      if(secondPrice = firstPrice)
        {
         string msg = "No movement detected, keep trying!.";
        }
     }
  }

//+------------------------------------------------------------------+
