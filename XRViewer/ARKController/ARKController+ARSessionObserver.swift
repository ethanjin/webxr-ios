extension ARKController: ARSessionObserver {
    
    @objc(session:cameraDidChangeTrackingState:)
    public func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        didChangeTrackingState(camera)
    }
    
    @objc(sessionWasInterrupted:)
    public func sessionWasInterrupted(_ session: ARSession) {
        print("sessionWasInterrupted")
        sessionWasInterrupted()
    }
    
    @objc(sessionInterruptionEnded:)
    public func sessionInterruptionEnded(_ session: ARSession) {
        print("sessionInterruptionEnded")
        sessionInterruptionEnded()
    }
    
    @objc(session:didFailWithError:)
    public func session(_ session: ARSession, didFailWithError error: Error) {
        print("Session didFailWithError - \(error.localizedDescription)")
        didFailSession(error)
    }
    
    @objc(sessionShouldAttemptRelocalization:)
    public func sessionShouldAttemptRelocalization(_ session: ARSession) -> Bool {
        return true
    }
}
