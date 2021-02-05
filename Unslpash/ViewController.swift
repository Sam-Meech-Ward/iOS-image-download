//
//  ViewController.swift
//  Unslpash
//
//  Created by Sam Meech-Ward on 2020-05-24.
//  Copyright © 2020 Sam Meech-Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionview: UICollectionView!
  
  let networker = NetworkManager.shared
  
  var posts: [Post] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    networker.posts(query: "puppies") { [weak self] posts, error in
      if let error = error {
        print("error", error)
        return
      }
      
      self?.posts = posts!
      DispatchQueue.main.async {
        self?.collectionview.reloadData()
      }
    }
  }


}

extension ViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return posts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
    
    let post = posts[indexPath.item]
    cell.title = post.description
    
    cell.image = nil
    cell.badge = nil
    
    let representedIdentifier = post.id
    cell.representedIdentifier = representedIdentifier
    
    func image(data: Data?) -> UIImage? {
      if let data = data {
        return UIImage(data: data)
      }
      return UIImage(systemName: "picture")
    }
    
    networker.image(post: post) { data, error  in
      let img = image(data: data)
      DispatchQueue.main.async {
        if (cell.representedIdentifier == representedIdentifier) {
          cell.image = img
        }
      }
    }

    networker.profileImage(post: post) { data, error  in
      let img = image(data: data)
      DispatchQueue.main.async {
        if (cell.representedIdentifier == representedIdentifier) {
          cell.badge = img
        }
      }
    }
    
    return cell
  }
  
}

