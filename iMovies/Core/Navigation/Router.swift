//
//  Router.swift
//  iMovies
//
//  Created by cefalo on 22/1/24.
//

import SwiftUI

struct Router: View {
    @State private var isLoginCompleted: Bool = false
    
    
    var body: some View {
        if !isLoginCompleted{
            AuthView(isLoginCompleted: $isLoginCompleted)
        } else {
            FeedView()
        }
    }
}

struct Router_Previews: PreviewProvider {
    static var previews: some View {
        Router()
    }
}


struct AuthView: View {
    
    @Binding var isLoginCompleted: Bool
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FeedView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
