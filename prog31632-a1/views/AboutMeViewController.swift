//
//  AboutMeViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-08.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "20200527-_DSC0969")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
