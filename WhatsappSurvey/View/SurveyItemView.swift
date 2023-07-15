//
//  SurveyItem.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 15.07.2023.
//

import SwiftUI

struct SurveyItem: View {
    
    @Binding var surveyOption: SurveyOption
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                surveyOption.isSelected.toggle()
                
                if surveyOption.isSelected {
                    surveyOption.selectedCount += 1
                } else {
                    surveyOption.selectedCount -= 1
                }
                                
            }
        } label: {
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(surveyOption.isSelected ? .blue : .gray)
                    .font(.largeTitle)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(surveyOption.option)
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                        Text(String(Int(surveyOption.selectedCount)))
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                    }
                    CustomProgressView(value: surveyOption.selectedCount, total: Double(surveyOption.selectedCount))
                        .frame(height: 12)
                }
            }
        }
    }
}
