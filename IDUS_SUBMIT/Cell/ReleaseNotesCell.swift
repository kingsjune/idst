//
//  ReleaseNotesCell.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import UIKit

class ReleaseNotesCell: UITableViewCell {
    var releaseTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 13)
        return textView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setLayout (){
        self.addSubview(releaseTextView)
        releaseTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseTextView.topAnchor.constraint(equalTo: self.topAnchor),
            releaseTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            releaseTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            releaseTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
