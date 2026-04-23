//
//  Playground.swift
//  Clother
//
//  Created by RyanMFDR on 23/04/26.
//

import SwiftUI
import Lottie

struct Playground: View {
    var body: some View {
        ZStack {
            Text("hi")
            LottieView(animation: .named("cloud.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            LottieView(animation: .named("cloud.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
        }
    }
}

#Preview {
    Playground()
}
