//
//  Promiss.swift
//  PersonalTrainer
//
//  Created by Mandea Daniel on 17/03/2019.
//  Copyright © 2019 MTD Technology. All rights reserved.
//

import Foundation

public class Promise<Value>: Future<Value> {
    
    public init(value: Value? = nil) {
        super.init()
    }
    
    public func resolve(with value: Value) {
        result = .success(value)
    }
    
    public func reject(with error: Error) {
        result = .failure(error)
    }
}
