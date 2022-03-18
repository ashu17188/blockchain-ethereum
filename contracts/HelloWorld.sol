pragma solidity >=0.5.0;

contract HelloWorld {
    string private _greeting = "Hello, World!";
    address private _owner;

    constructor() public {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Ownable: caller is not owner");
        _;
    }

    //Here we created a function with the identifier or name greet, which does not take any parameters.
    // Following the identifier, we indicated that our function is an external function. This means that
    // it is part of our contract’s interface and can be called from other contracts, or from transactions,
    // but cannot be called from within the contract or at least not without an explicit reference to the
    // object it is being called on. Our other options here are public, internal, and private.

    // public functions are also part of the interface, meaning they can be called from other contracts or
    // transactions, but additionally they can be called internally. This means you can use an implicit
    // receiver of the message when invoking the method inside of a method.

    //Functions that will not alter the state of the contract’s variables can be marked as either pure or
    // view. pure functions do not read from the blockchain. Instead, they operate on the data passed in
    // or, as in our case, data that did not need any input at all. view functions are allowed to read
    // data from the blockchain, but again they are restricted in that they cannot write to the blockchain.
    function greet() external view returns (string memory) {
        return _greeting;
    }

    //The calldata location is only needed when the function is declared as external and when the data
    // type of the parameter is a reference type such as a mapping, struct, string, or array. Using value
    // types like int or address do not require this label.
    function setGreeting(string calldata greeting) external onlyOwner {
        _greeting = greeting;
    }

    //Since this is a getter function, we’ll need to add a state variable that will hold the address of
    // the owner, and then our function should return that address. The Solidity language provides two
    // address types: one is address and the other is address payable. The difference between them is that
    // address payable gives access to the transfer and send methods, and variables of this type can also
    // receive ether. We are not sending ether to this address and we can use the address type for our
    // purposes.
    function owner() public view returns (address) {
        return _owner;
    }
}
