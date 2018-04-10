//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics
import UIRounding

public protocol ScreenInfoProvider: ScaleProviderType {

  var size: CGSize { get }
  var frame: CGRect { get }

}
