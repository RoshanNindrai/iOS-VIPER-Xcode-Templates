//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

final class ___VARIABLE_moduleName___Wireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: <#Storyboard name#>, bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ___VARIABLE_moduleName___ViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = ___VARIABLE_moduleName___Interactor()
        let presenter = ___VARIABLE_moduleName___Presenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ___VARIABLE_moduleName___Wireframe: ___VARIABLE_moduleName___WireframeInterface {
    
    func navigate(using option: Driver<___VARIABLE_moduleName___NavigationOption>) {
        subscribe(to: option, unowning: self, navigationBlock: ___VARIABLE_moduleName___Wireframe.navigate(using: ))
    }

    func navigate(to option: ___VARIABLE_moduleName___NavigationOption) {
    }
}