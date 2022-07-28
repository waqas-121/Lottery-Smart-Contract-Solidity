//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Day30{

function concatenate(string memory a,string memory b) public pure returns(string memory)
{
    return string.concat(a," ",b);
} 
   
}
