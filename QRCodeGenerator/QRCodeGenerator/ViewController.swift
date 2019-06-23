//
//  ViewController.swift
//  QRCodeGenerator
//
//  Created by 山本隆 on 2019/06/23.
//  Copyright © 2019 山本隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var qrCodeView: QRCodeView!
    @IBOutlet weak var codeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickGenerateButton(_ sender: UIButton) {
        if codeText.text != nil {
            codeText.endEditing(true)
            qrCodeView.generateCode(codeText.text!)
        }
    }
    
}

