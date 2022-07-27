// SPDX-License-Identifier: aIT
pragma solidity >=0.5.0 <0.9.0;

contract day1 {

    function digitSum(int n)public pure returns(int){
    int sum;
    while(n>0){
    int storingVariable=n%10;
    sum+=storingVariable;
    n=n/10;
    }

    return sum;
    }

}
