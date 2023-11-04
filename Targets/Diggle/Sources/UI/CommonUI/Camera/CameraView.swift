//
//  CameraView.swift
//  CameraStudy
//
//  Created by 노우영 on 2023/10/15.
//

import SwiftUI


struct CameraView: View {
    @StateObject private var viewModel: CameraViewModel
    @Binding var isPresented: Bool
    
    init(captrueDelegate: CaptureDelegate, isPresented: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: CameraViewModel(captureDelegate: captrueDelegate))
        _isPresented = isPresented
    }
    
    var body: some View {
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear {
                    viewModel.configure()
                }
            
            VStack {
                Spacer()
                
                HStack{
                    // 찍은 사진 미리보기
                    Button {
                        isPresented = false
                    } label: {
                        Text("취소")
                    }
                    .frame(maxWidth: .infinity)

                    
                    Spacer()
                    
                    // 사진찍기 버튼
                    Button(action: {viewModel.capturePhoto()}) {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 75, height: 75)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    // 전후면 카메라 교체
                    Button(action: {viewModel.changeCamera()}) {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                    }
                    .frame(width: 75, height: 75)
                    .padding()
                    .frame(maxWidth: .infinity)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(captrueDelegate: NullCaptureDelegate(), isPresented: .constant(true))
    }
}
