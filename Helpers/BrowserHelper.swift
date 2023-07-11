import Foundation
import AppKit

struct BrowserHelper {
    static func isExcludedWebsite(_ websiteURL: URL, excludedWebsites: [URL]) -> Bool {
        return excludedWebsites.contains(websiteURL)
    }
    
    static func isIncognitoWindow(_ windowURL: URL, incognitoWindows: [URL]) -> Bool {
        return incognitoWindows.contains(windowURL)
    }
    
    static func isPIPWindowPlayingVideo(_ windowURL: URL, pipWindows: [URL]) -> Bool {
        return pipWindows.contains(windowURL)
    }
    
    static func openURLInBrowser(_ url: URL) {
        NSWorkspace.shared.open(url)
    }
}
