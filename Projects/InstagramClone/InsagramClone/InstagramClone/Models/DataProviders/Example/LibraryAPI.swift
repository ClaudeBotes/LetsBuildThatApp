//
//  LibraryAPI.swift
//  InstagramClone
//
//  Created by Claude on 31/3/2018.
//  Copyright © 2018 Claude. All rights reserved.
//

import Foundation

final class LibraryAPI {
    // 1
    static let shared = LibraryAPI()
    private let persistencyManager = PersistencyManager()
    //private let httpClient = HTTPClient()
    private let isOnline = false
    // 2
    private init() {
        
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(_ album: Album, at index: Int) {
        persistencyManager.addAlbum(album, at: index)
        if isOnline {
            //httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    func deleteAlbum(at index: Int) {
        persistencyManager.deleteAlbum(at: index)
        if isOnline {
           // httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
}
