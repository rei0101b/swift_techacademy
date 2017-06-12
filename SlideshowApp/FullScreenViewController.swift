//
//  FullScreenViewController.swift
//  SlideshowApp
//
//  Created by FNDM04 on 2017/06/09.
//  Copyright © 2017年 rei.yamaguchi. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    var IMG:[UIImage] = []
    var timeCountFromMain: Int = 0
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 写真の保存
        for i in 1...8 {
            let imgName: String = "img_" + String(i)
            print(imgName)
            IMG.append(UIImage(named: imgName)!)
        }
        imageView.image = IMG[timeCountFromMain]
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
