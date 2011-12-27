#import('../../../src/common/common.dart', prefix:"box2d");
#import('../../../third_party/unittest/unittest_vm.dart');
#source('mat33tests.dart');


class Mat33Test {

  Mat33Test() {
  }

  void run() {
   new mat33tests().run();
  }


}

void main() {
  new Mat33Test().run();
}
