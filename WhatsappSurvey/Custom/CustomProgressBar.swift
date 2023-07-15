//
//  CustomProgressView.swift
//  WhatsappSurvey
//
//  Created by Muhammed Faruk Söğüt on 15.07.2023.
//

import SwiftUI

struct CustomProgressView: View {
    
    var value : Double
    var total : Double
    
    var body: some View {
        ProgressView(value: value, total: total)
            .progressViewStyle(GreenProgressViewStyle())
    }
}


struct GreenProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { prox in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(.black)
                Capsule()
                    .foregroundColor(Color("green"))
                    .frame(width: prox.size.width * CGFloat(configuration.fractionCompleted ?? 0) , height: prox.size.height, alignment: .center)
            }
        }.frame(maxHeight: 50)
    }
}


struct CustomProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(value: 10, total: 100)
    }
}
