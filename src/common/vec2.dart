class Vec2 {
  double x;
  double y;
  Vec2([this.x=0.0,this.y=0.0]);
  Vec2.with(double xy) {
    x=xy;
    y=xy;
  }
  
  double operator [](int index) {
    if (index == 0){
      return x;
    } else if (index == 1) {
      return y;
    } else {
      throw new IndexOutOfRangeException(index);
    }
  }
  
  void operator []=(int index, double value) {
    if (index == 0){
      x=value;
    } else if (index == 1) {
      y=value;
    } else {
      throw new IndexOutOfRangeException(index);
    }
  }
  
  setZero() { x=0.0; y=0.0; }
  
  Set(double xx, double yy) {
    this.x=xx;
    this.y=yy;
  }
  
  Setxy(double xy) {
    this.x = xy;
    this.y = xy;
  }
  
  length() {
    return Math.sqrt(x*x + y*y);
  }
  
  normalize() {
    double len = length();
    if (len < Settings.FLT_EPSILON) {
      return 0.0;
    }
    
    double invLength = 1.0/len;
    x *= invLength;
    y *= invLength;
    
    // Euclidean Norm
    return len;
  }
  
  isValid() {
    return MathUtils.IsValid(x) && MathUtils.IsValid(y);
  }
  
  Vec2 operator negate() {
    Vec2 v = new Vec2(-x, -y);
    return v;
  }
  
  Vec2 operator +(Vec2 other) {
    Vec2 v = new Vec2(x+other.x, y+other.y);
    return v;
  }
  
  Vec2 operator -(Vec2 other) {
    Vec2 v = new Vec2(x-other.x, y-other.y);
    return v;
  }
  
  Vec2 operator *(Vec2 other) {
    Vec2 v = new Vec2(x*other.x, y*other.y);
    return v;
  }
  
  Vec2 scaleBy(double s) {
    Vec2 v = new Vec2(x*s, y*s);
    return v;
  }
  
  bool operator ==(Vec2 other) {
    return x==other.x && y==other.y;
  }
  
  static Vec2 zero() {
    Vec2 v = new Vec2();
    return v;
  }
  
  static dot(Vec2 a, Vec2 b) {
    return a.x*b.x + a.y*b.y;
  }
  
  static cross(Vec2 a, Vec2 b) {
    return a.x*b.y - a.y*b.x;
  }
  
  static crossByVectorScale(Vec2 a, double s) {
    Vec2 v = new Vec2(s*a.y, -s*a.x);
    return v;
  }
  
  static crossByScaleVector(double s, Vec2 a) {
    Vec2 v = new Vec2(-s*a.y, s*a.x);
    return v;
  }
  
  static distance(Vec2 a, Vec2 b) {
    Vec2 c = a - b;
    return c.length();
  }
  
  static distanceSquared(Vec2 a, Vec2 b) {
    Vec2 c = a - b;
    return Vec2.dot(c,c);
  }
}
