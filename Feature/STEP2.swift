//
//  STEP2.swift
//  BReady
//
//  Created by Joshua Samuel Vincent on 24/08/23.
//

//import SwiftUI
//import AVFoundation
//
//struct STEP2: View {
//    @State private var indexPage = 0
//    @State private var isCameraActive = false
//    @GestureState private var dragState = DragState.inactive
//
//    enum DragState {
//        case inactive
//        case dragging(translation: CGSize)
//
//        var translation: CGSize {
//            switch self {
//            case .inactive:
//                return .zero
//            case .dragging(let translation):
//                return translation
//            }
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Picker("What is your choice", selection: $indexPage) {
//                    Text("Front").tag(0)
//                    Text("Back").tag(1)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//                .frame(width: 200, height: 50)
//                .background(
//                    RoundedRectangle(cornerRadius: 50)
//                        .foregroundColor(Color(red: 1, green: 0.69, blue: 0.22))
//                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
//                )
//                .offset(y: 500)
//
//                VStack {
//                    Group {
//                        if indexPage == 0 {
//                            Button(action: {
//                                indexPage = 1 // Change page to "Back" when the button is pressed
//                            }) {
//                                Image("sony")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .foregroundColor(.accentColor)
//                                    .offset(y: 100)
//                                    .rotation3DEffect(
//                                        .degrees(Double(dragState.translation.height) / 10),
//                                        axis: (x: -10.0, y: 0.0, z: 0.0)
//                                    )
//                                    .animation(.spring())
//                                    .offset(y: dragState.translation.height)
//                                    .gesture(
//                                        DragGesture()
//                                            .updating($dragState) { value, state, _ in
//                                                state = .dragging(translation: value.translation)
//                                            }
//                                            .onEnded { value in
//                                                if value.translation.height < -100 {
//                                                    indexPage = 1
//                                                }
//                                            }
//                                    )
//                            }
//                        } else {
//                            ZStack {
//                                if isCameraActive {
//                                    CameraView2(sourceType: .camera)
//                                        .edgesIgnoringSafeArea(.all)
//                                        .rotationEffect(.degrees(0)) // Rotate the camera view
//                                        .scaleEffect(1.9)
//                                        .frame(width: 80, height: 80.5)
//                                        .offset(x: -28, y: 107)
//                                        .offset(y: dragState.translation.height) // Offset based on drag translation
//                                        .onAppear {
//                                            // Capture photo automatically
//                                            let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
//                                                capturePhoto()
//                                            }
//                                            RunLoop.main.add(timer, forMode: .common)
//                                        }
//                                }
//                                Image("back")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .foregroundColor(.accentColor)
//                                    .offset(y: 100)
//                                    .rotation3DEffect(
//                                        .degrees(Double(dragState.translation.height) / 10),
//                                        axis: (x: -10.0, y: 0.0, z: 0.0)
//                                    )
//                                    .animation(.spring())
//                                    .offset(y: dragState.translation.height)
//                                    .gesture(
//                                        DragGesture()
//                                            .updating($dragState) { value, state, _ in
//                                                state = .dragging(translation: value.translation)
//                                            }
//                                            .onEnded { value in
//                                                if value.translation.height > 100 {
//                                                    indexPage = 0
//                                                }
//                                            }
//                                    )
//                                    .onAppear {
//                                        isCameraActive = true
//                                    }
//                            }
//                        }
//                    }
//                }
//
//                VStack {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(width: 400, height: 400)
//                            .background(Color(red: 1, green: 0.69, blue: 0.22))
//                            .cornerRadius(63)
//                            .rotationEffect(Angle(degrees: -90))
//                            .padding(.top, 200)
//                            .overlay(
//                                Text("Step 2")
//                                    .font(Font.custom("SF Pro Text Bold", size: 28))
//                                    .foregroundColor(.black)
//                                    .padding(.bottom, 145)
//                            )
//
//                        Text("TAP BUTTON TO")
//                            .font(Font.custom("SF Pro Text Bold", size: 14))
//                            .foregroundColor(.black)
//                            .offset(y:40)
//                            .padding()
//                        VStack {
//                            Text("CAPTURE")
//                                .font(Font.custom("SF Pro Text Bold", size: 14))
//                                .foregroundColor(.red)
//                                .offset(y:60)
//                                .padding()
//                        }
//
//                        ZStack{
//                            Image("SHUTTER BUTTON")
//                                .padding (.bottom)
//
//                            Rectangle()
//                                .foregroundColor(.clear)
//                                .frame(width: 272, height: 57)
//                                .background(Color(red: 0.98, green: 0.94, blue: 0.69))
//                                .cornerRadius(34)
//                                .rotationEffect(Angle(degrees: -0))
//                                .offset(y:128)
//                            Text("Next Step")
//                                .font(Font.custom("SF Pro Text Bold", size: 20))
//                                .foregroundColor(.black)
//                                .offset()
//                                .offset(y:128)
//                                .offset()
//                        }
//                    }
//                    Spacer()
//                }
//            }
//            .padding()
//            .navigationBarTitle("Sony A7C ", displayMode: .inline)
//        }
//    }
//
//    private func capturePhoto() {
//        let captureSession = AVCaptureSession()
//
//        guard let backCamera = AVCaptureDevice.default(for: .video) else {
//            return
//        }
//
//        do {
//            let input = try AVCaptureDeviceInput(device: backCamera)
//            captureSession.addInput(input)
//
//            let output = AVCapturePhotoOutput()
//            if captureSession.canAddOutput(output) {
//                captureSession.addOutput(output)
//
//                captureSession.startRunning()
//
//                let settings = AVCapturePhotoSettings()
//                settings.flashMode = .auto
//                output.capturePhoto(with: settings, delegate: self)
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//struct CameraView2: UIViewControllerRepresentable {
//    typealias UIViewControllerType = UIImagePickerController
//    var sourceType: UIImagePickerController.SourceType
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.sourceType = sourceType
//        picker.showsCameraControls = false
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//    }
//}
//
//struct STEP2_Previews: PreviewProvider {
//    static var previews: some View {
//        STEP2()
//    }
//}
//
//extension STEP2: AVCapturePhotoCaptureDelegate {
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        if let imageData = photo.fileDataRepresentation() {
//            if UIImage(data: imageData) != nil {
//                // Handle the captured image, e.g., save it to the photo library
//                // You can use capturedImage variable to display or process the image further
//            }
//        }
//    }
//}

import SwiftUI
import AVFoundation

struct STEP2: View {
    @State private var indexPage = 0
    @State private var isCameraActive = false
    @GestureState private var dragState = DragState.inactive

    enum DragState {
        case inactive
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("What is your choice", selection: $indexPage) {
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
                .offset(y: 500)

                VStack {
                    Group {
                        if indexPage == 0 {
                            Button(action: {
                                indexPage = 1 // Change page to "Back" when the button is pressed
                            }) {
                                Image("sony")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.accentColor)
                                    .offset(y: 100)
                                    .rotation3DEffect(
                                        .degrees(Double(dragState.translation.height) / 10),
                                        axis: (x: -10.0, y: 0.0, z: 0.0)
                                    )
                                    .animation(.spring())
                                    .offset(y: dragState.translation.height)
                                    .gesture(
                                        DragGesture()
                                            .updating($dragState) { value, state, _ in
                                                state = .dragging(translation: value.translation)
                                            }
                                            .onEnded { value in
                                                if value.translation.height < -100 {
                                                    indexPage = 1
                                                }
                                            }
                                    )
                            }
                        } else {
                            ZStack {
                                if isCameraActive {
                                    CameraView3(sourceType: .camera)
                                        .edgesIgnoringSafeArea(.all)
                                        .rotationEffect(.degrees(0)) // Rotate the camera view
                                        .scaleEffect(1.9)
                                        .frame(width: 87.7, height: 88)
                                        .offset(x: -31.5, y: 107)
                                        .offset(y: dragState.translation.height) // Offset based on drag translation
                                }
                                Image("back")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.accentColor)
                                    .offset(y: 100)
                                    .rotation3DEffect(
                                        .degrees(Double(dragState.translation.height) / 10),
                                        axis: (x: -10.0, y: 0.0, z: 0.0)
                                    )
                                    .animation(.spring())
                                    .offset(y: dragState.translation.height)
                                    .gesture(
                                        DragGesture()
                                            .updating($dragState) { value, state, _ in
                                                state = .dragging(translation: value.translation)
                                            }
                                            .onEnded { value in
                                                if value.translation.height > 100 {
                                                    indexPage = 0
                                                }
                                            }
                                    )
                                    .onAppear {
                                        isCameraActive = true
                                    }
                            }
                        }
                    }
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
                                    .font(Font.custom("SF Pro Text Bold", size: 28))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 145)
                            )
                        
                        Text("TAP BUTTON TO")
                            .font(Font.custom("SF Pro Text Bold", size: 14))
                            .foregroundColor(.black)
                            .offset(y:40)
                            .padding()
                        VStack {
                            Text("CAPTURE")
                                .font(Font.custom("SF Pro Text Bold", size: 14))
                                .foregroundColor(.red)
                                .offset(y:60)
                                .padding()
                        }
                        
                            ZStack{
                                Image("SHUTTER BUTTON")
                                    .padding (.bottom)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 273, height: 57)
                                    .background(Color(red: 0.98, green: 0.94, blue: 0.69))
                                    .cornerRadius(34)
                                    .rotationEffect(Angle(degrees: -0))
                                    .offset(y:128)
                                NavigationLink(destination: TaskView2()) {
                                    Text("Next Step")
                                        .font(Font.custom("SF Pro Text Bold", size: 20))
                                        .foregroundColor(.black)
                                        .offset(y:128)
                                }
                            }
                    }
                    Spacer()
                }
            }
            .padding()
            .navigationBarTitle("Sony A7C ", displayMode: .inline)
        }
    }
    
    private func capturePhoto() {
        let captureSession = AVCaptureSession()
        
        guard let backCamera = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            captureSession.addInput(input)
            
            let output = AVCapturePhotoOutput()
            if captureSession.canAddOutput(output) {
                captureSession.addOutput(output)
                
                captureSession.startRunning()
                
                let settings = AVCapturePhotoSettings()
                settings.flashMode = .auto
                output.capturePhoto(with: settings, delegate: PhotoCaptureProcessor())
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct CameraView2: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.showsCameraControls = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}

struct STEP2_Previews: PreviewProvider {
    static var previews: some View {
        STEP2()
    }
}

class PhotoCaptureProcessor: NSObject, AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            if UIImage(data: imageData) != nil {
                // Handle the captured image, e.g., save it to the photo library
                // You can use capturedImage variable to display or process the image further
            }
        }
    }
}
