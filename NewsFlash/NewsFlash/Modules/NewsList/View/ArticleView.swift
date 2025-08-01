//
//  ArticleView.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 01/08/25.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    var body: some View {
        HStack(spacing: 10) {
            // Article image
            AsyncImage(url: URL(string: article.media.first?.mediaMetadata.first?.url ?? "")) { image in
                image.resizable()
                image.scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            
            VStack(spacing: 5) {
                Text(article.title)
                    .font(Font.system(size: 15))
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 4) {
                    Text(article.byline)
                        .font(Font.system(size: 15))
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Image(systemName: "calendar")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(article.publishedDate)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                
                
            }
            // Chevron
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
        )
    }
}

#Preview {
    let article = Article.init(uri: "", url: "", id: 1, assetID: 1, source: "New York Times", publishedDate: "2025-07-28", updated: "2025-07-31 04:40:39", section: "Well", subsection: "Family", nytdsection: "well", adxKeywords: "Dating", byline: "By Catherine Pearson", type: "Article", title: "Why Women Are Weary of the Emotional Labor of ‘Mankeeping’", abstract: "As male social circles shrink, female partners say they have to meet more social and emotional needs.", desFacet: ["Dating and Relationships"], orgFacet: [], perFacet: [], geoFacet: [], media: [.init(type: "image", subtype: "photo", caption: "", copyright: "", approvedForSyndication: 1, mediaMetadata: [.init(url: "https://static01.nyt.com/images/2025/07/28/well/28Well-Mankeeping/28Well-Mankeeping-thumbStandard.jpg", format: "", height: 75, width: 75)])], etaID: 0)
    ArticleView(article: article)
}
