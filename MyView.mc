import Toybox.WatchUi;
import Toybox.Lang;

module MyBarrel{
    (:views)
    module Views{
        class MyView extends WatchUi.View{
            private var visible as Boolean = false;
            private var weakDelegate as WeakReference;

            function initialize(delegate as MyViewDelegate){
                View.initialize();

                weakDelegate = delegate.weak();
                delegate.setView(self);
            }

            function getDelegate() as MyViewDelegate?{
                return weakDelegate.get() as MyViewDelegate?;
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