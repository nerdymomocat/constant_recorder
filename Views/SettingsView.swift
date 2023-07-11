import SwiftUI

struct SettingsView: View {
    @State private var selectedApps: [String] = []
    @State private var excludedWebsites: [String] = []
    @State private var excludeIncognito: Bool = false
    @State private var excludePIP: Bool = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Apps to Exclude")) {
                    List {
                        ForEach(selectedApps, id: \.self) { app in
                            Text(app)
                        }
                    }
                    .onDelete(perform: deleteSelectedApp)
                }
                
                Section(header: Text("Websites to Exclude")) {
                    List {
                        ForEach(excludedWebsites, id: \.self) { website in
                            Text(website)
                        }
                    }
                    .onDelete(perform: deleteExcludedWebsite)
                }
                
                Section(header: Text("Exclusion Options")) {
                    Toggle("Exclude Incognito Windows", isOn: $excludeIncognito)
                    Toggle("Exclude PIP Windows", isOn: $excludePIP)
                }
            }
        }
    }
    
    private func deleteSelectedApp(at offsets: IndexSet) {
        selectedApps.remove(atOffsets: offsets)
    }
    
    private func deleteExcludedWebsite(at offsets: IndexSet) {
        excludedWebsites.remove(atOffsets: offsets)
    }
}
