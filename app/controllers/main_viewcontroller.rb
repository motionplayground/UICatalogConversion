class RCMainViewController < UITableViewController
  attr_accessor :menu_list

  TITLE_KEY = "title"
  EXPLAIN_KEY = "explanation"
  VIEW_CONTROLLER_KEY = "viewController"
  CELL_IDENTIFIER = "MyIdentifier"

  def viewDidLoad
    super
    # set our view controller as delegate and data source for the table view
    tableView.delegate = self
    tableView.dataSource = self
    
    # construct the array of page descriptions we will use (each description is a dictionary) 
    self.menu_list = []

    # text_field_view_controller = RCTextFieldController.alloc.initWithNibName(nil, bundle:nil)
    
    # self.menu_list.addObject({TITLE_KEY => "TextFields", EXPLAIN_KEY => "Uses of UITextField", VIEW_CONTROLLER_KEY => text_field_view_controller})

    segment_view_controller = RCSegmentViewController.alloc.initWithNibName(nil, bundle:nil)

    self.menu_list.addObject({TITLE_KEY => "SegmentTitle", EXPLAIN_KEY => "SegmentExplain", VIEW_CONTROLLER_KEY => segment_view_controller})

    # register our cell ID for later when we are asked for UITableViewCells (iOS 6.0 a later)
    tableView.registerClass(RCMyTableViewCell, forCellReuseIdentifier:CELL_IDENTIFIER)
  end

  def viewWillAppear(animated)
    super
    # this UIViewController is about to re-appear, make sure we remove the current selection in our table view
    table_selection = tableView.indexPathForSelectedRow
    tableView.deselectRowAtIndexPath(table_selection, animated:false)

    # some over view controller could have changed our nav bar tint color, so reset it here 
    UINavigationBar.appearance.setBarTintColor(UIColor.darkGrayColor)
  end

  # UITableViewDelegate 
  # the table's selection has changed, switch to that item's UIViewController

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    target_viewcontroller = self.menu_list.objectAtIndex(indexPath.row).objectForKey(VIEW_CONTROLLER_KEY)
    self.navigationController.pushViewController(target_viewcontroller, animated:true)
  end

  # UITableViewDataSource
  # tell our table how many rows it will have, in our case the size of our menuList

  def tableView(tableView, numberOfRowsInSection:section)
    self.menu_list.count
  end
  
  # tell our table what kind of cell to use and its title for the given row

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.text = self.menu_list.objectAtIndex(indexPath.row).objectForKey(TITLE_KEY)
    cell.detailTextLabel.text = self.menu_list.objectAtIndex(indexPath.row).objectForKey(EXPLAIN_KEY)
    cell
  end

end

