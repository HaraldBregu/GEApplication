//
//  GApplication.swift
//  GAEventApplication
//
//  Created by harald bregu on 24/08/18.
//  Copyright © 2018 frog design. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
public class GEApplication: GAListening, GAEventing, GASignaling, GAUtils {
    static public let current:GEApplication = GEApplication()
    public var listeners:[GAListener] = [GAListener]()
    public var events:[GAEvent] = [GAEvent]()
}
