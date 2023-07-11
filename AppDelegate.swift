import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main window
        let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 800, height: 600)
        let windowRect = NSRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        window = NSWindow(contentRect: windowRect, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: false)
        window.center()
        window.title = "Screen Capture App"
        window.makeKeyAndOrderFront(nil)
        
        // Set up the menu bar
        let menu = NSMenu()
        menu.addItem(withTitle: "Capture", action: #selector(captureAction), keyEquivalent: "")
        menu.addItem(withTitle: "Settings", action: #selector(settingsAction), keyEquivalent: "")
        menu.addItem(withTitle: "Search", action: #selector(searchAction), keyEquivalent: "")
        menu.addItem(withTitle: "Ask", action: #selector(askAction), keyEquivalent: "")
        menu.addItem(withTitle: "Export", action: #selector(exportAction), keyEquivalent: "")
        NSApp.mainMenu = menu
        
        // Set up the status bar item
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem.button {
            button.title = "Capture"
            button.action = #selector(captureAction)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up resources and save any necessary data
    }
    
    @objc func captureAction() {
        // Handle capture action
    }
    
    @objc func settingsAction() {
        // Handle settings action
    }
    
    @objc func searchAction() {
        // Handle search action
    }
    
    @objc func askAction() {
        // Handle ask action
    }
    
    @objc func exportAction() {
        // Handle export action
    }
}
