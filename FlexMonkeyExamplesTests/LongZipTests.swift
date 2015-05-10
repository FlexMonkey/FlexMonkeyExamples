//
//  FlexMonkeyExamplesTests.swift
//  FlexMonkeyExamplesTests
//
//  Created by Simon Gladman on 10/05/2015.
//  Copyright (c) 2015 Simon Gladman. All rights reserved.
//

import Foundation
import XCTest

class FlexMonkeyExamplesTests: XCTestCase
{
    let arrayOne = [1, 2, 55, 90]
    let arrayTwo = ["AAA", "BBB"]
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testLongZip_v1()
    {
        let resultOne = longZip_v1(arrayOne, arrayTwo)

        commonAssertions(resultOne)
    }
    
    func testLongZip_v2()
    {
        let resultOne = longZip_v2(arrayOne, arrayTwo)
        
        commonAssertions(resultOne)
    }
    
    func testLongZip_v3()
    {
        let resultOne = longZip_v3(arrayOne, arrayTwo)
        
        commonAssertions(resultOne)
    }
    
    func testExtendWithNil()
    {
        let resultOne = extendWithNil(arrayTwo, 3)
        
        XCTAssert(resultOne.count == 3, "Count")
        XCTAssertNil(resultOne[2], "Nil Added")
    }

    // -------
    
    func commonAssertions(results: [(Int?, String?)])
    {
        XCTAssert(results.count == 4, "Count")
        
        for (idx: Int, result:(Int?, String?))  in enumerate(results)
        {
            if idx < arrayOne.count
            {
                XCTAssertEqual(result.0!, arrayOne[idx], "Array One Value")
            }
            else
            {
                XCTAssertNil(result.0, "Array One nil")
            }
            
            if idx < arrayTwo.count
            {
                XCTAssertEqual(result.1!, arrayTwo[idx], "Array Two Value")
            }
            else
            {
                XCTAssertNil(result.1, "Array Two nil")
            }
        }
   
    }
    
}
