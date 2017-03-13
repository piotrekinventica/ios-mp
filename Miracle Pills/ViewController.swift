//
//  ViewController.swift
//  Miracle Pills
//
//  Created by Piotr Kaźmierczak on 13.03.2017.
//  Copyright © 2017 Piotr Kaźmierczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var successImage: UIImageView!
    
    var dataSource: StatePickerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = StatePickerDataSource(callback: {(row: String?) -> Void in
            self.statePickerButton.setTitle(row, for: UIControlState.normal)
            self.statePicker.isHidden = true
            self.hideOrShowAll(flag: false)
        })
        
        statePicker.dataSource = dataSource
        statePicker.delegate = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChooseStateClick(_ sender: AnyObject) {
        statePicker.isHidden = false
        hideOrShowAll(flag: true)
    }
    
    @IBAction func onBuyNowClick(_ sender: AnyObject) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
        }
        successImage.isHidden = false
    }
    
    func hideOrShowAll(flag: Bool) {
        countryLabel.isHidden = flag
        countryTextField.isHidden = flag
        zipCodeLabel.isHidden = flag
        zipCodeTextField.isHidden = flag
        buyNowButton.isHidden = flag
    }
    
}
