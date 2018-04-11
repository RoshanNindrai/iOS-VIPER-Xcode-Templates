//
//  PokemonDetailsPresenter.swift
//  Viper-v2-Demo
//
//  Created by Donik Vrsnak on 4/11/18.
//  Copyright (c) 2018 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PokemonDetailsPresenter {

    // MARK: - Private properties -

    private unowned var _view: PokemonDetailsViewInterface
    private var _interactor: PokemonDetailsInteractorInterface
    private var _wireframe: PokemonDetailsWireframeInterface
    
    private let _pokemon: Pokemon
    private var _sections: [Section<PokemonDetailsItem>] = [] {
        didSet {
            _view.reloadData()
        }
    }

    // MARK: - Lifecycle -

    init(wireframe: PokemonDetailsWireframeInterface, view: PokemonDetailsViewInterface, interactor: PokemonDetailsInteractorInterface, pokemon: Pokemon) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        _pokemon = pokemon
    }
}

// MARK: - Extensions -

extension PokemonDetailsPresenter: PokemonDetailsPresenterInterface {
    
    private var descriptionSection: Section<PokemonDetailsItem> {
        return Section(
            items: [PokemonDetailsItem.description(_pokemon)]
        )
    }
    
    private var characteristicsSection: Section<PokemonDetailsItem> {
        return Section(
            items: [PokemonDetailsItem.characteristics(_pokemon)]
        )
    }
    
    func viewDidLoad() {
        _view.setViewTitle(_pokemon.name)
        _view.setHeaderImage(with: _pokemon.imageURL)
        
        _sections = [
            descriptionSection,
        ]
        _view.reloadData()
    }
    
    func numberOfSections() -> Int {
        return _sections.count
    }
    
    func numberOrItems(in section: Int) -> Int {
        let section = _sections[section]
        return section.items.count
    }
    
    func item(at indexPath: IndexPath) -> PokemonDetailsItem {
        let section = _sections[indexPath.section]
        return section.items[indexPath.row]
    }
}
