import SwiftUI
import WebKit

struct Page39Task: View {
    @State private var showWebView = false
    @State private var videoPlayed = false
    private let urlString: String = "https://www.youtube.com/embed/9Gqq6P74J7Y"

    var body: some View {
        NavigationView {
            VStack {
                Text("Button On / Off")
                    .font(.custom("SFProText-Medium", size: 30))
                    .foregroundColor(.black)
                    .offset(x: -70, y: -20)

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
                    NavigationLink(destination: StepOnOff()) {
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
struct WebViewWithCallback: UIViewRepresentable {
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
        var parent: WebViewWithCallback

        init(_ parent: WebViewWithCallback) {
            self.parent = parent
            super.init()
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.videoPlayed = true
        }
    }
}

struct Page39Task_Previews: PreviewProvider {
    static var previews: some View {
        Page39Task()
    }
}

//import SwiftUI
//import WebKit
//
//struct Page39Task: View {
//    @State private var showWebView = false
//    @State private var videoPlayed = false
//    @State private var videoPlaybackDuration: TimeInterval = 0
//    private let urlString: String = "https://www.youtube.com/embed/9Gqq6P74J7Y"
//    private let minimumVideoDuration: TimeInterval = 10
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Button On / Off")
//                    .font(.custom("SFProText-Medium", size: 30))
//                    .foregroundColor(.black)
//                    .offset(x: -70, y: -20)
//
//                Rectangle()
//                    .frame(width: 370, height: 2)
//                    .foregroundColor(Color(red: 0xD9 / 255.0, green: 0xD9 / 255.0, blue: 0xD9 / 255.0))
//                    .cornerRadius(100)
//                    .offset(x: 1, y: -20)
//
//                WebViewWithCallback(urlString: urlString, videoPlayed: $videoPlayed, videoPlaybackDuration: $videoPlaybackDuration, minimumVideoDuration: minimumVideoDuration)
//                    .frame(height: 570)
//                    .cornerRadius(11)
//                    .shadow(color: .black.opacity(0.1), radius: 30.0, x: 4, y: 4)
//                    .sheet(isPresented: $showWebView) {
//                        WebViewWithCallback(urlString: urlString, videoPlayed: $videoPlayed, videoPlaybackDuration: $videoPlaybackDuration, minimumVideoDuration: minimumVideoDuration)
//                    }
//                    .cornerRadius(15)
//                    .offset(x: 0, y: -25)
//                    .padding(.top, 20)
//
//                if videoPlaybackDuration >= minimumVideoDuration {
//                    NavigationLink(destination: TaskView2()) {
//                        Text("Next")
//                            .font(.custom("SF Pro Text Bold", size: 20))
//                            .foregroundColor(.white)
//                            .frame(width: 120, height: 40)
//                            .background(Color("tabTint"))
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 20)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//// Define a WebView with JavaScript callback
//struct WebViewWithCallback: UIViewRepresentable {
//    let urlString: String
//    @Binding var videoPlayed: Bool
//    @Binding var videoPlaybackDuration: TimeInterval
//    let minimumVideoDuration: TimeInterval
//
//    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
//        return webView
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        if let url = URL(string: urlString) {
//            let request = URLRequest(url: url)
//            uiView.load(request)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self, minimumVideoDuration: minimumVideoDuration)
//    }
//
//    class Coordinator: NSObject, WKNavigationDelegate {
//        var parent: WebViewWithCallback
//        let minimumVideoDuration: TimeInterval
//
//        init(_ parent: WebViewWithCallback, minimumVideoDuration: TimeInterval) {
//            self.parent = parent
//            self.minimumVideoDuration = minimumVideoDuration
//            super.init()
//        }
//
//        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//            parent.videoPlayed = true
//        }
//
//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            // Update the video playback duration when video finishes loading
//            parent.videoPlaybackDuration = 0
//        }
//
//        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//            // Start tracking video playback duration
//            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//                self.parent.videoPlaybackDuration += 1
//                if self.parent.videoPlaybackDuration >= self.minimumVideoDuration {
//                    timer.invalidate() // Stop the timer once the minimum duration is reached
//                }
//            }
//        }
//    }
//}
//
//struct Page39Task_Previews: PreviewProvider {
//    static var previews: some View {
//        Page39Task()
//    }
//}
//
//struct TaskView2: View {
//    var body: some View {
//        Text("Task View")
//    }
//}
