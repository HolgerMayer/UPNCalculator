//
//  Stack.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

public enum StackRegister : Int {
    case X = 0
    case Y = 1
    case Z = 2
    case T = 3
}

public struct Stack<T> {
    fileprivate var initValue : T
    fileprivate var array = [T]()
    
    
    public init(_ value : T) {
        initValue = value
        clear()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
  
    public mutating func push(_ element: T) {
        array.insert(element, at: 0)
        array.removeLast()
    }
  
    public mutating func pop() -> T? {
         
        let value =  array.first
        array.removeFirst()
        array.append(array.last!)
        return value
    }
    
    public mutating func rollUp() {

        let temp = array[StackRegister.T.rawValue]
        array[StackRegister.T.rawValue] = array[StackRegister.Z.rawValue]
        array[StackRegister.Z.rawValue] = array[StackRegister.Y.rawValue]
        array[StackRegister.Y.rawValue] = array[StackRegister.X.rawValue]
        array[StackRegister.X.rawValue] = temp

    }
 
    public mutating func rollDown() {
           let temp = array[StackRegister.X.rawValue]
           array[StackRegister.X.rawValue] = array[StackRegister.Y.rawValue]
           array[StackRegister.Y.rawValue] = array[StackRegister.Z.rawValue]
           array[StackRegister.Z.rawValue] = array[StackRegister.T.rawValue]
           array[StackRegister.T.rawValue] = temp
    }
    
    public mutating func clear() {
        array.removeAll()
        array.insert(initValue, at: 0)
        array.insert(initValue, at: 0)
        array.insert(initValue, at: 0)
        array.insert(initValue, at: 0)
    }

    public var top: T? {
        return array.first
    }
    
    public func peek( register : StackRegister) -> T? {
        return array[register.rawValue]
    }
}
