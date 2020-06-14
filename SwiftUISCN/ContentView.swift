//
//  ContentView.swift
//  SwiftUISCN
//
//  Created by Vincent Neo on 14/6/20.
//  Copyright © 2020 Vincent Neo. All rights reserved.
//
import SceneKit
import SwiftUI

struct ContentView: View {

    @State private var gestureTranslation = CGSize.zero
    @State private var prevTranslation = CGSize.zero

    var body: some View {

        VStack {
            SceneView()
                .frame(height: (UIScreen.main.bounds.height / 2) + self.gestureTranslation.height)
            RoundedRectangle(cornerRadius: 5)
            .frame(width: 40, height: 6)
            .foregroundColor(Color.gray)
            .padding(2)
            .gesture(DragGesture(coordinateSpace: .global)
                    .onChanged({ value in
                        self.gestureTranslation = CGSize(width: value.translation.width + self.prevTranslation.width, height: value.translation.height + self.prevTranslation.height)

                    })
                    .onEnded({ value in
                        self.gestureTranslation = CGSize(width: value.translation.width + self.prevTranslation.width, height: value.translation.height + self.prevTranslation.height)

                        self.prevTranslation = self.gestureTranslation
                    })
            )
            Rectangle()
                .fill(Color.green)
                .frame(height: (UIScreen.main.bounds.height / 2) - self.gestureTranslation.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct SceneView: UIViewRepresentable {
    
    typealias UIViewType = SCNView
    
    func makeUIView(context: Context) -> SCNView {
        let scene = SCNScene(named: "SceneAssets.scnassets/Cube.scn")
        let view = SCNView()
        
        view.scene = scene
        
        view.allowsCameraControl = true
        view.defaultCameraController.interactionMode = .orbitTurntable
        view.defaultCameraController.inertiaEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }

}


