//
//  ListView.swift
//  rentaboat
//
//  Created by yasin on 24.03.2024.
//

import SwiftUI

struct ListView: View {
    var action: Action
    @Environment(\.dismiss) var dismiss
    var cityList: [String]
    @State var searchTerm: String = ""
    @Binding var selectedCity: String
    
    var filteredCities: [String] {
        guard !searchTerm.isEmpty else {
            return cityList
        }
        return cityList.filter { $0.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    init(cityList: [String], selectedCity: Binding<String>, action: Action = nil) {
        self.cityList = cityList
        self.action = action
        self._selectedCity = selectedCity
    }
    
    
    var body: some View {
        NavigationStack {
            List(filteredCities, id: \.self) { city in
                
                Button(action: {
                    print("tapped \(city)")
                    self.selectedCity = city
                    if let action {
                        action()
                    }
                    dismiss()
                }, label: {
                    Text("\(city)")
                })
            }
            .navigationTitle("Cities")
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Cities")
            .foregroundColor(.black)

        }
    }
}

#Preview {
    ListView(cityList: ["İstanbul","Antalya","İzmir"], selectedCity: .constant(""))
}
