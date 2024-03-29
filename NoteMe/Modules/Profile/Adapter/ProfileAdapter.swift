//
//  ProfileAdapter.swift
//  NoteMe
//
//  Created by Nikita Kudinovich on 23.01.24.
//

import UIKit

final class ProfileAdapter: NSObject {
    
    var sections: [ProfileSections] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var didSelectRow: ((ProfileSettingsRows) -> Void)?
    
    override init() {
        super.init()
        setupTableView()
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.addShadow()
        return tableView
    }()
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileSettingsCell.self)
        tableView.register(ProfileAccountCell.self)
    }
    
}

extension ProfileAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .account(let email):
            let cell: ProfileAccountCell = tableView.dequeue(at: indexPath)
            cell.setup(email: email)
            return cell
            
        case .settings(let rows):
            let cell: ProfileSettingsCell = tableView.dequeue(at: indexPath)
            cell.setup(rows[indexPath.row])
            return cell
        }
        
    }
    
    
}

extension ProfileAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileTableViewHeader()
        header.text = sections[section].headerText
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        
        switch section {
        case .settings(let rows):
            didSelectRow?(rows[indexPath.row])
        default: break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension ProfileAdapter: ProfileAdapterProtocol {
        func reloadData(with sections: [ProfileSections]) {
            self.sections = sections
        }
        
        func makeTableView() -> UITableView {
            return tableView
        }
}
