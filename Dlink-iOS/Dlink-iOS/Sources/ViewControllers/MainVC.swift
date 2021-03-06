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
    var isSelected = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        //        NotificationCenter.default.addObserver(self, selector: #selector(setDataList(_:)), name: NSNotification.Name("Dismiss"), object: nil)
        
    }
    
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
            GroupContentData(groupName: "건대 코다차야 모임", groupMember: "김소연님 외 2명", profileImageName: "check_icon", backgroundImageName: "group_list_box"),
            GroupContentData(groupName: "성신여대 모임", groupMember: "김인환님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
        ])
    }
    
    func setDataList() {
        homeContentList = []
        homeContentList.append(contentsOf: [
            GroupContentData(groupName: "솝트 사랑해요", groupMember: "김두범님 외 8명", profileImageName: "check_icon", backgroundImageName: "group_list_box"),
            GroupContentData(groupName: "건대 코다차야 모임", groupMember: "김소연님 외 2명", profileImageName: "check_icon", backgroundImageName: "group_list_box"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "check_icon", backgroundImageName: "end"),
            GroupContentData(groupName: "건대 코다차야 모임", groupMember: "김소연님 외 2명", profileImageName: "check_icon", backgroundImageName: "end"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
            GroupContentData(groupName: "홍대 코다차야 모임", groupMember: "김민영님 외 4명", profileImageName: "icon_end", backgroundImageName: "end"),
        ])
        
        groupTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC else {return}
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.className) as? GroupTableViewCell else {return UITableViewCell()}
        
        cell.setData(homeData: homeContentList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

