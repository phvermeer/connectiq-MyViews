import Toybox.WatchUi;
import Toybox.Lang;

module MyBarrel{
    (:views)
    module Views{
        class MyView extends WatchUi.View{
            private var visible as Boolean = false;
            private var weakDelegate as WeakReference?;

            function initialize(
                options as {
                    :delegate as MyViewDelegate,
                }
            ){
                View.initialize();

                if(options.hasKey(:delegate)){
                    weakDelegate = (options.get(:delegate) as MyViewDelegate).weak();
                }
            }

            function setDelegate(delegate as MyViewDelegate) as Void{
                weakDelegate = delegate.weak();
            }
            function getDelegate() as MyViewDelegate?{
                return (weakDelegate != null)
                    ? weakDelegate.get() as MyViewDelegate?
                    : null;
            }

            function onKey(sender as MyViewDelegate, keyEvent as WatchUi.KeyEvent) as Lang.Boolean{
                return false;
            }

            function onSwipe(sender as MyViewDelegate, swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean{
                return false;
            }

            function onTap(sender as MyViewDelegate, clickEvent as WatchUi.ClickEvent) as Lang.Boolean{
                return false;
            }

            function onShow(){
                View.onShow();
                visible = true;
            }
            function onHide(){
                View.onHide();
                visible = false;
            }
            function isVisible() as Boolean{
                return visible;
            }

        }    
    }
}