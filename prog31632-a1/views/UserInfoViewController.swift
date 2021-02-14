//
//  HomeViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-05.
//

import UIKit

class UserInfoViewController: UIViewController, UITextFieldDelegate {
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "20200527-_DSC0969")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    @IBAction func submitButton(_ sender: UIBarButtonItem) {
        let name = userInfoTextFields[0].text!
        let email = userInfoTextFields[3].text!
        let alert = UIAlertController(title: "Thanks for your time.", message: "Your name is \"\(name)\", your email is \"\(email)\".", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBOutlet var userInfoTextFields: [UITextField]!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        ageLabel.text = String("\(Int(sender.value))")
    }

    
    @objc func touchElsewhere() {
        view.endEditing(true)
    }
    
}
