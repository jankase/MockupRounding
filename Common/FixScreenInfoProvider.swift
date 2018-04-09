//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation

struct FixScreenInfoProvider: ScreenInfoProvider {

  private(set) var size: CGSize = .zero
  private(set) var frame: CGRect = .zero
  private(set) var scale: CGFloat = 1

}
