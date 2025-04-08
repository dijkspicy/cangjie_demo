package cangjieflops.scheduler

import cangjieflops.common.*
import std.collection.*
import std.sync.*
import std.time.*

public class SpuScheduler {
    let elector: Elector
    let queue: Queue<Pod>
    let watcher: Watcher<Pod>

    public init() {
        this.elector = SingletonElector()
        this.queue = Queue<Pod>()
        this.watcher = Watcher<Pod>()
    }

    public func start() {
        let master = this.elector.electAndRun("me", this.start0)
    }

    internal func start0(): Unit {
        this
            .watcher
            .watch("test")
            .on("onAdd", this.add)
            .on("onDelete", this.delete)
            .till()

        while (true) {
            println("scheduler loop")
            let item = this.queue.poll()
            if (item.isNone()) {
                sleep(1 * Duration.second)
                continue
            }
            try {
                let pod = item.getOrThrow()
                if (pod.isUnschedulable()) {
                    this.preschedule(pod)
                }
                let nodelist = this.filter(pod)
                let planlist = this.score(pod, nodelist)
                let node = this.prebind(planlist)
                this.bind(pod, node)
            } catch (error: Exception) {
                sleep(1 * Duration.second)
                continue
            }
        }
    }

    internal func add(pod: Pod) {
        this.queue.push(pod)
    }

    internal func delete(pod: Pod) {
    }

    public func stop() {
        this.watcher.stop()
    }

    internal func preschedule(pod: Pod) {

    }

    public func filter(pod: Pod): ArrayList<Node> {
        return ArrayList<Node>()
    }

    public func score(pod: Pod, nodelist: ArrayList<Node>): ArrayList<SpuSchedPlan> {
        return ArrayList<SpuSchedPlan>()
    }

    public func prebind(planlist: ArrayList<SpuSchedPlan>): Node {
        return Node()
    }

    public func bind(pod: Pod, node: Node) {
    }
}
