import Cocoa

class KeyboardShortcutHelper {
    static let shared = KeyboardShortcutHelper()
    
    private init() {}
    
    func registerShortcuts() {
        let captureShortcut = NSMenuItem(title: "Capture", action: #selector(captureShortcutPressed), keyEquivalent: "c")
        captureShortcut.keyEquivalentModifierMask = [.command, .shift]
        NSApp.mainMenu?.item(withTitle: "Capture")?.submenu?.addItem(captureShortcut)
        
        let searchShortcut = NSMenuItem(title: "Search", action: #selector(searchShortcutPressed), keyEquivalent: "s")
        searchShortcut.keyEquivalentModifierMask = [.command, .shift]
        NSApp.mainMenu?.item(withTitle: "Search")?.submenu?.addItem(searchShortcut)
        
        let exportShortcut = NSMenuItem(title: "Export", action: #selector(exportShortcutPressed), keyEquivalent: "e")
        exportShortcut.keyEquivalentModifierMask = [.command, .shift]
        NSApp.mainMenu?.item(withTitle: "Export")?.submenu?.addItem(exportShortcut)
    }
    
    @objc private func captureShortcutPressed() {
        NotificationCenter.default.post(name: .captureShortcutPressed, object: nil)
    }
    
    @objc private func searchShortcutPressed() {
        NotificationCenter.default.post(name: .searchShortcutPressed, object: nil)
    }
    
    @objc private func exportShortcutPressed() {
        NotificationCenter.default.post(name: .exportShortcutPressed, object: nil)
    }
}
