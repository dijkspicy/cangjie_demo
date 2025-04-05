package cangjieflops.agent

public struct SpuDevice {
    let id: String
    let nodeId: String
    let cardId: String
    let chipId: String
    let logicId: String
    let cardType: String
    let healthy: String
    let sharedIds: Array<Int>

    public init(nodeId: String, cardId: String, chipId: String, logicId: String, cardType: String, healthy: String) {
        this.id = "${nodeId}/${cardId}/${chipId}/${logicId}"
        this.nodeId = nodeId
        this.cardId = cardId
        this.chipId = chipId
        this.logicId = logicId
        this.cardType = cardType
        this.healthy = healthy
        this.sharedIds = Array<Int>(100, {i => i})
    }

    public func ToString(): String {
        return "${this.id}-${this.sharedIds}"
    }
}

