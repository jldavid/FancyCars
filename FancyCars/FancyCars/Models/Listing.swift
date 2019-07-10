import Foundation

class Listing: NSObject {
    
    var id: Int
    var img: String
    var name: String
    var make: String
    var model: String
    var year: Int
    
    init(id: Int, img: String, name: String, make: String, model: String, year: Int) {
        self.id = id
        self.img = img
        self.name = name
        self.make = make
        self.model = model
        self.year = year
    }
    
    init(json: [String: Any]) {
        self.id = json["id"] as? Int ?? 0
        self.img = json["img"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.make = json["make"] as? String ?? ""
        self.model = json["model"] as? String ?? ""
        self.year = json["year"] as? Int ?? 0
        super.init()
    }
    
    convenience override init() {
        self.init(json: ["":""])
    }
    
}
