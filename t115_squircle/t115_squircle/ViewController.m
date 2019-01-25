#import "ViewController.h"

// Copied from https://stackoverflow.com/a/49334551/167638
@interface CALayer(Private)

@property BOOL continuousCorners;

@end

@interface ArcView()

@property (strong) CALayer *borderLayer;

@end


@implementation ArcView

- (void)setRadius:(CGFloat)inRadius {
  if(_radius != inRadius) {
    _radius = inRadius;
    self.borderLayer.cornerRadius = inRadius;
    [self setNeedsDisplay];
  }
}

- (void)setInsets:(CGSize)inInsets {
  if(!CGSizeEqualToSize(_insets, inInsets)) {
    _insets = inInsets;
    [self setNeedsLayout];
    [self setNeedsDisplay];
  }
}

- (void)awakeFromNib {
  [super awakeFromNib];
  self.borderLayer = [CALayer new];
  self.borderLayer.borderColor = [[UIColor blueColor] CGColor];
  self.borderLayer.borderWidth = 2.0;
  self.borderLayer.continuousCorners = YES;
  self.borderLayer.cornerRadius = self.radius;
  [self.layer addSublayer:self.borderLayer];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.borderLayer.frame = CGRectInset(self.bounds, self.insets.width, self.insets.height);
}

- (void)drawRect:(CGRect)rect {
  CGFloat theRadius = self.radius;
  CGFloat theOffset = 1.2 * theRadius;
  CGRect theRect = CGRectInset(self.bounds, self.insets.width, self.insets.height);
  UIBezierPath *thePath = [UIBezierPath new];
  CGPoint thePoint;

  [thePath moveToPoint:CGPointMake(CGRectGetMinX(theRect) + theOffset, CGRectGetMinY(theRect))];
  [thePath addLineToPoint:CGPointMake(CGRectGetMaxX(theRect) - theOffset, CGRectGetMinY(theRect))];
  thePoint = CGPointMake(CGRectGetMaxX(theRect), CGRectGetMinY(theRect));
  [thePath addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(theRect), CGRectGetMinY(theRect) + theOffset) controlPoint:thePoint];
  [thePath addLineToPoint:CGPointMake(CGRectGetMaxX(theRect), CGRectGetMaxY(theRect) - theOffset)];
  thePoint = CGPointMake(CGRectGetMaxX(theRect), CGRectGetMaxY(theRect));
  [thePath addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(theRect) - theOffset, CGRectGetMaxY(theRect)) controlPoint:thePoint];
  [thePath addLineToPoint:CGPointMake(CGRectGetMinX(theRect) + theOffset, CGRectGetMaxY(theRect))];
  thePoint = CGPointMake(CGRectGetMinX(theRect), CGRectGetMaxY(theRect));
  [thePath addQuadCurveToPoint:CGPointMake(CGRectGetMinX(theRect), CGRectGetMaxY(theRect) - theOffset) controlPoint:thePoint];
  [thePath addLineToPoint:CGPointMake(CGRectGetMinX(theRect), CGRectGetMinY(theRect) + theOffset)];
  thePoint = CGPointMake(CGRectGetMinX(theRect), CGRectGetMinY(theRect));
  [thePath addQuadCurveToPoint:CGPointMake(CGRectGetMinX(theRect) + theOffset, CGRectGetMinY(theRect)) controlPoint:thePoint];
  thePath.lineWidth = 0.5;
  [[UIColor redColor] set];
  [thePath stroke];
}

@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet ArcView *arcView;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)changeRadius:(id)sender {
  [_arcView setRadius:_slider.value];
}

@end
