//
//  PlayerControlsView.swift
//  Spotify
//
//  Created by Евгений Никитин on 29.04.2021.
//

import UIKit

protocol PlayerControlsViewDelegate: class {
    func playerControlsViewDidTapPlayPause(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapForward(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapRewind(_ playerControlsView: PlayerControlsView)
}

final class PlayerControlsView: UIView {
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        return slider
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "This is my song"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is my song"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let rewindButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "backward.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 34,
                weight: .regular
            )
        )
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "forward.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 34,
                weight: .regular
            )
        )
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(
            systemName: "pause.fill",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 34,
                weight: .regular
            )
        )
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(volumeSlider)
        addSubview(rewindButton)
        addSubview(forwardButton)
        addSubview(playPauseButton)
        
        rewindButton.addTarget(self, action: #selector(didTapRewind), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(didTapForward), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapRewind() {
        delegate?.playerControlsViewDidTapRewind(self)
    }
    
    @objc private func didTapForward() {
        delegate?.playerControlsViewDidTapForward(self)
    }
    
    @objc private func didTapPlayPause() {
        delegate?.playerControlsViewDidTapPlayPause(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: 50
        )
        subtitleLabel.frame = CGRect(
            x: 0,
            y: nameLabel.bottom + 10,
            width: width,
            height: 50
        )
        volumeSlider.frame = CGRect(
            x: 10,
            y: subtitleLabel.bottom + 20,
            width: width - 20,
            height: 44
        )
        
        let buttonSize: CGFloat = 60
        playPauseButton.frame = CGRect(
            x: (width - buttonSize) / 2,
            y: volumeSlider.bottom + 30,
            width: buttonSize,
            height: buttonSize
        )
        rewindButton.frame = CGRect(
            x: playPauseButton.left - 80 - buttonSize,
            y: playPauseButton.top,
            width: buttonSize,
            height: buttonSize
        )
        forwardButton.frame = CGRect(
            x: playPauseButton.right + 80,
            y: playPauseButton.top,
            width: buttonSize,
            height: buttonSize
        )
    }
}
