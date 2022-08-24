//
//  CountryView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct CountryView: View {
    
    @StateObject var viewModel: CountryViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    // aqui vai a bandeira e o nome com o iso3
                }
                
                if let countryDescription = viewModel.countryDescription {
                    Text(countryDescription.description)
                        .padding(20)
                        .font(.body)
                        .lineSpacing(1.5)
                    
                } else {
                    LoadingView()
                }
                
                Spacer()
            }
        }
        .navigationTitle(viewModel.country.areaName ?? "No name")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            viewModel.getDescription()
        })
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(viewModel: CountryViewModel(with: Country()))
    }
}
