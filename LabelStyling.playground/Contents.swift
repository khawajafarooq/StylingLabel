import UIKit
import PlaygroundSupport

class LabelViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        var titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 20, y: 20, width: 300, height: 24)
        titleLabel.text = "Swift API Design"
        titleLabel.style(.header)
        
        let yOffset = titleLabel.frame.origin.y + titleLabel.frame.size.height
        var subTitleLabel = UILabel()
        subTitleLabel.frame = CGRect(x: 20, y: yOffset, width: 300, height: 20)
        subTitleLabel.text = "Simple swift API for styling labels."
        subTitleLabel.style(.regular)
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = LabelViewController()

protocol UIStyle {
    
    var color: UIColor { get }
    var fontName: String { get }
    var fontSize: CGFloat { get }
}

struct LabelStyle: UIStyle {
    
    var fontName: String
    var fontSize: CGFloat
    var color: UIColor
}

enum LabelType {
    
    case header
    case regular
    case none
}

protocol LabelStylable {
    
    var headerLabel: LabelStyle { get }
    var regularLabel: LabelStyle { get }
}

extension LabelStylable where Self: UILabel {
    
    var headerLabel: LabelStyle {
        return LabelStyle(fontName: ".SFUIText", fontSize: 20.0, color: .darkGray)
    }
    
    var regularLabel: LabelStyle {
        return LabelStyle(fontName: ".SFUIText", fontSize: 14.0, color: .darkGray)
    }
    
    mutating func style(_ type: LabelType) {
        
        switch type {
        case .header: apply(headerLabel)
        case .regular: apply(regularLabel)
        case .none: print("no styling applied")
        }
    }
    
    private func apply(_ style: UIStyle) {
        
        self.font = UIFont(name: style.fontName, size: style.fontSize)
        self.textColor = style.color
    }
}

extension UILabel: LabelStylable {
    var headerLabel: LabelStyle {
        return LabelStyle(fontName: ".SFUIText", fontSize: 20.0, color: .brown)
    }
}
