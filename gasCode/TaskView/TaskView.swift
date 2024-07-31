import SwiftUI
import WebKit

struct TaskView: View {
    @State private var showWebView = false
    private let urlString: String = "https://www.youtube.com/embed/LSjMdFOLQqU"
    
    var body: some View {
        
        VStack {
            ZStack {
                WebView(urlString: urlString)
                    .frame(width: UIScreen.main.bounds.width, height: 410)
                    .sheet(isPresented: $showWebView){
                        WebView(urlString: urlString)
                    }
                    .cornerRadius(15)
                    .offset(y:-95)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 160)
                    .cornerRadius(30)
                    .position(x: UIScreen.main.bounds.width * 1/2
                              , y: UIScreen.main.bounds.height*0.4)
                //                 .offset(y:-55)
            }
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Sony A7C")
                        .font(
                            Font.custom("SF Compact Display", size: 32)
                                .weight(.semibold)
                        )
                        .padding([.bottom , .top],2)
                    
                    Text("Secara definisi kamera merupakan seperangkat alat atau perlengkapan yang berfungsi untuk mengabadikan suatu objek menjadi sebuah gambar (diam maupun bergerak) yang merupakan hasil proyeksi pada sistem lensa.")
                        .font(
                            Font.custom("SF Compact Text", size: 10)
                                .weight(.medium)
                        )
                        
                        .foregroundColor(Color(red: 0.26, green: 0.21, blue: 0.21))
                        .padding(.trailing)
                    
                    Text("Complete this task")
                        .font(
                            Font.custom("SF Compact Display", size: 24)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                        .padding([.bottom , .top],5)
                    
                    VStack(spacing:20) {
                        NavigationLink(destination:Page39Task()) {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 341, height: 48)
                                    .background(.white)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                
                                HStack{
                                    Text("BUTTON ON / OFF")
                                        .font(
                                            Font.custom("SF Compact Display", size: 20)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding()
                                }
                                
                                
                            }
                            .frame(width: 341, height: 40)
                            .contentShape(Rectangle().size(width: 341, height: 480))
                        }
                        
                        NavigationLink(destination:PhotoRecordButton()) {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 341, height: 48)
                                    .background(.white)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                HStack{
                                    Text("PHOTO/RECORD BUTTON")
                                        .font(
                                            Font.custom("SF Compact Display", size: 20)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding()
                                }
                                
                                
                            }
                            .frame(width: 341, height: 40)
                            .contentShape(Rectangle().size(width: 341, height: 480))
                        }
                        NavigationLink(destination: BatteryPlace()) {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 341, height: 48)
                                    .background(.white)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                HStack{
                                    Text("BATTERY PLACE")
                                        .font(
                                            Font.custom("SF Compact Display", size: 20)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding()
                                }
                                
                                
                            }
                            .frame(width: 341, height: 40)
                            .contentShape(Rectangle().size(width: 341, height: 480))
                        }
                        NavigationLink(destination:ExposureTriangle()) {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 341, height: 48)
                                    .background(.white)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                HStack{
                                    Text("EXPOSURE TRIANGLE")
                                        .font(
                                            Font.custom("SF Compact Display", size: 20)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding(.leading, 20)
                                    Spacer()
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.52, green: 0.49, blue: 0.49))
                                        .padding()
                                }
                                
                                
                            }
                            .frame(width: 341, height: 40)
                            .contentShape(Rectangle().size(width: 341, height: 480))
                        }
                    }
                    
                    
                    
                    /////////
                    
                    
                    
                    
                    
                }
                
                
            }.padding()
                .offset(y:-120)
                .offset(x: 11)
            Spacer()
            
        }
        
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
