#import('../../../src/common/common.dart', prefix:"box2d");
#import('../../../third_party/unittest/unittest_vm.dart');
#source('vec2tests.dart');
class Vec2Test {

  Vec2Test() {
  }

  void run() {
    new Vec2tests().run();
  }
}

void main() {
  new Vec2Test().run();
}
