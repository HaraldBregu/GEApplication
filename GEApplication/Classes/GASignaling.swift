//
//  GASignaling.swift
//  GAEventApplication
//
//  Created by harald bregu on 07/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public protocol GASignaling {
    func sendSignal()
}

@available(iOS 9.0, *)
public extension GASignaling where Self:GEApplication {
    
    public func sendSignal() {
        self.listeners.forEach({ $0.updated(self) })
    }
}
