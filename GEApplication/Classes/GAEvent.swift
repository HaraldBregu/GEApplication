//
//  GAEvent.swift
//  GAEventApplication
//
//  Created by harald bregu on 24/08/18.
//  Copyright © 2018 frog design. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public typealias GAEUpdated = (GAEvent) -> Void

@available(iOS 9.0, *)
public class GAEvent {
    public var identifier: String = GAEvent.identifier
    public var name: String = ""
    public var description: String = ""
    public var updated:GAEUpdated = {_ in}
    public init() {
        
    }
}

@available(iOS 9.0, *)
public extension GAEvent {
    static public let identifier: String = UUID().uuidString
}
