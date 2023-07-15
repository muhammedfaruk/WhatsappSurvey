//
//  SurveyModel.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 15.07.2023.
//

import Foundation

struct Survey: Identifiable {
    let id = UUID()
    var time = Date()
    let userName: String
    let question: String
    var options: [SurveyOption]
}

struct SurveyOption: Identifiable {
    let id = UUID()
    let option: String
    var isSelected: Bool
    var selectedCount: Double
}
