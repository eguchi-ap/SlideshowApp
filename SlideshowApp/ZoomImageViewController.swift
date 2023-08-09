//
//  ZoomImageViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC39 on 2023/08/03.
//

import UIKit

class ZoomImageViewController: UIViewController {
    var image = UIImage(named: "image1.jpg")
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
