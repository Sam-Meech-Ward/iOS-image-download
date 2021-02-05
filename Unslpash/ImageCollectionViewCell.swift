//
//  ImageCollectionViewCell.swift
//  Unslpash
//
//  Created by Sam Meech-Ward on 2020-05-24.
//  Copyright © 2020 Sam Meech-Ward. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var badgeImageView: UIImageView!
  
  var representedIdentifier: String = ""
  
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
  var image: UIImage? {
    didSet {
      imageView.image = image
    }
  }
  
  var badge: UIImage? {
    didSet {
      badgeImageView.image = badge
    }
  }
}
