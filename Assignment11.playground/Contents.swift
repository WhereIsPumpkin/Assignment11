protocol CargoManaging {
    func add(item: String)
    func remove(item: String)
    func list()
}

protocol CrewManaging {
    func add(item: String)
    func remove(item: String)
    func list()
}

class CargoManager: Manageable, CargoManaging {
    var cargo: [String] = []

    func add(item: String) {
        cargo.append(item)
    }

    func remove(item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
        }
    }

    func list() {
        print("📦 Cargo items:")
        for item in cargo {
            print(" - \(item)")
        }
    }
}

class CrewManager: Manageable, CrewManaging {
    var crew: [String] = []

    func add(item: String) {
        crew.append(item)
    }

    func remove(item: String) {
        if let index = crew.firstIndex(of: item) {
            crew.remove(at: index)
        }
    }

    func list() {
        print("👥 Crew members:")
        for item in crew {
            print(" - \(item)")
        }
        print()
    }
}

class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    var cargoManager: CargoManaging
    var crewManager: CrewManaging

    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }

    func cannonCount() -> Int {
        print("🏴‍☠️ The ship \(name) has \(cannonsCount) cannons.")
        return cannonsCount
    }

    func fireCannon(count: Int) {
        if count <= cannonsCount {
            let startingAmountOfCannons = cannonsCount
            cannonsCount -= count
            print("💥 You've just fired \(count) cannons from \(startingAmountOfCannons), now you have \(cannonsCount) left.")
        } else if count > cannonsCount {
            print("🚫 You don't have enough cannons left. You have only \(cannonsCount) left.")
        } else if cannonsCount == 0 {
            print("🔒 You don't have any cannons left to fire.")
        }
    }

    func addCargo(item: String) {
        cargoManager.add(item: item)
    }

    func removeCargo(item: String) {
        cargoManager.remove(item: item)
    }

    func listCargo() {
        cargoManager.list()
    }

    func addCrew(crewMember: String) {
        crewManager.add(item: crewMember)
    }

    func removeCrew(crewMember: String) {
        crewManager.remove(item: crewMember)
    }

    func listCrew() {
        crewManager.list()
    }
}

protocol Manageable {
    func add(item: String)
    func remove(item: String)
    func list()
}

class Frigate: PirateShip {
    let captain: String
    var pirateMonkeys: Int = 0

    init(name: String, cannonsCount: Int, cargoManager: CargoManager, crewManager: CrewManager, captain: String) {
        self.captain = captain
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }

    func recruitPirateMonkeys(newMonkeys: Int) {
        pirateMonkeys += newMonkeys
        print("🐒 The crew of Frigate \(name) recruits \(newMonkeys) pirate monkeys. Total pirate monkeys: \(pirateMonkeys)")
    }

    func unleashPirateMonkeys() {
        if pirateMonkeys > 0 {
            print("🏴‍☠️ Captain \(captain) unleashes the pirate monkeys of Frigate \(name) onto enemy ships, causing chaos with their mischievous antics.")
        } else {
            print("🚫 The Frigate \(name) has no pirate monkeys to unleash upon the enemy.")
        }
    }
}

class Galleon: PirateShip {
    let captain: String
    var parrotCount: Int = 0

    init(name: String, cannonsCount: Int, cargoManager: CargoManager, crewManager: CrewManager, captain: String) {
        self.captain = captain
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }

    func acquireParrot() {
        parrotCount += 1
        print("🦜 Captain \(captain) and the crew of Galleon \(name) have acquired a parrot! Current parrot count: \(parrotCount)")
    }

    func sendParrotsToHarass() {
        if parrotCount > 0 {
            print("🏴‍☠️ Captain \(captain) sends the Galleon's parrots to harass enemy ships with their loud squawks and antics.")
        } else {
            print("🚫 The Galleon \(name) has no parrots to send for the attack.")
        }
    }
}


protocol Cannons {
    func cannonCount() -> Int
    func fireCannon(count: Int)
}

class TreasureMap {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    func hintToTreasure(firstParameter: Int, secondParameter: Int) {
        if firstParameter == x && secondParameter == y {
            print("🏆 You've hit the jackpot! Treasure found! 🎉⚓💰")
        } else if firstParameter == x && secondParameter != y {
            print("🏴‍☠️ X marks the spot! Head diagonally northeast! 🗺️↗️")
        } else if firstParameter != x && secondParameter == y {
            print("🏴‍☠️ Arrr! The treasure is close! Go southwest! 🗺️↙️")
        } else if firstParameter == 0 && secondParameter == 0 {
            print("🌊 Set sail, landlubber! Your adventure begins! ⚓🌟")
        } else {
            print("🏴‍☠️ Turn around, matey! X is behind you! 🗺️↩️")
        }
    }

}

class SeaAdventure {
    let adventureType: String

    init(adventureType: String) {
        self.adventureType = adventureType
    }

    func encounter(adventure: String) {
        print("🌊 Your ship has just encountered a \(adventureType) adventure.")
    }
}

class PirateCode {
    func parley() {
        discussTerms(term: "parley")
        print("Crew chose peace! 🕊️🤜🏻🤛🏻🕊️")
    }

    func mutiny() {
        discussTerms(term: "mutiny")
        print("Crew's up for a brawl! ‼️👊🏻")
    }

    private func discussTerms(term: String) {
        print("Negotiations for \(term) in progress...")
    }
}


let cargoManager = CargoManager()
let crewManager = CrewManager()

var ship = PirateShip(name: "Black Pearl", cannonsCount: 35, cargoManager: cargoManager, crewManager: crewManager)

ship.addCrew(crewMember: "Albert Camus")
ship.addCrew(crewMember: "Franz Kafka")
ship.addCrew(crewMember: "Thom Yorke")
ship.addCrew(crewMember: "James Ballard")
ship.listCrew()

ship.addCargo(item: "swords and cutlasses")
ship.addCargo(item: "treasure chests")
ship.addCargo(item: "guns")
ship.listCargo()

let myTreasureMap = TreasureMap(x: 18, y: 12)

let pirateCode = PirateCode()

let seaAdventure = SeaAdventure(adventureType: "Kraken Attack")

let startingX = 0
let startingY = 0

myTreasureMap.hintToTreasure(firstParameter: startingX, secondParameter: startingY)
myTreasureMap.hintToTreasure(firstParameter: 5, secondParameter: 7)
myTreasureMap.hintToTreasure(firstParameter: 18, secondParameter: 12)

seaAdventure.encounter(adventure: seaAdventure.adventureType)

pirateCode.mutiny()

ship.fireCannon(count: 12)
ship.fireCannon(count: 15)
ship.fireCannon(count: 20)
ship.fireCannon(count: 10)
ship.fireCannon(count: 8)

pirateCode.parley()

print()
// ეს მაიმუნების და თუთიყურშების თავდასხმები :დდდდდდდ
var galleon = Galleon(name: "Golden Feather", cannonsCount: 30, cargoManager: cargoManager, crewManager: crewManager, captain: "Captain Hook")

galleon.acquireParrot()
galleon.sendParrotsToHarass()

print()

var frigate = Frigate(name: "Scurvy's Revenge", cannonsCount: 25, cargoManager: cargoManager, crewManager: crewManager, captain: "Calico Jack")

frigate.recruitPirateMonkeys(newMonkeys: 10) // Recruit 10 pirate monkeys for the Frigate
frigate.unleashPirateMonkeys() // Unleash pirate monkeys in an attack
