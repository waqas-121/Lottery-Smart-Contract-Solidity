// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Function{
    
    
    uint a=10;

    function returnStateVariable( ) public view returns(uint)
    {
        return a;
    }

    function returnLocalVariable( ) public pure returns(uint)
    {
        uint b=20;
        return b;
    }
}
