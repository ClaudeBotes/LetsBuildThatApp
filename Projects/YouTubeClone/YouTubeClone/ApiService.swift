//
//  ApiService.swift
//  YouTubeClone
//
//  This class is responsible for getting the videos
//
//  Created by Claude on 21/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchVideos(completion: @escaping ([Video]) -> ()){
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error ?? "Error trying to fetch videos.")
                return
            }
            
            do {
                // Create JSON Object
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                // Create videos object to hold videos
                var videos = [Video]()
                
                // Build Video collection
                for dictionary in json as! [[String: AnyObject]]{
                    let video = Video()
                    
                    // Get title and thumbnail from json
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    // Get channel details from json
                    let channelDictionary = dictionary["channel"] as! [String:AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    
                    // Add channel to video
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async(execute: {
                    completion(videos)
                })
                
            }catch let jsonError {
                print(jsonError)
            }
            }.resume()

    
    }

}
