//
//  LoginViewController.swift
//  MySampleApp
//
//  Created by Lisandro Gurman on 12/6/16.
//
//

import UIKit
import AWSMobileHubHelper

class LoginViewController: UIViewController {
    
    var vista = Vistas()

    @IBAction func LoginButton(sender: UIButton) {
        vista.cambiarVista("SignIn", vista: "SignIn", vistaActual: self)

        
    }

    @IBOutlet weak var crearNuevoUsuario: UIButton!
    
    var didSignInObserver: AnyObject!
    
    var passwordAuthenticationCompletion: AWSTaskCompletionSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if AWSIdentityManager.defaultIdentityManager().loggedIn {
            vista.cambiarVista("Main", vista: "Main", vistaActual: self)
        }

        crearNuevoUsuario.addTarget(self, action: #selector(handleUserPoolSignUp), forControlEvents: .TouchUpInside)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func handleUserPoolSignUp () {

        if !AWSIdentityManager.defaultIdentityManager().loggedIn {
            vista.cambiarVista("UserPools", vista: "SignUp", vistaActual: self)
        }
    }
    
    func dimissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
