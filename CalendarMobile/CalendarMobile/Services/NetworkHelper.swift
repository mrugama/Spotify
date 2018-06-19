//
//  NetworkHelper.swift
//  CalendarMobile
//
//  Created by C4Q on 6/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badData
    case badURL
    case codingError(rawError: Error)
    case badStatusCode(num: Int)
    case other(rawError: Error)
}

struct NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    private let session = URLSession(configuration: .default)
    func performDataTask(with request: URLRequest,
                         completionHandler: @escaping (Data) -> Void,
                         errorHandler: @escaping (Error) -> Void) {
        session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.badData); return}
                if let error = error {
                    errorHandler(AppError.other(rawError: error))
                }
                completionHandler(data)
            }
            }.resume()
    }
}
