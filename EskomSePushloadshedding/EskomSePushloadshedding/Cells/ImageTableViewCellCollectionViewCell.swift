//
//  ImageTableViewCellCollectionViewCell.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/09.
//


import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet var ImageView1: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        initSubviews()
    }
  
    
    static let identifier = "ImageTableViewCell"
    
    static func nib () -> UINib {
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
        
    }


//    func initSubviews() {
//        let nib = UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil)
//        nib.instantiate(withOwner: self)
//    }
    public func configure(with imageName: String) {
        ImageView1.image = UIImage(named: imageName)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
