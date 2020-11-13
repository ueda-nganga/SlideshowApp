//
//  ZoomViewController.swift
//  SlideshaowApp
//
//  Created by 上田涼太 on 2020/11/11.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomimage: UIImageView!
    
    var nowIndex:Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "1.jpg")!,
        UIImage(named: "2.jpg")!,
        UIImage(named: "3.jpg")!,
        UIImage(named: "4.jpg")!,
        UIImage(named: "5.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        zoomimage.image = imageArray[nowIndex]
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
