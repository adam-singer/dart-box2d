class sweeptests {

  run() {
    group('Constructor Test ::', () {
      test('Sweep()', () {
        expect(new box2d.Sweep()).isNotNull();
      });
    });
    
    group('Test public methods ::', () {
      test('getTransform(final Transform xf, final double alpha)', () {
        var sweep = new box2d.Sweep();
        var localCenter = new box2d.Vec2(0,0);
        var c0 = new box2d.Vec2(0,0);
        var c = new box2d.Vec2(0,0);
        var a0 = 0.0;
        var a = 0.0;
        var t0 = 0.0;
        
        sweep.localCenter = localCenter;
        sweep.c0 = c0;
        sweep.c = c;
        sweep.a0 = a0;
        sweep.a = a;
        sweep.t0 = t0;
        
        var v = new box2d.Vec2(0,0);
        var col1 = new box2d.Vec2(0,0);
        var col2 = new box2d.Vec2(0,0);
        var mat = new box2d.Mat22(col1,col2);
        var trans = new box2d.Transform(v,mat);
        
        sweep.getTransform(trans, 0.5);
        expect(sweep).isNotNull();
      });
      
      test('advance(double t)', () {
        var sweep = new box2d.Sweep();
        var localCenter = new box2d.Vec2(0,0);
        var c0 = new box2d.Vec2(0,0);
        var c = new box2d.Vec2(0,0);
        var a0 = 0.0;
        var a = 0.0;
        var t0 = 0.0;
        
        sweep.localCenter = localCenter;
        sweep.c0 = c0;
        sweep.c = c;
        sweep.a0 = a0;
        sweep.a = a;
        sweep.t0 = t0;
        
        var v = new box2d.Vec2(0,0);
        var col1 = new box2d.Vec2(0,0);
        var col2 = new box2d.Vec2(0,0);
        var mat = new box2d.Mat22(col1,col2);
        var trans = new box2d.Transform(v,mat);
        
        sweep.advance(0.5);
        expect(sweep).isNotNull();
      });
    });
    
  }
}
