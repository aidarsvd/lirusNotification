
import UIKit
import RappleProgressHUD // lib in github https://github.com/rjeprasad/RappleProgressHUD

let BASE_URL = "http://212.109.218.188/"

protocol BaseView
{
    func showLoading() -> Void
    func hideLoading() -> Void
    func error(error: String) -> Void
}

class BaseViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // MARK: - getVC
    func getVC(name:String) -> UIViewController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name)
        return vc
    }
    
    func back()
    {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - showLoading
    func showLoading()
    {
        let attributes = RappleActivityIndicatorView.attribute(style: RappleStyle.circle, tintColor: .white, screenBG: .black, progressBG: .gray, progressBarBG: .orange, progreeBarFill: .red, thickness: 4)
        RappleActivityIndicatorView.startAnimating(attributes: attributes)
    }
    
    // MARK: - hideLoading
    func hideLoading()
    {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    // MARK: - error
    func error(error: String)
    {
        showDialogOkBtn(title: "", message: error, vc: self)
    }
    
    func showDialogOkBtn(title: String, message: String, vc: UIViewController)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
