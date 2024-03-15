//
//  ViewController.swift
//  SecureKeyApp
//
//  Created by Abdur Rehman on 15/03/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        // 1. Create Configuration Settings File "file name as config". (Please make sure you don’t check any Targets which is also the default in Xcode)
        // 2. Add Secret keys in config file
        // 3. Add Config.xcconfig to the gitignore. This step is very important as we don’t want it to be available to everyone who has access to our repo.
        // 4. Let’s add the API Key to our info.plist. The API_KEY in our Config.xcconfig acts as a User-defined Variable which can be accessed by $(API_KEY) on the info.plist.
        // 5. Let’s set the Config.xcconfig to the Configurations to our App Project.
        //    You can always create different xcconfigs for Debug & Release, for simplicity of this article we will keep one.
        //    If due to some reason our repo is compromised, the hacker won’t get hold of our secrets.
        // 6. Accesss key like //  Bundle.main.infoDictionary?["API_KEY"]
        
        /*
            ways to get key:
            Bundle.main.infoDictionary?["API_KEY"] as? String
            Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
            ProcessInfo.processInfo.environment["API_KEY"]
        */
        
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return}
        print("API KEY (get as bundle's object: \(key)")
        
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else { return}
        print("API KEY (get from infoDictionary: \(key)")
        
        guard let key =  ProcessInfo.processInfo.environment["API_KEY"]  else { return}
        print("API KEY (environment vairable): \(key)")
        
        
        

    }
}


