import Foundation

class Availability: NSObject {
    
    var available: String
    
    init(available: String) {
        self.available = available
    }
    
    init(json: [String: Any]) {
        self.available = json["available"] as? String ?? ""
        super.init()
    }
    
    convenience override init() {
        self.init(json: ["":""])
    }
    
}
