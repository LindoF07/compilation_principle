# compilation_principle
only for homework
1. Node 类 (链表节点)
这个类定义了构成链表的基本元素。

属性/方法	描述
data : Int	存储节点所包含的整数值。
next : Node	指向链表中的下一个 Node 对象。如果它是链表的最后一个节点，则为 void (空)。
init_node(...)	构造函数，用于创建和初始化节点的数据和下一个指针。
get_data(), get_next(), set_next(...)
get_data（）、get_next（）、set_next（...）	提供对节点内部数据和指针的访问和修改接口。

2. Queue 类 (队列实现)
这个类使用 Node 来实现队列的 FIFO (First-In, First-Out，先进先出) 行为。

属性/方法	描述
front : Node	队头指针。元素从这里出队 (Dequeue)。
rear : Node	队尾指针。元素从这里入队 (Enqueue)。
init_queue()	初始化队列，将 front 和 rear 都设为 void (空)。
is_empty()	检查队列是否为空 (即 isvoid front)。
enqueue(item : Int)	入队。将新元素添加到链表的队尾 (rear 后面)。操作时间复杂度为 O(1)。
dequeue() : Int	出队。移除并返回链表队头 (front) 的元素。如果队列为空，则打印错误信息并返回 0。操作时间复杂度为 O(1)。
peek() : Int	查看队头。返回队头元素的值，但不将其移除。
print_queue()	遍历并打印队列中的所有元素。

3. Main 类 (测试程序)
Main 类中的 main() 方法演示了 Queue 类的所有功能，包括：
初始化和测试空队列。
连续进行多次 入队 (enqueue(10), enqueue(20), enqueue(30))。
测试 查看队头 (peek)。
测试 出队 (dequeue) 并打印队列状态。
再次 入队 新元素。
循环 出队 直到队列清空。
测试对空队列执行 出队 时的错误处理机制。

