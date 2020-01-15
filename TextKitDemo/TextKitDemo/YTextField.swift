//
//  YTextField.swift
//  TextKitDemo
//
//  Created by Ethan Wang on 2020/1/15.
//  Copyright © 2020 Ethan Wang. All rights reserved.
//

import SwiftUI

class ViewWithLabel : UIView {
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(label)
        label.numberOfLines = 0
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setString(_ attributedString:NSAttributedString) {
        self.label.attributedText = attributedString
    }
}

struct TextWithAttributedString: UIViewRepresentable {
    
    var attributedString:NSAttributedString
    
    func makeUIView(context: Context) -> ViewWithLabel {
        let view = ViewWithLabel(frame:CGRect.zero)
        return view
    }
    
    func updateUIView(_ uiView: ViewWithLabel, context: UIViewRepresentableContext<TextWithAttributedString>) {
        uiView.setString(attributedString)
    }
}

struct TextWithAttributedString_Previews: PreviewProvider {
    static var previews: some View {
        TextWithAttributedString(attributedString: NSAttributedString(string: "Test"))
    }
}
