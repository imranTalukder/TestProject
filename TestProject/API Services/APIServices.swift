//
//  APIServices.swift
//  TestProject
//
//  Created by Appnap WS01 on 25/7/22.
//

import Foundation

class APIServices {
    final class func fetchMovieList(withUrl: URL, completion: @escaping(_ fetchedData: [MovieData]?) -> Void) {
        let session = URLRequest(url: withUrl)
        let task = URLSession.shared.dataTask(with: session) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data  {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(MovieDataList.self, from: safeData)
                    completion(decodedData.results)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
