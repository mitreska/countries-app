//
//  CountryRow.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI
import Kingfisher

struct CountryRow: View {
    let country: Country
    @EnvironmentObject var countriesViewModel: CountriesViewModel
    
    var body: some View {
        HStack {
            // change to kingfisher image component
            KFImage.url(URL(string: countriesViewModel.setImageURL(with: country)))
                .cacheMemoryOnly()
                .roundCorner(radius: .point(10), roundingCorners: .all)
                .resizable()
//                .onProgress { receivedSize, totalSize in  }
//                .onSuccess { result in
//                    print("https://www.kestrel.ws/flags/current/lg/\(country.iso3).png")
//                    print(result)
//                }
//                .onFailure { error in
//                    print("https://www.kestrel.ws/flags/current/lg/\(country.iso3!).png")
//                    print(error.localizedDescription)
//                }
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 80, height: 80, alignment: .center)
            
            Text(country.areaName ?? "Ops! No name found.")
                .textCase(.uppercase)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: Country())
    }
}
