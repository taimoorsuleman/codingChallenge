//
//  DropDownTableViewCell.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 17/11/2023.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {

    //MARK: - IBOUTLET
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override var isSelected: Bool{
        didSet{
            if isSelected{
                self.titleLbl.font = .boldSystemFont(ofSize: 32)
            }else{
                self.titleLbl.font = .systemFont(ofSize: 20)
            }
        }
    }
    
    func poppulateUI(title:String){
        self.titleLbl.text = title
    }
    
}
