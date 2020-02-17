
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.



typealias CompletionBlockForTableviewBG = (_ result: Bool) -> Void
import Foundation
import UIKit

extension UITableView{
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
    /// Set table header view & add Auto layout.
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0){
            self.scrollToRow(at: NSIndexPath(row: rows - 1, section: sections - 1) as IndexPath, at: .bottom, animated: animated)
        }
    }
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    func scrollToTop(animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.hasRowAtIndexPath(indexPath: indexPath) {
            self.scrollToRow(at: indexPath, at: .top, animated: animated)
        }
    }
    
    func setTableHeaderView(headerView: UIView) {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set first.
        self.tableHeaderView = headerView
        
        // Then setup AutoLayout.
        headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    /// Update header view's frame.
    func updateHeaderViewFrame() {
        guard let headerView = self.tableHeaderView else { return }
        
        // Update the size of the header based on its internal content.
        headerView.layoutIfNeeded()
        
        // ***Trigger table view to know that header should be updated.
        let header = self.tableHeaderView
        self.tableHeaderView = header
    }
    func removeBottomSeparatorLine() {
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.separatorStyle = .none
    }
    
    func scrollToLastRowOfSection(section: Int, atScrollPosition: UITableView.ScrollPosition = .top, animated: Bool = false) {
        scrollToRow(at: lastRowInSection(section: section) as IndexPath, at: atScrollPosition, animated: animated)
    }
    
    func registerClass(cell: UITableViewCell.Type) {
        register(cell.classForCoder(), forCellReuseIdentifier: cell.className)
    }
    
    public func insertSection(_ section: Int, with animation: UITableView.RowAnimation) {
        insertSections(IndexSet(integer: section), with: animation)
    }
    
    public func deleteSection(_ section: Int, with animation: UITableView.RowAnimation) {
        deleteSections(IndexSet(integer: section), with: animation)
    }
    
    public func reloadSection(_ section: Int, with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integer: section), with: animation)
    }
    
    private func lastRowInSection(section: Int) -> NSIndexPath {
        guard let dataSource = dataSource else {
            preconditionFailure("Don't have dataSource")
        }
        return NSIndexPath(row: dataSource.tableView(self, numberOfRowsInSection: section) - 1, section: section)
    }
    
    func showLoadMore(){
        let pagingSpinner = UIActivityIndicatorView(style: .white)
        pagingSpinner.color = defaultThemeColor()
        pagingSpinner.startAnimating()
        
        let viewLoader = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        viewLoader.backgroundColor = UIColor.clear
        viewLoader.addSubview(pagingSpinner)
        pagingSpinner.center = viewLoader.center
        
        self.tableFooterView = nil;
        self.tableFooterView = viewLoader
    }
    
    func hideLoadMore(){
        self.tableFooterView = nil;
        self.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    func checkForNoData(count:Int,strMessage : String,color : UIColor = defaultThemeColor()){
        if count > 0 {
            self.backgroundView = nil;
            self.separatorStyle = .none;
        }else{
            
            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
            noDataLabel.text          = strMessage
            noDataLabel.textColor     = color
            noDataLabel.numberOfLines = 0
            noDataLabel.lineBreakMode = .byTruncatingTail
            noDataLabel.textAlignment = .center
            noDataLabel.font =  UIFont.init(name: Font.FontName.circular_black.rawValue, size: 16)
            self.backgroundView = noDataLabel;
            self.separatorStyle = .none;
            
        }
    }
    
    func checkForNoDataCustmize(count:Int,strMessage : String,color : UIColor = defaultThemeColor(), height: CGFloat){
        if count > 0 {
            self.backgroundView = nil;
            self.separatorStyle = .none;
        }else{
            
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            noDataLabel.text          = strMessage
            noDataLabel.textColor     = defaultThemeColor()
            noDataLabel.textAlignment = .center
            //noDataLabel.backgroundColor = .red
            noDataLabel.font =  UIFont.init(name: Font.FontName.circular_black.rawValue, size: 16)
            self.backgroundView = noDataLabel;
            self.separatorStyle = .none;
        }
    }
}

//MARK:
//MARK: Table View Cell

extension UITableViewCell {
    func removeMargins() {
        
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = .zero
        }
        // prevent the cell from inheriting the tableView's margin settings
        if self.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            self.preservesSuperviewLayoutMargins = false
        }
        // explicitly setting cell's layout margins
        if self.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            self.layoutMargins = .zero
        }
    }
}



