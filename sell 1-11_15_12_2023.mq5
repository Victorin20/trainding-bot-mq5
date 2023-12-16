
#include <Trade\Trade.mqh>
CTrade trade;

double startPrice = 1.07711;
double points = 0.0025;


string symbol = "EURUSD";

double volume_1 = 0.07;
double volume_2 = 0.05;
double black_volume_2 = 0.4;
double volume_3 = 0.06;
double volume_4 = 0.06;
double volume_5 = 0.05;
double black_volume_5 = 0.8;
double volume_6 = 0.05;
double black_volume_6 = 0.8;
double volume_7 = 0.05;
double black_volume_7 = 0.4;
double volume_8 = 0.05;
double black_volume_8 = 0.8;
double volume_9 = 0.04;
double black_volume_9 = 0.85;
double volume_10 = 0.04;
double black_volume_10 = 0.85;
double volume_11 = 0.04;
double black_volume_11 = 0.85;

bool failed_1 = false;
bool failed_2 = false;
bool failed_3 = false;
bool failed_4 = false;
bool failed_5 = false;
bool failed_6 = false;
bool failed_7 = false;
bool failed_8 = false;
bool failed_9 = false;
bool failed_10 = false;
bool failed_11 = false;

bool succes = false;

bool first_active_1 = false;
bool second_active_1 = false;
bool third_active_1  = false;
bool fourd_active_1  = false;
bool fifth_active_1  = false;
bool sixth_active_1  = false;

bool first_active_2 = false;
bool second_active_2 = false;
bool third_active_2 = false;
bool fourd_active_2 = false;
bool fifth_active_2 = false;
bool sixth_active_2 = false;

bool first_active_3 = false;
bool second_active_3 = false;
bool third_active_3  = false;
bool fourd_active_3  = false;
bool fifth_active_3  = false;
bool sixth_active_3  = false;

bool first_active_4 = false;
bool second_active_4 = false;
bool third_active_4 = false;
bool fourd_active_4 = false;
bool fifth_active_4 = false;
bool sixth_active_4 = false;
bool seventh_active_4 = false;

bool first_active_5 = false;
bool second_active_5 = false;
bool third_active_5 = false;
bool fourd_active_5 = false;
bool fifth_active_5 = false;
bool sixth_active_5 = false;

bool first_active_6 = false;
bool second_active_6 = false;
bool third_active_6 = false;
bool fourd_active_6 = false;
bool fifth_active_6 = false;
bool sixth_active_6 = false;

bool first_active_7 = false;
bool second_active_7 = false;
bool third_active_7 = false;
bool fourd_active_7 = false;
bool fifth_active_7 = false;
bool sixth_active_7 = false;

bool first_active_8 = false;
bool second_active_8 = false;
bool third_active_8 = false;
bool fourd_active_8 = false;
bool fifth_active_8 = false;
bool sixth_active_8 = false;

bool first_active_9 = false;
bool second_active_9 = false;
bool third_active_9 = false;
bool fourd_active_9 = false;
bool fifth_active_9 = false;
bool sixth_active_9 = false;
bool seventh_active_9 = false;

bool first_active_10 = false;
bool second_active_10 = false;
bool third_active_10 = false;
bool fourd_active_10 = false;
bool fifth_active_10 = false;
bool sixth_active_10 = false;
bool seventh_active_10 = false;

bool first_active_11 = false;
bool second_active_11 = false;
bool third_active_11 = false;
bool fourd_active_11 = false;
bool fifth_active_11 = false;
bool sixth_active_11 = false;
bool seventh_active_11 = false;

bool third_1 = false;
bool fourd_1 = false;
bool fifth_1 = false;
bool sixth_1 = false;

bool third_2 = false;
bool fourd_2 = false;
bool fifth_2 = false;
bool sixth_2 = false;

bool third_3 = false;
bool fourd_3 = false;
bool fifth_3 = false;
bool sixth_3 = false;

bool third_4 = false;
bool fourd_4 = false;
bool fifth_4 = false;
bool sixth_4 = false;
bool seventh_4 = false;

bool third_5 = false;
bool fourd_5 = false;
bool fifth_5 = false;
bool sixth_5 = false;

bool third_6 = false;
bool fourd_6 = false;
bool fifth_6 = false;
bool sixth_6 = false;

bool third_7 = false;
bool fourd_7 = false;
bool fifth_7 = false;
bool sixth_7 = false;

bool third_8 = false;
bool fourd_8 = false;
bool fifth_8 = false;
bool sixth_8 = false;

bool third_9 = false;
bool fourd_9 = false;
bool fifth_9 = false;
bool sixth_9 = false;
bool seven_9 = false;

bool third_10 = false;
bool fourd_10 = false;
bool fifth_10 = false;
bool sixth_10 = false;
bool seven_10 = false;

bool third_11 = false;
bool fourd_11 = false;
bool fifth_11 = false;
bool sixth_11 = false;
bool seven_11 = false;

bool once = false;

double GetCurrentPrice(string symbol, ENUM_SYMBOL_INFO_DOUBLE type) {
    double price = SymbolInfoDouble(symbol, type);
    return price;
}
  
void CancelOrder(string commentToFind) {
   
   
   for(int k = OrdersTotal()-1; k <= 0; k--)
   {
   
   
       ulong OrderTicket = OrderGetTicket(k);
       string comment = OrderGetString(ORDER_COMMENT);
       if(comment == commentToFind)
       {
       trade.OrderDelete(OrderTicket);
       }
       
            
      
   }
}

uint buyLimit(const int position, const double volume, const int combination_number)
  {
//--- prepare a request
   double price = startPrice - points*position;
   MqlTradeRequest request={};
   request.action=TRADE_ACTION_PENDING;         // setting a pending order
   request.symbol=_Symbol;                      // symbol
   request.volume=volume;                          // volume in 0.1 lots
   request.sl=price - points;                                // Stop Loss is not specified
   request.tp= price+points;                                // Take Profit is not specified
   request.comment = IntegerToString(combination_number);
   request.type=ORDER_TYPE_BUY_LIMIT;                // order type
//--- form the price for the pending order
   request.price=price;
//--- send a trade request
   MqlTradeResult result={};
   OrderSend(request,result);
   
//--- return code of the trade server reply
if(result.retcode == 10015)
   {
   Print("Buy limit order placed successfully.");
  
   }
    else{
    Print("Buy limit Order placement failed.");
    }
   return result.retcode;
  }


uint sellLimit(const int position, const double volume, const int combination_number)
  {
//--- prepare a request
double price = startPrice - points*position;
   MqlTradeRequest request={};
   request.action=TRADE_ACTION_PENDING;         // setting a pending order
   request.symbol=_Symbol;                      // symbol
   request.volume=volume;                          // volume in 0.1 lots
   request.sl=price + points;                                // Stop Loss is not specified
   request.tp=price - points;                                // Take Profit is not specified
   request.comment = IntegerToString(combination_number);
   request.type=ORDER_TYPE_SELL_LIMIT;                // order type
//--- form the price for the pending order
   request.price=price;
//--- send a trade request
   MqlTradeResult result={};
   OrderSend(request,result);
//--- return code of the trade server reply
   if(result.retcode == 10009)
   {
   Print("Sell Limit order placed successfully.");
  
   }
    else{
    Print("Sell Limit Order placement failed.");
    }
   return result.retcode;
  }
  
  
  uint buyStop(const int position, const double volume, const int combination_number)
  {
//--- prepare a request
double price = startPrice - points*position;
   MqlTradeRequest request={};
   request.action=TRADE_ACTION_PENDING;         // setting a pending order
   request.symbol=_Symbol;                      // symbol
   request.volume=volume;                          // volume in 0.1 lots
   request.sl=price - points;                                // Stop Loss is not specified
   request.tp=price+points;                                // Take Profit is not specified
   request.comment = IntegerToString(combination_number);
   request.type=ORDER_TYPE_BUY_STOP;                // order type
//--- form the price for the pending order
   request.price=price;
//--- send a trade request
   MqlTradeResult result={};
   OrderSend(request,result);
//--- return code of the trade server reply
   if(result.retcode == 10015)
   {
   Print("Buy Stop order placed successfully.");
  
   }
    else{
    Print("Buy Stop Order placement failed.");
    }
   return result.retcode;
  }
  
  uint sellStop(const int position, const double volume, const int combination_number)
  {
//--- prepare a request
double price = startPrice - points*position;
   MqlTradeRequest request={};
   request.action=TRADE_ACTION_PENDING;         // setting a pending order
   request.symbol=_Symbol;                      // symbol
   request.volume=volume;                          // volume in 0.1 lots
   request.sl=price + points;                                // Stop Loss is not specified
   request.tp=price - points;                                // Take Profit is not specified
   request.comment = IntegerToString(combination_number);
   request.type=ORDER_TYPE_SELL_STOP;                // order type
//--- form the price for the pending order
   request.price=price;
//--- send a trade request
   MqlTradeResult result={};
   OrderSend(request,result);
//--- return code of the trade server reply
   if(result.retcode == 10009)
   {
   Print("Sell Stop order placed successfully.");
  
   }
    else{
    Print("Sell Stop Order placement failed.");
    }
   return result.retcode;
   
      
   
  }
  
  
uint blackSellLimit(const int position, const double volume,const double stoploss, const double takeprofit, const int combination_number)
  {
  
  double price = startPrice + points*position;
  
//--- prepare a request
   MqlTradeRequest request={};
   request.action=TRADE_ACTION_PENDING;         // setting a pending order
   request.symbol=_Symbol;                      // symbol
   request.volume=volume;                          // volume in 0.1 lots
   request.sl=price - stoploss;                                // Stop Loss is not specified
   request.tp=price + takeprofit;                                // Take Profit is not specified
   request.comment = IntegerToString(combination_number);
   request.type=ORDER_TYPE_SELL_LIMIT;                // order type
//--- form the price for the pending order
   request.price=price;
//--- send a trade request
   MqlTradeResult result={};
   OrderSend(request,result);
   
//--- return code of the trade server reply
if(result.retcode == 10009)
   {
   Print("Black sell Limit order placed successfully.");
  
   }
    else{
    Print("Black sell Limit Order placement failed.");
    }
   return result.retcode;
  }

  double round5(double value) {
    int digits = 5; // Number of digits after the decimal point
    double roundedValue = NormalizeDouble(value, digits);
    return roundedValue;
}


void OnStart()
{

Print("Buy1-11 Start");

sellStop(0, volume_1, 1);


sellStop(0, volume_2, 2);


sellStop(0, volume_3, 3);


sellStop(0, volume_4, 4);


sellStop(0, volume_5, 5);


sellStop(0, volume_6, 6);


sellStop(0, volume_7, 7);


sellStop(0, volume_8, 8);


sellStop(0, volume_9, 9);


sellStop(0, volume_10, 10);


sellStop(0, volume_11, 11);

int fail = 0;

while(fail != 11 && succes == false)
{

    Sleep(100);
    double last_price = GetCurrentPrice(symbol, SYMBOL_ASK);
    
    if(last_price <= startPrice && once == false)
    {
   
        first_active_1 = true;
        first_active_2 = true;
        first_active_3 = true;
        first_active_4 = true;
        first_active_5 = true;
        first_active_6 = true;
        first_active_7 = true;
        first_active_8 = true;
        first_active_9 = true;
        first_active_10 = true;
        first_active_11 = true;
        buyLimit(1, volume_1*2, 1);
        buyLimit(1, volume_2*2, 2);
        sellStop(1, volume_3*2, 3);
        sellStop(1, volume_4*2, 4);
        buyLimit(1, volume_5*2, 5);
        sellStop(1, volume_6*2, 6);
        sellStop(1, volume_7*2, 7);
        sellStop(1, volume_8*2, 8);
        buyLimit(1, volume_9*2, 9);
        sellStop(1, volume_10*2, 10);
        sellStop(1, volume_11*2, 11);
        once = true;
    }


    if(failed_1 == false)
    {

        
        if(first_active_1 && last_price >= startPrice + points)
        {

            failed_1 = true;
            first_active_1 = false;
            CancelOrder("1");
        }

        if(first_active_1 && last_price <= startPrice - points)
        {

            first_active_1 = false;
            second_active_1 = true;
        }

        if(second_active_1 && last_price <= startPrice - points*2)
        {

            failed_1 = true;
            second_active_1 = false;
            CancelOrder("1");
        }

        if(second_active_1 && last_price >= startPrice)
        {

            second_active_1 = false;
            third_active_1 = true;
        }

        if(third_active_1 && last_price >= startPrice + points)
        {

            failed_1 = true;
            third_active_1 = false;
            CancelOrder("1");
        }
        
        if(third_active_1 && last_price <= startPrice - points)
        {

            third_active_1 = false;
            fourd_active_1 = true;
        }
        
        if(fourd_active_1 && last_price >= startPrice)
        {

            failed_1 = true;
            fourd_active_1 = false;
            CancelOrder("1");
        }

        if(fourd_active_1 && last_price <= startPrice - points*2)
        {

            fourd_active_1 = false;
            fifth_active_1 = true;
        }

        if(fifth_active_1 && last_price >= startPrice - points)
        {

            failed_1 = true;
            fifth_active_1 = false;
            CancelOrder("1");
        }

        if(fifth_active_1 && last_price <= startPrice - points*3)
        {

            fifth_active_1 = false;
            sixth_active_1 = true;
        }
        
        if(sixth_active_1 && last_price >= startPrice - points*2)
        {

            failed_1 = true;
            sixth_active_1 = false;
        }

        if(sixth_active_1 && last_price <= startPrice - points*4)
        {

            sixth_active_1 = false;
            Print("Sell combination 1 finished");
            succes = true;
        }

        if(failed_1 == false)
        {


            if(last_price <= startPrice - points && third_1 == false && second_active_1)
            {

                sellLimit(0, volume_1*4, 1);
                third_1 = true;
            }    

            if(last_price >= startPrice && fourd_1 == false && third_active_1)
            {

                sellStop(1, volume_1*8, 1);
                fourd_1 = true;
            }
            
            if(last_price <= startPrice - points && fifth_1 == false && fourd_active_1)
            {

                sellStop(2, volume_1*16, 1);
                fifth_1 = true;
            }
            
            if(last_price <= startPrice - points * 2 && sixth_1 == false && fifth_active_1)
            {

                sellStop(3, volume_1*32, 1);
                sixth_1 = true;
            }
        }
        else 
        {

            Print("Sell Combination 1 failed");
            fail++;
        }
    }

    if(failed_2 == false)
    {


        if(first_active_2 && last_price >= startPrice + points)
        {

            failed_2 = true;
            first_active_2 = false;
            CancelOrder("2");
        }

        if(first_active_2 && last_price <= startPrice - points)
        {

            first_active_2= false;
            second_active_2 = true;
        }

        if(second_active_2 && last_price <= startPrice - points*2)
        {

            failed_2 = true;
            second_active_2 = false;
            CancelOrder("2");
        }

        if(second_active_2 && last_price >= startPrice)
        {

            second_active_2 = false;
            third_active_2 = true;
        }

        if(third_active_2 && last_price >= startPrice + points)
        {

            failed_2 = true;
            third_active_2 = false;
            CancelOrder("2");
        }
        
        if(third_active_2 && last_price <= startPrice - points)
        {

            third_active_2 = false;
            fourd_active_2 = true;
        }
        
        if(fourd_active_2 && last_price <= startPrice - points*2)
        {

            failed_2 = true;
            fourd_active_2 = false;
            CancelOrder("2");
        }

        if(fourd_active_2 && last_price >= startPrice)
        {

            fourd_active_2 = false;
            fifth_active_2 = true;
        }

        if(fifth_active_2 && last_price >= startPrice + points)
        {

            failed_2 = true;
            fifth_active_2 = false;
        }

        if(fifth_active_2 && last_price <= startPrice - points*4)
        {

            fifth_active_2 = false;
            Print("Sell combination 2 finished");
            succes = true;
        }

        if(failed_2 == false)
        {

            if(last_price <= startPrice - points && third_2 == false && second_active_2)
            {
                sellLimit(0, volume_2*4, 2);
                third_2 = true;
            }   

            if(last_price >= startPrice && fourd_2 == false && third_active_2)
            {
                buyLimit(1, volume_2*8, 2);
                fourd_2 = true;
            }
            
            if(last_price <= startPrice - points && fifth_2 == false && fourd_active_2)
            {
                blackSellLimit(0, black_volume_2, points*1, points*4, 2);
                fifth_2 = true;
            }
        }
        else 
        {

            Print("Sell Combination 2 failed");
            fail++;
        }
    }

    if(failed_3 == false)
    {

        if(first_active_3 && last_price >= startPrice + points)
        {
            failed_3 = true;
            first_active_3 = false;
            CancelOrder("3");
        }

        if(first_active_3 && last_price <= startPrice - points)
        {
            first_active_3 = false;
            second_active_3 = true;
        }

        if(second_active_3 && last_price >= startPrice)
        {

            failed_3 = true;
            second_active_3 = false;
            CancelOrder("3");
        }

        if(second_active_3 && last_price <= startPrice - points *2)
        {
            second_active_3 = false;
            third_active_3 = true;
        }

        if(third_active_3 && last_price >= startPrice - points)
        {
            failed_3 = true;
            third_active_3 = false;
            CancelOrder("3");
        }
        
        if(third_active_3 && last_price <= startPrice - points*3)
        {
            third_active_3 = false;
            fourd_active_3 = true;
        }
        
        if(fourd_active_3 && last_price <= startPrice - points*4)
        {
            failed_3 = true;
            fourd_active_3 = false;
            CancelOrder("3");
        }

        if(fourd_active_3 && last_price >= startPrice - points*2)
        {
            fourd_active_3 = false;
            fifth_active_3 = true;
        }

        if(fifth_active_3 && last_price >= startPrice - points)
        {
            failed_3 = true;
            fifth_active_3 = false;
            CancelOrder("3");
        }

        if(fifth_active_3 && last_price <= startPrice - points*3)
        {
            fifth_active_3 = false;
            sixth_active_3 = true;
        }
        
        if(sixth_active_3 && last_price >= startPrice - points*2)
        {
            failed_3 = true;
            sixth_active_3 = false;
        }

        if(sixth_active_3 && last_price <= startPrice - points*4)
        {
            sixth_active_3 = false;
            Print("Sell combination 3 finished");
            succes = true;
        }

        if(failed_3 == false)
        {


            if(last_price <= startPrice - points && third_3 == false && second_active_3)
            {

                sellStop(2, volume_3*4, 3);
                third_3 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_3 == false && third_active_3)
            {

                buyLimit(3, volume_3*8, 3);
                fourd_3 = true;
            }
            
            if(last_price <= startPrice - points*3 && fifth_3 == false && fourd_active_3)
            {

                sellLimit(2, volume_3*16, 3);
                fifth_3 = true;
            }
            
            if(last_price >= startPrice - points * 2 && sixth_3 == false && fifth_active_3)
            {

                sellStop(3, volume_3*32, 3);
                sixth_3 = true;
            }
        }
        else 
        {

            Print("Sell Combination 3 failed");
            fail++;
        }
    }

    if(failed_4 == false)
    {


        if(first_active_4 && last_price >= startPrice + points)
        {
            failed_4 = true;
            first_active_4 = false;
            CancelOrder("4");
        }

        if(first_active_4 && last_price <= startPrice - points)
        {
            first_active_4 = false;
            second_active_4 = true;
        }

        if(second_active_4 && last_price >= startPrice)
        {
            failed_4 = true;
            second_active_4 = false;
            CancelOrder("4");
        }

        if(second_active_4 && last_price <= startPrice - points*2)
        {
            second_active_4 = false;
            third_active_4 = true;
        }

        if(third_active_4 && last_price <= startPrice - points*3)
        {
            failed_4 = true;
            third_active_4 = false;
            CancelOrder("4");
        }
        
        if(third_active_4 && last_price >= startPrice - points)
        {
            third_active_4 = false;
            fourd_active_4 = true;
        }
        
        if(fourd_active_4 && last_price >= startPrice)
        {
            failed_4 = true;
            fourd_active_4 = false;
            CancelOrder("4");
        }

        if(fourd_active_4 && last_price <= startPrice - points*2)
        {
            fourd_active_4 = false;
            fifth_active_4 = true;
        }

        if(fifth_active_4 && last_price >= startPrice - points)
        {
            failed_4 = true;
            fifth_active_4 = false;
            CancelOrder("4");
        }
        if(fifth_active_4 && last_price <= startPrice - points*3)
        {
            fifth_active_4 = false;
            sixth_active_4 = true;
        }
        
        if(sixth_active_4 && last_price >= startPrice - points*2)
        {
            failed_4 = true;
            sixth_active_4 = false;
        }

        if(sixth_active_4 && last_price <= startPrice - points*4)
        {
            sixth_active_4 = false;
            Print("Sell combination 4 finished");
            succes = true;
        }

        if(failed_4 == false)
        {


            if(last_price <= startPrice - points && third_4 == false && second_active_4)
            {
                buyLimit(2, volume_4*4, 4);
                third_4 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_4 == false && third_active_4)
            {
                sellLimit(1, volume_4*8, 4);
                fourd_4 = true;
            }
            
            if(last_price >= startPrice - points && fifth_4 == false && fourd_active_4)
            {
                sellStop(2, volume_4*16, 4);
                fifth_4 = true;
            }
            
            if(last_price <= startPrice - points*2 && sixth_4 == false && fifth_active_4)
            {
                sellStop(3, volume_4*32, 4);
                sixth_4 = true;
            }
        }
        else 
        {

            Print("Sell Combination 4 failed");
            fail++;
        }
    }
    

    if(failed_5 == false)
    {

        if(first_active_5 && last_price >= startPrice + points)
        {
            failed_5 = true;
            first_active_5 = false;
            CancelOrder("5");
        }

        if(first_active_5 && last_price <= startPrice - points)
        {
            first_active_5 = false;
            second_active_5 = true;
        }

        if(second_active_5 && last_price <= startPrice - points*2)
        {
            failed_5 = true;
            second_active_5 = false;
            CancelOrder("5");
        }

        if(second_active_5 && last_price >= startPrice)
        {
            second_active_5 = false;
            third_active_5 = true;
        }

        if(third_active_5 && last_price >= startPrice + points)
        {
            failed_5 = true;
            third_active_5 = false;
            CancelOrder("5");
        }
        
        if(third_active_5 && last_price <= startPrice - points)
        {
            third_active_5 = false;
            fourd_active_5 = true;
        }
        
        if(fourd_active_5 && last_price >= startPrice)
        {
            failed_5 = true;
            fourd_active_5 = false;
            CancelOrder("5");
        }

        if(fourd_active_5 && last_price <= startPrice - points*2)
        {
            fourd_active_5 = false;
            fifth_active_5 = true;
        }
        if(fifth_active_5 && last_price <= startPrice - points*3)
        {
            failed_5 = true;
            fifth_active_5 = false;
            CancelOrder("5");
        }

        if(fifth_active_5 && last_price >= startPrice - points)
        {
            fifth_active_5 = false;
            sixth_active_5 = true;
        }
        
        if(sixth_active_5 && last_price >= startPrice + points)
        {
            failed_5 = true;
            sixth_active_5 = false;
        }

        if(sixth_active_5 && last_price <= startPrice - points*4)
        {
            sixth_active_5 = false;
            Print("Sell comtination 5 finished");
            succes = true;
        }

        if(failed_5 == false)
        {

            if(last_price <= startPrice - points && third_5 == false && second_active_5)
            {
                sellLimit(0, volume_5*4,5);
                third_5 = true;
            }    

            if(last_price >= startPrice && fourd_5 == false && third_active_5)
            {
                sellStop(1, volume_5*8,5);
                fourd_5 = true;
            }
            
            if(last_price <= startPrice - points && fifth_5 == false && fourd_active_5)
            {
                buyLimit(2, volume_5*16,5);
                fifth_5 = true;
            }
            
            if(last_price <= startPrice - points * 2 && sixth_5 == false && fifth_active_5)
            {
                blackSellLimit(1, black_volume_5, points*2, points*3,5);
                sixth_5 = true;
            }
        }
        else 
        {
            Print("Sell Combination 5 failed");
            fail++;
        }
    }
    
    if(failed_6 == false)
    {

        if(first_active_6 && last_price >= startPrice + points)
        {
            failed_6 = true;
            first_active_6 = false;
            CancelOrder("6");
        }

        if(first_active_6 && last_price <= startPrice - points)
        {
            first_active_6 = false;
            second_active_6 = true;
        }

        if(second_active_6 && last_price >= startPrice)
        {
            failed_6 = true;
            second_active_6 = false;
            CancelOrder("6");
        }

        if(second_active_6 && last_price <= startPrice - points*2)
        {
            second_active_6 = false;
            third_active_6 = true;
        }

        if(third_active_6 && last_price <= startPrice - points * 3)
        {
            failed_6 = true;
            third_active_6 = false;
            CancelOrder("6");
        }
        
        if(third_active_6 && last_price >= startPrice - points)
        {
            third_active_6 = false;
            fourd_active_6 = true;
        }
        
        if(fourd_active_6 && last_price >= startPrice)
        {
            failed_6 = true;
            fourd_active_6 = false;
            CancelOrder("6");
        }

        if(fourd_active_6 && last_price <= startPrice - points*2)
        {
            fourd_active_6 = false;
            fifth_active_6 = true;
        }

        if(fifth_active_6 && last_price <= startPrice - points*3)
        {
            failed_6 = true;
            fifth_active_6 = false;
            CancelOrder("6");
        }

        if(fifth_active_6 && last_price >= startPrice - points)
        {
            fifth_active_6 = false;
            sixth_active_6 = true;
        }
        
        if(sixth_active_6 && last_price >= startPrice + points)
        {
            failed_6 = true;
            sixth_active_6 = false;
        }

        if(sixth_active_6 && last_price <= startPrice - points*4)
        {
            sixth_active_6 = false;
            Print("Sell combination 6 finished");
            succes = true;
        }

        if(failed_6 == false)
        {

            if(last_price <= startPrice - points && third_6 == false && second_active_6)
            {
                buyLimit(2, volume_6*4, 6);
                third_6 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_6 == false && third_active_6)
            {
                sellLimit(1, volume_6*8, 6);
                fourd_6 = true;
            }
            
            if(last_price >= startPrice - points && fifth_6 == false && fourd_active_6)
            {
                buyLimit(2, volume_6*16, 6);
                fifth_6 = true;
            }
            
            if(last_price <= startPrice - points*2 && sixth_6 == false && fifth_active_6)
            {
                blackSellLimit(1, black_volume_6, points*2, points*3, 6);
                sixth_6 = true;
            }
        }
        else 
        {
            Print("Sell Combination 6 failed");
            fail++;
        }
    }
    
    if(failed_7 == false)
    {


        if(first_active_7 && last_price >= startPrice + points)
        {
            failed_7 = true;
            first_active_7 = false;
            CancelOrder("7");
        }

        if(first_active_7 && last_price <= startPrice - points)
        {
            first_active_7 = false;
            second_active_7 = true;
        }

        if(second_active_7 && last_price >= startPrice)
        {
            failed_7 = true;
            second_active_7 = false;
            CancelOrder("7");
        }

        if(second_active_7 && last_price <= startPrice - points*2)
        {
            second_active_7 = false;
            third_active_7 = true;
        }

        if(third_active_7 && last_price <= startPrice - points*3)
        {
            failed_7 = true;
            third_active_7 = false;
            CancelOrder("7");
        }
        
        if(third_active_7 && last_price >= startPrice - points)
        {
            third_active_7 = false;
            fourd_active_7 = true;
        }
        
        if(fourd_active_7 && last_price <= startPrice - points*2)
        {
            failed_7 = true;
            fourd_active_7 = false;
            CancelOrder("7");
        }

        if(fourd_active_7 && last_price >= startPrice)
        {
            fourd_active_7 = false;
            fifth_active_7 = true;
        }

        if(fifth_active_7 && last_price >= startPrice + points)
        {
            failed_7 = true;
            fifth_active_7 = false;
        }

        if(fifth_active_7 && last_price <= startPrice - points*4)
        {
            fifth_active_7 = false;
            Print("Sell combination 7 finished");
            succes = true;
        }
    
        if(failed_7 == false)
        {
            if(last_price <= startPrice - points && third_7 == false && second_active_7)
            {
                buyLimit(2, volume_7*4, 7);
                third_7 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_7 == false && third_active_7)
            {
                buyStop(1, volume_7*8, 7);
                fourd_7 = true;
            }
            
            if(last_price >= startPrice - points && fifth_7 == false && fourd_active_7)
            {
                blackSellLimit(0, black_volume_7, points*1, points*4, 7);
                fifth_7 = true;
            }
        }
        else 
        {
            Print("Sell Combination 7 failed");
            fail++;
        }
    }

    if(failed_8 == false)
    {

        if(first_active_8 && last_price >= startPrice + points)
        {
            failed_8 = true;
            first_active_8 = false;
            CancelOrder("8");
        }

        if(first_active_8 && last_price <= startPrice - points)
        {
            first_active_8 = false;
            second_active_8 = true;
        }

        if(second_active_8 && last_price >= startPrice)
        {
            failed_8 = true;
            second_active_8 = false;
            CancelOrder("8");
        }

        if(second_active_8 && last_price <= startPrice - points*2)
        {
            second_active_8 = false;
            third_active_8 = true;
        }

        if(third_active_8 && last_price >= startPrice - points)
        {
            failed_8 = true;
            third_active_8 = false;
            CancelOrder("8");
        }
        
        if(third_active_8 && last_price <= startPrice - points*3)
        {
            third_active_8 = false;
            fourd_active_8 = true;
        }
        
        if(fourd_active_8 && last_price <= startPrice - points*4)
        {
            failed_8 = true;
            fourd_active_8 = false;
            CancelOrder("8");
        }

        if(fourd_active_8 && last_price >= startPrice - points*2)
        {
            fourd_active_8 = false;
            fifth_active_8 = true;
        }

        if(fifth_active_8 && last_price <= startPrice - points*3)
        {
            failed_8 = true;
            fifth_active_8 = false;
            CancelOrder("8");
        }

        if(fifth_active_8 && last_price >= startPrice - points)
        {
            fifth_active_8 = false;
            sixth_active_8 = true;
        }
        
        if(sixth_active_8 && last_price >= startPrice + points)
        {
            failed_8 = true;
            sixth_active_8 = false;
        }
            
        if(sixth_active_8 && last_price <= startPrice - points*4)
        {
            sixth_active_8 = false;
            Print("Sell combination 8 finished");
            succes = true;
        }

        if(failed_8 == false)
        {
            if(last_price <= startPrice - points && third_8 == false && second_active_8)
            {
                sellStop(2, volume_8*4, 8);
                third_8 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_8 == false && third_active_8)
            {
                buyLimit(3, volume_8*8, 8);
                fourd_8 = true;
            }
            
            if(last_price <= startPrice - points *3 && fifth_8 == false && fourd_active_8)
            {
                buyStop(2, volume_8*16, 8);
                fifth_8 = true;
            }
            
            if(last_price >= startPrice - points*2 && sixth_8 == false && fifth_active_8)
            {
                blackSellLimit(1, black_volume_8, points*2, points*3, 8);
                sixth_8 = true;
            }
        }
        else 
        {
            Print("Sell Combination 8 failed");
            fail++;
        }
    }

    if(failed_9 == false)
    {
        if(first_active_9 && last_price >= startPrice + points)
        {
            failed_9 = true;
            first_active_9 = false;
            CancelOrder("9");
        }

        if(first_active_9 && last_price <= startPrice - points)
        {
            first_active_9 = false;
            second_active_9 = true;
        }

        if(second_active_9 && last_price <= startPrice - points*2)
        {
            failed_9 = true;
            second_active_9 = false;
            CancelOrder("9");
        }

        if(second_active_9 && last_price >= startPrice)
        {
            second_active_9 = false;
            third_active_9 = true;
        }

        if(third_active_9 && last_price >= startPrice + points)
        {
            failed_9 = true;
            third_active_9 = false;
            CancelOrder("9");
        }
        
        if(third_active_9 && last_price <= startPrice - points)
        {
            third_active_9 = false;
            fourd_active_9 = true;
        }
        
        if(fourd_active_9 && last_price >= startPrice)
        {
            failed_9 = true;
            fourd_active_9 = false;
            CancelOrder("9");
        }

        if(fourd_active_9 && last_price <= startPrice - points*2)
        {
            fourd_active_9 = false;
            fifth_active_9 = true;
        }

        if(fifth_active_9 && last_price >= startPrice - points)
        {
            failed_9 = true;
            fifth_active_9 = false;
            CancelOrder("9");
        }

        if(fifth_active_9 && last_price <= startPrice - points*3)
        {
            fifth_active_9 = false;
            sixth_active_9 = true;
        }
        
        if(sixth_active_9 && last_price <= startPrice - points*4)
        {
            failed_9 = true;
            sixth_active_9 = false;
            CancelOrder("9");
        }

        if(sixth_active_9 && last_price >= startPrice - points*2)
        {
            sixth_active_9 = false;
            seventh_active_9 = true;
        }

        if(seventh_active_9 && last_price >= startPrice + points)
        {
            failed_9 = true;
            seventh_active_9 = false;
        }

        if(seventh_active_9 && last_price <= startPrice - points*4)
        {
            seventh_active_9 = false;
            Print("Sell combination 9 finished");
            succes = true;
        }

        if(failed_9 == false)
        {
            if(last_price <= startPrice - points && third_9 == false && second_active_9)
            {
                sellLimit(0, volume_9*4, 9);        
                third_9 = true;
            }    

            if(last_price >= startPrice && fourd_9 == false && third_active_9)
            {
                sellStop(1, volume_9*8, 9);
                fourd_9 = true;
            }
            
            if(last_price <= startPrice - points && fifth_9 == false && fourd_active_9)
            {
                sellStop(2, volume_9*16, 9);
                fifth_9 = true;
            }

            if(last_price <= startPrice - points*2 && sixth_9 == false && fifth_active_9)
            {
                buyLimit(3, volume_9*32, 9);
                sixth_9 = true;
            }
            
            if(last_price <= startPrice - points * 3 && seven_9 == false && sixth_active_9)
            {
                blackSellLimit(2, black_volume_9, points*3, points*2, 9);
                seven_9 = true;   
            }
        }
        else 
        {
            Print("Sell Combination 9 failed");
            fail++;
        }
    }
    
    if(failed_10 == false)
    {

        
        if(first_active_10 && last_price >= startPrice + points)
        {
            failed_10 = true;
            first_active_10 = false;
            CancelOrder("10");
        }

        if(first_active_10 && last_price <= startPrice - points)
        {
            first_active_10 = false;
            second_active_10 = true;
        }

        if(second_active_10 && last_price >= startPrice)
        {
            failed_10 = true;
            second_active_10 = false;
            CancelOrder("10");
        }

        if(second_active_10 && last_price <= startPrice - points*2)
        {
            second_active_10 = false;
            third_active_10 = true;
        }

        if(third_active_10 && last_price <= startPrice - points*3)
        {
            failed_10 = true;
            third_active_10 = false;
            CancelOrder("10");
        }
        
        if(third_active_10 && last_price >= startPrice - points)
        {
            third_active_10 = false;
            fourd_active_10 = true;
        }
        
        if(fourd_active_10 && last_price >= startPrice)
        {
            failed_10 = true;
            fourd_active_10 = false;
            CancelOrder("10");
        }

        if(fourd_active_10 && last_price <= startPrice - points*2)
        {
            fourd_active_10 = false;
            fifth_active_10 = true;
        }

        if(fifth_active_10 && last_price >= startPrice - points)
        {
            failed_10 = true;
            fifth_active_10 = false;
            CancelOrder("10");
        }

        if(fifth_active_10 && last_price <= startPrice - points*3)
        {
            fifth_active_10 = false;
            sixth_active_10 = true;
        }
        
        if(sixth_active_10 && last_price <= startPrice - points*4)
        {
            failed_10 = true;
            sixth_active_10 = false;
            CancelOrder("10");
        }

        if(sixth_active_10 && last_price >= startPrice - points*2)
        {
            sixth_active_10 = false;
            seventh_active_10 = true;
        }

        if(seventh_active_10 && last_price >= startPrice + points)
        {
            failed_10 = true;
            seventh_active_10 = false;
        }

        if(seventh_active_10 && last_price <= startPrice - points*4)
        {
            seventh_active_10 = false;
            Print("Sell combination 10 finished");
            succes = true;
        }

        if(failed_10 == false)
        {


            if(last_price <= startPrice - points && third_10 == false && second_active_10)
            {
                buyLimit(2, volume_10*4, 10);
                third_10 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_10 == false && third_active_10)
            {
                sellLimit(1, volume_10*8, 10);
                fourd_10 = true;
            }
            
            if(last_price >= startPrice - points && fifth_10 == false && fourd_active_10)
            {
                sellStop(2, volume_10*16, 10);
                fifth_10 = true;
            }
            
            if(last_price <= startPrice - points * 2 && sixth_10 == false && fifth_active_10)
            {
                buyLimit(3, volume_10*32, 10);
                sixth_10 = true;
            }
            
            if(last_price <= startPrice - points*3 && seven_10 == false && sixth_active_10)
            {
                blackSellLimit(2, black_volume_10, points*3, points*2, 10);
                seven_10 = true;   
            }
        }
        
        else 
        {
            Print("Sell Combination 10 failed");
            fail++;
        }
    }
    
    if(failed_11 == false)
    {


        if(first_active_11 && last_price >= startPrice + points)
        {
            failed_11 = true;
            first_active_11 = false;
            CancelOrder("11");
        }

        if(first_active_11 && last_price <= startPrice - points)
        {
            first_active_11 = false;
            second_active_11 = true;
        }

        if(second_active_11 && last_price >= startPrice)
        {
            failed_11 = true;
            second_active_11 = false;
            CancelOrder("11");
        }

        if(second_active_11 && last_price <= startPrice - points*2)
        {
            second_active_11 = false;
            third_active_11 = true;
        }

        if(third_active_11 && last_price >= startPrice - points)
        {
            failed_11 = true;
            third_active_11 = false;
            CancelOrder("11");
        }
        
        if(third_active_11 && last_price <= startPrice - points*3)
        {
            third_active_11 = false;
            fourd_active_11 = true;
        }
        
        if(fourd_active_11 && last_price <= startPrice - points*4)
        {
            failed_11 = true;
            fourd_active_11 = false;
            CancelOrder("11");
        }

        if(fourd_active_11 && last_price >= startPrice - points*2)
        {
            fourd_active_11 = false;
            fifth_active_11 = true;
        }

        if(fifth_active_11 && last_price >= startPrice - points)
        {
            failed_11 = true;
            fifth_active_11 = false;
            CancelOrder("11");
        }

        if(fifth_active_11 && last_price <= startPrice - points*3)
        {
            fifth_active_11 = false;
            sixth_active_11 = true;
        }
        
        if(sixth_active_11 && last_price <= startPrice - points*4)
        {
            failed_11 = true;
            sixth_active_11 = false;
            CancelOrder("11");
        }

        if(sixth_active_11 && last_price >= startPrice - points*2)
        {
            sixth_active_11 = false;
            seventh_active_11 = true;
        }

        if(seventh_active_11 && last_price >= startPrice + points)
        {
            failed_11 = true;
            seventh_active_11 = false;
        }

        if(seventh_active_11 && last_price <= startPrice - points*4)
        {
            seventh_active_11 = false;
            Print("Sell combination 11 finished");
            succes = true;
        }

        if(failed_11 == false)
        {


            if(last_price <= startPrice - points && third_11 == false && second_active_11)
            {
                sellStop(2, volume_11*4, 11);
                third_11 = true;
            }    

            if(last_price <= startPrice - points*2 && fourd_11 == false && third_active_11)
            {
                buyLimit(3, volume_11*8, 11);
                fourd_11 = true;
            }
            
            if(last_price <= startPrice - points*3 && fifth_11 == false && fourd_active_11)
            {
                sellLimit(2, volume_11*16, 11);
                fifth_11 = true;
            }
            
            if(last_price >= startPrice - points * 2 && sixth_11 == false && fifth_active_11)
            {
                buyLimit(3, volume_11*32, 11);
                sixth_11 = true;
            }
            
            if(last_price <= startPrice - points*3 && seven_11 == false && sixth_active_11)
            {
                blackSellLimit(2, black_volume_11, points*3, points*2, 11);
                seven_11 = true;
            }
        }
        else 
        {
            Print("Sell Combination 11 failed");
            fail++;
        }
    }
    
}
}