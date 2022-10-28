// I'm a comment!
// SPDX-License-Identifier: MIT

// pragma solidity 0.8.7;
pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    //virtual keyword is added to parent function to make it overridable by its child
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

/*
Calldata:
-Variable only gonna exist temporarily
-Can be Modified

Memory:
-Variable only gonna exist temporarily
-Cannot be Modified

Storage:
-Permanent Storage in the blockchain
-Can be Modified
-------------------------------------

Data location can only be specified for array, struct , mapping types or String

/*
