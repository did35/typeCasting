// ========= TYPE CASTING IN SWIFT =========
// Swift interview App.
// Code source example.
// =========================================

import Foundation

// Consider those classes.
// ====== Top level ======
class LivingBeing {
    var age: Int?
    
    init(age: Int?) {
        if let age = age {
            self.age = age
        }
    }
}

// ===== Child =====
class Human: LivingBeing {
    var name: String?
    
    init(name: String?, age: Int?) {
        if let name = name {
            self.name = name
        }
        
        super.init(age: age ?? 0)
    }
}

class Animal: LivingBeing {
    var isMammals: Bool?
    
    init(isMammal: Bool? , age: Int?) {
        if let isMammal = isMammal {
            self.isMammals = isMammal
        }
        
        super.init(age: age ?? 0)
    }
}

// Two different Class Object. What is the type of the array?
let livingBeingArr = [Animal(isMammal: true, age: 12), Human(name: "John", age: 58)]

/*
 Swift's type checker is able to deduce that 'Human' and 'Animal' have a common superclass of LivingBeing, and so it infers a type of [LivingBeing].
 
 The items stored in livingBeingArr are still 'Human' and 'Animal' instances behind the scene.
 
 If you iterate over the contents of this array, the items you receive back are typed as LivingBeing, and not as 'Human' or 'Animal'.
 
 In order to work with them as their native type, you need to check their type, or downcast them to a different type.
 */

//========= CHECKING TYPE ============

let livingBeingObj = livingBeingArr[0]

for item in livingBeingArr {
    if item is Animal {
        print("item is of type Animal")
    } else if item is Human {
        print("item is of type Human")
    }
}

// ======== DOWNCASTING =========
/*
 Downcasting can be done in two ways.
   - Conditional downcasting (as?).
   - Forced downcasting (as!).
 */

let animalObj = livingBeingArr[0] as? Animal
let humanObj = livingBeingArr[1] as? Human

// ========= UPCASTING =========
/*
 Upcasting from the base class object to its superclass is also possible
 */
