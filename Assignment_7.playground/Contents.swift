/* ----------------- TASK _ Superhero Battle ----------------- */
// Subtask 1: class SuperEnemy
class SuperEnemy {
    let name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

// Subtask 2: protocol Superhero
protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String : Int] { get }
    
    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}

// Subtask 3: extension Superhero
extension Superhero {
    func about() {
        switch self.superPowers.count {
        case 0:
            print("\(self.name) (A.K.A. \(self.alias)) has no superpowers!")
        default:
            print("\(self.name) (A.K.A. \(self.alias)) has superpowers: ")
            for (power, damage) in self.superPowers {
                print("\t\(power), with damage \(damage)")
            }
        }
    }
}

// Subtask 4: superhero structures
struct CaptainAmerica: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        print("\(target.name) received damage of \(damage)!\n")
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if superPowers.isEmpty {
            print("No more superpowers left! Attacking for the last time!")
            attack(target: target)
            
        } else {
            let randomIndex = Int.random(in: 0..<superPowers.count)
            let randomPower = Array(superPowers.keys)[randomIndex]
            print("\(alias) attacking \(target.name) with \(randomPower)!")
            target.hitPoints -= superPowers[randomPower] ?? 0
            print("Damage: -\(superPowers[randomPower] ?? 0) hitpoints.")
            superPowers.removeValue(forKey: randomPower)
        }
        
        return target.hitPoints
    }
}

struct Thor: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        print("\(target.name) received damage of \(damage)!\n")
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if superPowers.isEmpty {
            print("No more superpowers left! Attacking for the last time!")
            attack(target: target)
        } else {
            let randomIndex = Int.random(in: 0..<superPowers.count)
            let randomPower = Array(superPowers.keys)[randomIndex]
            print("\(alias) attacking \(target.name) with \(randomPower)!")
            target.hitPoints -= superPowers[randomPower] ?? 0
            print("Damage: -\(superPowers[randomPower] ?? 0) hitpoints.")
            superPowers.removeValue(forKey: randomPower)
        }
        
        return target.hitPoints
    }
}

struct IronMan: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        print("\(target.name) received damage of \(damage)!\n")
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if superPowers.isEmpty {
            print("No more superpowers left! Attacking for the last time!")
            attack(target: target)
        } else {
            let randomIndex = Int.random(in: 0..<superPowers.count)
            let randomPower = Array(superPowers.keys)[randomIndex]
            print("\(alias) attacking \(target.name) with \(randomPower)!")
            target.hitPoints -= superPowers[randomPower] ?? 0
            print("Damage: -\(superPowers[randomPower] ?? 0) hitpoints.")
            superPowers.removeValue(forKey: randomPower)
        }
        
        return target.hitPoints
    }
}

struct DoctorStrange: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        print("\(target.name) received damage of \(damage)!\n")
        target.hitPoints -= damage
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if superPowers.isEmpty {
            print("No more superpowers left! Attacking for the last time!")
            attack(target: target)
        } else {
            let randomIndex = Int.random(in: 0..<superPowers.count)
            let randomPower = Array(superPowers.keys)[randomIndex]
            print("\(alias) attacking \(target.name) with \(randomPower)!")
            target.hitPoints -= superPowers[randomPower] ?? 0
            print("Damage: -\(superPowers[randomPower] ?? 0) hitpoints.")
            superPowers.removeValue(forKey: randomPower)
        }
        
        return target.hitPoints
    }
}

// Subtask 5: class SuperheroSquad
class SuperheroSquad {
    var superheroes: [Superhero]
    
    init(superheroes: [Superhero]) {
        self.superheroes = superheroes
    }
    
    func listSuperheroes() {
        if superheroes.isEmpty {
            print("\nNo superheroes present!")
        } else {
            print("\nOur Super Heroes: ")
            for hero in superheroes {
                hero.about()
            }
        }
    }
}

// Subtask 6: Battle Simulation!!!
func simulateShowdown(squad: SuperheroSquad, enemy: SuperEnemy) {
    print("Our heroes met \(enemy.name) with \(enemy.hitPoints) point health.\nThey'll fight now.\nWIN OR LOSE!")
    print("--------------------------------------------------")
    
    squad.listSuperheroes()
    print()
    
    // Iterating over heroes and attacking enemy:
    for var hero in squad.superheroes {
        while true {
            if hero.superPowers.isEmpty {
                hero.performSuperPower(target: enemy)
                break
            }
            
            hero.performSuperPower(target: enemy)
        }
    }
    
    // Printing result:
    if enemy.hitPoints > 0 {
        print("Superheroes lost...")
    } else {
        print("Enemy Defeated!")
    }
}

let thanos = SuperEnemy(name: "Thanos",
                        hitPoints: Int.random(in: 300...900))
let captain = CaptainAmerica(name: "Steve Rogers",
                             alias: "Captain America",
                             isEvil: false,
                             superPowers: [
                                "Shield Bash"   : 25,
                                "Shield Throw"  : 30
                             ])
let thor = Thor(name: "Thor Odinson",
                alias: "Thor",
                isEvil: false,
                superPowers: [
                    "Hammer Uppercut"   : 34,
                    "Hammer Throw"      : 30,
                    "Lightning Storm"   : 45
                ])
let ironMan = IronMan(name: "Tony Stark",
                      alias: "Iron Man",
                      isEvil: false,
                      superPowers: [
                        "Repulsor Blast"    : 28,
                        "Rocket Barrage"    : 30,
                        "Unibeam"           : 65
                    ])
let doctorStrange = DoctorStrange(name: "Stephen Strange",
                                  alias: "Doctor Strange",
                                  isEvil: false,
                                  superPowers: [
                                    "Bolt of Balthak"   : 17,
                                    "Winds of Watoomb"  : 23,
                                    "Unibeam"           : 65
                                ])
let squad = SuperheroSquad(superheroes: [captain, thor, ironMan, doctorStrange])

simulateShowdown(squad: squad, enemy: thanos)
