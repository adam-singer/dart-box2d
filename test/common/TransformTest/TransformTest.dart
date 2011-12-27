#import('../../../src/common/common.dart', prefix:"box2d");
#import('../../../third_party/unittest/unittest_vm.dart');
#source('transformtests.dart');



class TransformTest {

  TransformTest() {
  }

  void run() {
   new transformtests().run();
  }


}

void main() {
  new TransformTest().run();
}
