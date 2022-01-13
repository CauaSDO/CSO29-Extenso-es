//EXTENSÕES
import Foundation
import CoreGraphics

let name = "Eric Alves Brito"


// Parte 01: Da Adicao de codigo de Breno para a variavel characters ser reconhecida
extension ClosedRange where Bound == Unicode.Scalar {
    static let asciiPrintable: ClosedRange = " "..."~"
    var range: ClosedRange<UInt32>  { lowerBound.value...upperBound.value }
    var scalars: [Unicode.Scalar]   { range.compactMap(Unicode.Scalar.init) }
    var characters: [Character]     { scalars.map(Character.init) }
    var string: String              { String(scalars) }
}
let range = ClosedRange.asciiPrintable         // {lowerBound " ", upperBound "~"}   32...126
let characters = range.characters  // [" ", "!", """, "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~"]



extension String {
    
    // Parte 02: Da Adicao de codigo de Breno para a variavel characters ser reconhecida
    init<S: Sequence>(_ sequence: S) where S.Element == Unicode.Scalar {
        self.init(UnicodeScalarView(sequence))
    }
    
    
    var vowels: [Character]{
        var list: [Character] = []
        for character in characters {
            switch String(character).lowercased(){
                case "a", "e", "i","o", "u":
                    list.append(character)
                default:
                    break
            }
        }
        
        return list
    }
    
    func initials() -> String {
        let array = self.components(separatedBy: " ")
        let firsts = array.map({$0.first!})
        return String(firsts)
    }
}

print(name.vowels)
print(name.initials())



class Account {
    let number: String
    var balance: Double = 0
    
    init(number: String) {
        self.number = number
    }
}


extension Account {
    convenience init(number: String, balance: Double) {
        self.init(number : number)
        self.balance = balance
    }
}

let account = Account(number: "237498237432894")
