//
//  File.swift
//  Miracle Pills
//
//  Created by Piotr Kaźmierczak on 13.03.2017.
//  Copyright © 2017 Piotr Kaźmierczak. All rights reserved.
//

import Foundation
import UIKit

class StatePickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let viewControllerCallback: (String?) -> Void
    
    init(callback: @escaping (String?) -> Void ){
        viewControllerCallback = callback
    }
    
    let states = ["NY", "DC", "Cal", "Flo", "Tex", "Wyo", "Whis", "Ohio", "Idaho"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewControllerCallback(states[row])
    }
}
