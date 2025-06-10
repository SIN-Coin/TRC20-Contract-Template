// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SINCOIN {
    string public name = "SINCOIN";
    string public symbol = "SIN";
    uint8 public decimals = 6;
    uint256 public totalSupply = 1000000000000000; // 1 میلیارد با 6 رقم اعشار

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
