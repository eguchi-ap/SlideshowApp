//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC39 on 2023/08/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageIndex: Int = 0;
    
    let image = [
        UIImage(named: "image1.jpg"),
        UIImage(named: "image2.jpg"),
        UIImage(named: "image3.jpg")
    ]
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image[imageIndex]
    }
    
    @IBAction func tapPlay(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImage(_:)), userInfo: nil, repeats: true)

            self.nextButton.isEnabled = false
            self.previousButton.isEnabled = false
            self.playButton.setTitle("停止", for: .normal)

        } else {
            self.timer.invalidate()
            self.timer = nil
            
            self.nextButton.isEnabled = true
            self.previousButton.isEnabled = true
            self.playButton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func tapNext(_ sender: Any) {
        if image[imageIndex] == image.last! {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = image[imageIndex]
    }
    
    @IBAction func tapPrevious(_ sender: Any) {
        if image[imageIndex] == image.first! {
            imageIndex = image.indices.last!
        } else {
            imageIndex -= 1
        }
        imageView.image = image[imageIndex]
    }
    
    @objc func slideImage(_ timer: Timer) {
        if image[imageIndex] == image.last! {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = image[imageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            timer.invalidate()
            timer = nil
            self.nextButton.isEnabled = true
            self.previousButton.isEnabled = true
            self.playButton.setTitle("再生", for: .normal)
        }
        
        let zoomVC: ZoomImageViewController = segue.destination as! ZoomImageViewController
        zoomVC.image = self.image[imageIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}
