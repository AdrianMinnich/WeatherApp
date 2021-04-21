//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Adrian Minnich on 21/04/2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    static let identifier = "WeatherCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var hourLabel: UILabel!
    
    func configure(with model: HourlyWeather) {
        self.tempLabel.text = "\(Int(model.temp - 273.15))°"
        self.iconImageView.contentMode = .scaleAspectFit
        
        let icon = model.weather[0].icon
        if icon.contains("01") {
            self.iconImageView.image = UIImage(named: "clear")
        }
        else if icon.contains("04") || icon.contains("03") || icon.contains("02"){
            self.iconImageView.image = UIImage(named: "cloud")
        }
        else if icon.contains("13") || icon.contains("10"){
            self.iconImageView.image = UIImage(named: "rain")
        }
        
        self.hourLabel.text = "\(getHourForDate(Date(timeIntervalSince1970: Double(model.dt)))):00"
    }
    
    func getHourForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return ""}
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: inputDate)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
