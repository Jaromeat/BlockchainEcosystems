pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

/** 
 * @title Tradeboard
 * @dev Implements 
 */
contract Tradeboard {
   
    struct Trade {
        uint id;
        string name;
        uint price;
        string description;
        string payload;
        address seller;
        bool accepted;
        bool fulfilled;
        address buyer;
        address[] offers;
        mapping(address => bool) offerMap;
        
    }
    
    struct TradeInfo {
        uint id; 
        string name; 
        uint price; 
        string description; 
        bool accepted; 
        bool fulfilled;
    }


    Trade[] tradeboard;
    
   
    function getTradeBoard() public view returns (TradeInfo[] memory tradeboard) {
        
        TradeInfo[] memory tradeInfo;
        
        for(uint i = 0; i < tradeboard.length; i++) {
            tradeInfo[i] = this.getTradeInfo(i);
        }
        return tradeInfo;
    }

    function getTradeInfo(uint tradeId) public view returns (TradeInfo memory trade) {
        
        Trade memory trade = tradeboard[tradeId];
        
        TradeInfo memory tradeInfo = new TradeInfo(
            
            trade.id,
            trade.name,
            trade.price,
            trade.description, 
            trade.accepted,
            trade.fulfilled
        );
        return trade;
        
    }
    
    
    function getOffers(uint tradeId) public view returns (address[] memory buyer) {
        return tradeboard[tradeId].offers;
        
    }

    
    function createTrade(string memory name, uint price,
                string memory description, string memory payload) public {
                    
        Trade memory newTrade = new Trade(tradeboard.length, name, price, 
        description, payload, msg.sender);
        tradeboard.push(newTrade);
    }

    
    function makeOffer(uint tradeId) public 
    {
        Trade storage trade = tradeboard[tradeId];
        
        require(trade.seller != msg.sender, "Can't make offers on your own request!");
        
        require(!trade.completed, "Trade is no longer available!");
        
        require(!trade.offerMap(msg.sender), "You have already made an offer!");
        
        trade.offers.push(msg.sender);
        trade.offerMap[msg.sender] = true;
        
    }

    
    function acceptOffer(uint tradeId, address buyer) public view 
    {
        Trade storage trade = tradeboard[tradeId];
        
        require(trade.seller = msg.sender, "Only the seller can accept offers for this Trade!");
        
        require(!trade.accepted, "Trade has already been completed!");
        
        require(trade.offerMap[buyer], "Buyer doesn't match any offers!");
        
        trade.buyer = buyer;
        
        trade.accepted = true;
        
        trade.offers[buyer] = tradeId;
    }
    
    
     function fullfillTrade(uint tradeId) public payable returns (string memory payload) {
        
        Trade memory trade = tradeboard[tradeId];
        
        require(!trade.fulfilled, "Trade has already been fulfilled!");
        
        require(trade.accepted, "Buyer has yet to accept an offer!");
        
        require(trade.offerMap[msg.sender], "You haven't put in an offer for this Trade!");
        
        require(trade.buyer = msg.sender, "Your offer has not yet been accepted!");
        
        trade.seller.transfer(msg.value);
        
        return trade.payload;
     }
        
        
}
