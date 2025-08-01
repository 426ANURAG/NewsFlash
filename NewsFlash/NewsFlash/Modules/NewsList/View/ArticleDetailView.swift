//
//  ArticleDetailView.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 01/08/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image
                AsyncImage(url: URL(string: article.media.first?.mediaMetadata.first?.url ?? "")) { image in
                    image.resizable()
                        .frame(height: 300)
                        .clipped()
                        .cornerRadius(16)
                        .padding(.top)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                
                // Title & Subtitle
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(article.abstract)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer(minLength: 30)
            }
            .padding()
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    let article = Article.init(uri: "", url: "", id: 1, assetID: 1, source: "New York Times", publishedDate: "2025-07-28", updated: "2025-07-31 04:40:39", section: "Well", subsection: "Family", nytdsection: "well", adxKeywords: "Dating", byline: "By Catherine Pearson", type: "Article", title: "Why Women Are Weary of the Emotional Labor of ‘Mankeeping’", abstract: "As male social circles shrink, female partners say they have to meet more social and emotional needs.", desFacet: ["Dating and Relationships"], orgFacet: [], perFacet: [], geoFacet: [], media: [.init(type: "image", subtype: "photo", caption: "", copyright: "", approvedForSyndication: 1, mediaMetadata: [.init(url: "https://static01.nyt.com/images/2025/07/28/well/28Well-Mankeeping/28Well-Mankeeping-thumbStandard.jpg", format: "", height: 75, width: 75)])], etaID: 0)
    ArticleDetailView(article: article)
}
