import SwiftUI

struct BackCam: View {
    @State private var BackCam = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("What is your choice", selection: $BackCam) {
                    Text("Front").tag(0)
                    Text("Back").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .frame(width: 200, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(Color(red: 1, green: 0.69, blue: 0.22))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                )
                .offset(y: 460)
                
                VStack {
                    Image("back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.accentColor)
                        .offset(y: 100)
                }
                
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 400, height: 400)
                            .background(Color(red: 1, green: 0.69, blue: 0.22))
                            .cornerRadius(63)
                            .rotationEffect(Angle(degrees: -90))
                            .padding(.top, 200)
                            .overlay(
                                Text("Step 2")
                                    .font(.custom("SF Pro Text Bold", size: 28))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 145)
                            )
                        
                        Text("SWITCH POWER BUTTON TO")
                            .font(.custom("SF Pro Text Bold", size: 14))
                            .foregroundColor(.black)
                            .offset(y: 40)
                            .padding()
                        
                        ZStack {
                            Image("camera1")
                                .padding(.bottom)
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 272, height: 57)
                                .background(Color(red: 0.98, green: 0.94, blue: 0.69))
                                .cornerRadius(34)
                                .rotationEffect(Angle(degrees: 0))
                                .offset(y: 100)
                            Text("Next Step")
                                .font(.custom("SF Pro Text Bold", size: 20))
                                .foregroundColor(.black)
                                .offset(y: 100)
                                .offset(x: -40)
                            HStack {
                                Image(systemName: "arrow.right.circle")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .offset(y: 100)
                                    .offset(x: 87)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .navigationBarTitle("Sony A7C", displayMode: .inline)
        }
    }
}

struct BackCam_Previews: PreviewProvider {
    static var previews: some View {
        BackCam()
    }
}
