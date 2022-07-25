//
//  Extensions.swift
//  TestProject
//
//  Created by Appnap WS01 on 25/7/22.
//

import UIKit

extension UIImageView {
    func loadImageFrom(posterPath: String) {
        let urlString = IMAGE_BASE_URL + posterPath
        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
