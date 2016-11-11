//
//  DetailPlatformViewModel.swift
//  tldr-viewer
//
//  Created by Matthew Flint on 01/01/2016.
//  Copyright © 2016 Green Light. All rights reserved.
//

import Foundation
import SwiftyMarkdown

class DetailPlatformViewModel {
    // the message to show when there's no tldr page
    var message: NSAttributedString?
    
    // platform name and index
    var platformName: String!
    var platformIndex: Int
    
    // tldr page in HTML
    var detailHTML: String?
    
    // tldr page as an AttributedString
    var detailAttributedString: NSAttributedString?
    
    private var command: Command!
    private var platform: Platform!
    
    init(command: Command, platform: Platform, platformIndex: Int) {
        self.command = command
        self.platform = platform
        self.platformIndex = platformIndex
        
        self.platformName = platform.displayName
        
        let detailDataSource = DetailDataSource(command: command, platform: platform)
        guard let markdown = detailDataSource.markdown else {
            handleError(detailDataSource.errorString)
            return
        }
        
        handleSuccess(markdown)
    }
    
    private func handleError(_ error: String?) {
        self.message = Theme.detailAttributed(string: error)
    }
    
    private func handleSuccess(_ markdownString: String) {
        let md = SwiftyMarkdown(string: markdownString)
        self.detailAttributedString = md.attributedString()
        
        var markdown = Markdown()
        let html = markdown.transform(markdownString)
        self.detailHTML = Theme.pageFrom(htmlSnippet: html)
        self.message = nil
    }
}
