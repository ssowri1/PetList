//
//  UIimageView+extension.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import UIKit

extension UIImageView {

    private static let imageCache = NSCache<NSString, UIImage>()
    private var imageCache: NSCache<NSString, UIImage> { UIImageView.imageCache }
    
    func imageFromURL(_ URLString: String, placeHolder: UIImage?) {
        self.image = nil
        // If image url's image name has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let cachedImage = imageCache.object(forKey: NSString(string: imageServerUrl)) {
            self.image = cachedImage
            return
        }

        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(String(describing: error))")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.imageCache.setObject(downloadedImage, forKey: NSString(string: imageServerUrl))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
