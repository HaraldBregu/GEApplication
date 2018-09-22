//
//  GAListening.swift
//  GAEventApplication
//
//  Created by harald bregu on 05/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public protocol GAListening {
    func addListener(_ target:AnyObject, updated:@escaping GALUpdated)
    func removeListener(_ target:AnyObject)
}

@available(iOS 9.0, *)
public extension GAListening where Self:GEApplication {
    
    public func addListener(_ target:AnyObject, updated:@escaping GALUpdated) {
        let listener = GAListener()
        listener.name = "TODO"
        listener.target = target
        listener.updated = updated
        self.listeners.append(listener)
    }

    public func removeListener(_ target:AnyObject) {
        self.listeners = self.listeners.filter { ObjectIdentifier($0.target) !=  ObjectIdentifier(target) }
    }
}
