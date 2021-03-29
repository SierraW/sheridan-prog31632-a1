//
//  AvatarSelectionViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-03-28.
//

import UIKit

class AvatarSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as! AvatarCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.cellImage.image = UIImage(named: "avatar1")
        case 1:
            cell.cellImage.image = UIImage(named: "avatar2")
        default:
            cell.cellImage.image = UIImage(named: "avatar3")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.avatar = "avatar\(indexPath.row + 1)"
        dismiss(animated: true)
    }
    
    var avatar: String = "avatar0"
    var onDismiss: (String) -> Void = {name in}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        onDismiss(avatar)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
