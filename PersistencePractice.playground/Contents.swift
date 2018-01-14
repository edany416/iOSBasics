//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Note: Codable {
    let title: String
    let text: String
    let timeStamp: Date
}

let newNote = Note(title: "Grocery Run", text: "Get peanut butter", timeStamp: Date())



let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")


let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(newNote)

try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
let propertyListDecoder = PropertyListDecoder()
if let retrivedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrivedNoteData) {
    print(decodedNote)
}


