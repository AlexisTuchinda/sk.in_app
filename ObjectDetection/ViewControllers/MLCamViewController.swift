//
//  MLCamViewController.swift
//  ObjectDetection
//
//  Created by Fahim Hasan Khan on 9/8/21.
//  Copyright © 2021 Y Media Labs. All rights reserved.
//

import Foundation
import CameraManager
import UIKit

class MLCamViewController: UIViewController {
    // MARK: - Constants
    
    let cameraManager = CameraManager()
    
    // MARK: - @IBOutlets
         
    @IBOutlet var cameraView: UIView!
    @IBOutlet var askForPermissionsLabel: UILabel!
    @IBOutlet var cameraButton: UIButton!
    
    
    
    let lightBlue = UIColor(red: 24 / 255, green: 125 / 255, blue: 251 / 255, alpha: 1)
    let redColor = UIColor(red: 229 / 255, green: 77 / 255, blue: 67 / 255, alpha: 1)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCameraManager()
        
        askForPermissionsLabel.isHidden = true
        askForPermissionsLabel.backgroundColor = lightBlue
        askForPermissionsLabel.textColor = .white
        askForPermissionsLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(askForCameraPermissions))
        askForPermissionsLabel.addGestureRecognizer(tapGesture)
      
        let currentCameraState = cameraManager.currentCameraStatus()
        
        if currentCameraState == .notDetermined {
            askForPermissionsLabel.isHidden = false
        } else if currentCameraState == .ready {
            addCameraToView()
        } else {
            askForPermissionsLabel.isHidden = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraManager.resumeCaptureSession()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cameraManager.stopCaptureSession()
    }
    
    // MARK: - ViewController
    fileprivate func setupCameraManager() {
        cameraManager.shouldEnableExposure = true
        cameraManager.writeFilesToPhoneLibrary = true
        cameraManager.showAccessPermissionPopupAutomatically = true
        cameraManager.cameraOutputMode = .videoOnly
        cameraManager.shouldUseLocationServices = true
        cameraManager.imageAlbumName =  "CSMLData"
        cameraManager.videoAlbumName =  "CSMLData"
        cameraManager.animateShutter = true
    }
    
    
    fileprivate func addCameraToView() {
        cameraManager.addPreviewLayerToView(cameraView, newCameraOutputMode: CameraOutputMode.videoWithMic)
        cameraManager.showErrorBlock = { [weak self] (erTitle: String, erMessage: String) -> Void in
            
            let alertController = UIAlertController(title: erTitle, message: erMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) -> Void in }))
            
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - @IBActions

    
    @IBAction func actionButtonClicked(_ sender: UIButton) {
        cameraButton.isSelected = !cameraButton.isSelected
        cameraButton.setTitle("STOP", for: UIControl.State.selected)
        
        cameraButton.backgroundColor = cameraButton.isSelected ? redColor : lightBlue
        if sender.isSelected {
            cameraManager.startRecordingVideo()
        } else {
            cameraManager.stopVideoRecording { (_, error) -> Void in
                if error != nil {
                    self.cameraManager.showErrorBlock("Error occurred", "Cannot save video.")
                }
            }
        }
    }
    
   
    @IBAction func askForCameraPermissions() {
        cameraManager.askUserForCameraPermission { permissionGranted in
            
            if permissionGranted {
                self.askForPermissionsLabel.isHidden = true
                self.askForPermissionsLabel.alpha = 0
                self.addCameraToView()
            } else {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
}

