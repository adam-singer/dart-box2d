class MathUtils {
  static bool IsValid(double x) {
    return !(x.isInfinite() || x.isNaN());
  }
  
  static Vec2 MultiplyMatt22ByVec2(Mat22 A, Vec2 v) {
    double x = A.col1.x*v.x + A.col2.x*v.y;
    double y = A.col1.y*v.x + A.col2.y*v.y;
    Vec2 u = new Vec2(x,y);
    return u;
  }
}
