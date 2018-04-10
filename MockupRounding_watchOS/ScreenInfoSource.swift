//
// Created by Jan Kase on 09/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import WatchKit

public struct ScreenInfoSource {

  public static var `default`: ScreenInfoProvider = WKInterfaceDevice.current()

}
