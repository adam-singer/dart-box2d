#import('../../../src/common/common.dart', prefix:"box2d");
#import('../../../third_party/unittest/unittest_vm.dart');
#source('vec3tests.dart');


class Vec3Test {

  Vec3Test() {
  }

  void run() {
   new vec3tests().run();
  }


}

void main() {
  new Vec3Test().run();
}
