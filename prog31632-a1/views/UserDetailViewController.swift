//
//  UserDetailViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-03-29.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet var userFieldLabels: [UILabel]!
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.image = UIImage(named: user.avatar)
        userFieldLabels[0].text = user.name
        userFieldLabels[1].text = user.address
        userFieldLabels[2].text = user.phoneNumber
        userFieldLabels[3].text = user.email
        userFieldLabels[4].text = String(user.age)
        userFieldLabels[5].text = user.gender
        userFieldLabels[6].text = (UIApplication.shared.delegate as! AppDelegate).userController.officialDateFormatter.string(from: user.dateOfBirth)
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
