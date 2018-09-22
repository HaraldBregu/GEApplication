//
//  GAEventing.swift
//  GAEventApplication
//
//  Created by harald bregu on 05/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation


@available(iOS 9.0, *)
public protocol GAEventing {
    
    // Add an event to the application without sending any signal
    func addEvent(_ event:GAEvent)
    func sendEvent(_ event:GAEvent)
    
    func findEvent(_ name:String) -> GAEvent?
    func containEvent(_ name:String) -> Bool
    func findEvents(_ names:[String]) -> [GAEvent]
    func containEvents(_ names:[String]) -> Bool
    func matchEvents(_ names:[String]) -> Bool
    func matchedEvents(_ names:[String]) -> [GAEvent]

    func fireEvent(_ name:String) -> Bool
    func fireEvents(_ names:[String], match:Bool) -> Bool
    
    func removeEvent(_ name:String) -> Bool
    func removeEvents(_ names:[String]) -> Bool
    func removeAllEvents()
}

@available(iOS 9.0, *)
public extension GAEventing where Self:GEApplication {
    
    public func addEvent(_ event:GAEvent) {
        let containEvent = self.containEvent(event.name)
        if containEvent { return }
        self.events.append(event)
    }

    public func sendEvent(_ event:GAEvent) {
        self.addEvent(event)
        self.listeners.forEach({ $0.updated(self) })
    }
    
    public func findEvent(_ name:String) -> GAEvent? {
        return self.events.first(where: {$0.name == name})
    }
    
    public func containEvent(_ name:String) -> Bool {
        return (self.findEvent(name) != nil)
    }

    public func findEvents(_ names:[String]) -> [GAEvent] {
        return self.events.filter{ names.contains($0.name) }
    }
    
    public func containEvents(_ names:[String]) -> Bool {
        return self.findEvents(names).count > 0
    }

    public func matchEvents(_ names:[String]) -> Bool {
        return Set(names).isSubset(of: Set(self.eventNames))
    }
    
    public func matchedEvents(_ names:[String]) -> [GAEvent] {
        if self.matchEvents(names) == false { return [] }
        return self.findEvents(names)
    }

    public func fireEvent(_ name:String) -> Bool {
        if self.containEvent(name) == false { return false }
        return self.removeEvent(name)
    }
    
    public func fireEvents(_ names:[String], match:Bool=false) -> Bool {
        let dontMatch = match && self.matchEvents(names) == false
        if dontMatch { return false }
        return self.removeEvents(names)
    }
    
    public func removeEvent(_ name:String) -> Bool {
        self.events = self.events.filter { $0.name != name }
        return true
    }
    
    public func removeEvents(_ names:[String]) -> Bool {
        self.events = self.events.filter{ !names.contains($0.name) }
        return true
    }
        
    public func removeAllEvents() {
        self.events.removeAll()
    }
}
