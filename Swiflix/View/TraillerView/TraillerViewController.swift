//
//  TraillerViewController.swift
//  Swiflix
//
//  Created by Bryan Barreto on 24/01/21.
//

import UIKit
import YouTubePlayer

class TraillerViewController: UIViewController {
    
    @IBOutlet weak var player: YouTubePlayerView!
    
    let trailler: MovieTrailer
    
    init(_ t:MovieTrailer) {
        self.trailler = t
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player.loadVideoID(self.trailler.key)
        self.player.delegate = self
    }
    @IBAction func voltarTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension TraillerViewController: YouTubePlayerDelegate {
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        self.player.play()
    }
}
