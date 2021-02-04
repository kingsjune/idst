//
//  InfoCell.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import UIKit

class InfoCell: UITableViewCell {
      static var cellHeight: CGFloat {
          return 50
      }
      
      var infoLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 14)
          return label
      }()
      
      var detailInfoLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 14)
          return label
      }()

      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          setLayout()
      }
      
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
          
      func setLayout (){
          self.addSubview(infoLabel)
          self.addSubview(detailInfoLabel)
          infoLabel.translatesAutoresizingMaskIntoConstraints = false
          detailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
              infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
              detailInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              detailInfoLabel.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor)
          ])
      }
}
