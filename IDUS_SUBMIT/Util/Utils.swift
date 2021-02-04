//
//  Utils.swift
//  IDUSTASK
//
//  Created by BHJ on 2021/02/04.
//

import Foundation

class Utils {
    static let shared = Utils()
    func convertMb(kb : String) -> String {
        let mb = Double(kb)! / 1_024 / 1_024
        return "\(String(format: "%.2f", mb)) MB"
    }
}
