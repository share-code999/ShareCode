
import UIKit


let contentView = UIView()
var labels: [UILabel]?

func setting() {
    
    //create Label
    let title1 = UILabel()
    let title2 = UILabel()
    let title3 = UILabel()
    let largeTitle = UILabel()
    let subHeadLine = UILabel()
    let headLine = UILabel()
    let footNote = UILabel()
    let caption1 = UILabel()
    let caption2 = UILabel()
    let callout = UILabel()
    let body = UILabel()
    let `default` = UILabel()
    
    labels = [`default`, title1, title2, title3, largeTitle, subHeadLine, headLine, footNote, caption1, caption2, callout, body]
    
    //set size
    let width = UIScreen.main.bounds.width/4
    let height = UIScreen.main.bounds.height/2
    var yPoint: CGFloat = 0
    contentView.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    
    for label in labels! {
        label.frame
        = CGRect(x: 0, y: yPoint, width: width, height: 30)
        yPoint += label.frame.height
    }
    
    //set text
    title1.text = "title 1"
    title2.text = "title 2"
    title3.text = "title 3"
    largeTitle.text = "large title"
    subHeadLine.text = "sub head line"
    headLine.text = "head line"
    footNote.text = "foot note"
    caption1.text = "caption 1"
    caption2.text = "caption 2"
    callout.text = "callout"
    body.text = "body"
    `default`.text = "default"
    
    //set color
    contentView.backgroundColor = .white
    title1.backgroundColor = .red
    title2.backgroundColor = .orange
    title3.backgroundColor = .yellow
    largeTitle.backgroundColor = .green
    subHeadLine.backgroundColor = .blue
    headLine.backgroundColor = .brown
    footNote.backgroundColor = .cyan
    caption1.backgroundColor = .lightGray
    caption2.backgroundColor = .magenta
    callout.backgroundColor = .purple
    body.backgroundColor = .gray
    `default`.backgroundColor = .darkGray
    
    //add label
    contentView.addSubViews(labels!)
    
    
    //self.setLabelFontStyle([label], fontStyle: .callout)
    //font size
    let labelAndStyles: [UILabel:UIFont.TextStyle] = [
        title1:.title1,
        title2:.title2,
        title3:.title3,
        largeTitle:.largeTitle,
        subHeadLine:.subheadline,
        headLine:.headline,
        footNote:.footnote,
        caption1:.caption1,
        caption2:.caption2,
        callout:.callout,
        body:.body
    ]
    `default`.font = UIFont.systemFont(ofSize: 17)
    
    setLabelFontStyles(labelAndStyles)
    
}

func setLabelFontStyles(_ labelAndStyles: [UILabel:UIFont.TextStyle]) {
    for labelAndStyle in labelAndStyles {
        labelAndStyle.key.font = UIFont.preferredFont(forTextStyle: labelAndStyle.value)
        labelAndStyle.key.adjustsFontForContentSizeCategory = true
    }
}

setting()
contentView
