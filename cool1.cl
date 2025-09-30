class Node {
    data : Int;    -- 节点存储的元素（数据域）
    next : Node;   -- 指向下一个节点的引用（指针域）
    
    -- 构造函数：初始化一个新的节点
    init_node(d : Int, n : Node) : Node {
        {
            data <- d;
            next <- n;
            self;
        }
    };
    
    -- 获取节点数据
    get_data() : Int { data };
    
    -- 获取下一个节点引用
    get_next() : Node { next };
    
    -- 设置下一个节点引用
    set_next(n : Node) : Node {
        {
            next <- n;
            self;
        }
    };
};

class Queue {
    front : Node;  -- 队头引用（出队 Dequeue 的位置）
    rear : Node;   -- 队尾引用（入队 Enqueue 的位置）
    
    -- 构造函数：初始化一个空队列
    init_queue() : Queue {
        {
            front <- void;
            rear <- void;
            self;
        }
    };
    
    -- 检查队列是否为空
    is_empty() : Bool {
        isvoid front
    };
    
    -- 入队操作 (Enqueue): 在队尾添加元素
    enqueue(item : Int) : Object {
        let new_node : Node <- (new Node).init_node(item, void) in
            if self.is_empty() then
                -- 队列为空时，新节点既是队头也是队尾
                {
                    front <- new_node;
                    rear <- new_node;
                }
            else
                -- 队列不为空时，将当前队尾的 next 指向新节点，并更新队尾引用
                {
                    rear.set_next(new_node);
                    rear <- new_node;
                }
            fi
    };
    
    -- 出队操作 (Dequeue): 移除并返回队头元素
    dequeue() : Int {
        if self.is_empty() then
            -- 队列为空，输出错误信息并返回一个默认值
            {
                (new IO).out_string("Error: Dequeue on empty queue.\n");
                0;
            }
        else
            let result : Int <- front.get_data() in  -- 存储队头数据
            {
                front <- front.get_next();  -- 队头向前移动
                if isvoid front then        -- 如果新的 front 是 void，说明队列变空
                    rear <- void            -- 必须将 rear 也设为 void
                else
                    0                       -- 占位
                fi;
                result;
            }
        fi
    };
    
    -- 查看队头元素 (Peek)：返回队头数据但不移除
    peek() : Int {
        if self.is_empty() then
            {
                (new IO).out_string("Error: Peek on empty queue.\n");
                0;
            }
        else
            front.get_data()
        fi
    };
    
    -- 打印队列内容（调试用途）
    print_queue() : Object {
        if self.is_empty() then
            (new IO).out_string("Queue is empty.\n")
        else
            let curr : Node <- front,
                io : IO <- new IO
            in
            {
                io.out_string("Queue: [");
                while (not isvoid curr) loop
                    {
                        io.out_int(curr.get_data());
                        curr <- curr.get_next();
                        if not isvoid curr then
                            io.out_string(", ")
                        else
                            0
                        fi;
                    }
                pool;
                io.out_string("]\n");
            }
        fi
    };
};

class Main {
    io : IO <- new IO;
    
    main() : Object {
        {
            io.out_string("=== 队列测试程序 ===\n");
            
            -- 创建队列
            let queue : Queue <- (new Queue).init_queue() in
            {
                -- 测试空队列操作
                io.out_string("\n1. 测试空队列:\n");
                queue.print_queue();
                io.out_string("队列是否为空: ");
                if queue.is_empty() then
                    io.out_string("是\n")
                else
                    io.out_string("否\n")
                fi;
                
                -- 入队测试
                io.out_string("\n2. 入队元素 10, 20, 30:\n");
                queue.enqueue(10);
                queue.enqueue(20);
                queue.enqueue(30);
                queue.print_queue();
                
                -- 查看队头元素
                io.out_string("\n3. 查看队头元素: ");
                io.out_int(queue.peek());
                io.out_string("\n");
                
                -- 出队测试
                io.out_string("\n4. 出队操作:\n");
                io.out_string("出队元素: ");
                io.out_int(queue.dequeue());
                io.out_string("\n");
                queue.print_queue();
                
                io.out_string("再次出队元素: ");
                io.out_int(queue.dequeue());
                io.out_string("\n");
                queue.print_queue();
                
                -- 再次入队
                io.out_string("\n5. 再次入队元素 40, 50:\n");
                queue.enqueue(40);
                queue.enqueue(50);
                queue.print_queue();
                
                -- 继续出队直到空
                io.out_string("\n6. 继续出队直到队列为空:\n");
                while (not queue.is_empty()) loop
                    {
                        io.out_string("出队元素: ");
                        io.out_int(queue.dequeue());
                        io.out_string("\n");
                        queue.print_queue();
                    }
                pool;
                
                -- 测试对空队列的出队操作
                io.out_string("\n7. 测试对空队列的出队操作:\n");
                queue.dequeue();
            };
            
            io.out_string("\n=== 测试完成 ===\n");
        }
    };
};