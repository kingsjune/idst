//
//  ResponseModel.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import Foundation

struct ResponseModel:Codable {
    var resultCount :Int?
    var results : [Results]?
    
    enum CodingKeys : String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
}

struct Results : Codable {
    var screenShotUrl:[String]
    var description:String
    var fileSizeBytes:String
    var version:String
    var genres:[String]
    var releaseNotes:String

    
    enum CodingKeys : String , CodingKey {
        case screenShotUrl = "screenshotUrls"
        case description = "description"
        case fileSizeBytes = "fileSizeBytes"
        case version = "version"
        case genres = "genres"
        case releaseNotes = "releaseNotes"
    }
}
