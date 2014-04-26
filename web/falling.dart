library falling;

//-----------------------------------------------------------------------------

import 'dart:html';
import 'dart:async';
import 'package:stagexl/stagexl.dart';

//-----------------------------------------------------------------------------

part "statemanager.dart";
part "state/state.dart";
part "state/init.dart";
part "state/menu.dart";

//-----------------------------------------------------------------------------

Element canvas;
RenderLoop renderLoop;
ResourceManager resourceManager;
StateManager stateManager;

void main() {
  canvas = querySelector('#stage');
	renderLoop = new RenderLoop();
	resourceManager = new ResourceManager();
	stateManager = new StateManager();

  stateManager.addStateMap({"init" : new Init("menu"),
                            "menu" : new Menu()});

	stateManager.initState("init");
  
}


