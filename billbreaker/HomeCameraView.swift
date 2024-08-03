//
//  HomeCamerView.swift
//  billbreaker
//
//  Created by Nick Habeth on 8/2/24.
//

import Foundation
import SwiftUI
import PhotosUI

//struct HomeCameraView: View {
//    @EnvironmentObject var router: Router
//    @EnvironmentObject var model: DataModel
//    @State private var showingReceiptDetail = false
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                //VStack{
//                    CameraView(model: model)
//                        .navigationTitle("Camera")
//                    
//                    if model.isProcessing {
//                        ProgressView("Processing...")
//                            .padding()
//                            .background(Color.secondary.colorInvert())
//                            .cornerRadius(10)
//                    }
//                    MainTabToolbar()
//              //  }
//            }
//        }
//        .sheet(isPresented: $showingReceiptDetail) {
//            //if let receipt = model.processedReceipt {
//            ProcessedView(proReceipt: model.processedReceipt)
//            //}
//        }
//        .onChange(of: model.isProcessingComplete) { completed in
//            if completed {
//                showingReceiptDetail = true
//                model.isProcessingComplete = false // Reset for next use
//            }
//        }
//    }
//}
//struct HomeCameraView: View {
//    @EnvironmentObject var router: Router
//    @EnvironmentObject var model: DataModel
//    @State private var showingReceiptDetail = false
//
//    var body: some View {
//        ZStack {
//            // Camera view as the base layer
//            CameraView(model: model)
//            
//            // Overlay UI elements
//            VStack {
//                
//                Spacer()
//                
//                // Camera button
//                Button(action: {
//                    // Capture image action
//                }) {
//                    Circle()
//                        .stroke(Color.white, lineWidth: 3)
//                        .frame(width: 70, height: 70)
//                }
//                
//                // Bottom toolbar
//                HStack {
//                    Button(action: {
//                        // Import action
//                    }) {
//                        VStack {
//                            Image(systemName: "plus")
//                            Text("Import")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Archive action
//                    }) {
//                        VStack {
//                            Image(systemName: "archivebox")
//                            Text("Archive")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Settings action
//                    }) {
//                        VStack {
//                            Image(systemName: "gear")
//                            Text("Settings")
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.black.opacity(0.6))
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .sheet(isPresented: $showingReceiptDetail) {
//            ProcessedView(proReceipt: model.processedReceipt)
//        }
//        .onChange(of: model.isProcessingComplete) { completed in
//            if completed {
//                showingReceiptDetail = true
//                model.isProcessingComplete = false // Reset for next use
//            }
//        }
//    }
//}
//struct HomeCameraView: View {
//    @StateObject private var model = DataModel()
//    @State private var showingReceiptDetail = false
//
//    var body: some View {
//        ZStack {
//            // Camera preview as the base layer
//            CameraView(model: model)
//            
//            // Overlay UI elements
//            VStack {
//                // Top section
//                VStack {
//                    Text("TAKE A PICTURE OF")
//                        .font(.headline)
//                    Text("YOUR RECEIPT")
//                        .font(.headline)
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color.black.opacity(0.6))
//                
//                Spacer()
//                
//                // Middle section
//                Text("10 FREE SPLITS REMAINING")
//                    .font(.caption)
//                    .padding()
//                
//                // Camera button
//                Button(action: {
//                    model.camera.takePhoto()
//                }) {
//                    Circle()
//                        .stroke(Color.white, lineWidth: 3)
//                        .frame(width: 70, height: 70)
//                }
//                
//                // Bottom toolbar
//                HStack {
//                    Button(action: {
//                        // Import action
//                    }) {
//                        VStack {
//                            Image(systemName: "plus")
//                            Text("Import")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Archive action
//                    }) {
//                        VStack {
//                            Image(systemName: "archivebox")
//                            Text("Archive")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Settings action
//                    }) {
//                        VStack {
//                            Image(systemName: "gear")
//                            Text("Settings")
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.black.opacity(0.6))
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .task {
//            await model.camera.start()
//            await model.loadPhotos()
//            await model.loadThumbnail()
//        }
//        .sheet(isPresented: $showingReceiptDetail) {
//            ProcessedView(proReceipt: model.processedReceipt)
//        }
//        .onChange(of: model.isProcessingComplete) { completed in
//            if completed {
//                showingReceiptDetail = true
//                model.isProcessingComplete = false // Reset for next use
//            }
//        }
//    }
//}
//struct HomeCameraView: View {
//    @StateObject private var model = DataModel()
//    @State private var showingReceiptDetail = false
//    @State private var selectedPhotoData: PhotosPickerItem?
//
//    var body: some View {
//        ZStack {
//            // Camera preview as the base layer
//            CameraView(model: model)
//            
//            // Overlay UI elements
//            VStack {
//                // Top section
//                VStack {
//                    Text("TAKE A PICTURE OF")
//                        .font(.headline)
//                    Text("YOUR FATCHECK")
//                        .font(.headline)
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color.black.opacity(0.6))
//                
//                Spacer()
//                
//                // Camera button
//                Button(action: {
//                    model.camera.takePhoto()
//                }) {
//                    Circle()
//                        .stroke(Color.white, lineWidth: 3)
//                        .frame(width: 70, height: 70)
//                }
//                
//                // Bottom toolbar
//                HStack {
//                    PhotosPicker(
//                        selection: $selectedPhotoData,
//                        matching: .images,
//                        photoLibrary: .shared()
//                    ) {
//                        VStack {
//                            Image(systemName: "plus")
//                            Text("Import")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Archive action
//                    }) {
//                        VStack {
//                            Image(systemName: "archivebox")
//                            Text("Archive")
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        // Settings action
//                    }) {
//                        VStack {
//                            Image(systemName: "gear")
//                            Text("Settings")
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.black.opacity(0.6))
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .task {
//            await model.camera.start()
//            await model.loadPhotos()
//            await model.loadThumbnail()
//        }
//        .sheet(isPresented: $showingReceiptDetail) {
//            ProcessedView(proReceipt: model.processedReceipt)
//        }
//        .onChange(of: model.isProcessingComplete) { completed in
//            if completed {
//                showingReceiptDetail = true
//                model.isProcessingComplete = false // Reset for next use
//            }
//        }
//        .onChange(of: selectedPhotoData) { newValue in
//            if let photoItem = newValue {
//                Task {
//                    if let imageData = try? await photoItem.loadTransferable(type: Data.self) {
//                        await model.processPhoto(imageData: imageData)
//                    }
//                }
//            }
//        }
//    }
//}
struct HomeCameraView: View {
    @StateObject private var model = DataModel()
    @State private var showingReceiptDetail = false
    @State private var selectedPhotoData: PhotosPickerItem?

    var body: some View {
        ZStack {
            // Camera preview as the base layer
            CameraView(model: model)
            
            // Overlay UI elements
            VStack {
                // Top section
//                VStack {
//                    Text("TAKE A PICTURE OF")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Text("YOUR FATCHECK")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                }
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(Color.black.opacity(0.6))
                
                Spacer()
                
                // Camera button
                Button(action: {
                    model.camera.takePhoto()
                }) {
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 70, height: 70)
                }
                
                // Bottom toolbar
                HStack {
                    Spacer()
                    PhotosPicker(
                        selection: $selectedPhotoData,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        VStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Text("Import")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Archive action
                    }) {
                        VStack {
                            Image(systemName: "archivebox")
                                .foregroundColor(.white)
                            Text("Archive")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Settings action
                    }) {
                        VStack {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                            Text("Settings")
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .task {
            await model.camera.start()
            await model.loadPhotos()
            await model.loadThumbnail()
        }
        .sheet(isPresented: $showingReceiptDetail) {
            ProcessedView(proReceipt: model.processedReceipt)
        }
        .onChange(of: model.isProcessingComplete) { completed in
            if completed {
                showingReceiptDetail = true
                model.isProcessingComplete = false // Reset for next use
            }
        }
        .onChange(of: selectedPhotoData) { newValue in
            if let photoItem = newValue {
                Task {
                    if let imageData = try? await photoItem.loadTransferable(type: Data.self) {
                        await model.processPhoto(imageData: imageData)
                    }
                }
            }
        }
    }
}
