int col = 120;
int row = 35;
final String STRING = "！＠＃＄％＾＆＊（）＿＋｝｛」「”；’；？・？？？？？？！*-/ABCDEFDHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789＋－！＄＠％＾＆＆＾＊＆＠＆あいうえおかきくけこさしすせそ破魔矢らは高校アイウエオリピバハマヤラバヤユヨコウサシスセソカキクケコナニヌネノキモイ";
int green = 100;
class MatrixRain{
  int x;
  int y;
  int w;//size of the rain drop
  boolean changeWord = true;//flag for changing the word
  String word;
  
  MatrixRain(int x,int y,int w){
     this.x= x;
     this.y =y;
     this.w =w;
  }
  
  void dorain(int num){

    String wrd = changeWords();
    int col = min(green,num*3);
    
    if(col == green)
      col = 255;
      
    fill(0,col,0);
    text(wrd,x,y,w,w);
 
    calcValues();
  }
  
  String changeWords(){
      float num = random(0,2);
      
      if(changeWord){//first time word is generated.
          char a = returnWord();
          String b = String.valueOf(a);
          this.word = b;//update the wod
          changeWord = false;
          return b;
      }else if(num < 0.1){
          char a = returnWord();
          String b = String.valueOf(a);
          this.word = b;
          return b;
      }else{
         //return the same word. no changes in word
         return this.word; 
      }
  }
  
  void calcValues(){
    y += 10;
  }
  
 char returnWord() {
  return STRING.charAt((int)random(STRING.length()));
 }
 
 int getY(){
    return this.y;
 }
 void setY(int y){
    this.y = y;
 }

}//end of matrixRain

MatrixRain matrix[][] = new MatrixRain[col][row];
 
void setup(){
  size(1500,1000);
  PFont font = createFont("MS Gothic", 40);
  textFont(font, 20);
  
   for(int i = 0;i<col;i++){
       float randY = random(0,1200);
       float randX = random(0,1500);
      
     for(int j = 0;j<row;j++){
         
         matrix[i][j] = new MatrixRain((int)randX,(int)randY,1000);
         randY+=10;
     }
   }
}

void draw(){
  background(0);

   for(int i = 0;i<col;i++){
      for(int j =0;j<row;j++){
        matrix[i][j].dorain(j);
        
        ///if the string gets to buttom, bring it up again
        if(matrix[i][j].getY() > 1500){
          matrix[i][j].setY(0);
        }
      }
    }

}//end of draw