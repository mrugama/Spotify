//: Playground - noun: a place where people can play

import UIKit
/*
Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab"
 For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
*/

private func decodeString(_ encode: String) -> String {
    let arrEncode = Array(encode)
    var finalStr = ""
    let digits = CharacterSet.decimalDigits
    //var newStr = ""
    guard encode.count > 1 else {return encode}
    if digits.contains(arrEncode[0].unicodeScalars.first!) {
        guard let num = Int(String(arrEncode[0])) else {return finalStr}
        for _ in 1...num {
            for i in arrEncode.indices {
                if i == 0 {continue}
                if arrEncode[i] == "[" || arrEncode[i] == "]" { continue }
                if digits.contains(arrEncode[i].unicodeScalars.first!) {
                    finalStr += decodeString(arrEncode[i...].map{String($0)}.joined())
                    break
                } else {
                    finalStr.append(String(arrEncode[i]))
                }
            }
        }
    }
    return finalStr
}

decodeString("4[ab]") //expected: abababab
decodeString("2[b2[a3[q]]]") //expected: baaabaaa

