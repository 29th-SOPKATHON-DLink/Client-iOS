//
//  ViewController.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/20.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var groupTableView: UITableView!
    
    var homeContentList: [GroupContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTableView()
        initDataList()
    }
    @IBAction func touchUpCreateButton(_ sender: Any) {
        guard let dvc = UIStoryboard(name: "CreateGroup", bundle: nil).instantiateViewController(withIdentifier: "CreateGroupVC") as? CreateGroupVC else { return }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    func setTableView() {
        let homeTableXib = UINib(nibName: GroupTableViewCell.className, bundle: nil)
        groupTableView.register(homeTableXib, forCellReuseIdentifier: GroupTableViewCell.className)
        
        groupTableView.dataSource = self
        groupTableView.delegate = self
        
        groupTableView.backgroundColor = .clear
    }
    
    func initDataList() {
        homeContentList.append(contentsOf: [
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "check_icon", backgroundImageName: "group_list_box"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "check_icon", backgroundImageName: "group_list_box"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
        ])
    }
}

extension MainVC {
    private func initUI() {
        let rootLayer = view.getGradient(startColor: .bgStartColor, endColor: .bgEndColor)
        view.layer.insertSublayer(rootLayer, at: 0)
        
    }
}
    
// MARK: - Extension Part
extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.className) as? GroupTableViewCell else {return UITableViewCell()}
        
        cell.setData(homeData: homeContentList[indexPath.row])
        return cell
    }
}

