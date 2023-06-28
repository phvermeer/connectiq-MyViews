import Toybox.WatchUi;
import Toybox.Lang;

module MyViews{
    class MyView extends WatchUi.View{
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
    }    
}