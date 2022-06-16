// SPDX-Lisence-Identifier: MIT
pragma solidity ^0.8.8;

// EVM: Ethereum Virtual Machine
// Avalanche, Fantom, Polygon

// Initializing your contract 
contract SimpleStorage {
    // Basic data types


    //boolean, uint, int addtress, bytes

    // bool hasFavouriteNumber = true;
    // uint32 favouriteNumber = 5;    //  Unsigned Integers
    // string favouriteNumberInWords = "FIVE";
    // int256 favouriteInt = -5;  //    Signed Integers
    // address myAddress = 0x92379b927g8137r8723f873fvb8;
    // bytes32: favouriteBytes = "cat";



    // private functions are only visible to the contract 
    // external functions are only visible externally 
    // private functions are only visible internally 

    // public variables are visible internally and externally 
    // initilizing a variable to 0
    uint256 favouriteNumber;

    // Solidity Basic Mapping
    mapping(string => uint256) public nameToFavouriteNumber;

    // initializing a new data type with struct
    struct People {
        uint256 favouriteNumber;
        string name;
    };


    
    // Intializing a dynamic array with array 
    People[] public people;

    // // Structs & Arrays
    // People public person = People(
    //     {
    //         favouriteNumber: 2, 
    //         name: "patrick";  
    //     };
    // );

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    };

    // (view, pure) are use to declear functions that do not require computations 
    function retrieve () public view returns (uint256) {
        return favouriteNumber;
    };

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name})
        people.push(newPerson);
        // OR
        // people.push(People(_favouriteNumber, _name));

        // Mapping
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }; 
    
        // Memory{ EVM Overview (EVM can access and store information in six places) {
            // 1. Stack
            // 2. Memory: Are Temporary variables that can be modified  
            // 3. Storage: Are Permanent variables that can be modified
            // 4. Calldata: Are Temporary variables that CANNNOT be modified 
            // 5. Code
            // 6. Logs
        // }


    // function add() public pure returns (uint256) {
    //     return favouriteNumber;
    // };
    
};