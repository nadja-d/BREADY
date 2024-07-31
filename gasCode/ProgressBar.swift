//import SwiftUI
//
//struct ProgressBar: View {
//    @State private var drawingWidth = false
//    var body: some View {
//        VStack(spacing: 10) {
//            Spacer() // Spacing agar isi tampilan berada di atas layar
//            Image("sign")
//                .offset(x: -170)
//
//            Text("Progress")
//                .font(.custom("SF Pro", size: 45))
//                .foregroundColor(.black)
//                .font(Font.custom("SF Pro", size: 60).weight(.bold))
//            //         .padding(.top, -430)
//                .offset(x: -80)
//                .offset(y: 20)
//
//
//            Text("choose one of the cameras to learn about")
//                .font(Font.custom("SF Compact Display", size: 17).weight(.semibold))
//                .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
//            //                .padding(.top, -383)
//                .offset(x:-10)
//                .offset(y: 20)
//
//
//            ZStack{
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 358, height: 211)
//                    .background(.white)
//                    .cornerRadius(25)
//                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                    .offset(y:-160)
//                    .padding()
//
//                HStack{
//                    Image("infront")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100, height: 588)
//                        .foregroundColor(.accentColor)
//                        .offset(x: -60)
//                        .offset(y: -195)
//
//                    Text("Sony A7C")
//                        .font(
//                            Font.custom("SF Compact Display", size: 20)
//                                .weight(.semibold)
//                        )
//                        .foregroundColor(.black)
//                        .offset(y: -225)
//                        .offset(x: -45)
//                }
//                VStack{
//                    Text("Kamera A7C dari Sony: Inovatif, kompak, menyatukan performa superior full-frame dengan portabilitas tinggi. Sensor besar hasilkan gambar tajam berkualitas tinggi dengan rentang dinamis luas.")
//                        .font(
//                            Font.custom("SF Compact Text", size: 10)
//                                .weight(.medium)
//                        )
//                        .foregroundColor(Color(red: 0.47, green: 0.41, blue: 0.41))
//                        .frame(width: 202, alignment: .top)
//                        .offset(y: -180)
//                        .offset(x: 58)
//                        .padding()
//                }
//                VStack(alignment: .leading) {
//                    Text("Current Progress")
//
//                        .offset(y: -116)
//                        .offset(x: -30)
//                        .font(
//                            Font.custom("SF Compact Text", size: 14)                        .weight(.medium)
//                        )
//
//                    ZStack(alignment: .leading) {
//                        RoundedRectangle(cornerRadius: 3)
//                            .fill(Color(.systemGray6))
//                            .frame(width: 310, height: 12)
//                            .offset(y: -112)
//
//                        RoundedRectangle(cornerRadius: 2)
//                            .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .leading, endPoint: .trailing))
//                            .frame(width: drawingWidth ? 310 : 0, height: 12)
//                            .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
//                            .offset(y: -112)
//                    }
//                    .frame(width: 250, height: 12)
//                    .onAppear {
//                        drawingWidth.toggle()
//
//                    }
//                }
//            }
//
//
//        }
//        .padding()
//    }
//}
//
//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}
//import SwiftUI
//
//struct ProgressBar: View {
//    @State private var drawingWidth = false
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 10) {
//                Spacer() // Spacing agar isi tampilan berada di atas layar
//                Image("sign")
//                    .offset(x: -170)
//
//                Text("Progress")
//                    .font(.custom("SF Pro", size: 45))
//                    .foregroundColor(.black)
//                    .font(Font.custom("SF Pro", size: 60).weight(.bold))
//                //         .padding(.top, -430)
//                    .offset(x: -80)
//                    .offset(y: 20)
//
//
//                Text("choose one of the cameras to learn about")
//                    .font(Font.custom("SF Compact Display", size: 17).weight(.semibold))
//                    .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
//                //                .padding(.top, -383)
//                    .offset(x:-10)
//                    .offset(y: 20)
//
//                NavigationLink(destination: CodingTask()) {
//                    ZStack{
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 358, height: 211)
//                            .background(.white)
//                            .cornerRadius(25)
//                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                            .offset(y:-160)
//                            .padding()
//
//                        HStack{
//                            Image("infront")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 100, height: 588)
//                                .foregroundColor(.accentColor)
//                                .offset(x: -60)
//                                .offset(y: -195)
//
//                            Text("Sony A7C")
//                                .font(
//                                    Font.custom("SF Compact Display", size: 20)
//                                        .weight(.semibold)
//                                )
//                                .foregroundColor(.black)
//                                .offset(y: -225)
//                                .offset(x: -45)
//                        }
//                        VStack{
//                            Text("Kamera A7C dari Sony: Inovatif, kompak, menyatukan performa superior full-frame dengan portabilitas tinggi. Sensor besar hasilkan gambar tajam berkualitas tinggi dengan rentang dinamis luas.")
//                                .font(
//                                    Font.custom("SF Compact Text", size: 10)
//                                        .weight(.medium)
//                                )
//                                .foregroundColor(Color(red: 0.47, green: 0.41, blue: 0.41))
//                                .frame(width: 202, alignment: .top)
//                                .offset(y: -180)
//                                .offset(x: 58)
//                                .padding()
//                        }
//                        VStack(alignment: .leading) {
//                            Text("Current Progress")
//
//                                .offset(y: -116)
//                                .offset(x: -30)
//                                .font(
//                                    Font.custom("SF Compact Text", size: 14)                        .weight(.medium)
//                                )
//
//                            ZStack(alignment: .leading) {
//                                RoundedRectangle(cornerRadius: 3)
//                                    .fill(Color(.systemGray6))
//                                    .frame(width: 310, height: 12)
//                                    .offset(y: -112)
//
//                                RoundedRectangle(cornerRadius: 2)
//                                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .leading, endPoint: .trailing))
//                                    .frame(width: drawingWidth ? 310 : 0, height: 12)
//                                    .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
//                                    .offset(y: -112)
//                            }
//                            .frame(width: 250, height: 12)
//                            .onAppear {
//                                drawingWidth.toggle()
//
//                            }
//                        }
//                    }
//
//                }
//
//
//            }
//            .padding()
//        }
//
//    }
//}
//
//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}

import SwiftUI

struct ProgressBar: View {
    @State private var drawingWidth = false
    var body: some View {
        
            VStack(spacing: 10) {
              
                
                Text("Progress")
                    .font(.custom("SF Pro", size: 45))
                    .foregroundColor(.black)
                    .font(Font.custom("SF Pro", size: 60).weight(.bold))
                //         .padding(.top, -430)
                    .offset(x: -80)
                    .offset(y: 5)
                
                
                Text("choose one of the cameras to learn about")
                    .font(Font.custom("SF Compact Display", size: 17).weight(.semibold))
                    .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                //                .padding(.top, -383)
                    .offset(x:-10)
                    .offset(y: 5)
                
                NavigationLink(destination: TaskView()) {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 358, height: 211)
                            .background(.white)
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .offset(y:-180)
                            .padding()
                        
                        HStack{
                            Image("infront")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 588)
                                .foregroundColor(.accentColor)
                                .offset(x: -60)
                                .offset(y: -215)
                            
                            Text("Sony A7C")
                                .font(
                                    Font.custom("SF Compact Display", size: 20)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.black)
                                .offset(y: -245)
                                .offset(x: -45)
                        }
                        VStack {
                            Text("Kamera A7C dari Sony: Inovatif, kompak, menyatukan performa superior full-frame dengan portabilitas tinggi. Sensor besar hasilkan gambar tajam berkualitas tinggi dengan rentang dinamis luas.")
                                .font(
                                    Font.custom("SF Compact Text", size: 10)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.47, green: 0.41, blue: 0.41))
                                .frame(width: 202, alignment: .leading)
                                .lineSpacing(2) // Adjust line spacing as needed
                                .padding(.horizontal) // Add horizontal padding
                                .offset(x: 58, y: -200) // Adjust the offset as needed
                        }

                        VStack(alignment: .leading) {
                            Text("Current Progress")
                            
                                .offset(y: -136)
                                .offset(x: -30)
                                .font(
                                    Font.custom("SF Compact Text", size: 14)                        .weight(.medium)
                                )
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color(.systemGray6))
                                    .frame(width: 310, height: 12)
                                    .offset(y: -132)
                                
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .leading, endPoint: .trailing))
                                    .frame(width: drawingWidth ? 310 : 0, height: 12)
                                    .animation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
                                    .offset(y: -132)
                            }
                            .frame(width: 250, height: 12)
                            .onAppear {
                                drawingWidth.toggle()
                                
                            }
                        }
                    }
                
                }
                
                
            }
            .padding()
        
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
