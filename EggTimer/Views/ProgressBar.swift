//
//  ProgressBar.swift
//  EggTimer
//
//  Created by Stéphane Lux on 08.11.2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
  
  @Binding var progress: CGFloat
  @State var isShowing = false
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .foregroundColor(Color(.systemGray))
          .opacity(0.3)
          .frame(width: geometry.size.width, height: geometry.size.height)
        Rectangle()
          .foregroundColor(Color(.systemYellow))
          .frame(width: self.isShowing ? geometry.size.width * (self.progress / 100.0) : 0.0,
                 height: geometry.size.height)
          .animation(.linear(duration: 0.6))
      }
      .onAppear {
        self.isShowing = true
      }
      .cornerRadius(geometry.size.height / 2.0)
    }
  }
}

#if DEBUG
struct ProgressBar_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBar(progress: .constant(25.0))
      .frame(width: 345.0, height: 8.0)
  }
}
#endif
