part of falling;

class StateManager{
  
  Map<String,State> _stateMap;
  State _currentState;
  StreamSubscription _currentSubscription;
  
  StateManager(){
    
    _stateMap = new Map<String,State>();                  
  }
  
  void addState(String name,State state){
    _stateMap[name]=state;
  }
  
  void addStateMap(Map<String,State> map){
    _stateMap.addAll(map);
  }
  
  void initState(String state){
    _currentState = _stateMap[state];
    _currentSubscription = _currentState.listen((message){print("Message: $message");},
            onDone: onDoneHandler);
  }
  
  void onDoneHandler(){
      if(_currentState.nextState != null){
        print("Next State"); 
        nextState();
      }else{
        print("The End");
      }
    }
  
  void nextState(){
    _currentState = _stateMap[_currentState.nextState];
    _currentSubscription = _currentState.listen((message){print("Message: $message");},
        onDone: onDoneHandler);
  }

	void pauseState(){
		_currentSubscription.pause();
	}

	void resumeState(){
		_currentSubscription.resume();
	}
  
  
}