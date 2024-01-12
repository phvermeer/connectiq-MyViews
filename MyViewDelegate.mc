import Toybox.WatchUi;
import Toybox.Lang;

module MyBarrel{
    (:views)
    module Views{
        class MyViewDelegate extends WatchUi.BehaviorDelegate{
            hidden var weakView as WeakReference?;

            function initialize(
                options as {
                    :view as MyView
                }
            ){
                BehaviorDelegate.initialize();
                if(options.hasKey(:view)){
                    weakView = (options.get(:view) as MyView).weak();
                }
            }

            function setView(view as MyView) as Void{
                weakView = view.weak();
            }
            function getView() as MyView?{
                return (weakView != null)
                    ? weakView.get() as MyView?
                    : null;
            }

            function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean{
                var view = getView();
                return (view != null)
                    ? view.onKey(self, keyEvent)
                    : false;
            }

            function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean{
                var view = getView();
                return (view != null)
                    ? view.onSwipe(self, swipeEvent)
                    : false;
            }

            function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean{
                var view = getView();
                return (view != null)
                    ? view.onTap(self, clickEvent)
                    : false;
            }
        }    
    }
}