//
//  ViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-05.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "20200527-_DSC0969")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(imageView, at: 0)
    }
    
    
}

