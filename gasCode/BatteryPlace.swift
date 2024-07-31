import SwiftUI

struct BatteryPlace: View {
    @State private var videoPlayed = false
    @State private var showWebView = false
        private let urlString: String = "https://www.youtube.com/embed/9Gqq6P74J7Y" // Use the embed URL

    var body: some View {
        VStack {

            Text("Battery Place")
                .font(.custom("SFProText-Medium", size: 30))
                .foregroundColor(.black)
                .offset(x:-85, y: -20) // Adjust the offsets as needed
          //      .padding(.top, -10)


            Rectangle()
                .frame(width: 370, height: 2)
                .foregroundColor(Color(red: 0xD9 / 255.0, green: 0xD9 / 255.0, blue: 0xD9 / 255.0))
                .cornerRadius(100)
                .offset(x: 1, y: -20) // Adjust the offsets as needed

            WebViewWithCallback(urlString: urlString, videoPlayed: $videoPlayed)
                .frame(height: 570)
                .cornerRadius(11)
                .shadow(color: .black.opacity(0.1), radius: 30.0, x: 4, y: 4)
                .sheet(isPresented: $showWebView) {
                    WebViewWithCallback(urlString: urlString, videoPlayed: $videoPlayed)
                }
                .cornerRadius(15)
                .offset(x: 0, y: -25)
                .padding(.top, 20)

            if videoPlayed {
                NavigationLink(destination: TaskView3()) {
                    Text("Next")
                        .font(.custom("SF Pro Text Bold", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 120, height: 40)
                        .background(Color("tabTint"))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .padding()
    }
}

struct BatteryPlace_Previews: PreviewProvider {
    static var previews: some View {
        BatteryPlace()
    }
}
