//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Adrian Minnich on 20/04/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    static let identifier = "WeatherTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    func configure(with model: DailyWeather) {

        self.lowTempLabel.text = "\(Int(model.temp.min - 273.15))°"
        self.highTempLabel.text = "\(Int(model.temp.max - 273.15))°"
        
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
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
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}
