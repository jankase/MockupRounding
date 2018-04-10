//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import WatchKit

extension WKInterfaceDevice: ScreenInfoProvider {

  public var size: CGSize {
    return screenBounds.size
  }

  public var frame: CGRect {
    return screenBounds
  }

}
