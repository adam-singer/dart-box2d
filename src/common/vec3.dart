class Vec3 {
  double x;
  double y;
  double z;
  
  Vec3(this.x,this.y,this.z);
  
  setZero() { x=0.0;y=0.0;z=0.0; }
  
  Set(double xx, double yy, double zz) {
    this.x=xx;
    this.y=yy;
    this.z=zz;
  }
  
  static dot(Vec3 a, Vec3 b) {
    return a.x*b.x + a.y*b.y + a.z*b.z;
  }
  
  static cross(Vec3 a, Vec3 b) {
    Vec3 v = new Vec3(
      a.y * b.z - a.z * b.y, 
      a.z * b.x - a.x * b.z,
      a.x * b.y - a.y * b.x);
    return v; 
  }
  
  Vec3 operator negate() {
    Vec3 v = new Vec3(-x,-y,-z);
    return v;
  }
  
  Vec3 operator +(Vec3 other) {
    Vec3 v = new Vec3(x+other.x, y+other.y, z+other.z);
    return v;
  }
  
  Vec3 operator -(Vec3 other) {
    Vec3 v = new Vec3(x-other.x, y-other.y, z-other.z);
    return v;
  }
  
  scaleBy(double s) {
    Vec3 v = new Vec3(x*s, y*s, z*s);
    return v;
  }
}
