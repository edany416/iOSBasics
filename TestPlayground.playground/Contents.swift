import UIKit

class GradedItem: Codable {
    var name: String
    var currentGrade: Double?
    
    init(name: String) {
        self.name = name
    }
}

class Course: GradedItem {
    var gradingCriterias = [GradingCriteria]()
}

class GradingCriteria: GradedItem {
    let weight: Double
    let equalWeights: Bool
    var gradedAssignments = [GradedAssignment]()
    init(name: String, weight: Double, equalWeights: Bool) {
        self.weight = weight
        self.equalWeights = equalWeights
        super.init(name: name)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class GradedAssignment: GradedItem {
    var weight: Double?
    var gradeRecieved: Double
    
    init(name: String, gradeRecieved: Double) {
        self.gradeRecieved = gradeRecieved
        super.init(name: name)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

class CourseList: GradedItemList<Course>, Codable {
    static let shared = CourseList()
    override private init() {}
    
}

class GradedItemList<E> {
    var itemList = [GradedItem]()
    var count: Int {
        get {
            return itemList.count
        }
    }
    
    func append(gradedItem: GradedItem) {
        itemList.append(gradedItem)
    }
    
    func itemAtIndex(_ index: Int) -> GradedItem {
        return itemList[index]
    }
    
    func saveToFile() {
        
    }
    
    func loadFromFile() {
        
    }
}

let courseList = CourseList.shared

//Test shit
let tempCourse = Course(name: "TestCourse 1")
let tempCourse2 = Course(name: "Test Course 2")

let tempHomework = GradingCriteria(name: "TestHomework", weight: 40, equalWeights: true)

tempCourse.gradingCriterias.append(tempHomework)
courseList.append(gradedItem: tempCourse)
courseList.append(gradedItem: tempCourse2)
let tempHW1 = GradedAssignment(name: "Test HW 1", gradeRecieved: 97)
tempHomework.gradedAssignments.append(tempHW1)
let tempHW2 = GradedAssignment(name: "Test HW 2", gradeRecieved: 85)
tempHomework.gradedAssignments.append(tempHW2)

let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
                             in: .userDomainMask).first!
let archiveURL =
    documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let propertyListEncoder = PropertyListEncoder()
let encodedNotes = try? propertyListEncoder.encode(courseList)

try? encodedNotes?.write(to: archiveURL,
                         options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL),
    let decodedNotes = try?
        propertyListDecoder.decode(Array<GradedItem>.self, from:
            retrievedNotesData) {
    
    print(course.name)
}



