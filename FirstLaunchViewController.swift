//
//  FirstLaunchViewController.swift
//  MySampleApp
//
//  Created by Lisandro Gurman on 12/6/16.
//
//

import UIKit

class FirstLaunchViewController: UIViewController {

    @IBAction func LastNextButton(sender: UIButton) {
        presentSignInViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    
    func presentSignInViewController() {
            let storyboard = UIStoryboard(name: "LogInStory", bundle: nil)
            let viewController = storyboard.instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(viewController, animated: true, completion: nil)
    }

}
