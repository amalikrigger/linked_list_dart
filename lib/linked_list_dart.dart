int calculate() {
  return 6 * 7;
}

class Node {
  Object value;
  Node? next;
  Node(this.value, this.next);
}

class LinkedList {
  Node? head;
  int size = 0;

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

  List<Object> toList() {
    final values = <Object>[];
    var current = head;
    while (current != null) {
      values.add(current.value);
      current = current.next;
    }
    return values;
  }

  void prepend(Object value) {
    if (head == null) {
      head = Node(value, null);
    } else {
      var node = Node(value, head);
      head = node;
    }
    size++;
  }

  void append(Object value) {
    if (head == null) {
      head = Node(value, null);
    } else {
      var currentNode = head!;
      while (currentNode.next != null) {
        currentNode = currentNode.next!;
      }
      currentNode.next = Node(value, null);
    }
    size++;
  }

  int indexOf(Object value) {
    if (head == null) {
      return -1;
    } else {
      var currentNode = head;
      int i = 0;
      while (i < size) {
        if (currentNode?.value != value) {
          currentNode = currentNode?.next;
          i++;
        } else {
          return i;
        }
      }
      return -1;
    }
  }

  Object? get(int index) {
    if (index >= size) {
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

  void insertAt(Object value, int index) {
    if (index >= size) {
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
    size++;
  }

  void deleteAt(int index) {
    if (index >= size) {
      throw IndexError;
    }
    if (head == null) {
      return;
    } else {
      if (index == 0) {
        head = head?.next;
      }
      var currentNode = head;
      int i = 0;
      while (i < index - 1) {
        currentNode = currentNode?.next;
        i++;
      }
      currentNode?.next = currentNode.next?.next;
    }
    size--;
  }

  void deleteByValue(Object value) {
    if (head == null) {
      return;
    } else {
      var currentNode = head;
      Node? previousNode;
      int i = 0;
      while (i < size) {
        if (currentNode?.value != value) {
          previousNode = currentNode;
          currentNode = currentNode?.next;
          i++;
        } else {
          if (i == 0) {
            head = currentNode?.next;
          } else {
            previousNode?.next = currentNode?.next;
          }
          size--;
          break;
        }
      }
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
    size = 0;
  }

  int length() {
    return size;
  }

  void reverse() {
    if (head == null || size <= 1) {
      return;
    } else {
      var start = 0;
      var end = size - 1;
      var currentNode = head;
      var startNode = head;
      while (start < end) {
        int i = 0;
        while (i < end) {
          if (start == i) {
            startNode = currentNode;
          }
          currentNode = currentNode?.next;
          i++;
        }
        var tempNode = Node(startNode!.value, startNode.next);
        startNode.value = currentNode!.value;
        currentNode.value = tempNode.value;
        start++;
        end--;
      }
    }
  }
}
