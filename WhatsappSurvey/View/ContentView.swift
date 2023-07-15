//
//  ContentView.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 14.07.2023.
//

import SwiftUI

struct ContentView: View {
    
   @State var surveyData = Survey(userName: "Muhammed Faruk Söğüt", question: "Merhaba senin favorin hangisi ?", options: [
        SurveyOption(option: "Batman", isSelected: false, selectedCount: 0),
        SurveyOption(option: "Superman", isSelected: false, selectedCount: 0),
        SurveyOption(option: "Iron Man", isSelected: false, selectedCount: 0),
    ])
    
    var body: some View {
        ZStack {
            Color("chatBackground")
            SurveyView(survey: $surveyData)
                .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
