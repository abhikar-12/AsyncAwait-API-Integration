//
//  UserDetailView().swift
//  Await
//
//  Created by Abhishek Kusalkar on 18/02/26.
//

import SwiftUI

struct UserDetailView: View {
    let user: UserModel
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.avatar_url ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            
            Text(user.login ?? "No Name")
                .font(.title)
            
            Text(user.url ?? "")
                .foregroundColor(.blue)
            Spacer()
        }
        .padding()
        .navigationTitle("User Detail")
        .navigationBarTitleDisplayMode(.automatic)
    }
}


#Preview {
    UserDetailView(user: UserModel(
        id: 1,
        login: "TestUser",
        avatar_url: "https://avatars.githubusercontent.com/u/1?v=4",
        url: "https://github.com/test"
    ))
}
