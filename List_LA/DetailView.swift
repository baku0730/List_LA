//
//  DetailView.swift
//  List_LA
//
//  Created by シング　シュバクシ on 2026/02/02.
//

import SwiftUI
import AVFAudio

struct DetailView: View {
    
    @State var animal: Animal
    @State var player: AVAudioPlayer!
    
    var body: some View {
        VStack{
            Text(animal.name)
                .font(.title)
                .bold()
            Spacer()
            Image(animal.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            Spacer()
            Button{
                player.currentTime = 0
                player.play()
            } label: {
                Text("鳴き声を聞く")
            }
            .buttonStyle(BorderedProminentButtonStyle())
            Spacer()
            Spacer()
        }
        .padding()
        .onAppear{
            player = try! AVAudioPlayer(data: animal.sound)
        }
        
    }
}

#Preview {
    DetailView(animal: .cat)
}
