import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Math;
import MyTools;

module MyViews{
    class NumberPicker2Delegate extends WatchUi.InputDelegate{
        hidden var radius as Number;
        var picker as NumberPicker2;

        function initialize(picker as NumberPicker2){
            InputDelegate.initialize();
            self.radius = System.getDeviceSettings().screenWidth/2;
            self.picker = picker;
        }

        protected function onNumberPicked(value as Number) as Void{
            // override this function
        }

        // handle input
        function onTap(clickEvent as ClickEvent) as Boolean{
            if(clickEvent.getType() == WatchUi.CLICK_TYPE_TAP){

                // handle tap action
                var xy = clickEvent.getCoordinates();
                var cx = xy[0]-radius;
                var cy = xy[1]-radius;
                var r = Math.sqrt(cx*cx + cy*cy);

                if(r/radius > 0.5){
                    // outer area (selectable numbers)
                    var angle = (cx != 0)
                        ? Math.atan(1f*cy/cx)
                        : (cy>=0)
                            ? Math.PI
                            : -Math.PI;
                    if(cx<0){
                        angle -= Math.PI;
                    }

                    var v = Math.round(10f * angle / (2f*Math.PI)).toNumber();
                    if(v<0){
                        v+=10;
                    }
                    picker.value *= 10;
                    picker.value += v;
                    WatchUi.requestUpdate();
                }else{
                    // inner area (confirmation or backspace)
                    r = radius * 0.2; // vertical threshold
                    if(cy < -r){
                        // backspace
                        picker.value /= 10;
                        WatchUi.requestUpdate();
                    }else if(cy > r){
                        // confirmation
                        onNumberPicked(picker.value);
                        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
                    }
                }
                return true;
            }
            return false;
        }
    }
}