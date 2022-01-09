import UIKit

class ViewController: UIViewController {
    

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet weak var nicknameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGestures(){
        let gesture = UIGestureRecognizer(target: self, action: #selector(handleGesrure))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    private func addObservers(){
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboardWillShow),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboardWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
    
    private func removeObservers(){
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillHideNotification,
                            object: nil)
        NotificationCenter.default
            .removeObserver(self,
                            name: UIResponder.keyboardWillHideNotification,
                            object: nil)
    }

    @objc private func handleGesrure(){
        self.scrollView.endEditing(true)
    }
    
    @objc private func handleKeyboardWillShow(){
        self.scrollView.contentInset.bottom += 120
    }
    
    @objc private func handleKeyboardWillHide(){
        self.scrollView.contentInset.bottom = 0
    }
    
    @IBAction func pressOnButton(_ sender: Any) {
        
        nicknameTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        let nickname = nicknameTextfield.text
        let password = passwordTextfield.text
        
        if nickname == "boom" && password == "12345678"{
            print("Данные введены правильно")
        } else {
            print("Данные введены не верно, попробуйте снова")
        }
    }
}



