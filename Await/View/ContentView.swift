//
//  ContentView.swift
//  Await
//
//  Created by Abhishek Kusalkar on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userView = UserViewModel()
    
    var body: some View {
        NavigationStack {
            if userView.isLoading {
                ProgressView()
            } else if let error = userView.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {

                    List(userView.user){ user in
                        NavigationLink(value: user) {
                            HStack {
                                AsyncImage(url: URL(string: user.avatar_url ?? "")) { Image in
                                    Image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                
                                VStack (alignment: .leading){
                                    Text(user.login ?? "")
                                        .font(.title3)
                                        .bold()
                                    
                                    Text(user.url ?? "")
                                        .font(.caption)
                                    
                                }
                            }
                        }
                    }
                    .navigationTitle("Github User")
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationDestination(for: UserModel.self, destination: { user in
                        UserDetailView(user: user)
                    })
            }
        }
        .task {
            await userView.fetchUserData()
        }
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
