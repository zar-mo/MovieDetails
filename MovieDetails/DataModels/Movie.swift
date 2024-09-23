//
//  Movie.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/20/24.
//

import Foundation

struct Movie: Codable {
    
    let duration: Double
    let image_id: String?
    let plays: Int
    let created_at: Date
    let size: Int
    let transcodings: [Transcoding]
    let title: String
    let updated_at: Date
    let account_id: String
    let progress: Double
    let originalMovie: Video
    
    let tags: [String]
    let id: String
    let aspectRatioMultiplier: Int
    let screenshot: ScreenShot
    let state: videoStatus
}

struct ScreenShot: Codable {
    let normal: String
    let thumb: String
    let original: String
  }

struct Transcoding: Codable {
    
    
        let id: String
        let rtmpStreamUri: String
        let size: Int
        let httpUri: String
        let title: String
        let progress: Double
        let rtmpBaseUri: String
        let bitrate: Int
        let height: Int
        let rtmpUri: String
        let state: videoStatus
        let width: Int
    
}

enum videoStatus: String, Codable {
    case ready = "ready"
    case notReady = "notReady"
}

struct Video: Codable {
    let http_uri: String
    let size: Int
    
    
}




