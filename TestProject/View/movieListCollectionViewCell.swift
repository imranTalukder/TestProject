//
//  MovieListViewCell.swift
//  TestProject
//
//  Created by Appnap WS01 on 24/7/22.
//

import UIKit

class movieListCollectionViewCell: UICollectionViewCell {
    
    // Properties
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        return iv
    }()
    
    let titleLbael: UILabel = UILabel()
    let subTitleLbael: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewSetup() {
        
        // Line view
        let lineView: UIView = UIView()
        addSubview(lineView)
        lineView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        //Image view
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        // Title
        self.addSubview(titleLbael)
        titleLbael.translatesAutoresizingMaskIntoConstraints = false
        titleLbael.font = UIFont.boldSystemFont(ofSize: 16)
        titleLbael.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        commonLabelSetup(lbl: titleLbael)
        
        // Subtitle
        addSubview(subTitleLbael)
        subTitleLbael.font = UIFont.systemFont(ofSize: 14)
        subTitleLbael.translatesAutoresizingMaskIntoConstraints = false
        subTitleLbael.topAnchor.constraint(equalTo: titleLbael.bottomAnchor,constant: 15).isActive = true
        commonLabelSetup(lbl: subTitleLbael)
    }
    
    //MARK: -  Helper functions
    private func commonLabelSetup(lbl: UILabel) {
        lbl.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 18).isActive = true
        lbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
    }

}
