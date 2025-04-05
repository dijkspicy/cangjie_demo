package cangjieflops.common

public class Watcher<T> {
    public func watch(name: String): This{
        return this
    }

    public func on(event: String, fn: (T) -> Unit): This {
        return this
    }

    public func stop() {

    }
    
    public func till() {
    }
}
