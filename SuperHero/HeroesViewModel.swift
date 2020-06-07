//
//  HeroesViewModel.swift
//  SuperHero
//
//  Created by Artem Kovardin on 07.06.2020.
//  Copyright © 2020 Artem Kovardin. All rights reserved.
//

import Foundation
import Combine

class HeroesViewModel: ObservableObject {
    
    @Published var heroes: [Hero] = []
    var cancellation: AnyCancellable?
    let service = HeroesService()
    
    init() {
        fetchHeroes()
    }
    
    func fetchHeroes() {
        cancellation = service.fetch()
        .mapError({ (error) -> Error in
            print(error)
            return error
        })
        .sink(receiveCompletion: { _ in },
              receiveValue: { heroes in
                self.heroes = heroes
        })
    }
}
