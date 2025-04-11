import 'package:test/test.dart';
import 'package:linked_list_dart/linked_list_dart.dart'; // Adjust this import based on your actual path

void main() {
  group('LinkedList Core Methods', () {
    test('insertAt() inserts value at specific index', () {
      final list = LinkedList();
      list.append(1);
      list.append(3);
      list.insertAt(2, 1);
      expect(list.toList(), [1, 2, 3]);
    });

    test('insertAt() at index 0 on non-empty list', () {
      final list = LinkedList();
      list.append(2);
      list.insertAt(1, 0);
      expect(list.toList(), [1, 2]);
    });

    test('deleteAt() removes node at given index', () {
      final list = LinkedList();
      list.append(10);
      list.append(20);
      list.append(30);
      list.deleteAt(1);
      expect(list.toList(), [10, 30]);
    });

    test('deleteAt() index 0 updates head', () {
      final list = LinkedList();
      list.append(100);
      list.append(200);
      list.deleteAt(0);
      expect(list.toList(), [200]);
    });

    test('deleteByValue() removes first matching node', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.deleteByValue(2);
      expect(list.toList(), [1, 3]);
    });

    test('deleteByValue() with head value', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.deleteByValue(1);
      expect(list.toList(), [2]);
    });

    test('indexOf() returns correct index', () {
      final list = LinkedList();
      list.append(5);
      list.append(10);
      list.append(15);
      expect(list.indexOf(10), 1);
    });

    test('indexOf() returns -1 if not found', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      expect(list.indexOf(3), -1);
    });

    test('get() returns correct value at index', () {
      final list = LinkedList();
      list.append('a');
      list.append('b');
      list.append('c');
      expect(list.get(1), 'b');
    });

    test('contains() returns true if value exists', () {
      final list = LinkedList();
      list.append(42);
      expect(list.contains(42), isTrue);
    });

    test('contains() returns false if value does not exist', () {
      final list = LinkedList();
      list.append(1);
      expect(list.contains(999), isFalse);
    });

    test('length() returns correct size', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      expect(list.length(), 2);
    });

    test('clear() resets the list', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.clear();
      expect(list.toList(), []);
      expect(list.length(), 0);
    });

    test('reverse() reverses the linked list', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.reverse();
      expect(list.toList(), [3, 2, 1]);
    });

    test('reverse() single element list remains unchanged', () {
      final list = LinkedList();
      list.append(99);
      list.reverse();
      expect(list.toList(), [99]);
    });

    test('reverse() on empty list does nothing', () {
      final list = LinkedList();
      list.reverse();
      expect(list.toList(), []);
    });

    test('insertAt() throws IndexError when index is out of bounds', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      expect(() => list.insertAt(3, 5), throwsA(isA<Type>()));
    });

    test('deleteAt() throws IndexError when index is out of bounds', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      expect(() => list.deleteAt(5), throwsA(isA<Type>()));
    });

    test('get() throws IndexError when index is out of bounds', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      expect(() => list.get(5), throwsA(isA<Type>()));
    });

    test('deleteByValue() does nothing if value is not found', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.deleteByValue(999);
      expect(list.toList(), [1, 2]);
      expect(list.length(), 2);
    });

    test('multiple appends and prepends maintain correct order', () {
      final list = LinkedList();
      list.append(3);
      list.prepend(2);
      list.prepend(1);
      list.append(4);
      expect(list.toList(), [1, 2, 3, 4]);
    });

    test('toString() reflects correct list structure', () {
      final list = LinkedList();
      list.append('x');
      list.append('y');
      list.append('z');
      expect(list.toString(), 'x -> y -> z -> null');
    });

    test('insertAt() near end of list', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(4);
      list.insertAt(3, 2);
      expect(list.toList(), [1, 2, 3, 4]);
    });

    test('deleteAt() last item in list', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.deleteAt(2);
      expect(list.toList(), [1, 2]);
    });

    test('clear() followed by new insertions', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.clear();
      list.append(3);
      expect(list.toList(), [3]);
      expect(list.length(), 1);
    });

    test('reverse() twice returns to original order', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.reverse();
      list.reverse();
      expect(list.toList(), [1, 2, 3]);
    });

    test('length() on empty list returns 0', () {
      final list = LinkedList();
      expect(list.length(), 0);
    });

    test('length() after multiple appends returns correct size', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      expect(list.length(), 3);
    });

    test('length() after multiple prepends returns correct size', () {
      final list = LinkedList();
      list.prepend(1);
      list.prepend(2);
      list.prepend(3);
      expect(list.length(), 3);
    });

    test('length() after mixed insertions (prepend, append, insertAt)', () {
      final list = LinkedList();
      list.append(1);       // [1]
      list.prepend(0);      // [0, 1]
      list.insertAt(2, 1);  // [0, 2, 1]
      expect(list.length(), 3);
    });

    test('length() updates correctly after deletions', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.deleteAt(1);  // deletes 2
      list.deleteByValue(3);
      expect(list.length(), 1);
    });

    test('reverseList() reverses the linked list', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      list.reverseList();
      expect(list.toList(), [3, 2, 1]);
    });

    test('reverseList() single element list remains unchanged', () {
      final list = LinkedList();
      list.append(99);
      list.reverseList();
      expect(list.toList(), [99]);
    });

    test('reverseList() on empty list does nothing', () {
      final list = LinkedList();
      list.reverseList();
      expect(list.toList(), []);
    });

    test('hasCycle returns false on empty list', () {
      final list = LinkedList();
      expect(list.hasCycle(), isFalse);
    });

    test('hasCycle returns false on single node without cycle', () {
      final list = LinkedList();
      list.append(1);
      expect(list.hasCycle(), isFalse);
    });

    test('hasCycle returns true on single node with cycle', () {
      final node = Node(1, null);
      node.next = node; // self-cycle
      final list = LinkedList();
      list.head = node;
      expect(list.hasCycle(), isTrue);
    });

    test('hasCycle returns false on multiple nodes without cycle', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);
      expect(list.hasCycle(), isFalse);
    });

    test('hasCycle returns true on multiple nodes with cycle', () {
      final list = LinkedList();
      list.append(1);
      list.append(2);
      list.append(3);

      // Creating cycle manually
      final firstNode = list.head;
      final secondNode = firstNode?.next;
      final thirdNode = secondNode?.next;
      thirdNode?.next = secondNode; // creates a cycle at node with value 2

      expect(list.hasCycle(), isTrue);
    });


  });
}
