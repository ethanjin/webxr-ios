import ARKit
import Metal
import MetalKit

open class ARKMetalController: NSObject, ARKControllerProtocol, MTKViewDelegate {
    
    public var previewingSinglePlane: Bool = false
    public var focusedPlane: PlaneNode?
    public var planes: [UUID : PlaneNode] = [:]
    private var renderer: Renderer?
    private var renderView: MTKView?
    private var hitTestFocusPoint = CGPoint.zero
    
    init?(sesion session: ARSession) {
        super.init()
        
        if setupAR(with: session) == false {
            return nil
        }
    }
    
    required public init(sesion session: ARSession?, size: CGSize) {
        
    }
    
    public func getRenderView() -> UIView! {
        return renderView
    }
    
    public func setHitTestFocus(_ point: CGPoint) {
        return
    }
    
    public func hitTest(_ point: CGPoint, with type: ARHitTestResult.ResultType) -> [Any]? {
        return nil
    }
    
    public func cameraProjectionTransform() -> matrix_float4x4 {
        return matrix_identity_float4x4
    }
    
    func didChangeTrackingState(_ camera: ARCamera?) {
    }
    
    func currentHitTest() -> Any? {
        return nil
    }
    
    public func setShowMode(_ mode: ShowMode) {
    }
    
    public func setShowOptions(_ options: ShowOptions) {
    }
    
    public func clean() {
    }
    
    public func update(_ session: ARSession?) {
    }
    
    func setupAR(with session: ARSession) -> Bool {
        renderView = MTKView()
        renderView = MTKView(frame: UIScreen.main.bounds, device: MTLCreateSystemDefaultDevice())
        renderView?.backgroundColor = UIColor.clear
        renderView?.delegate = self
        
        guard let size = renderView?.bounds.size else {
            print("Error accessing the renderView size")
            return false
        }

        // Tony 2/21/19: Commenting out below 5 lines until Metal is utilized (need to cast
        // MTKView as RenderDestinationProvider).
//        guard let device = renderView?.device else {
//            print("Metal is not supported on this device")
//            return false
//        }
//        renderer = Renderer(session: session, metalDevice: device, renderDestinationProvider: renderView)
        renderer?.drawRectResized(size, orientation: UIApplication.shared.statusBarOrientation)
        
        return true
    }
    
    // MARK: - MTKViewDelegate
    
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        DispatchQueue.main.async(execute: {
            self.renderer?.drawRectResized(size, orientation: UIApplication.shared.statusBarOrientation)
        })
    }
    
    public func draw(in view: MTKView) {
        renderer?.update()
    }
}
