//
//  Future.swift
//  PersonalTrainer
//
//  Created by Mandea Daniel on 16/03/2019.
//  Copyright © 2019 MTD Technology. All rights reserved.
//

import Foundation

public class Future<Value> {
    
    public var result: Result<Value, Error>? {
        didSet { result.map(report) }
    }
    
    private lazy var callbacks = [(Result<Value, Error>) -> Void]()
    
    public func observe(with callback: @escaping (Result<Value, Error>) -> Void) {
        callbacks.append(callback)
        result.map(callback)
    }
    
    private func report(result: Result<Value, Error>) {
        for callback in callbacks {
            callback(result)
        }
    }
}

// MARK: - Chain

extension Future {
    public func chained<NextValue>(with closure: @escaping (Value) throws -> Future<NextValue>) -> Future<NextValue> {
        let promise = Promise<NextValue>()
        
        observe { result in
            switch result {
            case .success(let value):
                do {
                    let future = try closure(value)
                    future.observe { result in
                        switch result {
                        case .success(let value):
                            promise.resolve(with: value)
                        case .failure(let error):
                            promise.reject(with: error)
                        }
                    }
                } catch {
                    promise.reject(with: error)
                }
            case .failure(let error):
                promise.reject(with: error)
            }
        }
        
        return promise
    }
    
    public func transformed<NextValue>(with closure: @escaping (Value) throws -> NextValue) -> Future<NextValue> {
        return chained { value in
            return try Promise(value: closure(value))
        }
    }
}
