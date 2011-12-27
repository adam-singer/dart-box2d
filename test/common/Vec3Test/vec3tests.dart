class vec3tests {
  run() {
    group('Constructor Test ::', () {
      test('is not null', () {
        var vec3 = new box2d.Vec3(0,1,0);
        expect(vec3).isNotNull();
        expect(vec3 is box2d.Vec3).isTrue();
        expect(vec3.x).equals(0.0);
        expect(vec3.y).equals(1.0);
        expect(vec3.z).equals(0.0);
      });
    });
    
    group('Test public methods ::', () {
      test('setZero()', () {
        var vec3 = new box2d.Vec3(1,1,1);
        expect(vec3).isNotNull();
        expect(vec3 is box2d.Vec3).isTrue();
        expect(vec3.x).equals(1.0);
        expect(vec3.y).equals(1.0);
        expect(vec3.z).equals(1.0);
        vec3.setZero();
        expect(vec3.x).equals(0.0);
        expect(vec3.y).equals(0.0);
        expect(vec3.z).equals(0.0);
      });
      
      test('dot(Vec3 a, Vec3 b)', () {
        var vec1 = new box2d.Vec3(1,2,3);
        var vec2 = new box2d.Vec3(3,4,5);
        var dot = box2d.Vec3.dot(vec1,vec2);
        expect(dot).equals(26);
      });
      
      test('cross(Vec3 a, Vec3 b)', () {
        var vec1 = new box2d.Vec3(1,2,3);
        var vec2 = new box2d.Vec3(3,4,5);
        var cross = box2d.Vec3.cross(vec1,vec2);
        expect(cross.x).equals(-2.0);
        expect(cross.y).equals(4.0);
        expect(cross.z).equals(-2.0);
      });
      
      test('operator negate()', () {
        var vec1 = new box2d.Vec3(1,2,3);
        vec1 = -vec1;
        expect(vec1.x).equals(-1.0);
        expect(vec1.y).equals(-2.0);
        expect(vec1.z).equals(-3.0);
      });
      
      test('operator +(Vec3 other)', () {
        var vec1 = new box2d.Vec3(1,2,3);
        var vec2 = new box2d.Vec3(3,4,5);
        var sum = vec1 + vec2;
        expect(sum.x).equals(4.0);
        expect(sum.y).equals(6.0);
        expect(sum.z).equals(8.0);
      });
      
      test('operator -(Vec3 other)', () {
        var vec1 = new box2d.Vec3(1,2,3);
        var vec2 = new box2d.Vec3(3,4,5);
        var sub = vec1 - vec2;
        expect(sub.x).equals(-2.0);
        expect(sub.y).equals(-2.0);
        expect(sub.z).equals(-2.0);
      });
      
      test('scaleBy(double s)', () {
        var vec1 = new box2d.Vec3(1,2,3);
        var vec2 = vec1.scaleBy(10.0);
        expect(vec2.x).equals(10.0);
        expect(vec2.y).equals(20.0);
        expect(vec2.z).equals(30.0);
      });
    });
  }
}
