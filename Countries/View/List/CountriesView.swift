//
//  CountriesView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct CountriesView: View {
    @State var list: [Country] = [Country(with: "Rússica"), Country(with: "Brasil"), Country(with: "Alemanha"), Country(with: "Argentina")]
    
    var body: some View {
        List {
            ForEach($list) { country in
                NavigationLink {
                    CountryView()
                } label: {
                    CountryRow()
                }
            }
        }
        .navigationTitle("Countries")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
