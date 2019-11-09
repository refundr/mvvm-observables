import UIKit

class CurrencyCell: UITableViewCell {
        
    var currencyRate : CurrencyRate? {
        didSet {
            guard let currencyRate = currencyRate else {
                return
            }
            currencyLabel.text = "\(currencyRate.currencyIso) and "
            rateLabel.text = "\(currencyRate.rate)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(currencyLabel)
        addSubview(rateLabel)
        setLabelConstraints()
        setRateLabelConstraints()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
               
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    let rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
        

    
    func setLabelConstraints() {
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        currencyLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        currencyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
    }
    
    func setRateLabelConstraints() {
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rateLabel.leadingAnchor.constraint(equalTo: currencyLabel.leadingAnchor,  constant: 80).isActive = true
        rateLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        rateLabel.trailingAnchor.constraint(equalTo: currencyLabel.trailingAnchor).isActive = true
        
    }
    
}
