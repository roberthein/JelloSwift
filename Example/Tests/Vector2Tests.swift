//
//  Vector2Tests.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 17/02/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import JelloSwift

class Vector2Tests: XCTestCase {
    
    func testMatrixTranslate() {
        // Tests a Vector2.matrix() to translate a Vector2
        
        let vector = Vector2(x: 10, y: 10)
        let expected = Vector2(x: -10, y: 20)
        
        let matrix = Vector2.matrix(translatingBy: Vector2(x: -20, y: 10))
        
        let transformed = vector * matrix
        
        XCTAssertEqual(expected, transformed)
    }
    
    func testMatrixScale() {
        // Tests a Vector2.matrix() to scale a Vector2
        
        let vector = Vector2(x: 10, y: -20)
        let expected = Vector2(x: 5, y: -40)
        
        let matrix = Vector2.matrix(scalingBy: Vector2(x: 0.5, y: 2))
        
        let transformed = vector * matrix
        
        XCTAssertEqual(expected, transformed)
    }
    
    func testMatrixRotate() {
        // Tests a Vector2.matrix() to rotate a Vector2
        
        let vector = Vector2(x: 10, y: 10)
        let expected = Vector2(x: -10, y: 10)
        
        let matrix = Vector2.matrix(rotatingBy: CGFloat.pi / 2)
        
        let transformed = vector * matrix
        
        XCTAssertEqual(expected, transformed)
    }
    
    func testCompoundMatrix() {
        // Tests a Vector2.matrix() to apply translation, scaling and rotation
        // of a Vector2
        // Order of operations should be: scaling -> rotating -> translating
        
        let vector = Vector2(x: 10, y: 10)
        let expected = Vector2(x: 5, y: 15)
        
        let matrix = Vector2.matrix(scalingBy: Vector2(x: 0.5, y: 0.5),
                                    rotatingBy: CGFloat.pi / 2,
                                    translatingBy: Vector2(x: 10, y: 10))
        
        let transformed = vector * matrix
        
        XCTAssertEqual(expected, transformed)
    }
}