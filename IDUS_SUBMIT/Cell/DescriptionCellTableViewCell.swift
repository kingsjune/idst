//
//  DescriptionCellTableViewCell.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import UIKit

class DescriptionCell: UITableViewCell {

    var descTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 13)
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setLayout (){
        self.addSubview(descTextView)
        descTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descTextView.topAnchor.constraint(equalTo: self.topAnchor),
            descTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
