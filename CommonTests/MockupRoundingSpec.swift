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
    describe("Mock up value horizontal rounding with screen scale 3") {
      let theMockUpRoundingHorizontal = self._rounding(direction: .horizontal, value: 1080)
      it("used ratio horizontal") {
        expect(theMockUpRoundingHorizontal.roundingRatio).to(beCloseTo(0.2963))
      }
      self._roundHorizontalSpecs.forEach { self._test(spec: $0, rounding: theMockUpRoundingHorizontal) }
      let theMockUpRoundingVertical = self._rounding(direction: .vertical, value: 1080)
      it("used ratio vertical") {
        expect(theMockUpRoundingVertical.roundingRatio).to(beCloseTo(0.5259))
      }
      self._roundVerticalSpecs.forEach { self._test(spec: $0, rounding: theMockUpRoundingVertical) }
      let theMockUpRoundingNoConvert = self._rounding(direction: .vertical, value: nil)
      it("not specified value conversion") {
        expect(theMockUpRoundingNoConvert.roundingRatio).to(beCloseTo(1.0))
      }
      self._noRoundSpecs.forEach { self._test(spec: $0, rounding: theMockUpRoundingNoConvert) }
    }
  }

  private var _roundHorizontalSpecs: [RoundingSpec<CGFloat>] = [
    RoundingSpec(inputValue: 60, roundResult: 17.6666, ceilResult: 18, floorResult: 17.6666, convertResult: 17.7777)
  ]

  private var _roundVerticalSpecs: [RoundingSpec<CGFloat>] = [
    RoundingSpec(inputValue: 60,
                 roundResult: 31.6666,
                 ceilResult: 31.6666,
                 floorResult: 31.3333,
                 convertResult: 31.5555)
  ]

  private var _noRoundSpecs: [RoundingSpec<CGFloat>] = [
    RoundingSpec(inputValue: 10.5, roundResult: 10.6666, ceilResult: 10.6666, floorResult: 10.3333, convertResult: 10.5)
  ]

  private func _rounding(direction aDirection: MockUpRoundingDirection, value aValue: CGFloat?) -> MockUpRounding {
    let theScreenSize = CGSize(width: 320, height: 568)
    let theScreenInfo = FixScreenInfoProvider(size: theScreenSize,
                                              frame: CGRect(origin: CGPoint.zero, size: theScreenSize),
                                              scale: 3)
    return MockUpRounding(direction: aDirection, mockUpValue: aValue, screenInfoSource: theScreenInfo)
  }

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
