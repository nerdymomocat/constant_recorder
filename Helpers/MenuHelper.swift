import Cocoa

class MenuHelper {
    
    // MARK: - Properties
    
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    private let menu = NSMenu()
    private let captureManager: CaptureManager
    private let settingsManager: SettingsManager
    private let searchManager: SearchManager
    private let askManager: AskManager
    private let exportManager: ExportManager
    
    // MARK: - Initialization
    
    init(captureManager: CaptureManager, settingsManager: SettingsManager, searchManager: SearchManager, askManager: AskManager, exportManager: ExportManager) {
        self.captureManager = captureManager
        self.settingsManager = settingsManager
        self.searchManager = searchManager
        self.askManager = askManager
        self.exportManager = exportManager
        
        setupStatusItem()
        setupMenu()
    }
    
    // MARK: - Private Methods
    
    private func setupStatusItem() {
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("MenuBarIcon"))
        }
    }
    
    private func setupMenu() {
        menu.addItem(NSMenuItem(title: "Capture", action: #selector(captureAction), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Settings", action: #selector(settingsAction), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Search", action: #selector(searchAction), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Ask", action: #selector(askAction), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Export", action: #selector(exportAction), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quitAction), keyEquivalent: ""))
        
        statusItem.menu = menu
    }
    
    // MARK: - Menu Actions
    
    @objc private func captureAction() {
        captureManager.startCapture()
    }
    
    @objc private func settingsAction() {
        settingsManager.showSettings()
    }
    
    @objc private func searchAction() {
        searchManager.showSearch()
    }
    
    @objc private func askAction() {
        askManager.showAsk()
    }
    
    @objc private func exportAction() {
        exportManager.showExport()
    }
    
    @objc private func quitAction() {
        NSApplication.shared.terminate(self)
    }
}
