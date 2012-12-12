Model = require "./model"
#CVImage = require './Image'

module.exports = class Feature extends Model

  x = 0.00
  y = 0.00 
  mMaxX = null
  mMaxY = null
  mMinX = null
  mMinY = null
  mWidth = null
  mHeight = null
  srcImgW = null
  srcImgH = null
  mAspectRatio = null
  boundingBox = null 
  extents = null 
  points = null  
  image = null
  
  constructor:(@image,@x,@y,@points)->
    #this.updateExtents()
    return 

  meanColor:()=>
    return @image.getPixel(@x,@y)

  draw:(color=Color.RED,width=-1)=>
    c = @image.getDrawingLayer().color(color[0],color[1],color[2])
    @image.getDrawingLayer().fill(c);
    @image.getDrawingLayer().noStroke();
    @image.getDrawingLayer().point(@x,@y)
    
  colorDistance:(c)=>
    mc = @meanColor()
    r = mc[0]-c[0]
    g = mc[1]-c[1]
    b = mc[2]-c[2]
    return Math.sqrt(r*r+g*g+b*b)

  angle:()=>
    return undefined

  length:()=>
    return Math.max(@width(),@height())

  distanceToNearestEdge:()=>
    return Math.min(@mMinX,@mMinY,@width-@mMaxX,@height-@mMaxY)

  onImageEdge:(tolerance=1)=>
    return(@distanceToNearestEdge()<=tolerance)

  notOnImageEdge:(tolerance=1)=>
    return(@distanceToNearestEdge()>tolerance)

  aspectRatio:()=>
    @updateExtents()
    return @mAspectRatio

  width:()=>
    @updateExtents()
    return @mWidth

  height:()=>
    @updateExtents()
    return @mHeight

  crop:()=>
    return @image.crop(@x,@y,@width(),@height(),centered=true)

  updateExtents:()=>
    if( !@mMaxX or !@mMaxY or !@mMinX or !@mMinY or
        !@mWidth or !@mHeight or !@mExtents or !@mBoundingBox ) 
      @mMaxX = -1.7976931348623157E+10308
      @mMaxY = -1.7976931348623157E+10308 #+/- infinity
      @mMinX = 1.7976931348623157E+10308
      @mMinY = 1.7976931348623157E+10308
      for p in @points
        if( p[0] > @mMaxX)
          @mMaxX = p[0] 
        if( p[0] < @mMinX)
          @mMinX = p[0]
        if( p[1] > @mMaxY)
          @mMaxY = p[1]
        if( p[1] < @mMinY)
          @mMinY = p[1]
      @mWidth = @mMaxX-@mMinX
      @mHeight = @mMaxY-@mMinY
      if( @mWidth <= 0 )
        @mWidth = 1
      if( @mHeight <= 0 )
        @mHeight = 1
      @mBoundingBox = [@mMinX,@mMinY,@mWidth,@mHeight]
      @mExtents = [@mMaxX,@mMinX,@mMaxY,@mMinY]
      @mAspectRatio = Math.max(@mWidth,@mHeight)/Math.min(@mWidth,@mHeight)

  boundingBox:()=>
    @updateExtents()
    return @mBoundingBox

  extents:()=>
    @updateExtents()
    return @mExtents

  minY:()=>
    @updateExtents()
    return @mMinY

  minX:()=>
    @updateExtents()
    return @mMinX

  maxY:()=>
    @updateExtents()
    return @mMaxY

  maxX:()=>
    @updateExtents()
    return @mMaxX
    
  topLeftCorner:()=>
    @updateExtents()
    return [@mMinX,@mMinY]  
  
  topRightCorner:()=>
    @updateExtents()
    return [@mMaxX,@mMinY]  

  bottomLeftCorner:()=>
    @updateExtents()
    return [@mMinX,@mMaxY]  

  bottomRightCorner:()=>
    @updateExtents()
    return [@mMaxX,@mMaxY]  
