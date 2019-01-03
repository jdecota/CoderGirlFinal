//// FifthViewController.swift           //  CryptoCompareClient.swift//  CoderGirlFinal
////
////  Created by Jennifer DeCota on 1/2/19.
////  Copyright © 2019 iOS Class. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//    // Some recommend having an ApiResult, Generic Type "T" - of any type- that is Decodable
//    //Indicating Success and Failure with Custom Errors
//    //For our completion handlers, we'll leverage a couple of enums:
//    
//enum ApiResult<T : Decodable> {
//    case success(T)
//    case failure(ApiError)
//}
//
//enum ApiError : Error {
//    case notFound    // 404
//    case serverError // 5xx
//    case requestError // 4xx
//    case responseFormatInvalid(String)
//    case connectionError(Error)
//}
//    
//    // Mark:  Model Completion Block : Now we can model our completion blocks like this:
//    
//typealias ApiCompletionBlock<T : Decodable> = (ApiResult<T>) -> Void
//
//class FifthViewController: UIViewController {
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            // Do any additional setup after loading the view.
//        }
//        
//        let session: URLSession
//        
//        //Mark: Takes in a session which is a URL session
//        init(session: URLSession) {
//            // create our session
//            self.session = session
//        }
//    
//        // Mark: func for fetching of coin list;  needs to
//        // takes no arguments, but DOES need completion
//        // completion is going to be an escaping closure that is given some sort of results
//        // in case of failure of result,
//        // in case of success, want some type that is serializable
//        
//    func fetchCoinList(completion: @escaping ApiCompletionBlock<CoinList>) {
//        let url = URL(string: "https://min-api.cryptocompare.com/data/all/coinlist")!
//        let req = URLRequest(url: url)
//        let task = session.dataTask(with: req) { (data, response, error) in
//            if let e = error {
//                DispatchQueue.main.async {
//                    completion(.failure(.connectionError(e)))
//                }
//            } else {
//                let http = response as! HTTPURLResponse
//                switch http.statusCode {
//                case 200:
//                    let jsonDecoder = JSONDecoder()
//                    do {
//                        let coinList = try jsonDecoder.decode(CoinList.self, from: data!)
//                        DispatchQueue.main.async {
//                            completion(.success(coinList))
//                        }
//                    } catch let e {
//                        print(e)
//                        let bodyString = String(data: data!, encoding: .utf8)
//                        completion(.failure(.responseFormatInvalid(bodyString ?? "<no body>")))
//                    }
//                    
//                default:
//                    completion(.failure(.serverError))
//                }
//            }
//        }
//        task.resume()
//    }
//}

