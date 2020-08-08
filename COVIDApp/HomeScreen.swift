//
//  HomeScreen.swift
//  COVIDApp
//
//  Created by Daly, Christina on 8/5/20.
//  Copyright © 2020 Shashank Venkat. All rights reserved.
//

import UIKit


//Home Screen View Controller
class HomeScreen: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets background color
        view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoToMapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "map_VC") as! ViewController
        //sets Presentation style to fullScreen
        vc.modalPresentationStyle = .fullScreen
        //presents ViewController
        present(vc, animated:true)
        //self.present(vc, animated:true, completion:nil)
        //show(vc, sender: self )
    }
    //button action to switch to map view

     
    /*   // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
