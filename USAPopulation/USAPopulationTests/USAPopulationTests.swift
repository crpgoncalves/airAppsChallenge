//
//  USAPopulationTests.swift
//  USAPopulationTests
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import XCTest
@testable import USAPopulation

final class USAPopulationTests: XCTestCase {
    
    func testShouldReturnSuccessByState() async {
        let data = try? await WebService.shared.getPopulationByState()
        
        guard let data = data else {
            XCTAssert(false)
            return
        }
        XCTAssertTrue(data.count > 0)
    }
    
    
    func testShouldReturnSuccessByNation() async {
        let data = try? await WebService.shared.getPopulationByNation()
        
        guard let data = data else {
            XCTAssert(false)
            return
        }
        XCTAssertTrue(data.count > 0)
    }
    
}


