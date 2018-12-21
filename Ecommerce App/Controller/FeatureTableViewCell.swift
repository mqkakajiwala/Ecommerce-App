//
//  FeatureTableViewCell.swift
//  Ecommerce App
//
//  Created by Mustafa on 21/12/2018.
//  Copyright © 2018 Mustafa. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [FeatureView] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        slides = createSlides()
        setupSlidingScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        self.contentView.bringSubviewToFront(pageControl)
        
        
    }
    
    func createSlides() -> [FeatureView] {
        let slide1: FeatureView = Bundle.main.loadNibNamed("FeatureView", owner: self, options: nil)?.first as! FeatureView
        slide1.slidingImageView.image = UIImage(named: "bur1")
        
        let slide2: FeatureView = Bundle.main.loadNibNamed("FeatureView", owner: self, options: nil)?.first as! FeatureView
        slide2.slidingImageView.image = UIImage(named: "bur2")
        
        let slide3: FeatureView = Bundle.main.loadNibNamed("FeatureView", owner: self, options: nil)?.first as! FeatureView
        slide3.slidingImageView.image = UIImage(named: "bur3")
        
        
        
        return [slide1, slide2, slide3]
        
    }
    
    func setupSlidingScrollView (slides: [FeatureView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height:self.contentView.frame.height)
        scrollView.contentSize = CGSize(width: self.contentView.frame.width * CGFloat(slides.count), height: self.contentView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: self.contentView.frame.width * CGFloat(i), y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/self.contentView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
