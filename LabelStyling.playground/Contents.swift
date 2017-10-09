import UIKit
import PlaygroundSupport

class LabelViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        var titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 20, y: 20, width: 300, height: 35)
        titleLabel.text = "Swift API Design"
        titleLabel.style(.title)
        
        let yOffset = titleLabel.frame.origin.y + titleLabel.frame.size.height
        var subTitleLabel = UILabel()
        subTitleLabel.frame = CGRect(x: 20, y: yOffset, width: 300, height: 20)
        subTitleLabel.text = "Simple swift API for styling labels."
        subTitleLabel.style(.body)
        
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
    
    init(fontName: String = ".SFUIText", fontSize: CGFloat = 17, color: UIColor = .black) {
        self.fontName = fontName
        self.fontSize = fontSize
        self.color = color
    }
}

enum LabelType {
    
    case title
    case headline
    case body
    case subhead
    case footnote
    case none
}

protocol LabelStylable {
    
    var titleStyle: LabelStyle { get }
    var headlineStyle: LabelStyle { get }
    var bodyStyle: LabelStyle { get }
    var subheadStyle: LabelStyle { get }
    var footnoteStyle: LabelStyle { get }
}

extension LabelStylable where Self: UILabel {
    
    var titleStyle: LabelStyle {
        return LabelStyle(fontSize: 28.0)
    }
    
    var headlineStyle: LabelStyle {
        return LabelStyle(fontSize: 17.0, color: .darkGray)
    }
    
    var bodyStyle: LabelStyle {
        return LabelStyle(fontSize: 17.0, color: .darkGray)
    }
    
    var subheadStyle: LabelStyle {
        return LabelStyle(fontSize: 17.0, color: .darkGray)
    }
    
    var footnoteStyle: LabelStyle {
        return LabelStyle(fontSize: 17.0, color: .darkGray)
    }
    
    mutating func style(_ type: LabelType) {
        
        switch type {
        case .title: apply(style: titleStyle)
        case .headline: print("Need to implement")
        case .body: apply(style: bodyStyle)
        case .subhead: print("Need to implement")
        case .footnote: print("Need to implement")
        case .none: print("no styling applied")
        }
    }
    
    private func apply(style: UIStyle) {
        
        self.font = UIFont(name: style.fontName, size: style.fontSize)
        self.textColor = style.color
    }
}

extension UILabel: LabelStylable {}

