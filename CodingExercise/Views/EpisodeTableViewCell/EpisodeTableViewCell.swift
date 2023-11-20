//
//  EpisodeTableViewCell.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 17/11/2023.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    //MARK: - IBOutlets

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var downloadBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //MARK: - Setup Methods
    private func configureUI(){
        self.titleImg.addBlackGradientLayerInBackground(frame: titleImg.bounds, colors: [.clear,.black])
    }
    
    func populateUI(title:String,imgPath:String){
        self.titleLbl.text = title
        let url =  imgPath.generateImageURLWithPath()
        titleImg.setImage(withURL: url)
    }

}
