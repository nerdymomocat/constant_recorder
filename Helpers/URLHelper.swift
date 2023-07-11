import Foundation

struct URLHelper {
    static func isExcludedApp(_ appName: String, excludedApps: [String]) -> Bool {
        return excludedApps.contains(appName)
    }
    
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
        // Code to open URL in browser
    }
}
