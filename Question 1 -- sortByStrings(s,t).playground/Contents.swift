//: Playground - noun: a place where people can play

import UIKit

/*
 Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".
 */

private func sortByStrings(_ s: String, by t: String) -> String {
    var toSortStr: [Character?] = Array(s)
    var newString = ""
    for x in t {
        //newString.append(toSortStr.filter{$0 == x})
        for (idx, val) in toSortStr.enumerated() where val == x {
            newString.append(val!)
            toSortStr[idx] = nil
        }
    }
    newString += toSortStr.compactMap{$0}
    return newString
}

sortByStrings("good", by: "odg")
