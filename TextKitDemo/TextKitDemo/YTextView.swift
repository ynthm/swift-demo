//
//  YTextView.swift
//  TextKitDemo
//
//  Created by Ethan Wang on 2020/1/15.
//  Copyright © 2020 Ethan Wang. All rights reserved.
//

import SwiftUI

struct YTextView: UIViewRepresentable {
    var attributedString: NSAttributedString
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
       
        
        let textView = UITextView()
        
        
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
//        if let selectedTextRange = textView.selectedTextRange {
//                let caretRect = textView.caretRect(for: selectedTextRange.start)
//                textView.scrollRectToVisible(caretRect, animated: false)
//        }
        
        return textView
    }
    
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedString
    }
    
    
    class Coordinator : NSObject, UITextViewDelegate {
        var textView: YTextView
        
        init(_ uiTextView: YTextView) {
            self.textView = uiTextView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.textView.attributedString = textView.attributedText
        }
    }
}

struct YTextView_Previews: PreviewProvider {
    static var previews: some View {
        YTextView(attributedString: NSAttributedString(string: "Test"))
    }
}
