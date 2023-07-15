//
//  Date+Ext.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 15.07.2023.
//

import Foundation

extension Date {
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
