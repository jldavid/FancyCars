import Foundation

class ListingDataManager {

var listings = [Listing]()
static let shared = ListingDataManager()

func clearListings() {
    listings.removeAll()
}

func addListing(listing: Listing) {
    if listingExists(id: listing.id) == false {
        listings.append(listing)
    }
}

func addListings(cars: [Listing]) {
    for car in cars {
        if listingExists(id: car.id) == false {
            listings.append(car)
        }
    }
}

func getListing(id: Int) -> Listing {
    let listing = listings.filter({ return $0.id == id })
    if let currentListing = listing.first {
        return currentListing
    } else {
        return Listing()
    }
}

func removeFood(id: Int) {
    let filteredListings = listings.filter{ $0.id != id }
    clearListings()
    for listing in filteredListings {
        listings.append(listing)
    }
}

func getListings() -> [Listing] {
    return listings
}

func listingExists(id: Int) -> Bool {
    let listing = listings.filter({ return $0.id == id })
    if listing.isEmpty {
        return false
    } else {
        return true
    }
}

func printListings() {
    for listing in listings {
        print(listing.name)
    }
}

fileprivate init() {}

}
