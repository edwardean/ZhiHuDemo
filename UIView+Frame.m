// UIView+Frame.m

#import "UIView+Frame.h"
#import <UIKit/UIKit.h>

@implementation UIView (Frames)

- (void)setOrigin:(CGPoint)loc
{
  CGRect rc = self.frame;
  rc.origin = loc;
  self.frame = rc;
}

- (void)setX:(CGFloat)x
{
  CGRect rc = self.frame;
  rc.origin.x = x;
  self.frame = rc;
}

- (void)setY:(CGFloat)y
{
  CGRect rc = self.frame;
  rc.origin.y = y;
  self.frame = rc;
}

- (void)setSize:(CGSize)sz
{
  CGRect rc = self.frame;
  rc.size = sz;
  self.frame = rc;
}

- (void)setWidth:(CGFloat)w
{
  CGRect rc = self.frame;
  rc.size.width = w;
  self.frame = rc;
}

- (void)setHeight:(CGFloat)h
{
  CGRect rc = self.frame;
  rc.size.height = h;
  self.frame = rc;
}

- (void)setCenterY:(CGFloat)y
{
  CGPoint pt = self.center;
  pt.y = y;
  self.center = pt;
}

- (void)setCenterX:(CGFloat)x
{
  CGPoint pt = self.center;
  pt.x = x;
  self.center = pt;
}

- (CGPoint)origin
{
  return self.frame.origin;
}

- (CGFloat)x
{
  return self.frame.origin.x;
}

- (CGFloat)y
{
  return self.frame.origin.y;
}

- (CGFloat)top
{
  return self.frame.origin.y;
}

- (CGFloat)left
{
  return self.frame.origin.x;
}

- (CGFloat)right
{
  return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
  return self.frame.origin.y + self.frame.size.height;
}

- (CGSize)size
{
  return self.frame.size;
}

- (CGFloat)height
{
  return self.frame.size.height;
}

- (CGFloat)width
{
  return self.frame.size.width;
}

- (CGFloat)centerX
{
  return self.center.x;
}

- (CGFloat)centerY
{
  return self.center.y;
}

@end
