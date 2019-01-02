// CoinList.swift

//  Created by Jennifer DeCota on 12/28/18.

//import Foundation
//
//// Mark: 1 Modeling the Coins Response:  In the API response we saw last time, all of the coins are returned in a dictionary underneath the data key. We'll start by modeling that.
//// Mark: 2  provide a custom nested struct to represent this data, decoding with a dynamic CodingKey implementation (since our keys are dynamic)
//// Mark: 3  Create references of new type Coin to be somewhat isolated from the rest of the application, so will be a NESTED type inside of CoinList
//// Mark: 4 Write Coin parsing TEST in testing
//
//struct CoinList : Decodable {
//
//    var response: String
//    var message: String
//    var baseImageURL : URL?
//    var baseLinkURL : URL?
//    var data : Data
//
//    //Modeling the Coins Response
//    enum CodingKeys : String, CodingKey {
//
//        case response = "Response"
//        case message = "Message"
//        case baseImageURL = "BaseImageURL"
//        case baseLinkURL = "BaseLinkURL"
//        case data = "Data"
//    }
//
//    // Mark: NESTED "Data" struct to represent this data, decoding with a dynamic CodingKey implementation (since our keys are dynamic)
//
//    struct Data : Decodable {
//        private struct Keys : CodingKey {
//            var stringValue: String
//
//            init?(stringValue: String) {
//                self.stringValue = stringValue
//            }
//            var intValue: Int?
//            init?(intValue: Int) {
//                self.stringValue = String(intValue)
//                self.intValue = intValue
//            }
//        }
//        // Mark:  Decoder Implementation
//        private var coins: [String : Coin] = [:]
//
//        // Mark: Get Container from the decoder
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: Keys.self)  // CodingKey.Protocol = Keys.self
//            // Loop over each key
//            for key in container.allKeys {
//                // coins is the coin KEY of API;  then decode the coin itself here
//                coins[key.stringValue] = try container.decode(Coin.self, forKey: key)
//            }
//        }
//
//        // Mark:  Get list of all coins
//        //  return the value of coins and Convert to array
//        func allCoins() -> [Coin] {
//            return Array(coins.values)
//        }
//
//        // Mark:  may want subscript here that will take a key which is a string optionally
//        //      - then can reach into coins array for that key
//        subscript(_ key: String) -> Coin? {
//            return coins[key]
//        }
//
//        // References a new type Coin; want it to be somewhat isolated from the rest of the application, so this will be a nested type INSIDE of CoinList:
//        // Mark: NESTED coin struct under CoinList b/c want our OWN Coin var for our app
//        //  So this is CoinList Coin which will be the type for parsing
//        struct Coin : Decodable {
//            let name : String
//            let symbol : String
//            let imagePath : String = ""
//
//            enum CodingKeys : String, CodingKey {
//                case name = "CoinName"
//                case symbol = "Symbol"
//                case imagePath = "ImageURL"
//            }
//        }
//    }
//}
