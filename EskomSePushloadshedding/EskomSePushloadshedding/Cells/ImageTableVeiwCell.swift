//
//  ImageTableVeiwCell.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/09.
//
import UIKit

class ImageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ImageView1: UIImageView!

    
    @IBOutlet weak var Stages: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
  
    
    static let identifier = "ImageTableViewCell"
    
    static func nib () -> UINib {
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
        
    }



    public func configure(with imageName: String) {
        ImageView1.image = UIImage(named: imageName)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        getStatus()
        
        }
        func getStatus() {
            networkmanager.shared.getStatus {  Status, error in
                if let error = error {
                    print(error.localizedDescription)
                    
                } else if let Status = Status, let
                            StageDetail = Status.status?.eskom {
                    self.Stages.text = "Stage:\(StageDetail.stage ?? "unknown")"
                }
            }
        }

        
    }
    



