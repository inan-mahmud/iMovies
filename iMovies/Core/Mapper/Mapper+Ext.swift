//
//  Mapper+Ext.swift
//  iMovies
//
//  Created by cefalo on 18/1/24.
//

import Foundation

extension Data {
    func decode<T: Decodable>() throws -> T {
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: self)
            return decoded
        } catch {
            throw error
        }
    }
}
