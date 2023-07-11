import Foundation

class SettingsManager {
    
    // MARK: - Properties
    
    private var excludedApps: [String] = []
    private var excludedWebsites: [String] = []
    private var excludeIncognito: Bool = false
    private var excludePIP: Bool = false
    
    // MARK: - Public Methods
    
    func setExcludedApps(_ apps: [String]) {
        excludedApps = apps
    }
    
    func setExcludedWebsites(_ websites: [String]) {
        excludedWebsites = websites
    }
    
    func setExcludeIncognito(_ exclude: Bool) {
        excludeIncognito = exclude
    }
    
    func setExcludePIP(_ exclude: Bool) {
        excludePIP = exclude
    }
    
    func isAppExcluded(_ appName: String) -> Bool {
        return excludedApps.contains(appName)
    }
    
    func isWebsiteExcluded(_ website: String) -> Bool {
        return excludedWebsites.contains(website)
    }
    
    func shouldExcludeIncognito() -> Bool {
        return excludeIncognito
    }
    
    func shouldExcludePIP() -> Bool {
        return excludePIP
    }
}
