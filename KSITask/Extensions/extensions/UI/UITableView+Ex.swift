


import UIKit

extension UITableView {
    func registerCell<Cell: UITableViewCell>(cellClass: Cell.Type,withRowHeight:CGFloat){
        //MARK: Generic Register cells
        self.register(UINib(nibName:String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
        
        self.separatorStyle = .none
        self.estimatedRowHeight = withRowHeight
    }
    
    func dequeue<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
     var isEmpty:(){
        if self.visibleCells.isEmpty{
            self.emptyMessage(text:BannerKeys.noData)
        }else{
            self.NoEmpty()
        }
    }
    
}
extension UITableView {
    
    func reload() {
        CATransaction.begin()
        self.reloadData()
        CATransaction.setCompletionBlock({
           // self.isEmpty
        })
        CATransaction.commit()
    }
    
    
    func registerNib<Cell:UITableViewCell>(cell:Cell.Type) {
        let nibName = String(describing: Cell.self)
          self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell:UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell =  self.dequeueReusableCell(withIdentifier: identifier) as? Cell else { fatalError(" Error in cell") }
           return cell
    }
    
    func emptyMessage(text:String){
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Helvetica Neue Italic", size: 13)
        label.textColor = UIColor(named:"SubtitleColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView = label
        NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
               label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               label.heightAnchor.constraint(equalToConstant: 20),
               label.widthAnchor.constraint(equalToConstant: 20)
               ])

    }
    


            func emptytable(){
            let emptyImage = UIImageView(image: UIImage(named: "empty-cart"))
            emptyImage.translatesAutoresizingMaskIntoConstraints = false //missed it in first place
            self.backgroundView = emptyImage
            NSLayoutConstraint.activate([
                emptyImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                emptyImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                emptyImage.heightAnchor.constraint(equalToConstant: 150),
                emptyImage.widthAnchor.constraint(equalToConstant: 150)
                ])
            self.isScrollEnabled = false
            }

         func NoEmpty(){
            self.backgroundView = nil
            self.isScrollEnabled = true
        }
    
    
    func setEmptyView(title: String, message: String, messageImage: UIImage) {
          
          let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
          
          let messageImageView = UIImageView()
          let titleLabel = UILabel()
          let messageLabel = UILabel()
          
          messageImageView.backgroundColor = .clear
          
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          messageImageView.translatesAutoresizingMaskIntoConstraints = false
          messageLabel.translatesAutoresizingMaskIntoConstraints = false
          
          titleLabel.textColor = UIColor.black
        titleLabel.font = .JF_Flat(ofSize: 17)
            //UIFont(name: "HelveticaNeue-Bold", size: 18)
          
          messageLabel.textColor = UIColor.lightGray
        messageLabel.font = .JF_Flat(ofSize: 17)
            //UIFont(name: "HelveticaNeue-Regular", size: 17)
          
          emptyView.addSubview(titleLabel)
          emptyView.addSubview(messageImageView)
          emptyView.addSubview(messageLabel)
          
          messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
          messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
          messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
          messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
          
          titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
          titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
          
          messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
          messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
          
          messageImageView.image = messageImage
          titleLabel.text = title
          messageLabel.text = message
          messageLabel.numberOfLines = 0
          messageLabel.textAlignment = .center
          
          UIView.animate(withDuration: 1, animations: {
              
              messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
          }, completion: { (finish) in
              UIView.animate(withDuration: 1, animations: {
                  messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
              }, completion: { (finishh) in
                  UIView.animate(withDuration: 1, animations: {
                      messageImageView.transform = CGAffineTransform.identity
                  })
              })
              
          })
          
          self.backgroundView = emptyView
          self.separatorStyle = .none
      }
      
      func restore() {
          self.backgroundView = nil
          self.separatorStyle = .none
      }
    

}
extension UITableViewCell {
    //MARK:- Animate Cells
    func setAnimationFromSide() {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        self.layer.transform = rotationTransform
        self.alpha = 0.5
        UIView.animate(withDuration: 1.0) {
            self.layer.transform = CATransform3DIdentity
            self.alpha = 1.0
    }}
    func setAnimationFadeIn() {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 10, 0)
        self.layer.transform = rotationTransform
        self.alpha = 0.5
        UIView.animate(withDuration: 0.75) {
            self.layer.transform = CATransform3DIdentity
            self.alpha = 1.0
    }}
    // inside tableView willDisplay
    func animateCellFadeInOut() {
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            self.transform = CGAffineTransform.identity
    }}
 
}
