//
//  Formatters.swift
//  App
//
//  Created by Ostap Derkach on 29.03.2024.
//

import Foundation

enum Formatters {
     static private var dateComponentsFormatter: DateComponentsFormatter = {
         let formatter = DateComponentsFormatter()
         formatter.allowedUnits = [.hour, .minute]
         return formatter
    }()

    static private var percentageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()

    static func format(seconds: Int, style: DateComponentsFormatter.UnitsStyle) -> String? {
        dateComponentsFormatter.unitsStyle = style
        return dateComponentsFormatter.string(from: TimeInterval(seconds))
    }

    static func format(percentage: Double) -> String? {
        percentageFormatter.string(from: NSNumber(value: percentage))
    }
}
