// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //Any version of 0.8.7 or above is OK   />=0.8.7 <0.9.0 --> another type of notation

contract SimpleStorage {
    // boolean, uint (Default uint256), int, address, bytes

    // This gets initialized to zero
    uint public favoriteNumber;   
    // public variable implicitly get assigned a function that returns its value
    // default visibility parameter is internal

    function store(uint256 _favoriteNumber)public {
        favoriteNumber = _favoriteNumber;
    }

    //function resembeling the global variable call at 8
    function retrieve()public view returns(uint256){
        return favoriteNumber;
        retrieve(); //if we call a view function inside a func that costs gas then it will cost gas
    }

    //view & pure function do not cost gas becasue it donot change the data in blockchain network
    //--> view is used to read the the function state
    //--> pure functions additionally disallow you to read from blockchain state

    function add() public pure returns (uint256){
        return(1+1);
    }

}

//0xd9145CCE52D386f254917e481eB44e9943F39138 --->address of deployed smart contract