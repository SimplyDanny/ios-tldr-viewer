//
//  DetailDataSource.swift
//  tldr-viewer
//
//  Created by Matthew Flint on 23/01/2016.
//  Copyright © 2016 Green Light. All rights reserved.
//

import Foundation

struct DetailDataSource {
    let markdown: String?
    let errorString: String?
    
    init(_ commandVariant: CommandVariant) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory
            .appendingPathComponent("pages")
            .appendingPathComponent(commandVariant.platform.name)
            .appendingPathComponent(commandVariant.commandName)
            .appendingPathExtension("md")
        
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            markdown = content
            errorString = nil
        } catch {
            markdown = nil
            errorString = Localizations.CommandDetail.Error.CouldNotFindTldr
        }
    }
}
