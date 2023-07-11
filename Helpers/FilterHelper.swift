import Foundation

class FilterHelper {
    
    // MARK: - Properties
    
    private var excludedWebsites: [String] = []
    private var excludeIncognito: Bool = false
    private var excludePIP: Bool = false
    
    // MARK: - Public Methods
    
    func setExcludedWebsites(_ websites: [String]) {
        excludedWebsites = websites
    }
    
    func setExcludeIncognito(_ exclude: Bool) {
        excludeIncognito = exclude
    }
    
    func setExcludePIP(_ exclude: Bool) {
        excludePIP = exclude
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
