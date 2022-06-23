// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract HotelRoom {
    //Vacant(空き室)
    //Occupid(満室)

    enum Statuses {Vacant, Occupied}
    Statuses public currentStatuses;

    //バック→フロントへ向けたメッセージの役割
    event Occupy(address _occupant, uint _value);

    //payable は送金を受け取る側.ただのaddressだと受け取れない。
    //payable だとお金のやりとりができる。senderとかtransferが使える。
    address payable public owner;

    constructor() {
        owner = payable(msg.sender); //メッセージの送信者のアカウントのアドレス
        currentStatuses = Statuses.Vacant; //最初はあきべや　
    }

    modifier onlyWhileVacant {
        //Check status
        require(currentStatuses == Statuses.Vacant,"already ocuppied");
        _;
    }

    modifier costs(uint _amount) {
        //Check price
        require(msg.value >= _amount, "not enough eth");
         _;
    } 

    //予約しよう。
    function booking() public payable onlyWhileVacant costs(2 ether) { 
        //Check price
        //require(msg.value >= _amount, "Not enough ether provided");

        //Check status
        //requireの引数がfalseの時は例外を投げる
        // require(currentStatuses == Statuses.Vacant,"already ocuppied");
        currentStatuses = Statuses.Occupied; //予約したら満室にする。
        //受信者(オーナー)にお金を送金する。
        //メッセージと一緒に送られたweiの量。
        //イーサリアム上のEther（ETH）の最小単位。
        // 1 wei = 0.000000000000000001 ETH。
        // owner.transfer(msg.value);　これだと送信するガス量が制限される。データの読み込みくらしかできない。

        //他のコントラクトとやり取りするための関数
        //戻ってきたデータをバイト単位でメモリします。
        (bool isSuccess, bytes memory data) = owner.call{value: msg.value}("I want to Booking.");
        // require(true);

        emit Occupy(msg.sender, msg.value); //ownerにETHを払う
    }
}