//
//  CoinSwiftNetworkHelper.swift
//  CoinSwift
//
//  Created by Ashfak Ahamed Alauddeen on 02/06/24.
//

import Foundation

protocol CoinSwiftNetworkHelperDelegate{
    func getCoinMapModel(from coinMapModel: CoinMapModel)
}

struct CoinSwiftNetworkHelper{
    let baseURL = "https://pro-api.coinmarketcap.com"
    var delegate: CoinSwiftNetworkHelperDelegate?
}

extension CoinSwiftNetworkHelper{
    
    func getCoinMapAPI(){
        var path = "/v1/cryptocurrency/map?listing_status=active"
        var url = "\(baseURL)\(path)"
        performRequest(url: url)
    }
    
    func performRequest(url urlString: String){
        
        if let apiURL = URL(string: urlString){
            
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            let apiKey = "{api-key}"
            request.setValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                
                if let error = error{
                    print("There occured an error \(String(describing: error.localizedDescription))")
                    return
                }
                
                if let data = data{
                    print("Data has been returned ...")
                    if let coins = self.parseCoinModel(from: data){
                        delegate?.getCoinMapModel(from: coins)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseCoinModel(from coinData: Data) -> CoinMapModel?{
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(CoinMapModel.self, from: coinData)
            return decodedData
            
        }catch{
            print("Error: \(error)")
            return nil
        }
    }
    
    
}
