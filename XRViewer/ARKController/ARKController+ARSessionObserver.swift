extension ARKController: ARSessionObserver {
    
    @objc(session:cameraDidChangeTrackingState:)
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        didChangeTrackingState(camera)
    }
    
    @objc(sessionWasInterrupted:)
    func sessionWasInterrupted(_ session: ARSession) {
        print("sessionWasInterrupted")
        sessionWasInterrupted()
    }
    
    @objc(sessionInterruptionEnded:)
    func sessionInterruptionEnded(_ session: ARSession) {
        print("sessionInterruptionEnded")
        sessionInterruptionEnded()
    }
    
    @objc(session:didFailWithError:)
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("Session didFailWithError - \(error.localizedDescription)")
        didFailSession(error)
    }
    
    @objc(sessionShouldAttemptRelocalization:)
    func sessionShouldAttemptRelocalization(_ session: ARSession) -> Bool {
        return true
    }
}
