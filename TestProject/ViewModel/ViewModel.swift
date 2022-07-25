//
//  ViewModel.swift
//  TestProject
//
//  Created by Appnap WS01 on 25/7/22.
//

import Foundation
import UIKit

protocol ViewModelDelegate {
    func updateMovieListView()
}

class ViewModel {
    
    var delegate: ViewModelDelegate?
    var movieList = [MovieData]() {
        didSet {
            delegate?.updateMovieListView()
        }
    }
    
    func updateMovieData(withQuery: String = "marvel") {
        let urlString = BASE_URL + API_KEY + "&query=" + withQuery
        guard let url = URL(string: urlString) else {return}
        APIServices.fetchMovieList(withUrl: url) { fetchedData in
            guard let fetchedData = fetchedData else {return}
            self.movieList = fetchedData
        }
    }
    
    func getImageFrom(posterPath: String, toImageView: UIImageView) {
        let urlString = IMAGE_BASE_URL + API_KEY + posterPath
        guard let url = URL(string: urlString) else {return}
        if let imageData = try? Data(contentsOf: url) {
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                toImageView.image = image
            }
        }
    }
    
    func getHeightOfLabel(txt: String, width: CGFloat) -> CGFloat {
        let tmpLabel: UILabel = UILabel()
        tmpLabel.font = UIFont.systemFont(ofSize: 14)
        tmpLabel.text = txt
        tmpLabel.numberOfLines = 0
        tmpLabel.textAlignment = .left
        tmpLabel.preferredMaxLayoutWidth = width
        tmpLabel.sizeToFit()
        print("\(tmpLabel.intrinsicContentSize.height)")
        return tmpLabel.intrinsicContentSize.height + 10
    }
}
