//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import UIKit

extension UIScreen: ScreenInfoProvider {

  public var size: CGSize {
    return applicationFrame.size
  }

  public var frame: CGRect {
    return applicationFrame
  }

}
