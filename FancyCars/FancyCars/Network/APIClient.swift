import Foundation
import Alamofire

class APIClient {
    
    static let shared = APIClient()
    let endpoint = "http://www.stormpixel.com/fancycars"
    
    func getCars(completion: @escaping ([Listing], Error?) -> ()) {
        let url = "\(endpoint)/cars.php"
        var listings = [Listing]()
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if (response.result.value as? NSArray != nil) {
                if let jsonArray = response.result.value as? NSArray {
                    for jsonFragment in jsonArray {
                        if let json = jsonFragment as? [String: Any] {
                            let listing = Listing(json: json)
                            listings.append(listing)
                        }
                    }
                    print(listings)
                    completion(listings, nil)
                }
            } else if let error = response.result.error as Error? {
                print("error")
                completion([Listing](), error)
            }
        }
    }
    
    fileprivate init() {}
    
}
