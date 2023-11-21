import UIKit

class editProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    
    // MARK: - Properties
        
        private var userProfile: UserProfile!
        
        // MARK: - Lifecycle Methods
        
        override func viewDidLoad() {
            super.viewDidLoad()
            loadUserProfile()
            setupUI()
        }
        
    // MARK: - UI Setup

        func setupUI() {
            // Populate UI elements with current user profile data
            usernameTextField.text = userProfile.username
            emailTextField.text = userProfile.email
            bioTextView.text = userProfile.bio
            
            // Add border to bioTextView
            bioTextView.layer.borderWidth = 1.0
            bioTextView.layer.borderColor = UIColor.gray.cgColor
            bioTextView.layer.cornerRadius = 5.0
        }

        
        // MARK: - Actions
        
        @IBAction func saveChangesButtonTapped(_ sender: UIButton) {
            // Update user profile with edited information
            userProfile.username = usernameTextField.text ?? ""
            userProfile.email = emailTextField.text ?? ""
            userProfile.bio = bioTextView.text
            
            // Save user profile
            saveUserProfile()
            
            // Dismiss the edit profile view controller
            navigationController?.popViewController(animated: true)
        }
        
        // MARK: - User Profile Persistence
        
        private func saveUserProfile() {
            do {
                let data = try JSONEncoder().encode(userProfile)
                UserDefaults.standard.set(data, forKey: "userProfile")
            } catch {
                print("Error encoding user profile: \(error.localizedDescription)")
            }
        }
        
        private func loadUserProfile() {
            if let data = UserDefaults.standard.data(forKey: "userProfile") {
                do {
                    userProfile = try JSONDecoder().decode(UserProfile.self, from: data)
                } catch {
                    print("Error decoding user profile: \(error.localizedDescription)")
                    userProfile = UserProfile(username: "", email: "", bio: "")
                }
            } else {
                userProfile = UserProfile(username: "", email: "", bio: "")
            }
        }
    }
