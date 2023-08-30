//
//  StretchyTableHeaderView.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/08.
//

import Foundation
import UIKit


final class StretchyTableHeaderView: UIView {
    public let imageView1: UIImageView = {
        let imageView1 = UIImageView()
        imageView1.clipsToBounds = true
        imageView1.contentMode = .scaleToFill
        return imageView1
    }()
    
    private var imageView1Height = NSLayoutConstraint()
    private var imageView1Bottom = NSLayoutConstraint()
    private var containerViewHight = NSLayoutConstraint()
    private var containerView = UIView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        
        setViewContraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView1)
    }
    
    func setViewContraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
         
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalTo: imageView1.widthAnchor).isActive = true
        
        containerViewHight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHight.isActive = true
        
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false

        imageView1Bottom = imageView1.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageView1Bottom.isActive = true
        imageView1Height = imageView1.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageView1Height.isActive = true
    }
    public func scrollViewDisscroll(scrollView: UIScrollView) {
        containerViewHight.constant = scrollView.contentInset.top
        let offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageView1Bottom.constant = CGFloat(offsetY >= 0 ? 0 : -offsetY / 2)
        imageView1Height.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
    }
    
    
}

