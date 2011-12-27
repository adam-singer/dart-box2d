class Transform {
  Vec2 position;
  Mat22 R;
  
  Transform(Vec2 p, Mat22 rotation) {
    position = p;
    R = rotation;
  }
  
  setIdentity() {
    position.setZero();
    R.setIdentity();
  }
  
  Set(Vec2 p, double angle) {
    position = p;
    R.setAngle(angle);
  }
  
  getAngle() {
    return Math.atan2(R.col1.y, R.col1.x);
  }
  
  static identity() {
    Transform t = new Transform(Vec2.zero(),Mat22.identity());
    return t;
  }
}
