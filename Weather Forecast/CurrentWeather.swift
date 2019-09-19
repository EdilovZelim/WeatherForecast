//
//  CurrentWeather.swift
//  Weather Forecast
//
//  Created by MacBook on 09/01/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let icon: UIImage
}
extension CurrentWeather: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let temperature = JSON["temperature"] as? Double,
            let iconString = JSON["icon"] as? String else { return nil }
        let icon = WeatherIconManager(rawValue: iconString).image
        self.temperature = temperature
        self.icon = icon
    }
}

extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32)))˚C"
    }
}
