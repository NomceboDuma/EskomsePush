//
//  DetailViewController.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var strSelectedItem = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = strSelectedItem
        self.view.addSubview(label)
        
        
       
    }
    


}
