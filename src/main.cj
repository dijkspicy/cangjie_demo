package cangjieflops

import cangjieflops.agent.*
import cangjieflops.scheduler.*

main(): Int64 {
    let sched = SpuScheduler()
    sched.start()
    return 0
}