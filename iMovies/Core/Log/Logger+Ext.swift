//
//  Logger+Ext.swift
//  iMovies
//
//  Created by cefalo on 25/12/23.
//

import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")
    
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
}
