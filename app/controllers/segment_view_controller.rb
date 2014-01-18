class RCSegmentViewController < UIViewController
  # attr_accessor :scroll_view

  SEGMENTCONTROL_HEIGHT = 40.0
  LABEL_HEIGHT = 20.0
  TOP_MARGIN = 20.0
  LEFT_MARGIN = 20.0
  RIGHT_MARGIN = 20.0
  TWEEN_MARGIN = 6.0

  def viewDidLoad
    super
    self.title = "SergmentTitle"
    self.view.backgroundColor = UIColor.lightGrayColor
    @scroll_view = UIScrollView.alloc.initWithFrame(self.view.frame)

    puts @scroll_view
    self.view.addSubview(@scroll_view)

    @scroll_view.setContentSize(CGSizeMake(CGRectGetWidth(@scroll_view.frame), CGRectGetHeight(@scroll_view.frame) - CGRectGetHeight(self.navigationController.navigationBar.frame)))

    create_controls
  end

  def create_controls
    segment_text_content = ['Check', 'Search', 'Tools']
    
    # Label
    y_placement = TOP_MARGIN
    frame = CGRectMake(LEFT_MARGIN, y_placement, CGRectGetWidth(self.view.bounds) - (RIGHT_MARGIN * 2.0), LABEL_HEIGHT)

    self.view.addSubview(label_with_frame(frame, title:"Tesing"))

    segmented_control = UISegmentedControl.alloc.initWithItems([UIImage.imageNamed("segment_check.png"), UIImage.imageNamed("segment_search.png"), UIImage.imageNamed("segment_tools.png") ])
    y_placement += TWEEN_MARGIN + LABEL_HEIGHT
    
    frame = CGRectMake(LEFT_MARGIN, y_placement, CGRectGetWidth(self.view.bounds) - (RIGHT_MARGIN * 2.0),SEGMENTCONTROL_HEIGHT)
    segmented_control.frame = frame
    segmented_control.addTarget(self, action:segment_action, forControlEvents:UIControlEventValueChanged)
    segmented_control.segmentedControlStyle = UISegmentedControlStylePlain
    segmented_control.selectedSegmentIndex = 1
    segmented_control.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    
    @scroll_view.addSubview(segmented_control)

    



  end

  def label_with_frame(frame, title:title)
    label = UILabel.alloc.initWithFrame(frame)
    label.text = title
    label.font = UIFont.boldSystemFontOfSize(17.0)
    label.textColor = UIColor.colorWithRed(76.0/255.0, green:86.0/255.0, blue:108.0/255.0, alpha:1.0)
    label.backgroundColor = UIColor.clearColor
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
    label
  end

  def segment_action
  end

end
