//
//  PathComponentRepresentable.swift
//  
//
//  Created by Brian Strobach on 1/18/22.
//

import RoutingKit

public protocol PathComponentRepresentable {
    var pathComponents: [PathComponent] { get }
}

extension PathComponent: PathComponentRepresentable {
    public var pathComponents: [PathComponent] {
        return [self]
    }
}

extension String: PathComponentRepresentable {
    public var pathComponents: [PathComponent] {

        if first == ":" {
            return [.parameter(String(dropFirst()))]
        }
        return [.constant(self)]
    }
}

public extension Collection where Element == PathComponentRepresentable {
    var pathComponents: [PathComponent] {
        return map { $0.pathComponents }.reduce([], +)
    }
}
