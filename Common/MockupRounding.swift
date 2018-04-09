//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import CoreGraphics
import UIRounding

public struct MockUpRounding {

  public static var shared: MockUpRounding = MockUpRounding()

  public var roundingRatio: CGFloat {
    return roundingHelper.multiplier
  }
  private (set) public var roundingHelper: RoundingHelper<CGFloat>

  public init(direction aDirection: MockUpRoundingDirection = .horizontal,
              mockUpValue aValue: CGFloat? = nil,
              screenInfoSource aScreenInfo: ScreenInfoProvider = ScreenInfoSource.default) {
    roundingHelper = RoundingHelper(scale: aScreenInfo.scale)
    guard let theValue = aValue else {
      roundingHelper.multiplier = 1
      return
    }
    switch aDirection {
    case .horizontal:
      roundingHelper.multiplier = theValue / aScreenInfo.size.width
    case .vertical:
      roundingHelper.multiplier = theValue / aScreenInfo.size.height
    }
  }

  public func round(value aValue: CGFloat) -> CGFloat {
    return roundingHelper.round(value: aValue)
  }

  public func ceil(value aValue: CGFloat) -> CGFloat {
    return roundingHelper.ceil(value: aValue)
  }

  public func floor(value aValue: CGFloat) -> CGFloat {
    return roundingHelper.floor(value: aValue)
  }

}
