//
//  CLLocationCoordinate2D.swift
//  GlobalLocatorLib
//
//  Created by Amr Aboelela on 11/15/22.
//  Copyright © 2022 Amr Aboelela. All rights reserved.
//
//  See LICENCE for details.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    static public func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    static public func +(lhs: Self, rhs: Self) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: lhs.latitude + rhs.latitude,
            longitude: lhs.longitude + rhs.longitude
        )
    }
    
    static public func -(lhs: Self, rhs: Self) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: lhs.latitude - rhs.latitude,
            longitude: lhs.longitude - rhs.longitude
        )
    }
    
    public var distance: Double {
        return sqrt(self.latitude*self.latitude + self.longitude * self.longitude)
    }
    
    public func friendlyDirectionTo(location: CLLocationCoordinate2D) -> String? {
        if self == location {
            return nil
        }
        let tan_22_5 = 0.41421356237
        var x = location.longitude - self.longitude
        var y = location.latitude - self.latitude
        if x >= 0 {
            if y >= 0 {
                if y < x {
                    if y / x < tan_22_5 {
                        return "E"
                    } else {
                        return "NE"
                    }
                } else {
                    if x / y < tan_22_5 {
                        return "N"
                    } else {
                        return "NE"
                    }
                }
            } else {
                y = -y
                if y < x {
                    if y / x < tan_22_5 {
                        return "E"
                    } else {
                        return "SE"
                    }
                } else {
                    if x / y < tan_22_5 {
                        return "S"
                    } else {
                        return "SE"
                    }
                }
            }
        } else {
            x = -x
            if y >= 0 {
                if y < x {
                    if y / x < tan_22_5 {
                        return "W"
                    } else {
                        return "NW"
                    }
                } else {
                    if x / y < tan_22_5 {
                        return "N"
                    } else {
                        return "NW"
                    }
                }
            } else {
                y = -y
                if y < x {
                    if y / x < tan_22_5 {
                        return "W"
                    } else {
                        return "SW"
                    }
                } else {
                    if x / y < tan_22_5 {
                        return "S"
                    } else {
                        return "SW"
                    }
                }
            }
        }
        //return "N"
    }
}
