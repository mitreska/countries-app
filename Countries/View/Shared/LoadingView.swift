//
//  LoadingView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            
            Text("Loading...")
                .italic()
                .padding(.top, 5)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
