//
//  UserViewModel.swift
//  Await
//
//  Created by Abhishek Kusalkar on 18/02/26.
//

import Foundation

class UserViewModel : ObservableObject {
    
    @Published var user: [UserModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
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
}
