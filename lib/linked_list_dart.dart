class Node<T> {
  final T value;
  Node<T>? next;

  Node(this.value, [this.next]);
}

class LinkedList<T> {
  Node<T>? head;
  int _size = 0;

  LinkedList();

  @override
  String toString() {
    var output = '';
    var current = head;
    while (current != null) {
      output += '${current.value} -> ';
      current = current.next;
    }
    return '${output}null';
  }

  List<T> toList() {
    final values = <T>[];
    var current = head;
    while (current != null) {
      values.add(current.value);
      current = current.next;
    }
    return values;
  }

  void prepend(T value) {
    head = Node(value, head);
    _size++;
  }

  void append(T value) {
    final newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
    _size++;
  }

  int indexOf(Object value) {
    var current = head;
    int index = 0;
    while (current != null) {
      if (current.value == value) return index;
      current = current.next;
      index++;
    }
    return -1;
  }

  Object? get(int index) {
    if (index >= _size) {
      throw IndexError;
    }
    if (head == null) {
      return null;
    } else {
      var currentNode = head;
      var i = 0;
      while (i != index) {
        currentNode = currentNode?.next;
        i++;
      }
      return currentNode?.value;
    }
  }

  void insertAt(T value, int index) {
    if (index >= _size) {
      throw IndexError;
    }
    if (head == null || index == 0) {
      head = Node(value, head);
    } else {
      var currentNode = head;
      var i = 0;
      while (i < index - 1) {
        currentNode = currentNode?.next;
        i++;
      }
      currentNode?.next = Node(value, currentNode.next);
    }
    _size++;
  }

  void deleteAt(int index) {
    if (index < 0 || index >= _size) throw IndexError;

    if (index == 0) {
      head = head?.next;
    } else {
      var current = head;
      for (int i = 0; i < index - 1; i++) {
        current = current?.next;
      }
      current?.next = current.next?.next;
    }
    _size--;
  }

  void deleteByValue(Object value) {
    if (head == null) return;

    if (head!.value == value) {
      head = head!.next;
      _size--;
      return;
    }

    var current = head;
    while (current?.next != null) {
      if (current!.next!.value == value) {
        current.next = current.next!.next;
        _size--;
        return;
      }
      current = current.next;
    }
  }

  bool contains(Object value) {
    if (indexOf(value) >= 0) {
      return true;
    } else {
      return false;
    }
  }

  void clear() {
    head = null;
    _size = 0;
  }

  int length() {
    return _size;
  }

  void reverse() {
    var current = head;
    Node<T>? prev;

    while (current != null) {
      final next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }

    head = prev;
  }

  bool hasCycle() {
    var fast = head;
    var slow = head;

    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
      if (slow == fast) {
        return true;
      }
    }
    return false;
  }
}

extension IterableLinkedList on LinkedList {
  Iterable<Object> get iterable sync* {
    var current = head;
    while (current != null) {
      yield current.value;
      current = current.next;
    }
  }
}

