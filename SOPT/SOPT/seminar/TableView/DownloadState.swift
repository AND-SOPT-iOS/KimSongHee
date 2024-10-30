//
//  DownloadState.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import Foundation

enum downloadState {
    case installed
    case download
    case redownload
    case update
    
    var title: String {
        switch self {
        case .installed:
            return "Installed"
        case .download:
            return "Download"
        case .redownload:
            return "Redownload"
        case .update:
            return "Update"
        }
    }
}
