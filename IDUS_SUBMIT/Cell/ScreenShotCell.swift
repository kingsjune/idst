//
//  ScreenShotCell.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//
import UIKit
import SDWebImage

class ScreenShotCollectionViewCell: UICollectionViewCell {

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout (){
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
}

class ScreenShotCell: UITableViewCell {
    static var cellHeight: CGFloat {
        return 500.0
    }
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(ScreenShotCollectionViewCell.self, forCellWithReuseIdentifier: "ScreenShotCell")
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    
    var results : [Results] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
  
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout (){
        collectionView.delegate = self
        collectionView.dataSource = self
        self.contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            collectionView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
}

extension ScreenShotCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = results.first?.screenShotUrl.count  else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenShotCell", for: indexPath) as? ScreenShotCollectionViewCell else{
            return UICollectionViewCell()
        }
        let transformer = SDImageResizingTransformer(size: CGSize(width: 281, height: 500), scaleMode: .aspectFill)
        cell.imageView.sd_setImage(with: URL(string:(results.first?.screenShotUrl[indexPath.row])!), placeholderImage: nil, options: SDWebImageOptions(rawValue: 3) , context: [.imageTransformer: transformer])
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = self.collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
}


