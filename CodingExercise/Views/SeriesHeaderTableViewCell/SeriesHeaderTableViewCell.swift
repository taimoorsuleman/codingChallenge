//
//  SeriesHeaderTableViewCell.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 17/11/2023.
//

import UIKit

protocol SeriesHeaderTableViewCellDelegate : AnyObject{
    func didTapReadMorebtn()
    func didTapPlayBtn()
    func didTapTrailerBtn()
}

class SeriesHeaderTableViewCell: UITableViewCell {

    
    //MARK: - IBOutlet
    @IBOutlet weak var dislikeBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var watchlistBtn: UIButton!
    @IBOutlet weak var trailerBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var sereistypeLbl: UILabel!
    @IBOutlet weak var seasonCountLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var selectedSeasonBtn: UIButton!
    @IBOutlet weak var showLessBtn: UIButton!
    
    
    weak var delegate :SeriesHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI(){
        self.titleImg.addBlackGradientLayerInBackground(frame: titleImg.bounds, colors: [.clear,.black])
    }
    
    private func setupReadMoreBtn(){
        if showLessBtn.tag == 0{
            showLessBtn.setTitle("Read More", for: .normal)
            detailLbl.numberOfLines = 2
        }else{
            showLessBtn.setTitle("Read Less", for: .normal)
            detailLbl.numberOfLines = 0
        }
    }
    
    func setupData(data:SeriesModel){
        titleLbl.text = data.name
        yearLbl.text = data.lastAirDate
        sereistypeLbl.text = "\(data.voteAverage ?? 0)"
        seasonCountLbl.text = "\(data.numberOfSeasons ?? 0) Seasons"
        let imgURL = data.posterPath?.generateImageURLWithPath()
        titleImg.setImage(withURL: imgURL)
        detailLbl.text = data.overview
        setupReadMoreBtn()
    }
    
    @IBAction func showLessBtnTapped(_ sender: UIButton) {
        showLessBtn.tag == 0 ? (showLessBtn.tag = 1) : (showLessBtn.tag = 0)
        delegate?.didTapReadMorebtn()
    }
    
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        delegate?.didTapPlayBtn()
    }
    @IBAction func trailerBtnTapped(_ sender: UIButton) {
        delegate?.didTapTrailerBtn()
    }
}
