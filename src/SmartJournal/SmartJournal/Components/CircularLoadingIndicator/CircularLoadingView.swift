//
//  CircularLoadingView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 12/4/23.
//

import SwiftUI

struct CircularLoadingView: View {
    @State private var rotation = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Circle()
                    .trim(from: 0.2, to: 0.8)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .frame(width: 60, height: 60)
                    .rotationEffect(Angle(degrees: rotation))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                            self.rotation = 360
                        }
                    }
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
                
        }
    }
}

#Preview {
    CircularLoadingView()
}

