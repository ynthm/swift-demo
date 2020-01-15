//
//  ContentView.swift
//  TextKitDemo
//
//  Created by Ethan Wang on 2020/1/15.
//  Copyright © 2020 Ethan Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var who = "Ethan"
    var body: some View {
        let string = "This is a test string"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 36)
        ]
        
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        
        let attributedString1 = NSMutableAttributedString(string: string)
        attributedString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
        attributedString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
        attributedString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
        attributedString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
        attributedString1.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))
        
        
        let attributedString3 = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString3.addAttribute(.link, value: "https://ynthm.com", range: NSRange(location: 19, length: 55))
        
        
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        
        let titleString = NSAttributedString(string: "Read all about it!", attributes: titleAttributes)
        
        
        return VStack {
            TextWithAttributedString(attributedString: attributedString)
            TextWithAttributedString(attributedString: attributedString1)
            TextWithAttributedString(attributedString: titleString)
            YTextView(attributedString: attributedString3)
        }
    }
    
    
    public func test1(url: URL) -> Void {
        
        
        let attributedString = NSAttributedString(string: "This is a test", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        let printFormatter = UISimpleTextPrintFormatter(attributedText: attributedString)
        let renderer = UIPrintPageRenderer()
        renderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        // A4 size
        let pageSize = CGSize(width: 595.2, height: 841.8)
        
        // Use this to get US Letter size instead
        // let pageSize = CGSize(width: 612, height: 792)
        
        // create some sensible margins
        let pageMargins = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        
        // calculate the printable rect from the above two
        let printableRect = CGRect(x: pageMargins.left, y: pageMargins.top, width: pageSize.width - pageMargins.left - pageMargins.right, height: pageSize.height - pageMargins.top - pageMargins.bottom)
        
        // and here's the overall paper rectangle
        let paperRect = CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height)
        
        
        renderer.setValue(NSValue(cgRect: paperRect), forKey: "paperRect")
        renderer.setValue(NSValue(cgRect: printableRect), forKey: "printableRect")
        
        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, paperRect, nil)
        renderer.prepare(forDrawingPages: NSMakeRange(0, renderer.numberOfPages))
        
        
        let bounds = UIGraphicsGetPDFContextBounds()
        
        for i in 0  ..< renderer.numberOfPages {
            UIGraphicsBeginPDFPage()
            
            renderer.drawPage(at: i, in: bounds)
        }
        
        UIGraphicsEndPDFContext()
        
        
        do {
            try pdfData.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
