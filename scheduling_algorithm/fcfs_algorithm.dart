class FCFS{
  int _burst;
  FCFS(String a){
    _burst = int.parse(a);
  }
  Set setburst(int bt){
    _burst = bt;
  }
  int  get getburst{
    return _burst;
  }
  
}