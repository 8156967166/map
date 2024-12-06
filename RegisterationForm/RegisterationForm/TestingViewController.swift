//
//  TestingViewController.swift
//  SampleCalendar
//
//  Created by Aneesha on 01/12/23.
//

import UIKit

class TestingViewController: UIViewController {

    let inputString = "required|min:10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValidate()
    }

    func setValidate() {
        // Split the string by "|"
        let components = inputString.components(separatedBy: "|")
        print("components ---- \(components)")
        // Iterate through components to find the one containing "min"
        for component in components {
            if component.contains("min") {
                
                // Split the component by ":"
                let minComponents = component.components(separatedBy: ":")

                // Make sure there are at least two components
                if minComponents.count >= 2 {
                    // Extract the minimum value
                    let minString = minComponents[1].trimmingCharacters(in: .whitespacesAndNewlines)

                    if let min = Int(minString) {
                        print("Minimum value: \(min)")
                    } else {
                        print("Invalid minimum value format")
                    }
                } else {
                    print("Invalid 'min' component format")
                }
            }
        }

    }
    
    
}

