//
//  homeController.swift
//  KSITask
//
//  Created by Eslam Mohamed on 4/13/22.
//

import UIKit

typealias homeControllerTypeAlias = homeViewsConfig

class homeController: UIViewController,homeControllerTypeAlias {
   
    
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    let dataFetchable:NetworkManager
    let model = viewModel()
    
    public init(dataFetchable:NetworkManager) {
        self.dataFetchable = dataFetchable
        super.init(nibName: homeController.className, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itesmtableConfigurations {}
        getItemsData()
        Bind()

      
    }


  

}
extension homeController {
    func Bind(){
        model.items.bind { [weak self] _  in
            self?.itemsTableView.reloadData()
        }
    }
    func getItemsData(){
        let simpleUrl = "http://178.128.171.40/task/response.json"
        dataFetchable.Call(url: simpleUrl) { (data:ItemsModel?) in
            guard let itemsData = data?.data?.banners else { return }
            self.model.items.value = itemsData
        }
    }
}

extension homeController :UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeue(indexPath: indexPath) as itemsCell
        let banner = model.items.value?[indexPath.row]
        cell.bannerConfigs = banner
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type =  model.items.value?[safe:indexPath.row]?.type
        if type == .main {
            return 220
        }else if type == .brandsSlider {
            return 220
        }else if type == .categoryCover {
            return 210
        }else{
            return 350
        }
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? itemsCell {
            cell.productsCollectionView.delegate = self
            cell.productsCollectionView.dataSource = self
            cell.productsCollectionView.tag = indexPath.row
            let type = model.items.value?[safe:indexPath.row]?.type
            if  type == .main {
                let cellSize = CGSize(width:150, height: 150)
                cell.productsCollectionView.registerCell(cellClass:ProductsCell.self, withSize: cellSize, Scroll: .horizontal)
            }else if type == .brandsSlider {
                let cellSize = CGSize(width:150, height: 150)
                cell.productsCollectionView.registerCell(cellClass:ProductsCell.self, withSize: cellSize, Scroll: .horizontal)
            } else if type == .categoryCover {
                let cellSize = CGSize(width:125, height: 125)
                cell.productsCollectionView.registerCell(cellClass:ProductsCell.self, withSize: cellSize, Scroll: .horizontal)
            }else {
                let cellSize = CGSize(width:135, height: 270)
                cell.productsCollectionView.registerCell(cellClass:ProductsCell.self, withSize: cellSize, Scroll: .horizontal)
            }
           
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                cell.productsCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: [], animated: true)
            }
            cell.productsCollectionView.reloadData()
        }
        
    }
    
}
extension homeController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let returnNum = model.items.value?[safe:collectionView.tag]?.content
        if returnNum?.blocks != nil {
            return returnNum?.blocks?.count ?? 0
        }else if returnNum?.brands != nil {
            return returnNum?.brands?.count ?? 0
        }else{
            return returnNum?.products?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as ProductsCell

        let type = model.items.value?[safe:collectionView.tag]?.content
    
        if type?.blocks != nil {
            if model.items.value?[safe:collectionView.tag]?.type == .categoryCover {
                cell.categoryCover = type?.blocks?[indexPath.item]
            }else{
                cell.blockConfigs = type?.blocks?[indexPath.item]
            }
            cell.backView.alpha = 0
            
        }else if type?.brands != nil {
            cell.backView.alpha = 0
            cell.brandConfigs = type?.brands?[indexPath.item]
        }else{
            cell.backView.alpha = 1
            cell.productsConfigs = type?.products?[indexPath.item]

        }
        return cell
    }
    
    
 
}
