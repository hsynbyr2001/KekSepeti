//
//  FeatureTests.swift
//  KekSepetiTests
//
//  Created by Hüseyin  Bayır on 2.01.2025.
//

import XCTest
@testable import KekSepeti

class MyFeatureTests: XCTestCase {
    func cakeCountTest() {
        let cakeCount = KekSepeti.Cake.types.count
        XCTAssertEqual(cakeCount, 16, "Total cake count should be 16")
    }
}
