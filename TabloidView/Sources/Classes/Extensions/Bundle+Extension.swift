//
//  Bundle+Extension.swift
//  TabloidView
//
//  Created by Alexander on 04.01.2024.
//

import Foundation

extension Bundle {
    var name: String? {
        return (Bundle.main.infoDictionary?["CFBundleName"] as? String)?.replacingOccurrences(of: ".", with: "_")
    }
}
