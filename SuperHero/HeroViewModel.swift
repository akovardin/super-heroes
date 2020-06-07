//
//  HeroViewModel.swift
//  SuperHero
//
//  Created by Artem Kovardin on 07.06.2020.
//  Copyright © 2020 Artem Kovardin. All rights reserved.
//

import Foundation
import Combine

class HeroViewModel: ObservableObject {

    @Published var hero: Hero?
    var cancellation: AnyCancellable?
    let service = HeroesService()
   
    func getHero(id: Int) {
       cancellation = service.get(id: id)
       .mapError({ (error) -> Error in
           print(error)
           return error
       })
       .sink(receiveCompletion: { _ in },
             receiveValue: { hero in
               self.hero = hero
       })
   }
}
