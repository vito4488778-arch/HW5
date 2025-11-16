//
//  Test.swift
//  HW5
//
//  Created by 114iosClassStudent04 on 2025/11/14.
//

import SwiftUI

struct Test: View {
    @State private var score = 0
    var body: some View {
        VStack{
            ZStack{
                Image("greatchain")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.4)
                VStack{
                    Image("book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                        
                    ZStack{
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .fill(Color.red)
                            .frame(width: 300, height: 100)
                            .opacity(0.8)
                        Text("Game Over !")
                            .font(Font.largeTitle.bold())
                            
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .fill(Color.white)
                            .frame(width: 300, height: 100)
                            .opacity(0.8)
                        Text("Total : \(score)")
                            .font(Font.largeTitle.bold())
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .fill(Color.yellow)
                            .shadow(color:.yellow, radius: 10)
                            .frame(width: 300, height: 75)

                        // Show exactly one tier and make sure it fits
                        Group {
                            if score >= 100 {
                                Text("✯ Tier: Master of Literature ✯")
                            } else if score >= 80 {
                                Text("✯ Tier: Distinguished Scholar ✯")
                            } else if score >= 60 {
                                Text("✯ Tier: Accomplished Reader ✯")
                            } else {
                                Text("✯ Tier: Beginning Explorer ✯")
                            }
                        }
                        .bold()
                        .font(.title2)                // make it bigger
                        .lineLimit(1)                 // keep to one line
                        .minimumScaleFactor(0.7)      // shrink if needed to fit
                        .padding(.horizontal, 12)     // keep away from the stroke
                        .frame(width: 300 - 16, height: 75, alignment: .center) // respect inner padding
                    }

                    Button("Restart"){
                        
                    }
                    
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(Color.white)
                    .cornerRadius(30)
                }
            }
        }
    }
}

#Preview {
    Test()
}
