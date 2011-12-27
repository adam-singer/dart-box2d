class Vec2tests {
  run() {
    group('Constructor Test ::', () {
      test('is not null', () {
       var vec2 = new box2d.Vec2();
       expect(vec2).isNotNull();
       expect(vec2 is box2d.Vec2).isTrue();
      });
      
      test('X,Y values 0', () {
        var vec2 = new box2d.Vec2();
        expect(vec2.x==0).isTrue();
        expect(vec2.y==0).isTrue();
      });
      
      test('X,Y values 2 parameters', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2.x==1).isTrue();
        expect(vec2.y==1).isTrue();
      });
      
      test('X,Y values 1 x parameters', () {
        var vec2 = new box2d.Vec2(x:1);
        expect(vec2.x==1).isTrue();
        expect(vec2.y==0).isTrue();
      });
      
      test('X,Y values 1 y parameters', () {
        var vec2 = new box2d.Vec2(y:1);
        expect(vec2.x==0).isTrue();
        expect(vec2.y==1).isTrue();
      });
      
      test('X,Y values 1 parameters', () {
        var vec2 = new box2d.Vec2.with(1.0);
        expect(vec2.x).equals(1.0);
        expect(vec2.y).equals(1.0);
      });
    });
    
    group('Set/Get test ::', () {
      test('set X,Y values', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2.x==1).isTrue();
        expect(vec2.y==1).isTrue();
        vec2.x=2;
        vec2.y=2;
        expect(vec2.x==2).isTrue();
        expect(vec2.y==2).isTrue();
      });
    });
    
    group('Index test ::', () {
      test('get X,Y values', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2[0]==1).isTrue();
        expect(vec2[1]==1).isTrue();
      });
      
      test('set X,Y values', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2[0]==1).isTrue();
        expect(vec2[1]==1).isTrue();
        vec2[0]=2;
        vec2[1]=2;
        expect(vec2[0]==2).isTrue();
        expect(vec2[1]==2).isTrue();
      });
      
      test('throw index exception', () {
        expectThrow(() {
          var vec2 = new box2d.Vec2(x:1,y:1);
          var v = vec2[2];
        });
      });
    });
    
    group('Test public methods ::', () {
      test('setZero', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2.x==1).isTrue();
        expect(vec2.y==1).isTrue();
        vec2.setZero();
        expect(vec2.x==0.0).isTrue();
        expect(vec2.y==0.0).isTrue();
      });
      
      test('Set(x,y)', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2.x).equals(1.0);
        expect(vec2.y).equals(1.0);
        vec2.Set(0,0);
        expect(vec2.x).equals(0.0);
        expect(vec2.y).equals(0.0);
      });
      
      test('Setxy(xy)', () {
        var vec2 = new box2d.Vec2(x:1,y:1);
        expect(vec2.x).equals(1.0);
        expect(vec2.y).equals(1.0);
        vec2.Setxy(0);
        expect(vec2.x).equals(0.0);
        expect(vec2.y).equals(0.0);
      });
      
      test('length()', () {
        var vec2 = new box2d.Vec2(x:1,y:0);
        expect(vec2.length()).equals(1.0);
      });
      
      test('normalize()', () {
        var vec2 = new box2d.Vec2(x:1,y:0);
        expect(vec2.normalize()).equals(0.0);
        vec2 = new box2d.Vec2(x:1.0,y:1.0);
        expect(vec2.normalize()).approxEquals(1.41421);
        expect(vec2.x).approxEquals(0.707107);
        expect(vec2.y).approxEquals(0.707107);
      });
      
      test('isValid() isInfinite', () { 
        double x=1.0;
        double y=0.0;
        expect(x.isInfinite()).isFalse();
        expect(x.isNaN()).isFalse();
        expect(y.isInfinite()).isFalse();
        expect(y.isNaN()).isFalse();
        
        bool isValid(double xx) {
          return !(xx.isInfinite() || xx.isNaN());
        }
        
        expect(isValid(x)).isTrue();
        expect(isValid(y)).isTrue();
        
      });
      
      test('isValid()', () {
        var vec2 = new box2d.Vec2(x:1.0,y:1.0);
        expect(vec2.isValid()).isTrue();
        
        vec2 = new box2d.Vec2(x:double.INFINITY,y:0);
        expect(vec2.isValid()).isFalse();
        
        vec2 = new box2d.Vec2(x:double.NAN,y:0);
        expect(vec2.isValid()).isFalse();
        
        vec2 = new box2d.Vec2(x:double.NEGATIVE_INFINITY,y:0);
        expect(vec2.isValid()).isFalse();
      });
      
      test('operator negate()', () {
        var vec2 = new box2d.Vec2(x:1.0,y:1.0);
        vec2 = -vec2;
        expect(vec2.x).equals(-1.0);
        expect(vec2.y).equals(-1.0);
      });
      
      test('operator +', () {
        var vec2 = new box2d.Vec2(x:1.0,y:1.0);
        vec2 += vec2;
        expect(vec2.x).equals(2.0);
        expect(vec2.y).equals(2.0);
      });
      
      test('operator -', () {
        var vec1 = new box2d.Vec2(x:1.0,y:1.0);
        var vec2 = new box2d.Vec2(x:2.0,y:2.0);
        var vec3 = vec2 - vec1;
        expect(vec3.x).equals(1.0);
        expect(vec3.y).equals(1.0);
      });
      
      test('operator *', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:2.0,y:2.0);
        var vec3 = vec2 * vec1;
        expect(vec3.x).equals(4.0);
        expect(vec3.y).equals(4.0);
      });
      
      test('scaleBy(double other)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = vec1.scaleBy(10);
        expect(vec2.x).equals(20.0);
      });
      
      test('operator ==', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:2.0,y:2.0);
        expect(vec1==vec2).isTrue();
        vec1 = new box2d.Vec2(x:2.0,y:1.0);
        expect(vec1==vec2).isFalse();
      });
      
      test('operator !=', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:1.0,y:2.0);
        expect(vec1!=vec2).isTrue();
        vec1 = new box2d.Vec2(x:1.0,y:2.0);
        expect(vec1!=vec2).isFalse();
      });
      
      test('zero()', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        box2d.Vec2 vec2 = box2d.Vec2.zero();
        expect(vec2.x).equals(0.0);
        expect(vec2.y).equals(0.0);
      });
      
      test('Dot(Vec2 a, Vec2 b)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:2.0,y:2.0);
        var dot = box2d.Vec2.dot(vec1,vec2);
        expect(dot).isNotNull();
        expect(dot).equals(8);
      });
      
      test('Cross(Vec2 a, Vec2 b)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:2.0,y:2.0);
        var cross = box2d.Vec2.cross(vec1,vec2);
        expect(cross).isNotNull();
        expect(cross).equals(0);
        
        vec1 = new box2d.Vec2(x:1.0,y:3.0);
        vec2 = new box2d.Vec2(x:2.0,y:2.0);
        cross = box2d.Vec2.cross(vec1,vec2);
        expect(cross).isNotNull();
        expect(cross).equals(-4.0);
      });
      
      test('CrossByVectorScale(Vec2 a, double s)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = box2d.Vec2.crossByVectorScale(vec1, 10.0);
        expect(vec2).isNotNull();
        expect(vec2.x).equals(20.0);
        expect(vec2.y).equals(-20.0);
      });
      
      test('CrossByScaleVector(double s, Vec2 a)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = box2d.Vec2.crossByScaleVector(10.0, vec1);
        expect(vec2).isNotNull();
        expect(vec2.x).equals(-20.0);
        expect(vec2.y).equals(20.0);
      });
      
      test('Distance(Vec2 a, Vec2 b)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:1.0,y:1.0);
        var d = box2d.Vec2.distance(vec1, vec2);
        expect(d).approxEquals(Math.SQRT2);
      });
      
      test('DistanceSquared(Vec2 a, Vec2 b)', () {
        var vec1 = new box2d.Vec2(x:2.0,y:2.0);
        var vec2 = new box2d.Vec2(x:1.0,y:1.0);
        var d = box2d.Vec2.distanceSquared(vec1, vec2);
        expect(d).equals(2);
      });
    });
    /*
    group('', () {
      test('', () {
        
      });
    });
    */
  }
}


