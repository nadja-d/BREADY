//
//  StepChangeAppeture.swift
//  gasCode
//
//  Created by Nadja Donosepoetro on 25/08/23.
//

import SwiftUI
import AVFoundation

struct StepChangeAppeture: View {
    @State private var indexPage = 0
    @State private var isCameraActive = false
    @GestureState private var dragState = DragState.inactive
    let captureModesList = ["1.4", "2.0", "2.8", "4.0", "5.6", "8.0"]
    @State private var selectedMode = "Default"
    
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
                        } else {
                            ZStack {
                                if isCameraActive {
                                    CameraView4(sourceType: .camera)
                                        .edgesIgnoringSafeArea(.all)
                                        .rotationEffect(.degrees(0)) // Rotate the camera view
                                        .scaleEffect(1.9)
                                        .frame(width: 87.7, height: 88)
                                        .offset(x: -25, y: 107)
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
                            .frame(width: 450, height: 450)
                            .background(Color(red: 1, green: 0.69, blue: 0.22))
                            .cornerRadius(63)
                            .rotationEffect(Angle(degrees: -90))
                            .padding(.top, 200)
                            .overlay(
                                Text("Step 1")
                                    .font(Font.custom("SF Pro Text Bold", size: 28))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 145)
                            )
                        
                        Text("SLIDE BUTTON TO")
                            .font(Font.custom("SF Pro Text Bold", size: 14))
                            .foregroundColor(.black)
                            .offset(y:40)
                            .padding()
                        VStack {
                            Text("CHANGE APPETURE")
                                .font(Font.custom("SF Pro Text Bold", size: 14))
                                .foregroundColor(.red)
                                .offset(y:60)
                                .padding()
                        }
                        
                        ZStack{
                            VStack {
                                Text("Selected Mode: \(selectedMode)")
                                    .padding()

                                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
                                        ForEach(captureModesList, id: \.self) { mode in
                                            Button(action: {
                                                selectedMode = mode
                                                
                                            }) {
                                                Text(mode)
                                                    .foregroundColor(selectedMode == mode ? .blue : .white)
                                                    .padding()
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }

                                Spacer()
                            }
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
    
    struct StepChangeAppeture_Previews: PreviewProvider {
        static var previews: some View {
            StepChangeAppeture()
        }
    }
    
    struct CameraView4: UIViewControllerRepresentable {
        typealias UIViewControllerType = UIImagePickerController
        var sourceType: UIImagePickerController.SourceType
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.showsCameraControls = false // this to hide the camera controls
            return picker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        }
    }
}
