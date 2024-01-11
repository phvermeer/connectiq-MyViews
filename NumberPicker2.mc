import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import MyBarrel;

module MyBarrel{
    (:views)
    module Views{
        (:numberPicker)
        class NumberPicker2 extends WatchUi.View{
            var value as Number;

            function initialize(initialValue as Number){
                View.initialize();
                value = initialValue;
            }

            function onUpdate(dc as Dc){
                // selectable numbers 0..9
                var font = Graphics.FONT_NUMBER_MEDIUM;
                var radius = System.getDeviceSettings().screenWidth / 2;
                var offset = Graphics.getFontHeight(font) / 2;
                var r = radius - offset;
                var count = 10;
                var angle = 0;
                var angleStep = 2*Math.PI / count;
                var justification = Graphics.TEXT_JUSTIFY_CENTER|Graphics.TEXT_JUSTIFY_VCENTER;
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
                dc.clear();

                for(var i=0; i<count; i++){
                    var x = radius + r * Math.cos(angle);
                    var y = radius + r * Math.sin(angle);

                    dc.drawText(x, y, font, i.toString(), justification);
                    angle += angleStep;
                }

                // current value 
                var x = radius;
                var y = radius;
                dc.drawText(x, y, font, value.format("%d"), justification);

                // draw backspace area
                dc.setPenWidth(4);
                dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
                dc.drawArc(x, y, radius/2, Graphics.ARC_COUNTER_CLOCKWISE, 20, 160);

                // draw confirm area
                dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
                dc.drawArc(x, y, radius/2, Graphics.ARC_CLOCKWISE, -20, -160);

                var bmp = WatchUi.loadResource(Rez.Drawables.iconConfirm) as BitmapResource;
                x = radius - bmp.getWidth()/2;
                y = radius * 1.3 - bmp.getHeight()/2;
                dc.drawBitmap(x, y, bmp);

                bmp = WatchUi.loadResource(Rez.Drawables.iconDelete) as BitmapResource;
                x = radius - bmp.getWidth()/2;
                y = radius * 0.7 - bmp.getHeight()/2;
                dc.drawBitmap(x, y, bmp);
            }
        }
    }
}