//import SwiftUI
//
//struct PhotoRecordButton: View {
//    @State private var showWebView = false
//        private let urlString: String = "https://www.youtube.com/embed/9Gqq6P74J7Y" // Use the embed URL
//
//    var body: some View {
//        VStack {
//            Text("Photo / Record Button")
//                .font(.custom("SFProText-Medium", size: 30))
//                .foregroundColor(.black)
//                .offset(x: -30, y: -20) // Adjust the offsets as needed
//          //      .padding(.top, -10)
//
//
//
//            Rectangle()
//                .frame(width: 370, height: 2)
//                .foregroundColor(Color(red: 0xD9 / 255.0, green: 0xD9 / 255.0, blue: 0xD9 / 255.0))
//                .cornerRadius(100)
//                .offset(x: 1, y: -20) // Adjust the offsets as needed
//
//            WebView(urlString: urlString)
//                                .frame(height: 570)
//                                .cornerRadius(11)
//                                .shadow(color: .black.opacity(0.1), radius: 30.0, x: 4, y: 4)
//                                .sheet(isPresented: $showWebView) {
//                                    WebView(urlString: urlString)
//                                }
//                .cornerRadius(15)
//                .offset(x: 0, y: -25) // Adjust the offsets as needed
//            .padding(.top,20)
//        }
//        .padding() // Place .padding() within the VStack
//    }
//}
//
//struct PhotoRecordButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoRecordButton()
//    }
//}

import SwiftUI
import WebKit

struct PhotoRecordButton: View {
    @State private var showWebView = false
    @State private var videoPlayed = false
    private let urlString: String = "https://www.youtube.com/embed/9Gqq6P74J7Y"

    var body: some View {
        NavigationView {
            VStack {
                Text("Photo / Record Button")
                    .font(.custom("SFProText-Medium", size: 30))
                    .foregroundColor(.black)
                    .offset(x: -30, y: -20)
                

                Rectangle()
                    .frame(width: 370, height: 2)
                    .foregroundColor(Color(red: 0xD9 / 255.0, green: 0xD9 / 255.0, blue: 0xD9 / 255.0))
                    .cornerRadius(100)
                    .offset(x: 1, y: -20)

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
                    NavigationLink(destination: STEP2()) {
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
}

// Define a WebView with JavaScript callback
struct WebViewWithCallback3: UIViewRepresentable {
    let urlString: String
    @Binding var videoPlayed: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWithCallback3

        init(_ parent: WebViewWithCallback3) {
            self.parent = parent
            super.init()
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.videoPlayed = true
        }
    }
}

struct PhotoRecordButton_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRecordButton()
    }
}
