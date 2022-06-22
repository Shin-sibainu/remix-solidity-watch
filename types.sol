//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypeContract {
    //ステート変数
    //ブロックチェーンに保存される。
    //保存されるたびにガス代が発生する。
    uint public myUint = 1;  // myUint >= 0
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;
    int public myInt = 1; //-1

    string public myString = "Hello Web3.0!"; 
    bytes32 public myBytes32 = "Hello Web3.0";

    address public myAddress = 0x5832479A4A744e108BcE4c14Ea2E856ca97cB2E9;

    struct MyStruct {
        string name;
        uint256 age;
    }

    MyStruct public myStruct = MyStruct("Shincode", 24);

    //ローカル変数
    function getValue() public pure returns(uint){
        //関数が使う変数は、そのスコープによって大量にガスを消費することになる。
        uint value = 1;
        return value;
    }
}

//view : 参照のみの可能なテーブル（値だけ取得できる）
//pure : 純粋に関数内でしか使えない(値に書き込むことも参照することもできない)