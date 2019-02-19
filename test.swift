//CSCI 294 Final Notes

//Var vs Let variables
var myName = "Palucki"
myName = "Kyle " + myName
let yourName = "Last"
// yourName = yourName + " First" // Can't change a constant - returns an error

//========================================

//Integers in swift
/* Integter types are:
 Int8     UInt8
 Int16    UInt16
 Int32    UInt32
 Int64    UInt64
 
 Int, signed and the same size as the platform word size
 UInt, unsigned and the same size as the platform word size
 */
 
//: 8-bit Singed Integer
 
// maximum value is (2^7)-1
Int8.max
pow(2,7)-1
// minimum value is -(2^7)
Int8.min
-pow(2,7)

//: 8-bit Unsigned Integer

// maximum is (2^8) - 1
UInt8.max
pow(2,8) - 1

// minimum is zero
UInt8.min

//==========================================================

//Doubles in swift
// There are five types for floating point numbers
let a: Float = 32    // IEEE 754 32 bit FP number
let b: Double = 64   // IEEE 754 64 bit FP number
let c: Float32 = 32  // IEEE 754 32 bit FP number
let d: Float64 = 64  // IEEE 754 64 bit FP number
let e: Float80 = 80  // Extended precision

//: Numeric Literals
// Can use underscores to make things easier to read
let bigNumber = 100_000_000
let smallNumber = 12.123_324_3

// Different ways to write integer literals
let decimalInteger = 20
let binaryInteger = 0b1_0100 // 20 in binary, used _ for bytes
let octalInteger = 0o24      // 20 in octal
let hexInteger = 0x14       // 20 in hex

// Floating Point Literals without exponents
let simpleDec = 3.2
//let doesntWork = .2 // must have leading digit in from of point
let correct = 0.2

// Floating Point Literals with exponents
let exponentDouble = 12.2345e12 // 12.2345 x 10 ^ 12
let negExpDouble = 12.3456e-19  // 12.3456 x 10 ^ -19

let hexDouble = 0xAE15p12       // AE15 x 2 ^ 12

//=========================================================

//Type Inference
var x = 50 //Type inference by default assigns this as an integer
var name = "Kyle" 

//Type Annotation
var num:Double = 50 //Type annotation turns this into a double regardless of floating point decimal
var char:Character = "x"

//==========================================================

//Functions in swift
func stats(_ values:Int ...) -> (smallest:Int, biggest:Int, average:Double){
    var theMin = Int.max
    var theMax = Int.min
    var theSum = 0
    
    for number in values {
        if number < theMin{
            theMin = number
        }
        
        if number > theMax {
            theMax = number
        }
        
        theSum += number
    }
    
    let average:Double = Double(theSum)/Double(values.count)
    return(theMin, theMax, average)
}

let results = stats(5,6,5,4,5,6,67,65,5,4,0)
print("min = \(results.smallest)")
print("max = \(results.biggest)")
print("avg = \(results.average)")

//: ## In-Out Parameters
func changeString(_ s: inout String){
    s.append(" ")
    s.append(s)
}

var school = "Ambrose"
print(school)
changeString(&school)
print(school)


func changeInt(_ i: inout Int){
    i = i * 2
}

var value = 12
print("\(value)")
changeInt(&value)
print("\(value)")

//=====================================================

//LOOOOOOOOOOOOPS
var value:Int = 0
for number in 1 ... 100 {
    value += number
}
 print(value)

// Another loop
value = 0
for _ in 1 ... 100{
    value += 1
}
print(value)


//: While Loops
var i = 0
value = 0
while i < 10 {
    value += i
    i += 1
}
print(value)


//: Repeat-While
i = 0
value = 1
repeat {
    value += i
    i += 1
} while i < 20
print(value)

//======================================================

//Strings
import Foundation

// Multi-Line tripple quoted strings
var address = """
12 Plymouth Rd.
Westbrook, CT
06498
"""

print(address)

// isEmpty()
address.isEmpty

// String vs. Character
let a = "A"
let b:Character = "B" // Characters use double quotes
type(of:a)
type(of:b)

// Basic string methods
var result = address.lowercased()
address.uppercased()
address.hasPrefix("12")
address.hasSuffix("06498")
address.contains("Westbrook") // need to import Foundation
address.count // Not a method, no parens ()

// Cannot index strings with an Int
// Instead, need to use a String.Index
var town = "Westbrook"
var index = town.startIndex
type(of:town)
type(of:index) // Notice, this is not an Int
town[index]
index = town.endIndex // This is an index that's one past the end
//town[index] // not character here

// How to get the last character, since we ant use endIndex?
let index1 = town.endIndex
let index2 = town.index(before: index1)
town[index2]

// Put this all in one line
town[town.index(before: town.endIndex)]

// Get character at index position 4
town[town.index(town.startIndex, offsetBy:4)]

// Substrings - You get a Substring type, not a String type
town = "Old Saybrook"
index = town.index(of:" ") ?? town.endIndex
let beginning = town[..<index] // set beginning to Old
type(of:beginning)
print(beginning)
// Can easily convert the Substring to a String
let newString = String(beginning)
type(of:newString)
print(newString)

//=============================================

//Structs
struct Rectangle {
    var height:Int
    var width:Int
}

//var rect = Rectangle1() // Doesn't work, initial values not given
var rect = Rectangle1(height: 10, width: 3)

// With initial Values
struct Rectangle2 {
    var height:Int = 1
    var width:Int = 2
}
var rect2 = Rectangle2()
print(rect2.height, rect2.width)

rect2 = Rectangle2(height: 3, width: 4)
print(rect2.height, rect2.width)

// Initializers
struct Point {
    var x:Int
    var y:Int
    
    init() {
        x = 0
        y = 0
    }
    
    init(_ x:Int, _ y:Int){
        self.x = x
        self.y = y
    }
    
    init(x:Int, y:Int){
        self.x = x
        self.y = y
    }
    
    init(x:Int){
        self.x = x
        self.y = 0
    }
    
    init(y:Int){
        self.x = 0
        self.y = y
    }
}

let origin = Point()
print(origin)

let p1 = Point(2,3)
print(p1)

let p2 = Point(x:4, y:5)
print(p2)

let p3 = Point(x:6)
print(p3)

let p4 = Point(y:7)
print(p4)

//===================================================

// Using Enumerations
enum Days {
    case Sunday //case keyword to create values within enum
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

var appointment:Days
appointment = .Wednesday

var today = Days.Thursday

if appointment == today {
    print("Get Going")
}
else {
    print("Watch some GSG")
}

//=============================================================
//Saving data
    
	func notesExample() {
        // ====================================
        // Make some notes
        let note1 = Note(title: "Grocery List", text: "chips, salsa, charcoal, beer", timestamp: Date())
        
        let note2 = Note(title: "Yard Work", text: "seed yard, trim bushes", timestamp:Date())
        
        let note3 = Note(title: "Projects", text:"iOS App, Network Model", timestamp:Date())
        
        print("================ ORIGINAL NOTES")
        print("Note 1\n", note1)
        print("Note 2\n", note2)
        print("Note 3\n", note3)
        
        // ====================================
        // Make the encoder and decoder
        let myEncoder = PropertyListEncoder()
        let myDecoder = PropertyListDecoder()
        
        print()
        print("================ ENCODER & DECODER")
        print("ENCODER\n", myEncoder)
        print("DECODER\n", myDecoder)
        
        // ====================================
        // Make the path to the save directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
        
        print()
        print("================ DIRECTORY & FILE")
        print("DOCUMENTS DIRECTORY\n", documentsDirectory)
        print("ARCHIVE URL\n", archiveURL)
        
        //let myString:String = documentsDirectory.absoluteString
        let myString:String = archiveURL.absoluteString
        myLabel.text = myString
        
        // ====================================
        // Put the notes into an array
        let notesArray = [note1, note2, note3]
        
        print()
        print("================ ORIGINAL ARRAY OF NOTES")
        print("ARRAY OF NOTES\n", notesArray)
        
        print()
        print("================ INDIVIDUAL NOTES")
        for note in notesArray {
            print("NOTE\n", note)
        }
        
        // ====================================
        // Encode the array
        let encodedNotes = try? myEncoder.encode(notesArray)
        
        print()
        print("================ ENCODED ARRAY OF NOTES")
        print("ENCODED ARRAY\n", encodedNotes!)
        
        // ====================================
        // Write the encoded notes array
        try? encodedNotes?.write(to: archiveURL)
        
        print()
        print("================ ENCODED ARRAY WAS WRITTEN")
        
        // ====================================
        // Retrieve the array of notes from the disk
        if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? myDecoder.decode(Array<Note>.self, from:retrievedNotesData){
            
            print()
            print("================ RETRIEVED ARRAY OF NOTES")
            print("DECODED ARRAY\n", decodedNotes)
            
            print()
            print("================ EACH RETRIEVED NOTE")
            for note in decodedNotes {
                print("NOTE\n", note)
            }
            
        }

    }

	//==================================================================================
//Guard
class GuardedCommandExample {
    var value:Int
    
    init(){
        self.value = 0
    }
    
    // First Way: Use an if-else instead of a guard
    func stringtoIntUsingIf(str: String){
        // Using a local variable called num
        if let num:Int = Int(str){
            print("value was set to \(num).")
            self.value = num
        } else {
            print("Cannot convert \(str) to an Int.")
            return
        }
    }
    
    // Second Way: Use a guard instead of an if-else
    func stringToIntUsingGuard(str:String){
        guard let num = Int(str) else {
            // If we get here, it means the conversion failed.
            // Return and don't change self.value
            print("Cannot convert \(str) to an Int.")
            return
        }
        // If we get here, we can use num directly without
        // having to unwrap it.
        print("value was set to \(num)")
        self.value = num
    }
} // end of GuardedCommandExample class

var guardExample = GuardedCommandExample()

print("guardExample.value = \(guardExample.value)")
guardExample.stringtoIntUsingIf(str: "12")
print("guardExample.value = \(guardExample.value)")

print()
guardExample.stringtoIntUsingIf(str: "Dog")
print("guardExample.value = \(guardExample.value)")

print()
guardExample.stringToIntUsingGuard(str: "13")
print("guardExample.value = \(guardExample.value)")

print()
guardExample.stringToIntUsingGuard(str: "Cat")
print("guardExample.value = \(guardExample.value)")

//==============================================================================================
//Optionals

print("\(Int("12"))")

// Error, need to Unwrap the optional
// var num:Int = Int("12")

// Int(String) returns an optional. Means it may have a value,
// or it may contain nil. Will be nil if the string cannot
// be convertred to an Int

print("\(Int("Dog"))")


// Do the same thing using variables
var num:Int

// Error - The value might not be an Int. It may be nil.
// num = Int("13")

var optInt:Int? // yes - we know this may be nil
type(of:optInt) // Type is Optional<Int>
type(of:num) // Type is Int

optInt = Int("14")
print(optInt)

// unwrap the optional and get the Int
num = optInt! // Can be dangerous if the optional is nil

// Another way to do the same thing (Still dangerous)
num = Int("15")!

// We can also do this:
// Use an "Implicitely Unwrapped Optional"
// Automatically unwrap this variable every time
var optInt2:Int!
type(of:optInt2)
optInt2 = Int("16")
num = optInt2

//==========================================================================================================
//Command Line arguments
print("This is a script file")

for arg in CommandLine.arguments{
    print(arg)
}

//=============================================================================
//Dictionaries

var ages = ["Connor":17, "Sean":24, "Rebekah":30]

// Cannot access elements by position
//ages[0] // Error!

ages["Sean"]
print(ages)

print(ages["Rebekah"]!)

ages["Grace"] = 22
print(ages)

print(ages["Molly"]) // nil

// Iterating over averything in the Dictionary
for (name, age) in ages {
    print("\(name) is \(age) years old.")
}

// Can iterate this way too
for name in Array(ages.keys){
    print("\(name) is \(ages[name]!) years old.")
}

// Remove Connor from the dictionary
print(ages)
ages["Connor"] = nil
print(ages)

// Check out if-let
if let winner = ages["Sean"]{
    print(winner)
}

if let winner = ages["Pat"]{
    print(winner)
}

ages.count

for value in Array(ages.values){
    print(value)
}

