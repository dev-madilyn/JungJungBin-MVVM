//
//  HomeVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/22.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: Properties
    private let naviView = HomeNaviView()
    private let storyCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.backgroundColor = .yellow
    }
    private let grayLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    private let feedTV = UITableView().then {
        $0.backgroundColor = .yellow
    }
    
    var storyDummyData: HomeStoryModel = [
        HomeStoryModelElement(profileImageName: "avatar1", userID: "user1"),
        HomeStoryModelElement(profileImageName: "avatar2", userID: "user2"),
        HomeStoryModelElement(profileImageName: "avatar3", userID: "user3"),
        HomeStoryModelElement(profileImageName: "avatar4", userID: "user4"),
        HomeStoryModelElement(profileImageName: "avatar5", userID: "user5"),
        HomeStoryModelElement(profileImageName: "avatar6", userID: "user6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubviews([naviView, storyCV, grayLine,feedTV])
        
        storyCV.dataSource = self
        feedTV.dataSource = self
        
        naviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(44)
        }
        
        storyCV.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(72)
        }
        
        grayLine.snp.makeConstraints {
            $0.top.equalTo(storyCV.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        feedTV.snp.makeConstraints {
            $0.top.equalTo(grayLine.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        let cell = StoryCVC()
        cell.setData(data: storyDummyData[indexPath.row])
        
        return cell
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
