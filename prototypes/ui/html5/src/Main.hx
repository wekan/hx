package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.ComponentBuilder;

class Main {
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            var mainView:Component = ComponentBuilder.fromFile("assets/main-view.xml");
            app.addComponent(mainView);

            app.start();
        });
    }
}
