//
//  CountryRow.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import SwiftUI

struct CountryRow: View {
    var body: some View {
        HStack {
            Image("placeholder")
                .padding()
                .frame(width: 70.0, height: 55.0)
            
            Text("Brasil")
                .textCase(.uppercase)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow()
    }
}
