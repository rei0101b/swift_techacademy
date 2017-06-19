//
//  ViewController.swift
//  instagram
//
//  Created by FNDM04 on 2017/06/19.
//  Copyright © 2017年 rei.yamaguchi. All rights reserved.
//

import UIKit
import ESTabBarController
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // currentUserがnilならログインしていない
        if FIRAuth.auth()?.currentUser == nil {
            // ログインしていなければ、ログイン画面を表示する
            // viewDidAppear内でpresent()を呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTab() {
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarContoller: ESTabBarController! = ESTabBarController(tabIconNames: ["home", "camera", "setting"])
        // 背景色、選択時の色を設定
        tabBarContoller.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarContoller.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        // 作成したESTabBarControllerを親のViewContollerに追加
        addChildViewController(tabBarContoller)
        view.addSubview(tabBarContoller.view)
        tabBarContoller.view.frame = view.bounds
        tabBarContoller.didMove(toParentViewController: self)
        // タブをタップしたときに表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "Setting")
        
        tabBarContoller.setView(homeViewController, at: 0)
        tabBarContoller.setView(settingViewController, at: 2)
        
        // 真ん中のタブはボタンとして扱う
        tabBarContoller.highlightButton(at: 1)
        tabBarContoller.setAction({
            // ボタンが押されたらImageViewControllerをモーダルで表示する
            let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageSelect")
            self.present(imageViewController!, animated: true, completion: nil)
        }, at: 1)
        
    }
    


}

