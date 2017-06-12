//
//  ViewController.swift
//  SlideshowApp
//
//  Created by FNDM04 on 2017/06/09.
//  Copyright © 2017年 rei.yamaguchi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var image: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var goNext: UIButton!
    @IBOutlet weak var goBack: UIButton!
    
    var timer = Timer()
    var playStopFlag = true
    var IMG:[UIImage] = []
    var timeCount = 0
    var audioPlayer: AVAudioPlayer!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 写真の保存
        for i in 1...8 {
            let imgName: String = "img_" + String(i)
            print(imgName)
            IMG.append(UIImage(named: imgName)!)
        }
        // 開くと同時にタイマー起動
        lanchTimer()
        // 音楽を流す
        prepareMusic()
        audioPlayer.play()
        // 戻る・進むボタンを無効化
        goNext.isEnabled = false
        goBack.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fullScreenViewController: FullScreenViewController = segue.destination as! FullScreenViewController
        fullScreenViewController.timeCountFromMain = timeCount
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // timerを止める
        playStopFlag = true
        changePlayStop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){}

    @IBAction func play(_ sender: Any) {
        changePlayStop()
    }
    
    @IBAction func next(_ sender: Any) {
        // timerを止める
        playStopFlag = true
        changePlayStop()
        if timeCount <= 6 {
            timeCount += 1
            image.setImage(IMG[timeCount], for: UIControlState())
            return
        }
        timeCount = 0
        image.setImage(IMG[timeCount], for: UIControlState())
    }
    @IBAction func back(_ sender: Any) {
        // timerを止める
        playStopFlag = true
        changePlayStop()
        if 0 < timeCount && timeCount <= 7 {
            timeCount -= 1
            image.setImage(IMG[timeCount], for: UIControlState())
            return
        }
        timeCount = 7
        image.setImage(IMG[timeCount], for: UIControlState())
    }
    
    func slideImage() {
        if timeCount <= 6 {
            timeCount += 1
            image.setImage(IMG[timeCount], for: UIControlState())
            return
        }
        timeCount = 0
    }
    
    // 「再生」を押すと「停止」ボタン表示を切り赤絵
    func changePlayStop() {
        if playStopFlag == false {
            // 戻る・進むボタンを無効化
            goNext.isEnabled = false
            goBack.isEnabled = false
            // 表示の切り替え
            playStopButton.setTitle("停止", for: .normal)
            restartSlideShow()
            playStopFlag = true
            return
        }
        // 戻る・進むボタンを有効化
        goNext.isEnabled = true
        goBack.isEnabled = true
        // 表示の切り替え
        playStopButton.setTitle("再生", for: .normal)
        stopSlideShow()
        playStopFlag = false
    }
    
    func restartSlideShow() {
        lanchTimer()
    }
    
    func stopSlideShow() {
        timer.invalidate()
    }
    
    func lanchTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideImage), userInfo: nil, repeats: true)
    }
    
    func prepareMusic() {
        // 再生する audio ファイルのパスを取得
        let audioPath = Bundle.main.path(forResource: "ONE-OK-ROCK", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        // auido を再生するプレイヤーを作成する
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
    }
    

}

