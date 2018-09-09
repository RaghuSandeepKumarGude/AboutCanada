//
//  main.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/15/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import UIKit

let testTarget = "NYTimesTests"

// if Test Delegate is found, use it otherwise use the default App Delegate
// the Test Delegate is not included as a compile source for the App target
let appDelegateClass: AnyClass? = NSClassFromString("\(testTarget).TestingAppDelegate") ?? AppDelegate.self
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self,
                                                                       capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
