//
//  NewsListEntity.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import Foundation

struct NewsListEntity: Identifiable, Codable {
    let id = UUID().uuidString
    let status, copyright: String?
    let numResults: Int?
    let results: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}
// MARK: - Article
struct Article: Codable, Identifiable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: String
    let publishedDate, updated, section: String
    let subsection: String?
    let nytdsection, adxKeywords: String
    let byline: String
    let type: String?
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaID: Int
    
    var smallMediaImageUrl: URL? {
        return URL(string: media.first?.mediaMetadata.first?.url ?? "")
    }
    
    var largeMediaImageUrl: URL? {
        return URL(string: media.last?.mediaMetadata.last?.url ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: String
    let subtype: String
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: String
    let height, width: Int
}


