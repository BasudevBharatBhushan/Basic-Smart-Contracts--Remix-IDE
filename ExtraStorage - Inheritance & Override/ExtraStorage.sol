// SPDX-License-Identifier: MIT

/*INHERITANCE & OVERRIDE*/

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    // +5
    //ovveride
    // virtual override

    function store(uint256 _favoriteNumber)public override{
        favoriteNumber = _favoriteNumber+5;
    }
}