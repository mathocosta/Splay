//
//  BarView.swift
//  FinalChallenge
//
//  Created by Paulo José on 06/09/19.
//  Copyright © 2019 The Rest of Us. All rights reserved.
//

import UIKit

class BarView: UIView {

    static let height: CGFloat = 20.0

    var progressBarConstraint: NSLayoutConstraint?

    var progress: CGFloat {
        didSet {
            progressBarConstraint?.constant = -(self.frame.width * (1 - progress))
        }
    }

    lazy var goalLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textColor
        label.font = .detailDarkStyle
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textColor
        label.textAlignment = .right
        label.font = .detailDarkStyle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var goalColor: RoundedView = {
        let view = RoundedView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(frame: CGRect, progress: CGFloat = 0.5) {
        self.progress = progress
        super.init(frame: frame)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BarView: CodeView {
    func buildViewHierarchy() {
        addSubview(goalColor)
        addSubview(goalLabel)
        addSubview(progressLabel)
    }

    func setupConstraints() {
        goalColor.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        goalColor.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        goalColor.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        goalColor.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        goalLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        goalLabel.leftAnchor.constraint(equalTo: goalColor.rightAnchor, constant: 8).isActive = true
        goalLabel.rightAnchor.constraint(equalTo: progressLabel.leftAnchor, constant: -8).isActive = true
        goalLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        progressLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        progressLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        progressLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        progressLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    func setupAdditionalConfiguration() {

    }

}
