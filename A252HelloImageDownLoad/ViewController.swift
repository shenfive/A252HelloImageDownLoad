//
//  ViewController.swift
//  A252HelloImageDownLoad
//
//  Created by DannyShen on 2025/3/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theImageView: UIImageView!
    
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


}

