//
//  GECommon.swift
//  GEApplication
//
//  Created by harald bregu on 27/08/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
extension GAEvent: Equatable {
    public static func == (lhs: GAEvent, rhs: GAEvent) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

@available(iOS 9.0, *)
extension GAEvent: Hashable {
    public var hashValue: Int {
        return identifier.hashValue
    }
}

@available(iOS 9.0, *)
public extension Array where Element: GAEvent {
    public func contains(_ elements: [Element]) -> Bool {
        let selfSet = Set(self)
        return !elements.contains { !selfSet.contains($0) }
    }
}
