//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import AppKit

extension NSScreen: ScreenInfoProvider {

  public var size: CGSize {
    return frame.size
  }

}
