import UIKit
import PlaygroundSupport

class LabelViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        var label1 = UILabel()
        label1.frame = CGRect(x: 20, y: 20, width: 350, height: 20)
        label1.text = "Swift API Design"
        label1.style(.headline)
        
        var yOffset = label1.frame.origin.y + label1.frame.size.height
        var label2 = UILabel()
        label2.frame = CGRect(x: 20, y: yOffset, width: 350, height: 20)
        label2.text = "This API is designed using apple guidelines"
        label2.style(.subhead)
        
        yOffset = label2.frame.origin.y + label2.frame.size.height
        var label3 = UILabel()
        label3.frame = CGRect(x: 20, y: yOffset, width: 350, height: 20)
        label3.text = "Explanation"
        label3.style(.title)
        
        yOffset = label3.frame.origin.y + label2.frame.size.height
        var label4 = UILabel()
        label4.frame = CGRect(x: 20, y: yOffset, width: 350, height: 20)
        label4.text = "Simple swift API for styling labels."
        label4.style(.body)
        
        yOffset = label4.frame.origin.y + label4.frame.size.height
        var label5 = UILabel()
        label5.frame = CGRect(x: 20, y: yOffset, width: 350, height: 20)
        label5.text = "© All rights reserved"
        label5.style(.footnote)
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
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
    
    init(fontStyle: UIFontTextStyle = .body, color: UIColor = .black) {
        let font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.init(fontName: font.fontName, fontSize: font.pointSize, color: color)
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
        return LabelStyle(fontStyle: .title1)
    }
    
    var headlineStyle: LabelStyle {
        return LabelStyle(fontStyle: .headline)
    }
    
    var bodyStyle: LabelStyle {
        return LabelStyle(fontStyle: .body)
    }
    
    var subheadStyle: LabelStyle {
        return LabelStyle(fontStyle: .subheadline)
    }
    
    var footnoteStyle: LabelStyle {
        return LabelStyle(fontStyle: .footnote)
    }
    
    mutating func style(_ type: LabelType) {
        
        switch type {
        case .title: apply(style: titleStyle)
        case .headline: apply(style: headlineStyle)
        case .body: apply(style: bodyStyle)
        case .subhead: apply(style: subheadStyle)
        case .footnote: apply(style: footnoteStyle)
        case .none: print("no styling applied")
        }
    }
    
    private func apply(style: UIStyle) {
        
        self.font = UIFont(name: style.fontName, size: style.fontSize)
        self.textColor = style.color
    }
}

extension UILabel: LabelStylable {
    
    var titleStyle: LabelStyle {
        return LabelStyle(fontSize: 12.0, color: .brown)
    }
    
    var headlineStyle: LabelStyle {
        return LabelStyle(color: .darkGray)
    }
    
    var bodyStyle: LabelStyle {
        return LabelStyle(color: .orange)
    }
    
    var subheadStyle: LabelStyle {
        return LabelStyle(color: .gray)
    }
    
    var footnoteStyle: LabelStyle {
        return LabelStyle(fontSize: 12.0, color: .purple)
    }
}

