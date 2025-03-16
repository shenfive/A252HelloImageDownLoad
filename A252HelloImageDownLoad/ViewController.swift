//
//  ViewController.swift
//  A252HelloImageDownLoad
//
//  Created by DannyShen on 2025/3/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theImageView: UIImageView!
    
    @IBOutlet weak var theImageContaner: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://cdn2.ettoday.net/images/5840/d5840071.jpg"){
            print("start:\(Date().timeIntervalSince1970)")

            
            DispatchQueue.global().async {
                do{
                    let imageData = try Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.theImageView.image = UIImage(data: imageData)
                        print("downloaded:\(Date().timeIntervalSince1970)")
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            print("end:\(Date().timeIntervalSince1970)")
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        theImageView.clipsToBounds = true
        theImageView.layer.cornerRadius = theImageView.bounds.width / 2
        theImageView.layer.borderColor = UIColor.red.cgColor
        theImageView.layer.borderWidth = 3
        
        theImageContaner.clipsToBounds = false
        theImageContaner.layer.cornerRadius = theImageContaner.bounds.width / 2
        theImageContaner.layer.shadowRadius = 20         //陰影
        theImageContaner.layer.shadowOpacity = 0.6;
        theImageContaner.layer.shadowColor = UIColor.green.cgColor
        theImageContaner.layer.shadowOffset = CGSize(width: 10, height: 10)

    }

}

