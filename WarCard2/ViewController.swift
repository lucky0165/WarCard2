//
//  ViewController.swift
//  WarCard2
//
//  Created by Łukasz Rajczewski on 14/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftCardImage: UIImageView!
    @IBOutlet weak var rightCardImage: UIImageView!
    @IBOutlet weak var leftPoints: UILabel!
    @IBOutlet weak var rightPoints: UILabel!
    
    var leftNumber = 0
    var rightNumber = 0
    
    var leftScore = 0
    var rightScore = 0
    
    var timer: Timer?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func rotate() {

        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    
    }
    
    @objc func update() {

        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftCardImage.image = UIImage(named: "card\(leftNumber)")
        leftCardImage.transform = leftCardImage.transform.rotated(by: .pi)
        
        rightCardImage.image = UIImage(named: "card\(rightNumber)")
        rightCardImage.transform = rightCardImage.transform.rotated(by: .pi)
        
        count += 1
        
        if count == 10 {
            timer?.invalidate()
            count = 0
            
            if leftNumber > rightNumber {
                leftScore += 1
                leftPoints.text = "\(leftScore)"
                leftPoints.font = leftPoints.font.withSize(70)

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.leftPoints.font = self.leftPoints.font.withSize(40)
                }
            
            
            } else if leftNumber < rightNumber {
                rightScore += 1
                rightPoints.text = "\(rightScore)"
                rightPoints.font = rightPoints.font.withSize(70)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.rightPoints.font = self.rightPoints.font.withSize(40)
                }
            }
            
        }
    }
    

    @IBAction func dealButtonTapped(_ sender: UIButton) {
        
        rotate()

        
    }
    
}

