//
//  SearchView.swift
//  SwiftPlayground
//
//  Created by Alexander Stonehouse on 24/9/19.
//  Copyright © 2019 alex. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var searchTerm: String = ""
    @ObservedObject var model: Search
    
    init(model: Search = Search()) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchTerm, onEditingChanged: { _ in }, onCommit: {
                        self.model.update(search: self.searchTerm)
                    })
                }.padding(4)
            }.overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 2)
            )
            List {
                 ForEach(self.model.routes) { result in
                     NavigationLink(destination: RouteView(route: result), label: {
                         Text("\(result.routeName)")
                     })
                 }
            }
        }.onAppear(perform: appear)
    }
    
    func appear() {
        
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View {
        SearchView(model: .fixture)
    }
}
