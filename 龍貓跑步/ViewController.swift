//
//  ViewController.swift
//  龍貓跑步
//
//  Created by 溫皓 on 2023/5/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dragonCatImageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var moonImageView: UIImageView!
    let gradientLayer0 = CAGradientLayer()// 建立漸層圖層0
    let gradientLayer1 = CAGradientLayer()// 建立漸層圖層1
    // 旋轉月亮圖片並調整位置
    func moonImageViewRotateLocation(degree:CGFloat){
        moonImageView.transform = CGAffineTransform.identity.rotated(by: -CGFloat.pi/180*degree).translatedBy(x: 220, y: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer0.frame = view.bounds// 設定漸層圖層0的範圍為整個視圖
        gradientLayer1.frame = view.bounds// 設定漸層圖層1的範圍為整個視圖
        // 設定漸層圖層0的顏色範圍
        gradientLayer0.colors = [UIColor(red: 251/255, green: 215/255, blue: 134/255, alpha: 1).cgColor,UIColor(red: 198/255, green: 255/255, blue: 221/255, alpha: 1).cgColor]
        // 設定漸層圖層1的顏色範圍
        gradientLayer1.colors = [UIColor(red: 44/255, green: 83/255, blue: 100/255, alpha: 1).cgColor,UIColor(red: 15/255, green: 32/255, blue: 40/255, alpha: 1).cgColor]
    
        view.layer.insertSublayer(gradientLayer0, at: 0)// 將漸層圖層0插入到視圖的最底部
        
        view.layer.insertSublayer(gradientLayer1, at: 1)// 將漸層圖層1插入到視圖的第二個位置
        moonImageViewRotateLocation(degree: -90)// 初始化旋轉月亮圖片的位置
    }

   
    @IBAction func changeSliderValue(_ sender: UISlider) {
        let imageName = String(format: "dragonCat-%01d", arguments: [Int(sender.value)])
        dragonCatImageView.image = UIImage(named: imageName)
        // 根據滑桿值改變漸層圖層1的透明度
        gradientLayer1.colors = [UIColor(red: 44/255, green: 83/255, blue: 100/255, alpha: CGFloat(sender.value/80)).cgColor,UIColor(red: 15/255, green: 32/255, blue: 40/255, alpha: CGFloat(sender.value/80)).cgColor]
        let newDegree = (sender.value*180/80) + 270// 計算新的旋轉角度
        moonImageViewRotateLocation(degree: CGFloat(newDegree))// 更新旋轉月亮圖片的位置和旋轉角度
    }
    
}

