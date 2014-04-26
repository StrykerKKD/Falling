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

//-----------------------------------------------------------------------------

Element canvas;
Stage stage;
RenderLoop renderLoop;
ResourceManager resourceManager;
StateManager stateManager;

void main() {
  canvas = querySelector('#stage');
  stage = new Stage(canvas,webGL: true);
	renderLoop = new RenderLoop();
	resourceManager = new ResourceManager();
	stateManager = new StateManager();
	
	renderLoop.addStage(stage);

  stage.focus = stage;

  stateManager.addStateMap({"init" : new Init("menu"),
                            "menu" : new Menu("level1"),
                            "level1": new Level1()});

	stateManager.initState("init");
  
}


