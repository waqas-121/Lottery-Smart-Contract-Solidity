// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract FunctionArgument{
    uint public a; 

    function set(uint _a)public 
    {
        a=_a;
    }
    function get()public view returns(uint)
    {
        return a;
    }
}
