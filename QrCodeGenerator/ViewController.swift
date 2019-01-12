//
//  ViewController.swift
//  QrCodeGenerator
//
//  Created by claudio Cavalli on 12/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qrCode: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            
            let filter = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage" : "hello world".data(using: .utf8), "inputCorrectionLevel":"H"])
            
            let image = filter!.outputImage!
            
            let scalex = self.qrCode.frame.size.width / image.extent.size.width
            let scaley = self.qrCode.frame.size.height / image.extent.size.height
            let trasform = CGAffineTransform(scaleX: scalex, y: scaley)
            
            let qr = image.transformed(by: trasform)
            
            self.qrCode.image = UIImage(ciImage: qr)
            
        }
    
    }
 
    override func viewWillAppear(_ animated: Bool) {
        qrCode.frame.size.width = 240
        qrCode.frame.size.height = 240
        qrCode.center = view.center
        
    }

}

