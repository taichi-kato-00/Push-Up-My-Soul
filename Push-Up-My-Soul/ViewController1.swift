//
//  ViewController1.swift
//  Push-Up-My-Soul
//
//  Created by 加藤太一 on 2020/09/25.
//  Copyright © 2020 taichi. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController1: UIViewController {
    
    //    音
    var resultAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    //        音の処理
    
    func setupSound() {
        if let sound = Bundle.main.path(forResource: "Gunshot01-1", ofType: ".mp3") {
            resultAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            resultAudioPlayer.prepareToPlay()
        }
    }
    
    //    カウントの配列
    var count :Int = 0
    //    日付の配列
    
    
    @IBOutlet weak var countLabel: UILabel!
    //カウントの配列を作成しておく。
    var arrayBox = [String]()
    //    dateを配列へ格納
    var appendDate:[String] = []
    
    @IBAction func countButton(_ sender: Any) {
       
        self.resultAudioPlayer.play()
        
        //        1ずつ増える
        count = count + 1
        countLabel.text = String(count)
    
    }
    
    /// 日付のインスタンス
    let dateFormatter = DateFormatter()
    
    //    saveボタンの処理
    @IBAction func saveButton(_ sender: Any) {
        
        //countLabelの数字をarrayBoxに入れる。
        arrayBox.append(String(count))
        /// カレンダー、ロケール、タイムゾーンの設定（未指定時は端末の設定が採用される）
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        /// 変換フォーマット定義（未設定の場合は自動フォーマットが採用される）
        dateFormatter.dateFormat = "yyyy年M月d日(EEEEE) H時m分"
        /// データ変換（Date→テキスト）
        let dateString = dateFormatter.string(from: Date())
        
        appendDate.append(dateString)
        //              print(appendDate)
        // ユーザーデフォルトに保存する
        UserDefaults.standard.set(appendDate, forKey: "date")
        
        //arrayというキー名でarrayBoxをアプリに保存する。
        UserDefaults.standard.set(arrayBox, forKey: "array")
        }
    //    リセットボタンの処理
    @IBAction func resetButton(_ sender: Any) {
        
        count = 0
        self.countLabel.text = "0"
        
    }
  
    override func viewDidLoad() {
         super.viewDidLoad()
         //次の1行を追加 -> 結果表示のときに音を再生(Play)する！
         setupSound()
     }
    
    
    
    
}














