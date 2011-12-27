class transformtests {
  run() {
    group('Constructor Test ::', () {
      test('Transform(Vec2 p, Mat22 rotation)', () {
        var v = new box2d.Vec2(0,0);
        var mat = new box2d.Mat22(v,v);
        var trans = new box2d.Transform(v,mat);
        expect(trans).isNotNull();
      });
    });
    
    group('Test public methods ::', () {    
      test('setIdentity()', () {
        var v = new box2d.Vec2(0,0);
        var col1 = new box2d.Vec2(0,0);
        var col2 = new box2d.Vec2(0,0);
        var mat = new box2d.Mat22(col1,col2);
        var trans = new box2d.Transform(v,mat);
        expect(trans).isNotNull();
        trans.setIdentity();
        expect(trans.position.x).equals(0.0);
        expect(trans.position.y).equals(0.0);
        expect(trans.R.col1.x).equals(1.0); expect(trans.R.col2.x).equals(0.0);
        expect(trans.R.col1.y).equals(0.0); expect(trans.R.col2.y).equals(1.0);
      });
      
      test('Set(Vec2 p, double angle)', () {
        var v = new box2d.Vec2(0,0);
        var col1 = new box2d.Vec2(0,0);
        var col2 = new box2d.Vec2(0,0);
        var mat = new box2d.Mat22(col1,col2);
        var trans = new box2d.Transform(v,mat);
        
        trans.Set(new box2d.Vec2(1,1), Math.PI/3);
        expect(trans.position.x).equals(1.0);
        expect(trans.position.y).equals(1.0);
        expect(trans.R.col1.x).approxEquals(0.5); expect(trans.R.col2.x).approxEquals(-0.8660254037844386);
        expect(trans.R.col1.y).approxEquals(0.8660254037844386); expect(trans.R.col2.y).approxEquals(0.5);
      
      });
      
      test('getAngle()', () {
        var v = new box2d.Vec2(0,0);
        var col1 = new box2d.Vec2(1,0);
        var col2 = new box2d.Vec2(0,1);
        var mat = new box2d.Mat22(col1,col2);
        var trans = new box2d.Transform(v,mat);
        expect(trans.getAngle()).equals(0);
        
      });
      
      test('static identity()', () {
        var trans = box2d.Transform.identity();
        expect(trans.position.x).equals(0.0);
        expect(trans.position.y).equals(0.0);
        expect(trans.R.col1.x).equals(1.0); expect(trans.R.col2.x).equals(0.0);
        expect(trans.R.col1.y).equals(0.0); expect(trans.R.col2.y).equals(1.0);
      });
    });
  }
}
