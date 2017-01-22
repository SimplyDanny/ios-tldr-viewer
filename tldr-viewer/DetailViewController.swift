//
//  DetailViewController.swift
//  tldr-viewer
//
//  Created by Matthew Flint on 30/12/2015.
//  Copyright © 2015 Green Light. All rights reserved.
//

import UIKit
import WebKit
import CoreSpotlight

class DetailViewController: UIViewController, ShortcutHandler {
    @IBOutlet weak var platformsSegmentedControl: UISegmentedControl!

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var webView: WKWebView!
    
    // these two conflicting constraints adjust the layout depending on whether the segmented control is shown. Only one should be enabled
    var webViewToTopAnchorConstraint: NSLayoutConstraint!
    var webViewToSegmentedControlConstraint: NSLayoutConstraint!

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
        
        let configuration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: configuration)
        
        // disable webview magnification
        self.webView.scrollView.delegate = self
        
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView)
        
        self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        // two top constraints for the web view
        self.webViewToTopAnchorConstraint = self.webView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.webViewToSegmentedControlConstraint = self.webView.topAnchor.constraint(equalTo: self.platformsSegmentedControl.bottomAnchor, constant: 3)
        
        self.messageView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.onCommandDisplayed()
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
        var htmlString: String?
        var message: NSAttributedString?
        var sceneTitle: String
        var showSegmentedControl = false

        if let viewModel = self.viewModel, let platformViewModel = viewModel.selectedPlatform {
            if (platformViewModel.message != nil) {
                message = platformViewModel.message
                htmlString = nil
            } else {
                message = nil
                htmlString = platformViewModel.detailHTML!
            }
            sceneTitle = viewModel.navigationBarTitle
            
            showSegmentedControl = viewModel.showPlatforms
            if (showSegmentedControl) {
                self.doConfigureSegmentedControl(viewModel)
            }
        } else {
            message = Theme.detailAttributed(string: "Nothing selected")
            htmlString = nil
            sceneTitle = ""
        }
        
        if let messageToShow = message {
            self.messageLabel.attributedText = messageToShow
            self.messageView.isHidden = false
            
            self.messageView.setNeedsLayout()
        } else {
            self.messageView.isHidden = true
        }
        
        if let htmlStringToShow = htmlString {
            self.webView.loadHTMLString(htmlStringToShow, baseURL: nil)
            self.webView.isHidden = false
        } else {
            self.webView.isHidden = true
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
        self.webViewToSegmentedControlConstraint.isActive = false
        self.webViewToTopAnchorConstraint.isActive = false
        
        self.platformsSegmentedControl.isHidden = !show
        self.webViewToSegmentedControlConstraint.isActive = show
        self.webViewToTopAnchorConstraint.isActive = !show
    }
    
    // MARK: - NSUserActivity stuff
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if let uniqueIdentifier = activity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            viewModel.showCommand(commandName: uniqueIdentifier)
            configureView()
            viewModel.onCommandDisplayed()
        }
    }
    
    // MARK: - ShortcutItem handling
    
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem) {
        guard let userInfo = shortcutItem.userInfo else { return }
        guard let commandName = userInfo[Constant.Shortcut.commandNameKey] as? String else { return}
        viewModel.showCommand(commandName: commandName)
        configureView()
        viewModel.onCommandDisplayed()
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
}
