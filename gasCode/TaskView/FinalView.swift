//
//  FinalView.swift
//  gasCode
//
//  Created by Nadja Donosepoetro on 25/08/23.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        VStack {
            Text("Sony A7C Test")
                .font(
                    Font.custom("SF Pro", size: 30)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Rectangle()
                .frame(width: 270, height: 2)
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(100)
                .padding(.horizontal)
            
            Text("Congratulations!")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            
            Spacer() // Move Spacer to the bottom
            
            Image("finish")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 750, maxHeight: 550) // Control the image size
                .cornerRadius(15)
                .padding(.top, -250) // Adjust the top padding
            
            Text("You are doing a great job till finish!\nAmazing work!")
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.light)
                )
                .font(.title2)
                .fontWeight(.light)
        
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.22, green: 0.22, blue: 0.22))
                .padding(.top, -120) // Adjust the top padding
            
            Spacer()
            
            ZStack{
                Rectangle()
                    .frame(width: 180, height: 49)
                    .foregroundColor(Color(red: 1.0, green: 175 / 255.0, blue: 55 / 255.0))
                    .cornerRadius(5)
                    .offset(x: 1, y: 61)
                
                Text("Finish")
                    .font(Font.custom("SF Pro", size: 16))
                    .foregroundColor(.black)
                    .offset(y: 61) // Sesuaikan offset vertikal agar teks berada di tengah
                    
            }.offset(y: -200)
            .padding(.horizontal)
            
            


            
        }
        .padding(.top, 95)
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
