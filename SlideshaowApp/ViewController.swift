//
//  ViewController.swift
//  SlideshaowApp
//
//  Created by 上田涼太 on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var flag:Int! = nil
    
    var imageArray:[UIImage] = [
        UIImage(named: "1.jpg")!,
        UIImage(named: "2.jpg")!,
        UIImage(named: "3.jpg")!,
        UIImage(named: "4.jpg")!,
        UIImage(named: "5.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageArray[nowIndex]
    }

    @IBAction func nextButton(_ sender: Any) {
        if (flag == nil) {
            nowIndex += 1
            
            if (nowIndex == imageArray.count) {
                nowIndex = 0
            }
            imageView.image = imageArray[nowIndex]
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if (flag == nil) {
            nowIndex -= 1
            
            if (nowIndex < 0) {
                nowIndex = 4
            }
            imageView.image = imageArray[nowIndex]
        }
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startButton.setTitle("停止", for: .normal)
            flag = 0
        } else {
            timer.invalidate()
            
            timer = nil
            
            flag = nil
            
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeImage() {
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func tapAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerを取得する
            let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
            // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        zoomViewController.nowIndex = nowIndex
        
        if(timer != nil) {
        timer.invalidate()
        
        timer = nil
        
        flag = nil
        
        startButton.setTitle("再生", for: .normal)
        }
    }
    
}
