using Toybox.WatchUi;
using Toybox.Lang;

module MyViews{
    typedef IMyView as interface{
        function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean;
        function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean;
        function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean;
    };

    class MyViewDelegate extends WatchUi.BehaviorDelegate{
        hidden var mView as IMyView;

        function initialize(view as IMyView){
            BehaviorDelegate.initialize();
            mView = view;
        }


        function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean{
            return mView.onKey(keyEvent);
        }

        function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean{
            return mView.onSwipe(swipeEvent);
        }

        function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean{
            return mView.onTap(clickEvent);
        }
    }    
}