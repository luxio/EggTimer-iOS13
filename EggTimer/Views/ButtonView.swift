//
//  ButtonView.swift
//  EggTimer
//
//  Created by Stéphane Lux on 11.11.2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct ButtonImage: View {
  @Binding var topText:String
  @EnvironmentObject var eggTimer : MyEggTimer
  var eggType : EggType
  @Binding var progress:CGFloat
  
  var imageName:String {
    switch eggType {
    case .soft:
      return "soft_egg"
    case .medium:
      return "medium_egg"
    case .hard:
      return "hard_egg"
    }
  }
  
  var title:String {
    switch eggType {
    case .soft:
      return "Soft"
    case .medium:
      return "Medium"
    case .hard:
      return "Hard"
    }
  }
  
  var body: some View {
    Button(action: {
      self.buttonPressed()
    }) {
      ZStack{
        Image(imageName)
          .renderingMode(.original)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding(5)
        Text(title)
          .font(.system(size: 18))
          .fontWeight(.black)
          .foregroundColor(.white)
      }
      
    }
  }
  
  func buttonPressed() {
    self.progress = 0
    self.eggTimer.timer.invalidate()
    let totalTime = self.eggType.rawValue
    var secondsRemaining = self.eggType.rawValue
    self.topText =  title
    self.progress = 100
    self.eggTimer.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
      if secondsRemaining > 0 {
        secondsRemaining -= 1
        self.progress = (CGFloat(secondsRemaining) / CGFloat(totalTime) ) * 100
      }  else {
        self.progress = 0
        self.topText =  "Done"
        self.eggTimer.timer.invalidate()
        
        // play sound
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

      }
    }
  }
}
