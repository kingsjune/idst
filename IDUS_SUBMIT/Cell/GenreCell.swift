//
//  GenreCell.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import UIKit

class GenreCell: UITableViewCell {
    static var cellHeight: CGFloat {
        return 100
    }
    var topLabel : UILabel = {
        let label = UILabel()
        label.text = "카테코리"
        return label
    }()
    var tagBtX : CGFloat = 10.0
    var isGenreSet:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setGenre(genres : [String])  {
        if !isGenreSet {
            for i in 0 ..< genres.count{
                let button = UIButton(type: .roundedRect)
                button.frame = CGRect(x: tagBtX, y: 50, width: 70, height: 20)
                button.setTitle(genres[i], for: .normal)
                tagBtX += button.frame.size.width + button.frame.origin.x
                self.addSubview(button)
            }
            isGenreSet = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setLayout (){
        self.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            topLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
