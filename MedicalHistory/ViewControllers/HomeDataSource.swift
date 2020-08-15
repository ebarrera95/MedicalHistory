//
//  HomeDataSource.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    var patients: [Patient]
    
    let folders: [HomeFolder] = [
        HomeFolder(foldersName: "Deleted",
                   symbol: .init(symbolName: "trash.circle.fill",
                                 colour: .systemRed,
                                 size: 32,
                                 weight: .medium,
                                 scale: .default)
        ),
        HomeFolder(foldersName: "Archived",
                   symbol: .init(symbolName: "folder.circle.fill",
                                 colour: .systemBlue,
                                 size: 32,
                                 weight: .medium,
                                 scale: .default)
        ),
        HomeFolder(foldersName: "DMM",
                   symbol: .init(symbolName: "star.circle.fill",
                                 colour: .systemYellow,
                                 size: 32,
                                 weight: .medium,
                                 scale: .default)
        )
    ]
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.backgroundColor = .white
            collectionView?.register(PatientCell.self, forCellWithReuseIdentifier: PatientCell.reuseIdentifier)
            collectionView?.register(HomeFolderCell.self, forCellWithReuseIdentifier: HomeFolderCell.reuseIdentifier)
            collectionView?.register(ReusableHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: ReusableHeaderView.reuseIdentifier)
            
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    init(patients: [Patient]) {
        self.patients = patients
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else { fatalError() }
        switch section {
        case .folders:
            return folders.count
        case .patientList:
            return patients.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else { fatalError() }
        switch section {
        case .folders:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFolderCell.reuseIdentifier, for: indexPath)
            guard let folderCell = cell as? HomeFolderCell else { fatalError() }
            folderCell.homeFolder = folders[indexPath.row]
            return folderCell
        case .patientList:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PatientCell.reuseIdentifier, for: indexPath)
            guard let patientCell = cell as? PatientCell else { fatalError() }
            patientCell.patientName = patients[indexPath.row].name
            return patientCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: ReusableHeaderView.reuseIdentifier, for: indexPath)
            guard let header = reusableView as? ReusableHeaderView else { fatalError() }
            header.title = NSAttributedString(string: "Patientes", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24)])
            return header
        default:
            assert(false, "unexpected element")
        }
    }
}

extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = HomeSection(rawValue: indexPath.section) else { fatalError() }
        switch section {
        case .folders:
            return CGSize(width: (collectionView.frame.width - 32)/2 - 4, height: 95)
        case .patientList:
            return CGSize(width: collectionView.frame.width, height: 44)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let section = HomeSection(rawValue: section) else { fatalError() }
        switch section {
        case .folders:
            return .zero
        case .patientList:
            return CGSize(width: collectionView.frame.width, height: 55)
        }
    }
}

private enum HomeSection: Int, CaseIterable {
    case folders
    case patientList
}
