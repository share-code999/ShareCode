
import UIKit

protocol TLabelProtocol {
    var num: Int { get set }
    var style: UIFont.TextStyle { get set }
}

//TestLabel
class TLabel: UILabel, TLabelProtocol {
    var num: Int = 0
    var style: UIFont.TextStyle = .body
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(frame: CGRect, fontTextStyle: UIFont.TextStyle, text: String?) {
        self.init(frame: frame)
        self.style = fontTextStyle
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        
    }
    
}


let contentView = UIView()
var labels: [TLabel] = []

func setting() {
    
    //create Label
    let `default` = UILabel(frame: .zero)
    `default`.font = UIFont.systemFont(ofSize: 17)
    `default`.text = "default"
    
    let title1 = TLabel(frame: .zero, fontTextStyle: .title1, text: "title 1")
    let title2 = TLabel(frame: .zero, fontTextStyle: .title2, text: "title 2")
    let title3 = TLabel(frame: .zero, fontTextStyle: .title3, text: "title 3")
    let largeTitle = TLabel(frame: .zero, fontTextStyle: .largeTitle, text: "largetitle")
    let subheadline = TLabel(frame: .zero, fontTextStyle: .subheadline, text: "subheadline")
    let headline = TLabel(frame: .zero, fontTextStyle: .headline, text: "headline")
    let footnote = TLabel(frame: .zero, fontTextStyle: .footnote, text: "footnote")
    let caption1 = TLabel(frame: .zero, fontTextStyle: .caption1, text: "cpation 1")
    let caption2 = TLabel(frame: .zero, fontTextStyle: .caption2, text: "caption 2")
    let callout = TLabel(frame: .zero, fontTextStyle: .callout, text: "callout")
    let body = TLabel(frame: .zero, fontTextStyle: .body, text: "body")
    
    //append TLabel -- 넣은 순서대로 표시됨
    appendLabel(title1)
    appendLabel(title2)
    appendLabel(title3)
    appendLabel(largeTitle)
    appendLabel(subheadline)
    appendLabel(headline)
    appendLabel(footnote)
    appendLabel(caption1)
    appendLabel(caption2)
    appendLabel(callout)
    appendLabel(body)
    
    //set contentView frame
    let width = UIScreen.main.bounds.width/4
    let height = UIScreen.main.bounds.height/3
    contentView.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    
    
    //set color
    contentView.backgroundColor = .white
    title1.backgroundColor = .red
    title2.backgroundColor = .orange
    title3.backgroundColor = .yellow
    largeTitle.backgroundColor = .green
    subheadline.backgroundColor = .blue
    headline.backgroundColor = .brown
    footnote.backgroundColor = .cyan
    caption1.backgroundColor = .lightGray
    caption2.backgroundColor = .magenta
    callout.backgroundColor = .purple
    body.backgroundColor = .gray
    `default`.backgroundColor = .darkGray
    
    
    
    setLabelFontStyles(labels, callback: { labels in
        
        //set rect and add
        
        let defaultSize = `default`.sizeThatFits(contentView.frame.size)
        `default`.frame = CGRect(origin: .zero, size: defaultSize)
        contentView.addSubview(`default`)
        
        var yPoint: CGFloat = `default`.frame.height
        for label in labels {
            let newSize = label.sizeThatFits(contentView.frame.size)
            label.frame = CGRect(origin: CGPoint(x: 0, y: yPoint), size: newSize)
            yPoint += label.frame.height
            contentView.addSubview(label)
        }
    })
}

func appendLabel(_ label: TLabel) {
    //set num
    label.num = labels.count
    //append
    labels.append(label)
}

func setLabelFontStyles(_ tLabels: [TLabel], callback: @escaping ([UILabel]) -> Void) {
    var labels: [TLabel] = []
    for tLabel in tLabels {
        labels.append(tLabel)
        tLabel.font = UIFont.preferredFont(forTextStyle: tLabel.style)
        tLabel.adjustsFontForContentSizeCategory = true
    }
    labels.sort(by: {$0.num < $1.num})
    callback(labels)
}

setting()
contentView
