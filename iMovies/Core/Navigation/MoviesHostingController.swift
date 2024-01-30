//
//  MoviesHostingController.swift
//  iMovies
//
//  Created by cefalo on 19/1/24.
//

import Foundation
import SwiftUI

final class MoviesHostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    
    var onViewIsAppearing: (() -> Void)?
    var onViewDidDisappear: (() -> Void)?
    
    convenience init(rootView: ContentView, onViewIsAppearing: (() -> Void)?, onViewDidDisappear: (() -> Void)?) {
        self.init(rootView: rootView)
        self.onViewIsAppearing = onViewIsAppearing
        self.onViewDidDisappear = onViewDidDisappear
    }
}
