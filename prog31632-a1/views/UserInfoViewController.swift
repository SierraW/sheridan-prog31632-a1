//
//  HomeViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-05.
//

import UIKit

class UserInfoViewController: UIViewController, UITextFieldDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "20200527-_DSC0969")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var avatar: String = "avatar0"

    @IBAction func submitButton(_ sender: UIBarButtonItem) {
        let name = userInfoTextFields[0].text!
        let address = userInfoTextFields[1].text!
        let phoneNumber = userInfoTextFields[2].text!
        let email = userInfoTextFields[3].text!
        let age = Int(ageSlider.value)
        let gender = genderSwitch.isOn ? "Female" : "Male"
        let dateOfBirth = dateOfBirthDatePicker.date
        
        let user = User(name: name, address: address, phoneNumber: phoneNumber, email: email, age: age, gender: gender, dateOfBirth: dateOfBirth, avatar: avatar)
        
        var alert: UIAlertController
        if (mainDelegate.userController.insert(data: user)) {
            alert = UIAlertController(title: "Data Saved!", message: "Your name is \"\(name)\", your email is \"\(email)\".", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "Data Not Save.", message: "Your name is \"\(name)\", your email is \"\(email)\".", preferredStyle: .alert)
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBOutlet var userInfoTextFields: [UITextField]!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfBirthDatePicker.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let avatarClick = UITapGestureRecognizer(target: self, action: #selector(changeAvatar))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(avatarClick)
        
        avatarImage.image = UIImage(named: avatar)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        ageLabel.text = String("\(Int(sender.value))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AvatarSelectionViewController
        destinationVC.avatar = avatar
        destinationVC.onDismiss = { name in
            self.avatarImage.image = UIImage(named: name)
        }
    }
    
    @objc func changeAvatar() {
        performSegue(withIdentifier: "ShowAvatarDetail", sender: self)
    }
    
}
