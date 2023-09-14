//
//  ViewController.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    //MARK: PROPERTIES
    private var viewModel = WeatherViewModel()
    
    //MARK: VISUAL COMPONENTS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
    }
    
    //MARK: FUNCTIONS
    private func observeEvent() {
        viewModel.getWeather()
        viewModel.eventHandler = { [weak self] event in
            
            switch event {
            case .loading:
                print("data is loading")
            case .stopLoading:
                print("data stopped loading")
            case .dataLoaded:
                print("data loaded")
                
            case .error(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
}

