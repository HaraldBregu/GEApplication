//
//  GAUtils.swift
//  GAEventApplication
//
//  Created by harald bregu on 08/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public protocol GAUtils {
    var eventNames:[String] {get}
}

@available(iOS 9.0, *)
public extension GAUtils where Self:GEApplication {
    public var eventNames:[String] {
        return self.events.map{ $0.name }
    }
}
