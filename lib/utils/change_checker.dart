class ChangeChecker{
  static int? checkChange(List<dynamic>? frames, int index, CheckType checkType){
    if(frames == null || index == frames.length - 1){
      return -1;
    }
    Map<String, dynamic> currentFrame = frames[index];
    Map<String, dynamic> nextFrame = frames[index+1];
    if(checkType == CheckType.REG){
      List<String> regList = currentFrame['REG'].keys.toList();
      Map<String, dynamic> currentInfoTable = currentFrame['REG'];
      Map<String, dynamic> nextInfoTable = nextFrame['REG'];
      for(int i = 0; i < regList.length; i++){
        if(currentInfoTable[regList[i]]!=nextInfoTable[regList[i]])
          return i;
      }
    } else {
      List<String> regList = currentFrame['NZ_MEM'].keys.toList();
      Map<String, dynamic> currentInfoTable = currentFrame['NZ_MEM'];
      Map<String, dynamic> nextInfoTable = nextFrame['NZ_MEM'];
      for(int i = 0; i < regList.length; i++){
        if(currentInfoTable[regList[i]]!=nextInfoTable[regList[i]])
          return i;
      }
    }
  }
}

enum CheckType {REG, MEM}