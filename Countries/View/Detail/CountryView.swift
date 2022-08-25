//
//  CountryView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI
import Kingfisher

struct CountryView: View {
    
    @StateObject var viewModel: CountryViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    // aqui vai a bandeira e o nome com o iso3
                    KFImage.url(URL(string: viewModel.setImageURL()))
                        .cacheMemoryOnly()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120, alignment: .center)
                    
                    VStack {
                        Text(viewModel.country.areaName ?? "No name")
                            .font(.title)
                        
                        Text(viewModel.country.iso3 ?? "No ISO")
                            .font(.subheadline)
                            .foregroundColor(Color.secondary)
                            .italic()
                            .frame(alignment: .leading)
                    }
                    .padding(5)
                    
                    Spacer()
                }
                .padding(.leading, 45)
                
                Divider()
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
                
                Text("About \(viewModel.country.areaName ?? "")")
                    .font(.largeTitle)
                    .padding(.vertical, 5)
                
                if let countryDescription = viewModel.countryDescription {
                    Text(countryDescription.description)
                        .padding(.horizontal, 20)
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
