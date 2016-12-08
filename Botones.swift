//
//  Botones.swift
//  MySampleApp
//
//  Created by Lisandro Gurman on 12/6/16.
//
//

import Foundation
import UIKit

let colorAzulPrincipal = UIColor(red: 50/255, green: 146/255, blue: 207/255, alpha: 1.0)

class BotonRedondo: UIButton{
    
    
    var myValue: Int
    
    required init?(coder aDecoder: NSCoder) {
        
        self.myValue = 0
        
        super.init(coder: aDecoder)
        
        backgroundColor = .whiteColor()
        frame.size = CGSize(width: 200, height: 30)
        layer.cornerRadius = 15
        setTitleColor(colorAzulPrincipal, forState: .Normal)
    }
    
    
}
