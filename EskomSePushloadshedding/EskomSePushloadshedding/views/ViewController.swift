//
//  ViewController.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/05.
//

import UIKit

class HomeVC: UIViewController {
    override func  viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
 
    }
}

class AddVC: UIViewController {
    override func  viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
    }
}

class ListVC: UIViewController {
    override func  viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
      
    }
}


class ViewController:  UITabBarController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate  {
    
    
    private var tableView: UITableView = {
        let table = UITableView()
        
        
        
        table.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        
        table.register(ImageTableViewCell.nib(), forCellReuseIdentifier:  ImageTableViewCell.identifier)
        
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0,
                                                           width: view.frame.size.width,
                                                           height: view.frame.size.width))
        header.imageView1.image = UIImage(named: "south 1")
        
        tableView.tableHeaderView = header
        
        //        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30 ))
        
        
        let label = UILabel(frame: header.bounds)
        label.text = "LoadShedding"
        label .textAlignment = .left
        header.addSubview(label)
        
        
        
        tableView.tableHeaderView = header
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    private func  tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> CGFloat {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 1 {
            
            
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = ""
        cell.backgroundColor  = .lightGray
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header  = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
            
        }
        
        header.scrollViewDisscroll(scrollView: tableView)
        
        
        let homeVC = HomeVC()
        let addVC = AddVC()
        let listVC = ListVC()
        
        
        homeVC.title = "Home"
        addVC.title = "Add Area"
        listVC.title = "More"
        
        
        self.setViewControllers([homeVC, addVC, listVC], animated: false)
    }
}




    

        
     

