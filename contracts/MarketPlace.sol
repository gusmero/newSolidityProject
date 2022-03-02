pragma solidity >0.5.12 <0.9.0;

contract Marketplace {
    address public seller;
    address public buyer;
    mapping (address => uint) public balances;

    event ListItem(address seller, uint price);
    event PurchasedItem(address seller, address buyer, uint price);

    enum StateType {
          ItemAvailable,
          ItemPurchased
    }

    StateType public state;

    constructor() public {
        seller = msg.sender;
        state = StateType.ItemAvailable;
    }

    function initializeBalance( address participant , uint amount) public {
        balances[participant] = amount;
    }

    function buy(address seller, address buyer, uint price) public payable {
        require(price <= balances[buyer], "Insufficient balance");
        state = StateType.ItemPurchased;
        balances[buyer] -= price;
        balances[seller] += price;

        emit PurchasedItem(seller, buyer, msg.value);
    }

    // Function to get the status of the shipping
    function getBalance(address account) internal view returns (uint ) {
     // Check the current status and return the correct name
     return balances[account];
    }


    // Function to get the status of the shipping
    function getState(StateType _status) internal pure returns (string memory) {
     // Check the current status and return the correct name
     if (StateType.ItemAvailable == _status) return "ItemAvailable";
     if (StateType.ItemPurchased == _status) return "ItemPurchased";
    }

   // Get status of your shipped item
    function State() public view returns (string memory) {
         StateType _state = state;
         return getState(_state);
    }
}