class Mat22 {
  Vec2 col1;
  Vec2 col2;
    
  Mat22(Vec2 c1, Vec2 c2) {
    col1=c1;
    col2=c2;
  }
  
  Mat22.withDouble(double a11, double a12, double a21, double a22) {
    col1 = new Vec2(a11, a21);
    col2 = new Vec2(a12, a22);
  }
  
  Mat22.withAngle(double angle) {
    double c = Math.cos(angle);
    double s = Math.sin(angle);
    col1 = new Vec2(c, s);
    col2 = new Vec2(-s, c);
  }
  
  Set(Vec2 c1, Vec2 c2) {
    col1=c1;
    col2=c2;
  }
  
  setAngle(double angle) {
    double c = Math.cos(angle);
    double s = Math.sin(angle);
    col1 = new Vec2(c, s);
    col2 = new Vec2(-s, c);
  }
  
  setIdentity() {
    col1.x = 1.0; col2.x = 0.0;
    col1.y = 0.0; col2.y = 1.0;
  }
  
  setZero() {
    col1.x = 0.0; col2.x = 0.0;
    col1.y = 0.0; col2.y = 0.0;
  }
  
  getAngle() {
    return Math.atan2(col1.y, col1.x);
  }
  
  isIdentity() {
    if (col1.x == 1.0 && col1.y == 0.0 && col2.x == 1.0 && col2.y == 0.0) {
      return true;
    } else {
      return false;
    }
      
  }
  
  getInverse() {
    if (isIdentity()) {
      return identity();
    }
    
    double a = col1.x;
    double b = col2.x;
    double c = col1.y;
    double d = col2.y;
    double det = a * d - b * c;
    assert(det!=0.0);
    det = 1.0/det;
    double c1x = det * d;
    double c1y = -det * c;
    double c2x = -det * b;
    double c2y = det * a;
    return new Mat22(new Vec2(c1x, c1y), new Vec2(c2x, c2y));
  }
  
  solve(Vec2 b) {
    double a11 = col1.x;
    double a12 = col2.x;
    double a21 = col1.y;
    double a22 = col2.y;
    double det = a11*a22 - a12*a21;
    assert(det!=0.0);
    det = 1.0/det;
    double x = det * (a22 * b.x - a12 * b.y);
    double y = det * (a11 * b.y - a21 * b.x);
    Vec2 v = new Vec2(x,y);
    return v;
  }
  
  static identity() {
    return new Mat22.withDouble(1.0,0.0,0.0,1.0);
  }
  
  Mat22 operator +(Mat22 other) {
    Mat22 c = new Mat22(col1 + other.col1, col2 + other.col2);
    return c;
  }
}
