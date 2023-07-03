import Toybox.WatchUi;
import Toybox.Lang;

module MyViews{
    class MyView extends WatchUi.View{
        private var visible as Boolean = false;

        function initialize(){
            View.initialize();
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