//
//  eggTimer.swift
//  EggTimer
//
//  Created by Stéphane Lux on 06.11.2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

class MyEggTimer: ObservableObject {
  var timer = Timer()
}



enum EggType: Int {
  case soft = 3
  case medium = 4
  case hard = 7
}
