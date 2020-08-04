//
//  File.swift
//  
//
//  Created by Oskar Groth on 2020-08-04.
//

import Foundation
import simd

public extension CGRect {
  var center: CGPoint { .init(x: midX, y: midY) }
}

public protocol CGFloat2 {
  var x: CGFloat { get }
  var y: CGFloat { get }
}

extension CGPoint: CGFloat2 { }

extension CGSize: CGFloat2 {
  public var x: CGFloat { width }
  public var y: CGFloat { height }
}

public extension SIMD2 where Scalar == CGFloat.NativeType {
    init<Float2: CGFloat2>(_ float2: Float2) {
        self.init(x: float2.x, y: float2.y)
    }
    
    init(x: CGFloat, y: CGFloat) {
        self.init(x: x.native, y: y.native)
    }
    
    /// Distance to the closest point on the rectangle's boundary.
    /// - Note: Negative if inside the rectangle.
    func getSignedDistance(to rect: CGRect) -> Scalar {
        let distances =
            abs( self - Self(rect.center) )
            - Self(rect.size) / 2
        return
            all(sign(distances) .> 0)
            ? length(distances)
            : distances.max()
    }
}

public extension Sequence {
    func min<Comparable: Swift.Comparable>(
        by getComparable: (Element) throws -> Comparable
    ) rethrows -> Element? {
        try self.min {
            try getComparable($0) < getComparable($1)
        }
    }
}
