import Toybox.WatchUi;
import Toybox.Lang;

module MyViews{
    class MyView extends WatchUi.View{
        function initialize(){
            View.initialize();
        }

        function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean{
            return false;
        }

        function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean{
            return false;
        }

        function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean{
            return false;
        }
    }    
}