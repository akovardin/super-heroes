//
//  ContentView.swift
//  SuperHero
//
//  Created by Artem Kovardin on 07.06.2020.
//  Copyright © 2020 Artem Kovardin. All rights reserved.
//

import SwiftUI
import URLImage

struct HeroesView: View {
    @ObservedObject var viewModel = HeroesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                HStack {
                    VStack(alignment: .leading) {
                        
                        NavigationLink(destination: HeroView(id: hero.id)) {
                           Text(hero.name)
                        }
                        
                    }
                }
            }.navigationBarTitle("Heroes")
        }
    }
}

struct HeroView: View {
    var id: Int?
    
    @ObservedObject var viewModel = HeroViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.hero?.name ?? "")
            .font(.title)
            Image(url: viewModel.hero?.images?.large ?? "")
        }.onAppear {
            self.viewModel.getHero(id: self.id ?? 0)
        }
        
    }
}

struct Image: View {
    var url: String?

    var body: some View {
        guard let u = URL(string: url ?? "") else {
            return AnyView(Text("Loading..."))
        }
        return AnyView(URLImage(u))
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
    }
}
