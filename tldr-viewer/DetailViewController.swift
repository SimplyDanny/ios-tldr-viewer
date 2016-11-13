//
//  DetailViewController.swift
//  tldr-viewer
//
//  Created by Matthew Flint on 30/12/2015.
//  Copyright © 2015 Green Light. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var platformsSegmentedControl: UISegmentedControl!

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: DetailViewModel! {
        didSet {
            self.viewModel.updateSignal = {
                self.configureView()
            }
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messageView.isHidden = true
        
        self.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureView()
    }
    
    @IBAction func platformSegmentDidChange(_ sender: AnyObject) {
        self.viewModel.select(platformIndex: self.platformsSegmentedControl.selectedSegmentIndex)
    }
    
    private func configureView() {
        if viewIfLoaded == nil {
            return
        }
        
        DispatchQueue.main.async {
            self.doConfigureView()
        }
    }
    
    private func doConfigureView() {
        var detailAttributedString: NSAttributedString?
        var message: NSAttributedString?
        var sceneTitle: String
        var showSegmentedControl = false

        if let viewModel = self.viewModel, let platformViewModel = viewModel.selectedPlatform {
            if (platformViewModel.message != nil) {
                message = platformViewModel.message
                detailAttributedString = nil
            } else {
                message = nil
                detailAttributedString = platformViewModel.detailAttributedString!
            }
            sceneTitle = viewModel.navigationBarTitle
            
            showSegmentedControl = viewModel.showPlatforms
            if (showSegmentedControl) {
                self.doConfigureSegmentedControl(viewModel)
            }
        } else {
            message = Theme.detailAttributed(string: "Nothing selected")
            detailAttributedString = nil
            sceneTitle = ""
        }
        
        if let messageToShow = message {
            self.messageLabel.attributedText = messageToShow
            self.messageView.isHidden = false
            
            self.messageView.setNeedsLayout()
        } else {
            self.messageView.isHidden = true
        }
        
        if let detailAttributedStringToShow = detailAttributedString {
            self.detailLabel.attributedText = detailAttributedStringToShow
            self.detailLabel.isHidden = false
        } else {
            self.detailLabel.isHidden = true
        }
        
        self.title = sceneTitle
        self.doShowOrHideSegmentedControl(showSegmentedControl)
    }
    
    private func doConfigureSegmentedControl(_ viewModel: DetailViewModel) {
        self.platformsSegmentedControl.removeAllSegments()
        
        for (index, platform) in viewModel.platforms.enumerated() {
            self.platformsSegmentedControl.insertSegment(withTitle: platform.platformName, at: index, animated: false)
        }
        
        self.platformsSegmentedControl.selectedSegmentIndex = viewModel.selectedPlatform.platformIndex
    }
    
    private func doShowOrHideSegmentedControl(_ show: Bool) {
//        self.webViewToSegmentedControlConstraint.isActive = false
//        self.webViewToTopAnchorConstraint.isActive = false
        
        self.platformsSegmentedControl.isHidden = !show
//        self.webViewToSegmentedControlConstraint.isActive = show
//        self.webViewToTopAnchorConstraint.isActive = !show
    }
}
