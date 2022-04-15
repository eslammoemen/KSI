//
//  CollectionView+Ex.swift
//  weeding
//
//  Created by Eslam Mohamed on 12/7/21.
//

import Foundation
extension UICollectionView {
    func assignCollectionLayout(withitemSize item:CGSize,and scroll:ScrollDirection ){
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = scroll
        layout.itemSize = item
        self.collectionViewLayout = layout
        
        
    }
}
import UIKit


extension UICollectionViewCell {
    
    var ident:String{
        return String(describing:self )
    }
}

extension UICollectionView {
    
    func reload() {
        CATransaction.begin()
        self.reloadData()
        CATransaction.setCompletionBlock({
            self.isEmpty
        })
        CATransaction.commit()
    }
    func selectFirstIndex(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let indexPathForFirstRow = IndexPath(row: 0, section: 0)
            self.selectItem(at:indexPathForFirstRow , animated: true, scrollPosition:[])
        }
    }
    
    func emptyMessage(text:String){
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = UIColor(named: "SubtitleColor")
        label.font = UIFont(name: "Helvetica Neue Italic", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView = label
        NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
               label.heightAnchor.constraint(equalToConstant: 20),
               label.widthAnchor.constraint(equalToConstant: 20)
               ])
        
    }
    func NoEmpty(){
       self.backgroundView = nil
       self.isScrollEnabled = true
   }
    
    var isEmpty:(){
       if self.visibleCells.isEmpty{
        self.emptyMessage(text:BannerKeys.noData)
       }else{
           self.NoEmpty()
       }
   }
    
    func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type,withSize:CGSize,Scroll:ScrollDirection){
        //MARK: Generic Register cells
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
        self.assignCollectionLayout(withitemSize: withSize, and: Scroll)
    }
    
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    func registerHeaderFooter<Cell: UICollectionReusableView>(cellClass: Cell.Type, kind: String){
        //MARK: Generic Register Header (Header/Footer)
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: Cell.self))
    }
    
    //    UICollectionView.elementKindSectionHeader
    
    func dequeueHeaderFooter<Cell: UICollectionReusableView>(kind: String, indexPath:IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    func collectionviewSets(direction:UICollectionView.ScrollDirection,height:CGFloat,count:CGFloat){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = direction
        let width = self.frame.width/2
        layout.itemSize = CGSize(width:width, height: height)
        self.collectionViewLayout = layout
    }
    func setCollectionWithOutHorizontalLayOut2(_ height:Int,_ count:Int){
          let layout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
          layout.minimumInteritemSpacing = 0
          layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 30)/CGFloat(count), height: CGFloat(height))
         // layout.scrollDirection = .horizontal
          self.collectionViewLayout  = layout
      }
    func setCollectionWithOutHorizontalLayOut(_ height:Int,_ count:Int){
          let layout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
          layout.minimumInteritemSpacing = 0
          layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 10)/CGFloat(count), height: CGFloat(height))
         // layout.scrollDirection = .horizontal
          self.collectionViewLayout  = layout
      }
    
    func setCollectionLayOut(_ height:Int,_ count:Int,scrollDirection: ScrollDirection){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (self.bounds.width - CGFloat(5 * (count + 1)))/CGFloat(count), height: CGFloat(height - 4))
        layout.scrollDirection = scrollDirection
        self.collectionViewLayout  = layout
    }

    func autoWidthSize(_ vc:UIViewController,_ title:String?){
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize =  CGSize(width: title?.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]).width ?? 0 + 50, height: self.frame.height - 5)
        layout.scrollDirection = .horizontal
        self.collectionViewLayout  = layout
    }
   
    
}
class RTLCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
        return UIUserInterfaceLayoutDirection.leftToRight
    }
}
class AutoSizedCollectionView: UICollectionView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
extension UICollectionView {
  var visibleCurrentCellIndexPath: IndexPath? {
    for cell in self.visibleCells {
      let indexPath = self.indexPath(for: cell)
      return indexPath
    }
    
    return nil
  }
    
    func moveToNextCell(indexPath:IndexPath) {
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

