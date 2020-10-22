//
//  DataModel.swift
//  ImageShowIntent
//
//  Created by Appnap WS01 on 21/10/20.
//

import Foundation

struct DataModel {
    var imageName: String
    
    static let currentData: [DataModel] = [
            DataModel(imageName: "play"),
            DataModel(imageName: "play.fill"),
            DataModel(imageName: "pause"),
            DataModel(imageName: "pause.fill")
    
        ]
}
