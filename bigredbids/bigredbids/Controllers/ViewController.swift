//
//  ContentView.swift
//  bigredbids
//
//  Created by Daniel Xie on 11/23/23.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let topRectangle = UILabel()
    private let titleText = UILabel()
    private let loginText = UILabel()
    private let loginUsername = UITextField()
    private let loginPassword = UITextField()
    private let loginButton = UIButton()
    private let createText = UILabel()
    private let createUsername = UITextField()
    private let createPassword = UITextField()
    private let createButton = UIButton()
    private let incorrectLoginText = UILabel()
    
    // MARK: - Properties (data)
    
    //private var users: [Users] = Users.dummyData
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.brb.white
        
        setupTopRectangle()
        setupTitleText()
        setupLoginText()
        setupLoginUsername()
        setupLoginPassword()
        setupLoginButton()
        setupCreateText()
        setupCreateUsername()
        setupCreatePassword()
        setupCreateButton()
    }
    
    
    // MARK: - Setup Views
    
    private func setupTopRectangle() {
        topRectangle.backgroundColor = UIColor.brb.red
        topRectangle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topRectangle)
        
        NSLayoutConstraint.activate([
            topRectangle.topAnchor.constraint(equalTo: view.topAnchor),
            topRectangle.heightAnchor.constraint(equalToConstant: 160),
            topRectangle.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    
    private func setupTitleText() {
        titleText.text = "Big Red Bids"
        titleText.font = .systemFont(ofSize: 32, weight: .bold)
        titleText.textColor = UIColor.brb.white
        titleText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleText)
        
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            titleText.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    private func setupLoginText() {
        loginText.text = "Login"
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.font = .systemFont(ofSize: 24, weight: .bold)
        loginText.textColor = UIColor.brb.black
        loginText.textAlignment = .center
        
        view.addSubview(loginText)
        
        NSLayoutConstraint.activate([
            loginText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loginText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            loginText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 96)
        ])
    }
    
    private func setupLoginUsername() {
        loginUsername.placeholder = "Username"
        loginUsername.translatesAutoresizingMaskIntoConstraints = false
        loginUsername.borderStyle = .roundedRect
        loginUsername.autocapitalizationType = .none
        loginUsername.autocorrectionType = .no
        
        view.addSubview(loginUsername)
        
        NSLayoutConstraint.activate([
            loginUsername.leadingAnchor.constraint(equalTo: loginText.leadingAnchor),
            loginUsername.trailingAnchor.constraint(equalTo: loginText.trailingAnchor),
            loginUsername.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 12)
        ])
    }
    
    private func setupLoginPassword() {
        loginPassword.placeholder = "Password"
        loginPassword.translatesAutoresizingMaskIntoConstraints = false
        loginPassword.borderStyle = .roundedRect
        loginPassword.autocapitalizationType = .none
        loginPassword.autocorrectionType = .no
        
        view.addSubview(loginPassword)
        
        NSLayoutConstraint.activate([
            loginPassword.leadingAnchor.constraint(equalTo: loginText.leadingAnchor),
            loginPassword.trailingAnchor.constraint(equalTo: loginText.trailingAnchor),
            loginPassword.topAnchor.constraint(equalTo: loginUsername.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        loginButton.setTitleColor(UIColor.brb.white, for: .normal)
        loginButton.backgroundColor = UIColor.brb.red
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 16
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: loginPassword.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 32),
            loginButton.widthAnchor.constraint(equalToConstant: 96)
        ])
        
        loginButton.addTarget(self, action: #selector(checkValidLogin), for: .touchUpInside)
    }
    
    private func setupCreateText() {
        createText.text = "Create Account"
        createText.translatesAutoresizingMaskIntoConstraints = false
        createText.font = .systemFont(ofSize: 24, weight: .bold)
        createText.textColor = UIColor.brb.black
        createText.textAlignment = .center
        
        view.addSubview(createText)
        
        NSLayoutConstraint.activate([
            createText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            createText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            createText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 128)
        ])
    }
    
    private func setupCreateUsername() {
        createUsername.placeholder = "Username"
        createUsername.translatesAutoresizingMaskIntoConstraints = false
        createUsername.borderStyle = .roundedRect
        createUsername.autocapitalizationType = .none
        createUsername.autocorrectionType = .no
        
        view.addSubview(createUsername)
        
        NSLayoutConstraint.activate([
            createUsername.leadingAnchor.constraint(equalTo: createText.leadingAnchor),
            createUsername.trailingAnchor.constraint(equalTo: createText.trailingAnchor),
            createUsername.topAnchor.constraint(equalTo: createText.bottomAnchor, constant: 12)
        ])
    }
    
    private func setupCreatePassword() {
        createPassword.placeholder = "Password"
        createPassword.translatesAutoresizingMaskIntoConstraints = false
        createPassword.borderStyle = .roundedRect
        createPassword.autocapitalizationType = .none
        createPassword.autocorrectionType = .no
        
        view.addSubview(createPassword)
        
        NSLayoutConstraint.activate([
            createPassword.leadingAnchor.constraint(equalTo: createText.leadingAnchor),
            createPassword.trailingAnchor.constraint(equalTo: createText.trailingAnchor),
            createPassword.topAnchor.constraint(equalTo: createUsername.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupCreateButton() {
        createButton.setTitle("Create", for: .normal)
        createButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        createButton.setTitleColor(UIColor.brb.white, for: .normal)
        createButton.backgroundColor = UIColor.brb.red
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.layer.cornerRadius = 16
        
        view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.topAnchor.constraint(equalTo: createPassword.bottomAnchor, constant: 16),
            createButton.heightAnchor.constraint(equalToConstant: 32),
            createButton.widthAnchor.constraint(equalToConstant: 96)
        ])
        
        createButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    private func setupIncorrectLogin() {
        incorrectLoginText.text = "Username or password incorrect"
        incorrectLoginText.font = .systemFont(ofSize: 12, weight: .regular)
        incorrectLoginText.textColor = UIColor.red
        
        incorrectLoginText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(incorrectLoginText)
        
        NSLayoutConstraint.activate([
            incorrectLoginText.centerXAnchor.constraint(equalTo: loginText.centerXAnchor),
            incorrectLoginText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12)
        ])
    }
    
    @objc private func checkValidLogin() {
        if let username = loginUsername.text {
            if let password = loginPassword.text {
                NetworkManager.shared.tryLogin(username: username, password: password) { [weak self] success in guard let self = self else {
                        self?.setupIncorrectLogin()
                        self?.loginUsername.text = ""
                        self?.loginPassword.text = ""
                        return
                    }
                    let appVC = AppVC(user: success)
                    navigationController?.pushViewController(appVC, animated: true)
                    
                }
            }
        }
        
    }
    
    @objc private func createAccount() {
        
        NetworkManager.shared.createUser(username: createUsername.text ?? "", password: createPassword.text ?? "") { [weak self] success in guard let self = self else { return }
            createUsername.text = ""
            createPassword.text = ""
            
            //users.append(success) //TODO: fix once users/user combined
        }
        
    }
}
