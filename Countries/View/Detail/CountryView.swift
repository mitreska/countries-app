//
//  CountryView.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct CountryView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding(.top, 20)
            
            Spacer()
        }
        .navigationTitle("BRASIL")
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
