//
//  ContentView.swift
//  swft
//
//  Created by Stéphane Lux on 03.11.2019.
//  Copyright © 2019 LUXio IT-Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var topText:String = "How do you like your eggs?"
  @State var progress:CGFloat = 0
  
  var body: some View {
    ZStack {
      Color("background")
        .edgesIgnoringSafeArea(.all)
      VStack() {
        Text(self.topText)
          .font(.system(size: 60))
          .lineLimit(1)
          .minimumScaleFactor(0.3)
          .foregroundColor(Color(.darkGray))
          .padding()
          .padding(.top, 100)
        Spacer()
      }
      VStack {
        HStack{
          ButtonImage(topText: $topText, eggType: .soft, progress: $progress)
          ButtonImage(topText: $topText, eggType: .medium, progress: $progress)
          ButtonImage(topText: $topText, eggType: .hard, progress: $progress)
        }
        .padding()
        ProgressBar(progress: $progress)
        .frame(width: 345, height: 5)
          .padding([.top, .bottom], 15)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
        .previewDisplayName("iPhone XS Max")      
    }
  }
}

