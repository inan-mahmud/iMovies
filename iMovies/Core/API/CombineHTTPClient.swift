////
////  CombineHTTPClient.swift
////  iMovies
////
////  Created by cefalo on 12/1/24.
////
//
//import Foundation
//import Combine
//
//public extension HTTPClient {
//    typealias Publisher = AnyPublisher<(Data,HTTPURLResponse), Error>
//    
//    func getPublisher(url: URL) -> Publisher {
//        var task: HTTPClientTask?
//        
//        return Deferred {
//            Future { completion in
//                task = self.makeRequest(url: url, completion: completion)
//            }
//        }.handleEvents(receiveCancel: {task?.cancel() })
//            .eraseToAnyPublisher()
//    }
//}
//
//extension Publisher {
//    func fallback(to fallbackPublisher: @escaping () -> AnyPublisher<Output, Failure>) -> AnyPublisher<Output, Failure> {
//            self.catch { _ in fallbackPublisher() }.eraseToAnyPublisher()
//        }
//}
