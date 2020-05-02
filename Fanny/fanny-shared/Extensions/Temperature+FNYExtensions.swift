//
//  Temperature+FNYExtensions.swift
//  Fanny
//
//  Created by Daniel Storm on 9/21/19.
//  Copyright © 2019 Daniel Storm. All rights reserved.
//

import Foundation

extension Temperature {

    func formattedTemperature(rounded: Bool = false) -> String {
        let temperatureUnitOption: TemperatureUnitOption = FNYUserPreferences.temperatureUnitOption()
        guard self.celsius > 1.0 else { return "--\(temperatureUnitOption.suffix)" }
        
        let temperature: Double
        switch temperatureUnitOption.index {
        case 0: temperature = self.celsius
        case 1: temperature = self.fahrenheit
        case 2: temperature = self.kelvin
        default: temperature = self.celsius
        }
        
        return rounded
            ? String(format: "%.0f\(temperatureUnitOption.suffix)", temperature.rounded())
            : String(format: "%.2f\(temperatureUnitOption.suffix)", temperature)
    }
    
}
