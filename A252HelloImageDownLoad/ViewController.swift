//
//  ViewController.swift
//  A252HelloImageDownLoad
//
//  Created by DannyShen on 2025/3/16.
//

import UIKit
//import Kingfisher
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var theImageView: UIImageView!
    
    @IBOutlet weak var theImageContaner: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let url = URL(string: "https://cdn.hk01.com/di/media/images/dw/20200812/370289758980673536.jpeg/n9DPEMxK9oiurOikNCKS0vCbRRiCES0RUTjuFlE47hY?v=w640"){
//            print("start:\(Date().timeIntervalSince1970)")
//            DispatchQueue.global().async {
//                self.theImageView.sd_setImage(with: url)
//                //            theImageView.kf.setImage(with: url)
//                print("downloaded:\(Date().timeIntervalSince1970)")
//            }
//            DispatchQueue.global().async {
//                do{
//                    let imageData = try Data(contentsOf: url)
//                    print(String(data: imageData, encoding: .utf8))
////                    DispatchQueue.main.async {
////                        self.theImageView.image = UIImage(data: imageData)
////                        print("downloaded:\(Date().timeIntervalSince1970)")
////                    }
//                }catch{
//                    print(error.localizedDescription)
//                }
//            }
//            print("end:\(Date().timeIntervalSince1970)")
//        }
        
        
        
        APIModel.share.queryUser { data, error in
            if let error{
                print(error.localizedDescription)
                return
            }
            print(data as? Data)
            
            
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

