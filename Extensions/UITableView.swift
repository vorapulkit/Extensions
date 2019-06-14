
import Foundation
import UIKit

extension UITableView{
    /// Set table header view & add Auto layout.
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
    
    func scrollToLastRowOfSection(section: Int, atScrollPosition: UITableViewScrollPosition = .top, animated: Bool = false) {
        scrollToRow(at: lastRowInSection(section: section) as IndexPath, at: atScrollPosition, animated: animated)
    }
    
    func registerClass(cell: UITableViewCell.Type) {
        register(cell.classForCoder(), forCellReuseIdentifier: cell.className)
    }
    
//        func registerNib(cell: UITableViewCell.Type) {
//            registerNib(cell, forCellReuseIdentifier: cell.className)
//        }
//        func dequeueCell<T>(forIndexPath indexPath: NSIndexPath) -> T where T: UITableViewCell, T: ClassnameStringConvertable {
//            guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath as IndexPath) as? T else {
//                preconditionFailure("Unable to dequeue \(T.description()) for indexPath: \(indexPath)")
//            }
//            return cell
//        }
//    
//        func registerHeaderFooterNib(headerFooterView: UITableViewHeaderFooterView.Type) {
//            registerNib(headerFooterView.nib(), forHeaderFooterViewReuseIdentifier: headerFooterView.className)
//        }
//    
//        func registerHeaderFooterClass(headerFooterView: UITableViewHeaderFooterView.Type) {
//            register(headerFooterView.classForCoder(), forHeaderFooterViewReuseIdentifier: headerFooterView.className)
//        }
//    
//        func dequeueHeaderFooter<T>() -> T where T: UITableViewHeaderFooterView, T: ClassnameStringConvertable {
//            guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T else {
//                preconditionFailure("Unable to dequeue \(T.description())")
//            }
//            return view
//        }
    
    public func insertSection(_ section: Int, with animation: UITableViewRowAnimation) {
        insertSections(IndexSet(integer: section), with: animation)
    }
    
    public func deleteSection(_ section: Int, with animation: UITableViewRowAnimation) {
        deleteSections(IndexSet(integer: section), with: animation)
    }
    
    public func reloadSection(_ section: Int, with animation: UITableViewRowAnimation) {
        reloadSections(IndexSet(integer: section), with: animation)
    }
    
    private func lastRowInSection(section: Int) -> NSIndexPath {
        guard let dataSource = dataSource else {
            preconditionFailure("Don't have dataSource")
        }
        return NSIndexPath(row: dataSource.tableView(self, numberOfRowsInSection: section) - 1, section: section)
    }
    
    func showLoadMore(){
        let pagingSpinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
        pagingSpinner.color = getThemeColor()
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
    
        func checkForNoData(count:Int,strMessage : String,color : UIColor = getThemeColor()){

            if count > 0 {
                self.backgroundView = nil;
                self.separatorStyle = .none;
            }else{

                let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
                noDataLabel.text          = strMessage
                noDataLabel.textColor     = UIColor.white
                noDataLabel.textAlignment = .center
                noDataLabel.font =  UIFont.init(name: Font.FontName.ProximaNova_Semibold.rawValue, size: 16)
                self.backgroundView = noDataLabel;
                self.separatorStyle = .none;
            }
        }
}

//MARK:
//MARK: Table View Cell

extension UITableViewCell {
    var tableView: UITableView? {
        var view = self.superview
        while (view != nil && view!.isKind(of: UITableView.self) == false) {
            view = view!.superview
        }
        return view as? UITableView
    }
    
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



