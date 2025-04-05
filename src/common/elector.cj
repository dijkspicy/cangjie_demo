package cangjieflops.common

public interface Elector {
    func electAndRun(name: String, fn: () -> Unit): Bool
}

public class SingletonElector <: Elector {
    public override func electAndRun(name: String, fn: () -> Unit): Bool {
        try {
            fn()
            return true
        } finally {
            println("${name} elect success")
        }

        return false
    }
}
