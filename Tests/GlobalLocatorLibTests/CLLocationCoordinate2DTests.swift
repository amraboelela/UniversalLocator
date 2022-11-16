
import XCTest
import CoreLocation
    
@testable import GlobalLocatorLib

final class CLLocationCoordinate2DTests: XCTestCase {
    
    func testEqual() {
        let location1 = CLLocationCoordinate2D(latitude: 128.098, longitude: -134.432)
        var location2 = CLLocationCoordinate2D(latitude: 128.098, longitude: -134.432)
        XCTAssertEqual(location1, location2)
        location2 = CLLocationCoordinate2D(latitude: 128.099, longitude: -134.432)
        XCTAssertNotEqual(location1, location2)
    }
    
    func testPlus() {
        let location1 = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location2 = CLLocationCoordinate2D(latitude: 3, longitude: 3)
        XCTAssertEqual(location1 + location2, CLLocationCoordinate2D(latitude: 4, longitude: 5))
    }
    
    func testMinus() {
        let location1 = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location2 = CLLocationCoordinate2D(latitude: 3, longitude: 3)
        XCTAssertEqual(location2 - location1, CLLocationCoordinate2D(latitude: 2, longitude: 1))
    }
    
    func testFriendlyDirection() {
        let location1 = CLLocationCoordinate2D(latitude: 28.092, longitude: 34.432)
        var location2 = CLLocationCoordinate2D(latitude: 28.093, longitude: 34.432)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "N")
        location2 = CLLocationCoordinate2D(latitude: 28.092, longitude: 34.432)
        XCTAssertNil(location1.friendlyDirectionTo(location: location2))
        location2 = CLLocationCoordinate2D(latitude: 28.091, longitude: 34.432)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "S")
        location2 = CLLocationCoordinate2D(latitude: 28.092, longitude: 34.431)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "W")
        location2 = CLLocationCoordinate2D(latitude: 28.092, longitude: 34.433)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "E")
        location2 = CLLocationCoordinate2D(latitude: 28.093, longitude: 34.433)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "NE")
        location2 = CLLocationCoordinate2D(latitude: 28.093, longitude: 34.435)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "E")
        location2 = CLLocationCoordinate2D(latitude: 28.095, longitude: 34.433)
        XCTAssertEqual(location1.friendlyDirectionTo(location: location2), "N")
    }
}
