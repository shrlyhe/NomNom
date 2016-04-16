//
//  ClarifyRecognitionViewController.swift
//  NomNom
//
//  Created by Shirley He on 4/16/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit


class ClarifyRecognitionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   //make set to store tags
   //yelp - convert key words to restaurant
    
    
    private lazy var client : ClarifaiClient = ClarifaiClient(appID: Credentials.clientID(), appSecret: Credentials.clientSecret())
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBAction func likeButtonPressed(sender: UIButton) {
        //converting to jpeg
        let jpeg = UIImageJPEGRepresentation(imageView.image!, 0.7)
        
        //generating tags!
        client.recognizeJpegs([jpeg!]) { (results, error) in
            if error != nil {
                print("Error: \(error)\n")
              
            } else {
                let tags = results![0].tags
                print(tags)
            }

        }
    
        //generate random image
       imageView.image = UIImage(named: "Image\(arc4random_uniform(3) + 1)")
        
        
        
        
    }
    
    @IBAction func dislikeButtonPressed(sender: UIButton) {
        //do nothing (no tags), generate image
       imageView.image = UIImage(named: "Image\(arc4random_uniform(3) + 1)")
        
    }
    

   

}