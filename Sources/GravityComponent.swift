//
//  GravityComponent.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 30/08/14.
//  Copyright (c) 2014 Luiz Fernando Silva. All rights reserved.
//

/// Represents a Gravity component that can be added to a body to make it
/// constantly affected by gravity
public final class GravityComponent: BodyComponent {
    
    /// The gravity vector to apply to the body
    public var gravity = Vector2(x: 0, y: -9.8)
    
    public var relaxable: Bool = false
    
    public init() {
        
    }
    
    public func accumulateInternalForces(in body: Body, relaxing: Bool) {
        
    }
    
    /// Accumulates the force of gravity by applying a unified force downwards.
    /// This force ignores mass by multiplying the gravity component by mass
    /// before applying the force, resulting in uniform velocity application in
    /// all bodies.
    public func accumulateExternalForces(on body: Body, world: World, relaxing: Bool) {
        if relaxing && !relaxable {
            return
        }
        
        for i in 0..<body.pointMasses.count {
            body.applyForce(gravity * body.pointMasses[i].mass, toPointMassAt: i)
        }
    }
    
    /// Changes the gravity of the bodies on a given world object
    public static func setGravity(on world: World, to vector: Vector2) {
        for b in world.bodies {
            b.withComponent(ofType: GravityComponent.self) { component in
                component.gravity = vector
            }
        }
    }
}

/// Component that can be added to bodies to add a gravity-like constant force
public struct GravityComponentCreator: BodyComponentCreator, Codable {
    
    public static var bodyComponentClass: BodyComponent.Type = GravityComponent.self
    
    public var vector: Vector2
    
    public init(gravity: Vector2 = Vector2(x: 0, y: -9.8)) {
        vector = gravity
    }
    
    public func prepareBodyAfterComponent(_ body: Body) {
        body.withComponent(ofType: GravityComponent.self) { component in
            component.gravity = vector
        }
    }
}
