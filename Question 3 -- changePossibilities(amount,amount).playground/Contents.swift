//: Playground - noun: a place where people can play

import UIKit

/*
 Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.
 
 Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.
 
 Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
 
 1¢, 1¢, 1¢, 1¢
 1¢, 1¢, 2¢
 1¢, 3¢
 2¢, 2¢
 */

private func coinChange(_ coins: [Int], _ amount: Int,_ idx: Int) -> Int {
    if amount < 0 { return 0 }
    if amount == 0 { return 1 }
    // means coins over and n>0 so no solution
    if idx == coins.count && amount > 0 { return 0 }
    
    return coinChange(coins, amount - coins[idx], idx) + coinChange(coins, amount, idx + 1)
}

/*
 Time Complexity : 2^n
 
*/

let myCoins = [1,2,3]
let amount = 5
coinChange(myCoins, amount, 0)
