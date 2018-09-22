//
//  GAListener.swift
//  GAEventApplication
//
//  Created by harald bregu on 05/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public typealias GALUpdated = (GEApplication) -> Void

@available(iOS 9.0, *)
public class GAListener {
    public var name: String!
    public var target:AnyObject!
    public var updated:GALUpdated!
    public init() {
        
    }
}
