//
//  PlayerViewController.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 20/11/2023.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController{
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var silder: UISlider!

    var player: AVPlayer?
    var viewModel: PlayerViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        playVideo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView(){
        playButton.isHidden = true
    }
    
    private func playVideo() {
        let videoURL = URL(string: (viewModel?.getPlayerURL())!)
        
        let asset = AVURLAsset(url: videoURL!)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        Task { @MainActor in
            let duration = try await asset.load(.duration).seconds
            silder.maximumValue = Float(duration)
            silder.minimumValue = 0
            silder.addTarget(self, action: #selector(self.playbackSliderValueChanged(_:)), for: .valueChanged)
        }
        
        player?.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoView.bounds
        playerLayer.videoGravity = .resizeAspect
        videoView.layer.addSublayer(playerLayer)
        player?.play()
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus", let change = change, let newValue = change[NSKeyValueChangeKey.newKey] as? Int, let oldValue = change[NSKeyValueChangeKey.oldKey] as? Int {
            let oldStatus = AVPlayer.TimeControlStatus(rawValue: oldValue)
            let newStatus = AVPlayer.TimeControlStatus(rawValue: newValue)
            if newStatus != oldStatus {
                DispatchQueue.main.async {[weak self] in
                    if newStatus == .playing || newStatus == .paused {
                        self?.stopActivityIndicator()
                    } else {
                        self?.startActivityIndicator()
                    }
                }
            }
        }
    }
    
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider) {
        
        let seconds : Int64 = Int64(playbackSlider.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        player?.seek(to: targetTime)
        
        if player?.rate == 0{
            player?.play()
        }
    }
    
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        if !(player?.isPlaying ?? true){
            player?.play()
            playButton.isHidden = true
            pauseButton.isHidden = false
        }
    }
    
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        if (player?.isPlaying ?? false){
            player?.pause()
            playButton.isHidden = false
            pauseButton.isHidden = true
        }
    }
    
}

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
