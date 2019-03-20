//
//  HomeViewController.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 13/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import UIKit
import SharkORM
import Kingfisher
import MaterialDesignSymbol

class HomeViewController: UIViewController {
    
    private var userDetails: MTDefaults.UserDetails?
    private var backgroundImageView: UIImageView!
    private var nameLabel: UILabel!
    private var greetingLabel: UILabel!
    private var monthButton: UIButton!
    private var profileImageView: UIImageView!
    private var sundayView: DayView!
    private var mondayView: DayView!
    private var tuesdayView: DayView!
    private var wednesdayView: DayView!
    private var thursdayView: DayView!
    private var fridayView: DayView!
    private var saturdayView: DayView!
    private var dayGroup: [DayView]!
    private var projectTable: UITableView!
    
    private var placements = [Placement]()
    private var timesheetLogs: [TimesheetLog] = [TimesheetLog]()
    private var currentWeekEnd: Date!
    
    override func viewDidLoad() {
        self.currentWeekEnd = Date().getWeekDates().thisWeek.last
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        if let details = MTDefaults.userDetails {
            userDetails = details
            // Set kingfisher image loading to always use the access token we got earlier as an auth header
            KingfisherManager.shared.defaultOptions = [.requestModifier(TokenPlugin(token: "Bearer \(userDetails?.accessToken ?? "")"))]
            populateViews()
        } else {
            self.present(SignInViewController(), animated: false, completion: nil)
        }
    }
    
    func populateViews() {
        UserProfile.query().limit(1).fetchAsync { (result) in
            if let profile = result.firstObject as? UserProfile {
                let bannerUrl = URL(string: "\(self.userDetails!.instanceUrl)\(profile.bannerPhotoURL ?? "")")
                let profileImageUrl = URL(string: "\(profile.mediumPhotoURL ?? "")")
                DispatchQueue.main.async {
                    self.backgroundImageView.kf.setImage(with: bannerUrl)
                    self.profileImageView.kf.setImage(with: profileImageUrl)
                    self.nameLabel.text = "\(profile.firstName ?? "") \(profile.lastName ?? "")"
                }
                self.getPlacementData()
            }
        }
    }
    
    func getPlacementData() {
        UserProfile.query().limit(1).fetchAsync { (result) in
            if let profile = result.firstObject as? UserProfile {
                MTApi.getPlacements(withContactId: profile.contactIDC ?? "", result: { (success, placements) in
                    MTApi.getPlacementCodes(result: { (success, codes) in
                        placements?.forEach({ (placement) in
                            placement.placementCodes = [PlacementCode]()
                            codes?.forEach({ (code) in
                                if placement.placementId == code.placementC {
                                    placement.placementCodes?.append(code)
                                }
                            })
                        })
                        self.placements = placements ?? [Placement]()
                        self.getTimesheet()
                    })
                })
            }
        }
    }
    
    func getTimesheet() {
        UserProfile.query().limit(1).fetchAsync { (result) in
            if let profile = result.firstObject as? UserProfile {
                MTApi.getTimesheet(forWeekEnd: self.currentWeekEnd, ownerId: profile.userId ?? "", result: { (success, timesheets) in
                    if let logs = timesheets {
                        self.timesheetLogs = logs
                        self.projectTable.reloadData()
                    }
                })
            }
        }
    }
    
    func getPlacementFor(log: TimesheetLog) -> Placement? {
        var result: Placement?
        self.placements.forEach { (placement) in
            if (log.placementC == placement.placementId) {
                result = placement
                return
            }
        }
        return result
    }
    
    @objc func dayChosen(sender: DayView) {
        dayGroup.forEach { (dayView) in
            dayView.chosen = dayView == sender
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = LPSColors.primaryDark
        
        let topHeaderView = UIView()
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topHeaderView)
        topHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        topHeaderView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.alpha = 0.65
        topHeaderView.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: topHeaderView.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: topHeaderView.rightAnchor).isActive = true
        
        greetingLabel = UILabel()
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.font = LPSFonts.quicksandRegular.of(size: 15.0)
        greetingLabel.textColor = LPSColors.white34
        greetingLabel.text = "good morning"
        topHeaderView.addSubview(greetingLabel)
        greetingLabel.topAnchor.constraint(equalTo: topHeaderView.topAnchor, constant: 29).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor, constant: 20).isActive = true
        greetingLabel.trailingAnchor.constraint(equalTo: topHeaderView.trailingAnchor, constant: -20).isActive = true
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = LPSFonts.quicksandMedium.of(size: 24.0)
        nameLabel.textColor = LPSColors.white
        nameLabel.text = "Tim Santiago"
        topHeaderView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor).isActive = true
        
        profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 60
        profileImageView.clipsToBounds = true
        topHeaderView.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: topHeaderView.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let leftIcon = MaterialDesignSymbol(text:MaterialDesignIcon.keyboardArrowLeft24px, size:20)
        leftIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        let previousMonthButton = UIButton()
        previousMonthButton.translatesAutoresizingMaskIntoConstraints = false
        previousMonthButton.setImage(leftIcon.image(size: CGSize(width: 20, height: 20)), for: .normal)
        topHeaderView.addSubview(previousMonthButton)
        previousMonthButton.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor, constant: -20).isActive = true
        previousMonthButton.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor, constant: 20).isActive = true
        previousMonthButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        previousMonthButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let rightIcon = MaterialDesignSymbol(text:MaterialDesignIcon.keyboardArrowRight24px, size:20)
        rightIcon.addAttribute(attributeName: NSAttributedString.Key.foregroundColor, value: UIColor.white)
        let nextMonthButton = UIButton()
        nextMonthButton.translatesAutoresizingMaskIntoConstraints = false
        nextMonthButton.setImage(rightIcon.image(size: CGSize(width: 20, height: 20)), for: .normal)
        topHeaderView.addSubview(nextMonthButton)
        nextMonthButton.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor, constant: -20).isActive = true
        nextMonthButton.trailingAnchor.constraint(equalTo: topHeaderView.trailingAnchor, constant: -20).isActive = true
        nextMonthButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nextMonthButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        monthButton = UIButton()
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        monthButton.setTitleColor(LPSColors.white, for: .normal)
        monthButton.titleLabel?.font = LPSFonts.quicksandMedium.of(size: 16.0)
        monthButton.setTitle("MARCH", for: .normal)
        topHeaderView.addSubview(monthButton)
        monthButton.centerYAnchor.constraint(equalTo: previousMonthButton.centerYAnchor).isActive = true
        monthButton.leadingAnchor.constraint(equalTo: previousMonthButton.trailingAnchor, constant: 20).isActive = true
        monthButton.trailingAnchor.constraint(equalTo: nextMonthButton.leadingAnchor, constant: -20).isActive = true
        
        let calendarBase = UIView()
        calendarBase.translatesAutoresizingMaskIntoConstraints = false
        calendarBase.layer.shadowColor = LPSColors.black.cgColor
        calendarBase.layer.shadowRadius = 8
        calendarBase.layer.shadowOpacity = 0.3
        calendarBase.layer.shadowOffset = CGSize(width: 0, height: 0)
        calendarBase.backgroundColor = LPSColors.primary
        calendarBase.clipsToBounds = false
        self.view.addSubview(calendarBase)
        calendarBase.topAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        calendarBase.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        calendarBase.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        calendarBase.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let calendarContainer = UIView()
        calendarContainer.translatesAutoresizingMaskIntoConstraints = false
        calendarContainer.backgroundColor = LPSColors.white56
        calendarContainer.clipsToBounds = false
        self.view.addSubview(calendarContainer)
        calendarContainer.topAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        calendarContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        calendarContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        calendarContainer.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        sundayView = DayView(withDayName: "SUN", dayNumber: "17")
        sundayView.translatesAutoresizingMaskIntoConstraints = false
        sundayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        sundayView.chosen = false
        calendarContainer.addSubview(sundayView)
        sundayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        sundayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        sundayView.leadingAnchor.constraint(equalTo: calendarContainer.leadingAnchor).isActive = true
        sundayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        mondayView = DayView(withDayName: "MON", dayNumber: "18")
        mondayView.translatesAutoresizingMaskIntoConstraints = false
        mondayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        mondayView.chosen = false
        calendarContainer.addSubview(mondayView)
        mondayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        mondayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        mondayView.leadingAnchor.constraint(equalTo: sundayView.trailingAnchor).isActive = true
        mondayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        tuesdayView = DayView(withDayName: "TUE", dayNumber: "19")
        tuesdayView.translatesAutoresizingMaskIntoConstraints = false
        tuesdayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        tuesdayView.chosen = true
        calendarContainer.addSubview(tuesdayView)
        tuesdayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        tuesdayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        tuesdayView.leadingAnchor.constraint(equalTo: mondayView.trailingAnchor).isActive = true
        tuesdayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        wednesdayView = DayView(withDayName: "WED", dayNumber: "20")
        wednesdayView.translatesAutoresizingMaskIntoConstraints = false
        wednesdayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        wednesdayView.chosen = false
        calendarContainer.addSubview(wednesdayView)
        wednesdayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        wednesdayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        wednesdayView.leadingAnchor.constraint(equalTo: tuesdayView.trailingAnchor).isActive = true
        wednesdayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        thursdayView = DayView(withDayName: "THU", dayNumber: "21")
        thursdayView.translatesAutoresizingMaskIntoConstraints = false
        thursdayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        thursdayView.chosen = false
        calendarContainer.addSubview(thursdayView)
        thursdayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        thursdayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        thursdayView.leadingAnchor.constraint(equalTo: wednesdayView.trailingAnchor).isActive = true
        thursdayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        fridayView = DayView(withDayName: "FRI", dayNumber: "22")
        fridayView.translatesAutoresizingMaskIntoConstraints = false
        fridayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        fridayView.chosen = false
        calendarContainer.addSubview(fridayView)
        fridayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        fridayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        fridayView.leadingAnchor.constraint(equalTo: thursdayView.trailingAnchor).isActive = true
        fridayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        saturdayView = DayView(withDayName: "SAT", dayNumber: "23")
        saturdayView.translatesAutoresizingMaskIntoConstraints = false
        saturdayView.addTarget(self, action: #selector(self.dayChosen(sender:)), for: .touchUpInside)
        saturdayView.chosen = false
        calendarContainer.addSubview(saturdayView)
        saturdayView.topAnchor.constraint(equalTo: calendarContainer.topAnchor).isActive = true
        saturdayView.bottomAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        saturdayView.leadingAnchor.constraint(equalTo: fridayView.trailingAnchor).isActive = true
        saturdayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 7).isActive = true
        
        dayGroup = [sundayView, mondayView, tuesdayView, wednesdayView, thursdayView, fridayView, saturdayView]
        
        projectTable = UITableView()
        projectTable.translatesAutoresizingMaskIntoConstraints = false
        projectTable.delegate = self
        projectTable.dataSource = self
        projectTable.backgroundColor = UIColor.clear
        projectTable.separatorColor = UIColor.clear
        self.view.addSubview(projectTable)
        projectTable.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor).isActive = true
        projectTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        projectTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        projectTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timesheetLogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let log = self.timesheetLogs.first {
            let cell = TimesheetLogCell()
            cell.hoursText = "\(log.thuC ?? 0)"
            cell.titleText = "\(self.getPlacementFor(log: log)?.placementNameC ?? "--none--")"
            cell.subtext = "\(log.clientCodeC ?? "--none--")\n\(log.descriptionC ?? "")"
            if UIApplication.shared.keyWindow?.traitCollection.forceTouchCapability == UIForceTouchCapability.available
            {
                registerForPreviewing(with: self, sourceView: cell)
                
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension HomeViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = self.projectTable.indexPathForRow(at: location) else { return nil }
        guard  let cell = self.projectTable.cellForRow(at: indexPath) else { return nil }
        let popVC = SignInViewController()
        //Set your Peek height
        popVC.preferredContentSize = CGSize(width: 0.0, height: 300)
        previewingContext.sourceRect = cell.frame
        return popVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
    
    
    
}
