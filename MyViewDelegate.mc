import Toybox.WatchUi;
using Toybox.Lang;

module MyViews{
    class MyViewDelegate extends WatchUi.BehaviorDelegate{
        hidden var mView as MyView;

        function initialize(view as MyView){
            BehaviorDelegate.initialize();
            mView = view;
        }
        function switchToView(view as MyView, transition as SlideType) as Void{
            mView = view;
            WatchUi.switchToView(view, self, transition);
        }


        function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean{
            return mView.onKey(self, keyEvent);
        }

        function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean{
            return mView.onSwipe(self, swipeEvent);
        }

        function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean{
            return mView.onTap(self, clickEvent);
        }
    }    
}