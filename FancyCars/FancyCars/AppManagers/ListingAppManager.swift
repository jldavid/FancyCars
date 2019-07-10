import Foundation

class ListingAppManager {
    
    static let shared = ListingAppManager()

    func getData(completion: @escaping (Bool, Error?) -> ()) {
        APIClient.shared.getCars { cars, error in
            print(cars)
            if cars.count > 0 {
                ListingDataManager.shared.addListings(cars: cars)
            }
            ListingDataManager.shared.printListings()
        }
    }

    fileprivate init() {}

}
