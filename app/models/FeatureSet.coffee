Model = require "./model"
CVImage = require './Image'
Feature = require './Feature'

module.exports = class FeatureSet extends Model

  
class FeatureSet #extends Array 
  # this is following
  # http://stackoverflow.com/questions/9688009/coffeescript-how-to-use-extends-for-array
  # http://stackoverflow.com/questions/7450354/why-does-setting-positions-in-a-subclass-of-array-not-change-its-length-should
  constructor:(objs)->
    @mArray = new Array(objs)
    
  length:()->
    return @mArray.length
    
  getArray:()->
    return @mArray

  draw:(color=Color.RED,width=-1)
    for obj in @mArray
      obj.draw(Color,width)

  #not sure we need SHOW
  #
  #

  x:()->
    return (obj.x for obj in @mArray)

  y:()->
    return (obj.y for obj in @mArray)

  coordinates:()->
    return ([obj.x,obj.y] for obj in @mArray)

  area:()->
    return ([obj.width()*obj.height()] for obj in @mArray)

 # sortArea(self):
 # return FeatureSet(sorted(self, key = lambda f: f.area()))
  
  distanceFrom:( point = [-1, -1])->
    #if (point[0] == -1 or point[1] == -1)
    #return spsd.cdist(self.coordinates(), [point])[:,0]
  
  sortDistance:( point = (-1, -1))->
    # return FeatureSet(sorted(self, key = lambda f: f.distanceFrom(point)))
        
  distancePairs:()->
    #return spsd.squareform(spsd.pdist(self.coordinates()))
  
  angle:()->
    #return np.array([f.angle() for f in self])
  
  sortAngle:(theta = 0)->
    #return FeatureSet(sorted(self, key = lambda f: abs(f.angle() - theta)))
  
  length:()->
    #return np.array([f.length() for f in self])
  
  sortLength:()->
    #return FeatureSet(sorted(self, key = lambda f: f.length()))
  
  meanColor:()->
    #return np.array([f.meanColor() for f in self])
  
  colorDistance:(color = (0, 0, 0)->
    #return spsd.cdist(self.meanColor(), [color])[:,0]
    
  sortColorDistance:(color = (0, 0, 0))->
    #return FeatureSet(sorted(self, key = lambda f: f.colorDistance(color)))
  
  filter:(filterarray)->
    #return FeatureSet(list(np.array(self)[np.array(filterarray)]))
  
  width:()->
    #return np.array([f.width() for f in self])
  
  height:()->
    #return np.array([f.height() for f in self])
  
  crop:()->
    #return np.array([f.crop() for f in self])  

  onImageEdge:(tolerance=1)->
    # fs = FeatureSet()
    # for f in self:
    #     if(f.onImageEdge(tolerance)):
    #         fs.append(f)
    # return fs 

  notOnImageEdge:(self, tolerance=1)->
    # fs = FeatureSet()
    # for f in self:
    #     if(f.notOnImageEdge(tolerance)):
    #         fs.append(f)
    # return fs

  topLeftCorners:()->
    #return np.array([f.topLeftCorner() for f in self])  

  bottomLeftCorners:()->
    # return np.array([f.bottomLeftCorner() for f in self])  

  topLeftCorners:()->
    # return np.array([f.topLeftCorner() for f in self])  
        
  topRightCorners:()->
    # return np.array([f.topRightCorner() for f in self])  
            
  bottomRightCorners:()->
    # return np.array([f.bottomRightCorner() for f in self])  

  aspectRatios:()->
    # return np.array([f.aspectRatio() for f in self])

