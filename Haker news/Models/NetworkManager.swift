//
//  NetworkManager.swift
//  Haker news
//
//  Created by Дмитрий Скоробогаты on 23.08.2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let postData =  try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = postData.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                    
                } else {
                    print(error!)
                }
            }
            task.resume()
            
        }
    }
}
