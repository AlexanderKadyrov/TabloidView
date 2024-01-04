//
//  TabloidView+Extension.swift
//  TabloidView
//
//  Created by Alexander on 04.01.2024.
//

import Foundation

extension TabloidView {
    func register(cellIdentifiers: [String]) {
        guard let bundleName = Bundle.main.name else { return }
        for cellIdentifier in cellIdentifiers.filter({ $0 != "" }) {
            if let aClass = NSClassFromString(bundleName + "." + cellIdentifier) {
                register(aClass, forCellReuseIdentifier: cellIdentifier)
            }
        }
    }
}
