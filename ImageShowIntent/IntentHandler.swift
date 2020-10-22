//
//  IntentHandler.swift
//  ImageShowIntent
//
//  Created by Appnap WS01 on 21/10/20.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, MainintentIntentHandling {
    var imageList: [ImageCategory] = [ImageCategory]()
    func provideImageOptionsCollection(for intent: MainintentIntent, with completion: @escaping (INObjectCollection<ImageCategory>?, Error?) -> Void) {
        
        
        for each in DataModel.currentData {
            let imageCategory = ImageCategory(identifier: each.imageName, display: each.imageName)
            imageCategory.name = each.imageName
            imageList.append(imageCategory)
        }
        
        //let collection = INObjectCollection(items: imageList)
        let collection = INObjectCollection(sections:
                [
                INObjectSection(title: "Hello 1", items: [ImageCategory(identifier: "1", display: "2")]),
                 INObjectSection(title: "Hello 2", items: imageList)])
        completion(collection,nil)
    }
    
    
}



