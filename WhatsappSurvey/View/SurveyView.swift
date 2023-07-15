//
//  SurveyView.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 15.07.2023.
//

import SwiftUI

struct SurveyView: View {
    
    @Binding var survey: Survey
    @State var presentSurveyDetail: Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                
                VStack(alignment: .leading, spacing: 10) {
                    //User Name
                    Text(survey.userName)
                        .font(.title3)
                        .foregroundColor(Color("pink"))
                    
                    //Question
                    Text(survey.question)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                    //Sub
                    Text("Birini veya daha fazlasini secin")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                               
                ForEach($survey.options, id: \.id) { $item in
                    SurveyItem(surveyOption: $item)
                }
                                                    
            }
            .padding(.all)
            
            
            VStack {
                Text(survey.time.getTime())
                    .foregroundColor(.gray)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 0.4)
            }
         
                
            Button("Oyları Görüntüle") {
                presentSurveyDetail.toggle()
            }
            .font(.title2)
            .padding(.vertical)
            .padding(.bottom, 5)
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("gray"))
        )        
        .sheet(isPresented: $presentSurveyDetail) {
            NavigationView {
                SurveyDetailView()
            }
        }
    }
    
    // Detail
    private func SurveyDetailView() -> some View {
        ZStack {
            Color("chatBackground")
            List {
                Section {
                    Text(survey.question)
                }
                ForEach(survey.options) { option in
                    Section {
                        HStack {
                            Text(option.option)
                            Spacer()
                            Text(String(Int(option.selectedCount)) + " " + "Oy")
                                .font(.headline)
                                .foregroundColor(.gray)
                            if option.selectedCount > 0 {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    } footer: {
                        Text("Bugün" + " " + survey.time.getTime())
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Anket Detayları")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Kapat") {
                    presentSurveyDetail.toggle()
                }
            }
        }
    }
}


struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
