// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Counter {
    //符号なし整数型 【uint型】 unsigned integer type
    //0と正の数のみを表現できる整数型
    // uint count; // 1, 2, 3...
    // uint public count; // -> delete getCount()
    uint public count = 0; // -> delete constructor()

    // constructor() public {
    //     count = 0;
    // } 

    // function getCount() public view returns(uint) {
    //     return count; 
    // }

    //gasが発生する -> blockchainに変更を加えているから
    function incrementCount() public {
        count = count + 1;
    }
}