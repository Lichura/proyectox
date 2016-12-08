//
//  Helpers.swift
//  MySampleApp
//
//  Created by Lisandro Gurman on 12/8/16.
//
//

import Foundation


class Vistas{
    
    func cambiarVista(storyboard: String, vista: String, vistaActual: UIViewController){
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(vista)
        //vistaActual.dismissViewControllerAnimated(true, completion: nil)
        vistaActual.presentViewController(viewController, animated: true, completion: nil)
        //vistaActual.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
