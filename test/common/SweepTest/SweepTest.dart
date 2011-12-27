#import('../../../src/common/common.dart', prefix:"box2d");
#import('../../../third_party/unittest/unittest_vm.dart');
#source('sweeptests.dart');


class SweepTest {

  SweepTest() {
  }

  void run() {
   new sweeptests().run();
  }


}

void main() {
  new SweepTest().run();
}
