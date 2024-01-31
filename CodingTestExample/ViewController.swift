//
//  ViewController.swift
//  CodingTestExample
//
//  Created by Perennials on 30/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //problem statement-1
        // 1. compute the number of numericals in a string
        self.computeNumericalsInString(str: "ABC123DEFNNS45")
        //Another approach to get numericals
        print(self.extractNumericals(from: "nnbasjsbdj12js77"))
        
        // 2. Find the occurance of a character in a string
        let inputString = "Perennial!"
        let charToFind: Character = "n"

        let occurrences = findTheOccuranceOfCharacter(character: charToFind, in: inputString)
        print("The character '\(charToFind)' occured \(occurrences) times in the string.")

        // 3. Reverse an arry
        let arrayData = [12,13,14,19,25]
        print(reverseAnArray(arr: arrayData))
        
        //Another approach to reverse array without using reverse function
        let names: [String] = ["Pere", "ios apps development", "mynt", "bharath", "aaa"]

        let reverseArr = self.reverseArrayWithoutReverseFunction(namesArr: names)

        print(reverseArr)
        
        // 4. Remove duplicate letters from a string
        let stringWithDuplicateValues = "ios apps development"
        let stringWithoutDuplicateValues = removeDuplicates(from: stringWithDuplicateValues)
        print("string With Duplicate Values is: \(stringWithDuplicateValues)")
        print("String without Duplicate values: \(stringWithoutDuplicateValues)")
        
        // 5. calculate the number of vowels and consonants in a string
        let combinedString = "Swift language!"
        let counts = countVowelsAndConsonants(in: combinedString)

        print("Vowel Count: \(counts.vowels)")
        print("Consonant Count: \(counts.consonants)")

        // 6. Find the max elment in an array
        let numbers = [17, 24, 22, 17, 9, 14]

        if let maxElement = findTheMaxElement(in: numbers) {
            print("Maximum Element is : \(maxElement)")
        } else {
            print("The array is empty.")
        }
    }

    // 1
    func computeNumericalsInString (str:String) {
        let countVal = String(str.filter { "0"..."9" ~= $0 }).count
        print(countVal)
    }
    
    // another approach
    func extractNumericals(from input: String) -> [Int] {
        do {
            let regex = try NSRegularExpression(pattern: "\\d+")
            let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
            
            let numbers = matches.map { match in
                Int((input as NSString).substring(with: match.range)) ?? 0
            }
            
            return numbers
        } catch {
            print("Error creating regular expression: \(error.localizedDescription)")
            return []
        }
    }

    // 2
    func findTheOccuranceOfCharacter(character: Character, in inputString: String) ->Int {
            var count = 0
            for char in inputString {
                if char == character {
                    count += 1
                }
            }
            
            return count
        }
    
    // 3
    func reverseAnArray(arr:[Int]) -> [Int]  {
         return arr.reversed()
    }
    //another approach
    func reverseArrayWithoutReverseFunction (namesArr:[String]) ->[String]  {
        var reverseArr: [String] = []
        for index in 0..<namesArr.count {
            reverseArr.insert(namesArr[namesArr.count-index-1], at: index)
        }
        return reverseArr
    }
    
    // 4
    func removeDuplicates(from input: String) -> String {
        var uniqueCharacters = Set<Character>()
        var result = ""

        for char in input {
            if !uniqueCharacters.contains(char) {
                uniqueCharacters.insert(char)
                result.append(char)
            }
        }
        return result
    }

    // 5
    func countVowelsAndConsonants(in input: String) -> (vowels: Int, consonants: Int) {
        let vowelsSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        
        var vowelCount = 0
        var consonantCount = 0
        
        for char in input {
            if vowelsSet.contains(char) {
                vowelCount += 1
            } else if char.isLetter {
                consonantCount += 1
            }
        }
        
        return (vowelCount, consonantCount)
    }

    // 6
    func findTheMaxElement(in array: [Int]) -> Int? {
        guard !array.isEmpty else {
            return nil
        }
        var maxElement = array[0]

        for element in array {
            if element > maxElement {
                maxElement = element
            }
        }
        return maxElement
    }
    
}

