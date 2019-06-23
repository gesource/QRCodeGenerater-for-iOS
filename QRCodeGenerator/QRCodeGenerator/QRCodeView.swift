//
//  QRCodeView.swift
//  QRCodeGenerator
//
//  Created by 山本隆 on 2019/06/23.
//  Copyright © 2019 山本隆. All rights reserved.
//

import UIKit

class QRCodeView: UIView {
    lazy var filter = CIFilter(name: "CIQRCodeGenerator")
    lazy var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func generateCode(_ string: String) {
        guard let data = string.data(using: .utf8) else {
            return
        }
        
//        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
//            return
//        }
//        filter.setDefaults()
//        filter.setValue(data, forKey: "inputMessage")

        guard let filter = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"]) else {
            return
        }

        guard let image = filter.outputImage else {
            return
        }
        
        let transform = CGAffineTransform.init(scaleX: 10, y: 10)
        let ciImage = image.transformed(by: transform)
        let uiImage = UIImage(ciImage: ciImage, scale: 1, orientation: .up)
        imageView.image = uiImage
    }
}
