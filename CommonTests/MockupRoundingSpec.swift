//
// Created by Jan Kase on 10/04/2018.
// Copyright (c) 2018 Jan Kaše. All rights reserved.
//

import Foundation
import Quick
import Nimble
import UIRounding
@testable import MockupRounding

class MockUpRoundingSpec: QuickSpec {

  override func spec() {
    super.spec()
    describe("Mock up value rounding with screen scale 3") {
      let theScreenSize = CGSize(width: 320, height: 568)
      let theScreenInfo = FixScreenInfoProvider(size: theScreenSize,
                                                frame: CGRect(origin: CGPoint.zero, size: theScreenSize),
                                                scale: 3)
      let theMockUpRounding = MockUpRounding(direction: .horizontal, mockUpValue: 1080, screenInfoSource: theScreenInfo)
      it("used ratio") {
        expect(theMockUpRounding.roundingRatio).to(beCloseTo(0.2963))
      }
      self._pointSpecs.forEach { self._test(spec: $0, rounding: theMockUpRounding) }
    }
  }

  private var _pointSpecs: [RoundingSpec<CGFloat>] = [
    RoundingSpec(inputValue: 60, roundResult: 17.6666, ceilResult: 18, floorResult: 17.6666, convertResult: 17.7777)
  ]

  private func _test(spec aSpec: RoundingSpec<CGFloat>, rounding aMockUpRounding: MockUpRounding) {
    it("round \(aSpec.inputValue)") {
      expect(aMockUpRounding.round(value: aSpec.inputValue)).to(beCloseTo(aSpec.roundResult))
    }
    it("ceil \(aSpec.inputValue)") {
      expect(aMockUpRounding.ceil(value: aSpec.inputValue)).to(beCloseTo(aSpec.ceilResult))
    }
    it("floor \(aSpec.inputValue)") {
      expect(aMockUpRounding.floor(value: aSpec.inputValue)).to(beCloseTo(aSpec.floorResult))
    }
    it ("convert \(aSpec.inputValue)") {
      expect(aMockUpRounding.convert(value: aSpec.inputValue)).to(beCloseTo(aSpec.convertResult))
    }
  }

}
