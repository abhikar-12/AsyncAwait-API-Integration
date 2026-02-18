**📱 GitHub Users App – SwiftUI (Async/Await + MVVM)**

A SwiftUI application that fetches and displays GitHub users using the GitHub Public API.
The app demonstrates modern iOS networking using Async/Await and follows the MVVM architecture pattern.


https://github.com/user-attachments/assets/91615a4a-943d-40f9-aef7-e7aced09340a




**🚀 Features**

    📡 Fetch users from GitHub API
    🖼 Load user avatar images using AsyncImage
    🔄 Swift Concurrency (Async/Await)
    🏗 MVVM Architecture
    ⏳ Loading State Handling
    ❌ Error Handling
    📱 NavigationStack with Detail View

**🏗 Architecture**
This project follows MVVM (Model-View-ViewModel):

🔹 Model – UserModel

    Conforms to Codable, Identifiable, Hashable
    Matches GitHub API JSON structure
🔹 ViewModel – UserViewModel

    Handles API request
    Manages loading & error states
    Uses @Published properties
🔹 View – ContentView

    Observes ViewModel using @StateObject
    Displays user list
    Navigates to detail screen
    
**📂Project Structure**

    GitHub-Users-SwiftUI
    │
    ├── Model
    │   └── UserModel.swift
    │
    ├── ViewModel
    │   └── UserViewModel.swift
    │
    ├── View
    │   ├── ContentView.swift
    │   └── UserDetailView.swift
    │
    └── App Entry

**📡 Networking Flow**

    Validate API URL
    Call API using URLSession.shared.data(from:)
    Decode JSON into [UserModel]
    Handle loading state
    Handle errors
    Update UI automatically via @Published
    
**💻 Example API Function**

    func fetchUserData() async {
        guard let url = URL(string: "https://api.github.com/users") else {
            errorMessage = "Invalid URL"
            return
        }
    
        isLoading = true
        errorMessage = nil
    
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            user = try JSONDecoder().decode([UserModel].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
        }
    
        isLoading = false
    }
