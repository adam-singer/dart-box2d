class mat33tests {
  run() {
    group('Constructor Test ::', () {
      test('Mat33(Vec3 c1, Vec3 c2, Vec3 c3)', () {
        var mat33 = new box2d.Mat33(
          new box2d.Vec3(1.0,0.0,0.0), 
          new box2d.Vec3(0.0,1.0,0.0), 
          new box2d.Vec3(0.0,0.0,1.0));
        expect(mat33.col1.x).equals(1.0); expect(mat33.col2.x).equals(0.0); expect(mat33.col3.x).equals(0.0);
        expect(mat33.col1.y).equals(0.0); expect(mat33.col2.y).equals(1.0); expect(mat33.col3.y).equals(0.0);
        expect(mat33.col1.z).equals(0.0); expect(mat33.col2.z).equals(0.0); expect(mat33.col3.z).equals(1.0);
      });
    });
    
    group('Test public methods ::', () {
      
      test('setZero()', () {
        var mat33 = new box2d.Mat33(
          new box2d.Vec3(1.0,1.0,1.0), 
          new box2d.Vec3(1.0,1.0,1.0), 
          new box2d.Vec3(1.1,1.0,1.0));
        mat33.setZero();
        expect(mat33.col1.x).equals(0.0); expect(mat33.col2.x).equals(0.0); expect(mat33.col3.x).equals(0.0);
        expect(mat33.col1.y).equals(0.0); expect(mat33.col2.y).equals(0.0); expect(mat33.col3.y).equals(0.0);
        expect(mat33.col1.z).equals(0.0); expect(mat33.col2.z).equals(0.0); expect(mat33.col3.z).equals(0.0);
      });
      
      test('solve33(Vec3 b)', () {
        var mat33 = new box2d.Mat33(
          new box2d.Vec3(1.0,2.0,2.0), 
          new box2d.Vec3(2.0,2.0,1.0), 
          new box2d.Vec3(0.0,1.0,1.0));
        var vec3 = new box2d.Vec3(4.0, 2.0, 2.0);
        vec3 = mat33.solve33(vec3);
        expect(vec3.x).approxEquals(4.0);
        expect(vec3.y).approxEquals(0);
        expect(vec3.z).approxEquals(-6.0);
        
      });
      
      test('solve22(Vec2 b)', () {
        var mat33 = new box2d.Mat33(
          new box2d.Vec3(-1.0,2.0,0.0), 
          new box2d.Vec3(4.0,-6.0,0.0), 
          new box2d.Vec3(0.0,0.0,0.0));
        
        var c = mat33.solve22(new box2d.Vec2(-12,20));
        expect(c.x).equals(4.0); 
        expect(c.y).equals(-2.0); 
      });
    });
  }
}
