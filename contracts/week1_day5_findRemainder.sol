// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract day5 {
    
    function find(int a)public pure returns(int){
    //require(a>0,"a eqals to 0");
    a%=3;
    return a;  
    }
}
