//
//  ViewController.swift
//  ios-cw-6-hm-3-x-o
//
//  Created by Mac on 9/28/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var xScore: UILabel!
    
    var buttonNames: [UIButton] = []
    override func viewDidLoad() {
        buttonNames = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "Waltz-music-loop_2", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
       // MusicPlayer.shared.startBackgroundMusic()
        
    }
    var counter = 1
   
    @IBAction func buttons(_ sender: UIButton, forEvent event: UIEvent) {
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    
        if counter % 2 == 0 {
            sender.setTitle("O", for: .normal)
            turnLabel.text = "X's turn"
            sender.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
            checkWinner("O")
            
        }else {
            sender.setTitle("X", for: .normal)
            turnLabel.text = "O's turn"
            sender.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
            checkWinner("X")
        }
      //  sender.setTitle(counter % 2 == 0 ? "X" : "O", for: .normal)
    // checkWinner(counter % 2 == 0 ? "X" : "O")
        sender.isEnabled = false
        counter += 1
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        restartGame()
        
    }
    func checkWinner (_ p: String) {
        
        let buttonTitles = buttonNames.map{$0.titleLabel!.text ?? ""}
        let r1 = (buttonTitles[0], buttonTitles[1], buttonTitles[2]) == (p, p, p)
        let r2 = (buttonTitles[3], buttonTitles[4], buttonTitles[5]) == (p, p, p)
        let r3 = (buttonTitles[6], buttonTitles[7], buttonTitles[8]) == (p, p, p)
        let c1 = (buttonTitles[0], buttonTitles[3], buttonTitles[6]) == (p, p, p)
        let c2 = (buttonTitles[1], buttonTitles[4], buttonTitles[7]) == (p, p, p)
        let c3 = (buttonTitles[2], buttonTitles[5], buttonTitles[8]) == (p, p, p)
        let d1 = (buttonTitles[0], buttonTitles[4], buttonTitles[8]) == (p, p, p)
        let d2 = (buttonTitles[2], buttonTitles[4], buttonTitles[6]) == (p, p, p)
//        let r12 = (buttonTitles[0], buttonTitles[1], buttonTitles[2]) !== (p, p, p)
//        let r22 = (buttonTitles[3], buttonTitles[4], buttonTitles[5]) !== (p, p, p)
//        let r32 = (buttonTitles[6], buttonTitles[7], buttonTitles[8]) !== (p, p, p)
//        let c12 = (buttonTitles[0], buttonTitles[3], buttonTitles[6]) !== (p, p, p)
//        let c22 = (buttonTitles[1], buttonTitles[4], buttonTitles[7]) !== (p, p, p)
//        let c32 = (buttonTitles[2], buttonTitles[5], buttonTitles[8]) !== (p, p, p)
//        let d12 = (buttonTitles[0], buttonTitles[4], buttonTitles[8]) !== (p, p, p)
//        let d22 = (buttonTitles[2], buttonTitles[4], buttonTitles[6]) !== (p, p, p)
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            alertWinner(winner: p)
            
        }
   //         else if r12 || r22 || r32 || c12 || c22 || c32 || d12 || d22 || {
//            alertTie()
//        }
    }
    func alertWinner (winner: String) {
        let alertController = UIAlertController(title: "\(winner) wins!", message: "Tap to restart", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .cancel, handler: resetButton(_:))
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    func alertTie () {
        let alertController = UIAlertController(title: "Tie!", message: "Tap to restart", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .cancel, handler: resetButton(_:))
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    func restartGame () {
//       for b in buttonNames{
//        b.setTitle("", for: .normal)
//        b.titleLabel!.text = ""
//        b.isEnabled = true
        
       buttonNames.forEach { button in
            button.setTitle("", for: .normal)
            button.titleLabel!.text = ""
            button.isEnabled = true
            counter = 1
            turnLabel.text! = "X's turn"
        }
    }
    func soundPlayer () {
        let path = Bundle.main.path(forAuxiliaryExecutable:"Waltz-music-loop_2.mp3")!
        let url = URL(fileURLWithPath: path)
    }
    
    var AudioPlayer = AVAudioPlayer()

}
class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "Waltz-music-loop_2.", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
