library falling;

//-----------------------------------------------------------------------------

import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:stagexl/stagexl.dart';


//-----------------------------------------------------------------------------

part "statemanager.dart";
part "Sprite/animatedsprite.dart";
part "Sprite/player.dart";
part "Sprite/point.dart";
part "Sprite/block.dart";
part "state/state.dart";
part "state/init.dart";
part "state/menu.dart";
part "state/level1.dart";
part "state/end.dart";
part "state/victory.dart";

//-----------------------------------------------------------------------------

Element canvas;
Stage stage;
RenderLoop renderLoop;
ResourceManager resourceManager;
StateManager stateManager;
Rectangle rect;
var mainColor = 0x7AA241;

void main() {
  canvas = querySelector('#stage');
  stage = new Stage(canvas,webGL: true);
	renderLoop = new RenderLoop();
	resourceManager = new ResourceManager();
	stateManager = new StateManager();
  rect = new Rectangle(0,0,800,600);
	
	renderLoop.addStage(stage);

  stage.focus = stage;

  stateManager.addStateMap({"init" : new Init("init","menu"),
                            "menu" : new Menu("menu","level1"),
                            "level1": new Level1("level1","end"),
                            "end": new End("end","level1"),
                            "victory": new Victory("victory")});

	stateManager.initState("init");
  
}


