//
//  Sound.swift
//  WhatIf
//
//  Created by Yaroslaw Bagriy on 1/13/16.
//

import Foundation

class Sound {
    
    var fileName : String
    var fileExtension : String
    
    init(fileName: String, fileExtension: String) {
        self.fileName = fileName
        self.fileExtension = fileExtension
    }
    
}

let beep = Sound(fileName: "beep", fileExtension: "mp3")