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
    @IBOutlet weak var weaherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherSituationLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        setUI()
    }
    
    //MARK: FUNCTIONS
    private func observeEvent() {
        viewModel.getWeather(lat: Constants.Locations.latBeijing, lon: Constants.Locations.lonBeijing)
        
        viewModel.eventHandler = {[weak self] event in
            switch event {
            case .loading:
                print("data is loading")
            case .stopLoading:
                print("data stopped loading")
            case .dataLoaded:
                print("data loaded")
                self?.setUI()
                
            case .error(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    private func setUI() {
        DispatchQueue.main.async {
            //self.view.translatesAutoresizingMaskIntoConstraints = false
            //self.weaherImage.translatesAutoresizingMaskIntoConstraints = false
            //self.locationLabel.translatesAutoresizingMaskIntoConstraints = false
            //self.weatherSituationLabel.translatesAutoresizingMaskIntoConstraints = false
            //self.weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            print("\(self.view.frame.height) HEIGHT")
            print("\(self.view.frame.width) WIDTH")
        }
        DispatchQueue.main.async {
            if let weatherSituation = self.viewModel.weatherModel {
                self.locationLabel.text = weatherSituation.name.uppercased()
                
                print("Lat: \(weatherSituation.coord.lon)\nLat: \(weatherSituation.coord.lat)")
                let weathers = weatherSituation.weather
                for weather in weathers {
                    self.weatherSituationLabel.text = weather.main
                    self.weatherDescriptionLabel.text = weather.description.uppercased()
                    
                    
                    if let icon = self.viewModel.getWeatherIcons()[weather.icon] {
                        self.weaherImage.setImage(with: icon)
                    } else {
                        self.weaherImage.image = UIImage(systemName: "questionmark")
                    }
                }
            }
        }
    }
}

