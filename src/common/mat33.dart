class Mat33 {
  Vec3 col1;
  Vec3 col2;
  Vec3 col3;
  
  Mat33(Vec3 c1, Vec3 c2, Vec3 c3) {
    col1=c1;
    col2=c2;
    col3=c3;
  }
  
  setZero() {
    col1.setZero();
    col2.setZero();
    col3.setZero();
  }
  
  Vec3 solve33(Vec3 b) {
    double det = Vec3.dot(col1, Vec3.cross(col2, col3));
    assert(det!=0.0);
    det = 1.0/det;
    double x = det * Vec3.dot(b, Vec3.cross(col2, col3));
    double y = det * Vec3.dot(col1, Vec3.cross(b, col3));
    double z = det * Vec3.dot(col1, Vec3.cross(col2, b));
    return new Vec3(x,y,z);
  }
  
  Vec2 solve22(Vec2 b) {
    double a11 = col1.x;
    double a12 = col2.x;
    double a21 = col1.y;
    double a22 = col2.y;
    double det = a11*a22 - a12*a21;
    assert(det!=0.0);
    det = 1.0/det;
    double x = det * (a22*b.x - a12*b.y);
    double y = det * (a11*b.y - a21*b.x);
    Vec2 v = new Vec2(x,y);
    return v;
  }
}
