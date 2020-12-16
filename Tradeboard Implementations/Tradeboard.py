import smartpy as sp

class Tradeboard(sp.Contract):
    
    def __init__(self):
        self.init()
        self.Trades = []
    
    @sp.entry_point
    def createTrade(self, name, price, description, payload):
        
        
        
        
        trade = Trade(name, price, description, payload, sp.sender.identity, '')
        
        self.Trades.append(trade)
       
        sp.result(0) 
        

    @sp.entry_point 
    def purchase(self, tradeId: int):
        
        #check statements sp.verify??? or if statements???
        
        trade = self.Trades[0]
        
        trade.buyer = sp.sender
        
        sp.send(trade.buyer, sp.amount, "transfer failed!")
        
        trade.completed = True;
        
        sp.result(self.Trades[0].payload)
    

    @sp.entry_point
    def getTradeboard(self):
        
        totalString = ''
        for trade in self.Trades:
            
            string = '{0}, {1}, {2}.\n'.format(trade.name, trade.description, trade.price)
            
            totalString = totalString.join(string)
    
        
        sp.result(totalString)
    
    
    
    @sp.entry_point
    def getTradeInfo(self, tradeId: int):
        
        string = '{0}, {1}, {2}.\n'.format(trade.name, trade.description, trade.price)
        
        sp.result(string)
        
    
class Trade:
    
    def __init__(self, name, price, description, payload, seller, buyer):
        
        self.name = name
        self.price = price
        self.description = description
        self.payload = payload
        self.seller = seller
        self.buyer = buyer
        self.completed = False
        
    

@sp.add_test(name = "Test Tradeboard")

def testTradeboard():
    
    scenario = sp.test_scenario()
    
    scenario.h1("Tradeboard")
    
    c1 = Tradeboard()
    
    seller = sp.test_account("seller")
    buyer = sp.test_account("buyer")
    
    scenario.h2("testing createTrade")
    
    scenario += c1.createTrade(0, 100, "description", "payload").run(sender = seller).html()
    
    scenario.h2("testing getTradeboard")
    
    scenario += c1.getTradeboard().run(sender = seller).html()
    
    scenario.h2("testing purchase")
    
    scenario += c1.purchase(0).run(sender = buyer, amount = 100).html()
