//
//  ViewController.swift
//  TestProject
//
//  Created by Appnap WS01 on 24/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    let searchController = UISearchController(searchResultsController: nil)
    var movieListCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        viewModel.delegate = self
        viewModel.updateMovieData()
        
        setupViews()
    }
    
    // Helper functions
    private func setupViews() {
        if let flowLayout = movieListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 5
        }
        movieListCollectionView.register(movieListCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCell")
        
        // Collection view
        movieListCollectionView.backgroundColor = .clear
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
        movieListCollectionView.showsHorizontalScrollIndicator = false
        movieListCollectionView.isScrollEnabled = true
        movieListCollectionView.alwaysBounceVertical = true
        movieListCollectionView.frame = CGRect(x: 10, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(movieListCollectionView)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            viewModel.updateMovieData(withQuery: text)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! movieListCollectionViewCell
        cell.imageView.image = nil
        cell.layoutIfNeeded()
        cell.imageView.loadImageFrom(posterPath: viewModel.movieList[indexPath.row].posterPath ?? "")
        cell.titleLbael.text = viewModel.movieList[indexPath.row].title
        cell.subTitleLbael.text = viewModel.movieList[indexPath.row].overview
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let overView: String = viewModel.movieList[indexPath.row].overview ?? ""
        let height: CGFloat = viewModel.getHeightOfLabel(txt: overView, width: collectionView.frame.width - 100)
        return CGSize(width: collectionView.frame.width, height: max(height + 55, 110))
    }
}

extension ViewController: ViewModelDelegate {
    func updateMovieListView() {
        DispatchQueue.main.async {
            self.movieListCollectionView.reloadData()
        }
    }
}
