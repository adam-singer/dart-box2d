class mat22tests {
  run() {
    group('Constructor Test ::', () {
      test('Create with Vec2', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(1,2), new box2d.Vec2(2,1));
        expect(mat22.col1.x).equals(1);
        expect(mat22.col1.y).equals(2);
        expect(mat22.col2.x).equals(2);
        expect(mat22.col2.y).equals(1);
        
      });
    });
    
    group('Test public methods ::', () {
      test('Set(Vec2 c1, Vec2 c2)', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(1,2), new box2d.Vec2(2,1));
        expect(mat22.col1.x).equals(1);
        expect(mat22.col1.y).equals(2);
        expect(mat22.col2.x).equals(2);
        expect(mat22.col2.y).equals(1);
        mat22.Set(new box2d.Vec2(5,6), new box2d.Vec2(6,5));
        expect(mat22.col1.x).equals(5);
        expect(mat22.col1.y).equals(6);
        expect(mat22.col2.x).equals(6);
        expect(mat22.col2.y).equals(5);
      });
      
      test('setAngle(double angle)', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(0,0), new box2d.Vec2(0,0));
        mat22.setAngle(0);  
        expect(mat22.col1.x).approxEquals(1.0); expect(mat22.col2.x).approxEquals(0.0);
        expect(mat22.col1.y).approxEquals(0.0); expect(mat22.col2.y).approxEquals(1.0);
        
        mat22.setAngle(Math.PI/3);  
        expect(mat22.col1.x).approxEquals(0.5); expect(mat22.col2.x).approxEquals(-0.8660254037844386);
        expect(mat22.col1.y).approxEquals(0.8660254037844386); expect(mat22.col2.y).approxEquals(0.5);
        
      });
      
      test('setIdentity()', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(0,0), new box2d.Vec2(0,0));
        mat22.setIdentity();
        expect(mat22.col1.x).approxEquals(1.0); expect(mat22.col2.x).approxEquals(0.0);
        expect(mat22.col1.y).approxEquals(0.0); expect(mat22.col2.y).approxEquals(1.0);
       
      });
      
      test('setZero()', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(1,1), new box2d.Vec2(1,1));
        mat22.setZero();
        expect(mat22.col1.x).equals(0.0); expect(mat22.col2.x).equals(0.0);
        expect(mat22.col1.y).equals(0.0); expect(mat22.col2.y).equals(0.0);
      });
      
      test('getAngle()', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(1,0), new box2d.Vec2(0,1));
        expect(mat22.getAngle()).equals(0);
        mat22 = new box2d.Mat22(new box2d.Vec2(-1,0), new box2d.Vec2(0,-1));
        expect(mat22.getAngle()).approxEquals(3.141593);
      });
      
      printMatrix(var mat22) {
        print('${mat22.col1.x} ${mat22.col2.x}');
        print('${mat22.col1.y} ${mat22.col2.y}');
      }
      
      test('getInverse()', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(4,3), new box2d.Vec2(3,2));
        mat22 = mat22.getInverse();
        expect(mat22.col1.x).approxEquals(-2.0); expect(mat22.col2.x).approxEquals(3.0);
        expect(mat22.col1.y).approxEquals(3.0); expect(mat22.col2.y).approxEquals(-4.0);
       
        mat22 = new box2d.Mat22(new box2d.Vec2(1,0), new box2d.Vec2(0,1));
        mat22 = mat22.getInverse();
        expect(mat22.col1.x).approxEquals(1.0); expect(mat22.col2.x).approxEquals(0.0);
        expect(mat22.col1.y).approxEquals(0.0); expect(mat22.col2.y).approxEquals(1.0);
       
      });
      
      printVec(var vec) {
        print('${vec.x} ${vec.y}');
      }
      
      test('solve(Vec2 b)', () {
        var mat22 = new box2d.Mat22(new box2d.Vec2(-1,2), new box2d.Vec2(4,-6));
        var vec2 = new box2d.Vec2(-12,20);
        var c = mat22.solve(vec2);
        
        expect(c.x).equals(4.0); 
        expect(c.y).equals(-2.0); 
      });
      
      test('identity()', () {
        var mat22 = box2d.Mat22.identity();
        expect(mat22.col1.x).equals(1.0); expect(mat22.col2.x).equals(0.0); 
        expect(mat22.col1.y).equals(0.0); expect(mat22.col2.y).equals(1.0);
      });
      
      test('operator +(Mat22 other)', () {
        var mat22 = box2d.Mat22.identity();
        mat22 += mat22;
        expect(mat22.col1.x).equals(2.0); expect(mat22.col2.x).equals(0.0); 
        expect(mat22.col1.y).equals(0.0); expect(mat22.col2.y).equals(2.0);
      });
    });
  }
}
