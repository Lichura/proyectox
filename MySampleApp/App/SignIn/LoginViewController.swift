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


    @IBAction func LoginButton(sender: UIButton) {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("SignIn")
        self.presentViewController(viewController, animated:true, completion:nil)
    }

    @IBOutlet weak var crearNuevoUsuario: UIButton!
    

    
    var didSignInObserver: AnyObject!
    
    var passwordAuthenticationCompletion: AWSTaskCompletionSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AWSIdentityManager.defaultIdentityManager().loggedIn {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewControllerWithIdentifier("Main")
            self.presentViewController(viewController, animated:true, completion:nil);
        }

        // Do any additional setup after loading the view.

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

            let storyboard = UIStoryboard(name: "UserPools", bundle: nil)
            let viewController = storyboard.instantiateViewControllerWithIdentifier("SignUp")
            self.presentViewController(viewController, animated:true, completion:nil);
            
        }
    }
    
    

    

    func dimissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
 
    


}
