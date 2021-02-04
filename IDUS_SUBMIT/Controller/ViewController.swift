//
//  ViewController.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(ScreenShotCell.self, forCellReuseIdentifier: "ScreenShotCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(ReleaseNotesCell.self, forCellReuseIdentifier: "ReleaseNotesCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
        tableView.register(GenreCell.self, forCellReuseIdentifier: "GenreCell")
        tableView.sectionHeaderHeight = 0
        tableView.backgroundColor = UIColor.white
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        return tableView
    }()
    
    var results : [Results] = []
    var isOpened:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "아이디어스(idus)"
        self.view.backgroundColor = UIColor.white
        self.callAPI()
    }
    
    func callAPI() {
        APIService.shared.requestAPI(onComplete: { (res) in
            switch res {
            case .success(let data):
                guard let res = data.results else {
                    return
                }
                self.results = res
                DispatchQueue.main.async {
                    self.setLayout()
                }
                break
            case .failure(let err):
                
                print(err)
                break
            }
        })
    }
    func setLayout()  {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            if !self.isOpened{
                return 1
            }else{
                return 2
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScreenShotCell", for: indexPath) as? ScreenShotCell else { return UITableViewCell() }
                cell.results = self.results
                cell.backgroundColor = UIColor.white
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier:"InfoCell", for: indexPath) as? InfoCell else {
                    return UITableViewCell()
                }
                cell.accessoryType = .none
                cell.backgroundColor = UIColor.white
                cell.selectionStyle = .none
                cell.infoLabel.text = "파일 사이즈"
                cell.detailInfoLabel.text = Utils.shared.convertMb(kb: self.results.first?.fileSizeBytes ?? "12345667890")
                return cell
            case 2:
                if indexPath.row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier:"InfoCell", for: indexPath) as? InfoCell else {
                        return UITableViewCell()
                    }
                    cell.accessoryType = .checkmark
                    cell.backgroundColor = UIColor.white
                    cell.selectionStyle = .none
                    cell.infoLabel.text = "새로운 기능"
                    cell.detailInfoLabel.text = self.results.first?.version
                    return cell
                }
                else{
                    guard let cell = tableView.dequeueReusableCell(withIdentifier:"ReleaseNotesCell", for: indexPath) as? ReleaseNotesCell else {
                        return UITableViewCell()
                    }
                    if let releaseNotes = self.results.first?.releaseNotes {
                        cell.releaseTextView.text = releaseNotes
                    }
                    cell.backgroundColor = UIColor.white
        
                    return cell
                }
                
            case 3:
                guard let cell = tableView.dequeueReusableCell(withIdentifier:"DescriptionCell", for: indexPath) as? DescriptionCell else {
                    return UITableViewCell()
                }
                if let desc = self.results.first?.description {
                    cell.descTextView.text = desc
                }
                cell.backgroundColor = UIColor.white
                return cell
        
            case 4:
                guard let cell = tableView.dequeueReusableCell(withIdentifier:"GenreCell", for: indexPath) as? GenreCell else {
                    return UITableViewCell()
                }
                if let genres = self.results.first?.genres {
                    cell.setGenre(genres: genres)
                }
                cell.backgroundColor = UIColor.white
                return cell
            default:
                return UITableViewCell()
            }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 && indexPath.row == 0  {
            self.isOpened = !self.isOpened
            self.tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return ScreenShotCell.cellHeight
            case 1:
                return InfoCell.cellHeight
            case 2:
                if indexPath.row == 1{
                    return UITableView.automaticDimension
                }
                return InfoCell.cellHeight
            case 3:
                return UITableView.automaticDimension
            default:
                return GenreCell.cellHeight
            }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return .leastNormalMagnitude
        }
        return 20
    }
}
