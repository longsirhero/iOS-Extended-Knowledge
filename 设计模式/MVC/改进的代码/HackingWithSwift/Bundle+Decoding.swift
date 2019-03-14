//
//  Bundle+Decoding.swift
//  HackingWithSwift
//
//  Created by hs on 2019/3/13.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(from filenmae: String) -> T {
        guard let url = Bundle.main.url(forResource: filenmae, withExtension: nil) else {
            fatalError("Failed to locate projects.json in app bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load projects.json in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }
        return loaded
    }
}
