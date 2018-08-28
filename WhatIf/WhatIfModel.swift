//
//  WhatIfModel.swift
//  WhatIf
//
//  Created by Yaroslaw Bagriy on 1/13/16.
//

import Foundation
import AVFoundation

class WhatIfModel: NSObject, AVAudioPlayerDelegate {
    
    let whatIfArray = [
        "What if you only had one sense?",
        "What would be your super-power?",
        "What if you could cure anything, what would it be?",
        "What if you could be any animal, which would you choose?",
        "What if you could be rich and miserable or poor and happy, your decision?",
        "If you had one wish, what would it be?",
        "If you could change one thing in the world what would it be?",
        "What if you could suddenly possess an extraorinary talent?",
        "If you could have chosen your first name what would it have been?",
        "If you had to convert to a different religion, which would you choose?",
        "If you had to be homeless for a year where would you stay?",
        "If you could only see one movie ever again which one would it be?",
        "What if you could commit one crime without being caught, what would it be?",
        "If you could unknow one thing you know what would it be?",
        "What if you had to lose a limb, which one would go?",
        "What if you could choose the way you die, how would you go?"
    ]
    
    var audioPlayer : AVAudioPlayer?
    
    func playSound (sound: Sound) {
        let dispatchQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, {[weak self] in
            let mainBundle = NSBundle.mainBundle()
            
            /* Find the location of our file to feed to the audio player */
            let filePath = mainBundle.pathForResource(sound.fileName, ofType:sound.fileExtension)
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                var error:NSError?
                
                do {
                    /* Start the audio player */
                    self!.audioPlayer = try AVAudioPlayer(data: fileData!)
                } catch let error1 as NSError {
                    error = error1
                    self!.audioPlayer = nil
                } catch {
                    fatalError()
                }
                
                /* Did we get an instance of AVAudioPlayer? */
                if let player = self!.audioPlayer {
                    /* Set the delegate and start playing */
                    player.delegate = self
                    if player.prepareToPlay() && player.play(){
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                } else {
                    /* Failed to instantiate AVAudioPlayer */
                }
            }
            
            })
    }

}
