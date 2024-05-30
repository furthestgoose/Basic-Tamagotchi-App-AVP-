//
//  CreatureDetailView.swift
//  Tamogochi
//
//  Created by Adam Byford on 30/05/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct CreatureDetailView: View {
    
    let modelName: String
        @State private var horizontalRotation = CGFloat.zero
        @State private var verticalRotation = CGFloat.zero
        
        @State private var endHorizontalRotation = CGFloat.zero
        @State private var endVerticalRotation = CGFloat.zero
        
        var body: some View {
            Model3D(named: modelName, bundle: realityKitContentBundle)
                .rotation3DEffect(
                    .degrees(horizontalRotation), axis: .y
                )
                .rotation3DEffect(
                    .degrees(-verticalRotation), axis: .x
                )
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            horizontalRotation = value.translation.width + endHorizontalRotation
                            verticalRotation = value.translation.height + endVerticalRotation
                        })
                        .onEnded({ _ in
                            endHorizontalRotation = horizontalRotation
                            endVerticalRotation = verticalRotation
                        })
                )
        }

}

#Preview {
    CreatureDetailView(modelName: "DogScene")
}
