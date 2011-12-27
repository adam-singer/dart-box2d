class Sweep {
  Vec2 localCenter;
  Vec2 c0;
  Vec2 c;
  double a0;
  double a;
  double t0;
  
  getTransform(final Transform xf, final double alpha) {
    assert(xf!=null);
    xf.position = c0.scaleBy(1.0 - alpha) + c.scaleBy(alpha);
    //xf.position = (1.0 - alpha) * c0 + alpha * c;
    double angle = (1.0 - alpha) * a0 + alpha * a;
    xf.R.setAngle(angle);
    
    // Shift to origin
    MathUtils.MultiplyMatt22ByVec2(xf.R, localCenter);
  } 
  
  advance(double t) {
    if (t0 < t && 1.0 - t0 > Settings.FLT_EPSILON) {
      double alpha = (t - t0)/(1.0 - t0);
      c0 = c0.scaleBy(1.0 - alpha) + c.scaleBy(alpha);
      //c0 = (1.0 - alpha) * c0 + alpha * c;
      a0 = (1.0 - alpha) * a0 + alpha * a;
      t0 = t;
    }
  }
}
