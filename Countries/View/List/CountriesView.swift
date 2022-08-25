//
//  CountriesView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct CountriesView: View {
    @StateObject var viewModel = CountriesViewModel()
    
    
    var body: some View {
        if $viewModel.countriesList.isEmpty {
            LoadingView()
                .onAppear(perform: {
                    viewModel.fetchData()
                })
        } else {
            List {
                ForEach(viewModel.filteredCountries) { country in
                    NavigationLink {
                        CountryView(viewModel: CountryViewModel(with: country))
                    } label: {
                        CountryRow(country: country)
                    }
                }
            }
            .navigationTitle("Countries")
            .searchable(text: $viewModel.searchQuery, prompt: "Search for country")
            .onChange(of: viewModel.searchQuery) { _ in
                viewModel.filterCountries()
            }
            .navigationBarTitleDisplayMode(.large)
            .environmentObject(viewModel)
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
