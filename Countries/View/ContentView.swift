//
//  ContentView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CountriesView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
